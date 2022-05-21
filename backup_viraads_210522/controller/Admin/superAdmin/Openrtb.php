<?php

namespace Controller\Admin\superAdmin;

class Openrtb extends Controller
{
    public $max_waiting = REPORT_EMAIL_AFTER;
    public $group_by = ['Date', 'Country', 'Browser', 'Platform', 'OS', 'Network ID', 'Ad ID', 'Website ID', 'Zone ID'];
    public $order_by = ['Date', 'Impression', 'Click', 'Conversion', 'Cost', 'Reach'];
    public $rtb_parameter = ['{ua}' => 'UserAgent', '{ip}' => 'IP Address', '{zid}' => 'Publisher Zone ID', '{wid}' => 'Publisher Website ID', '{lang}' => 'Content Language', '{ref}' => 'Referrer', '{ts}' => 'Current Timestamp'];
    public $rtb_version = ['1.0', '1.1', '2.0', '2.1', '2.2', '2.3', '2.4', '2.5', '2.6'];
    public $module_dir = BASE_PATH.'/module/OpenRTB';
    public $task_name = 'OpenrtbReporter';
    
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Openrtb;
        $this->helper = new \Module\Helper;
        $this->data = $db->sumNetworkAbstract();
        
        $this->title = 'OpenRTB Overview - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/index';
        $this->renderView();
    }
    
    public function network()
    {
        $id = (int) $this->getRequest('id');
        if($id) return $this->networkDetail($id);
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        $this->helper = new \Module\Helper;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Inactive'];
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countNetwork();
            } else {
                $this->data->total = $db->countNetworkSearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countNetworkStatus($this->data->status);
            } else {
                $this->data->total = $db->countNetworkStatusSearch($this->data->status, $this->data->key);
            }
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listNetwork($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listNetworkSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listNetworkStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listNetworkStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        }else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->data->module_list = $this->listModule();
        
        $this->data->weekAgo = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->today = date('Y-m-d');
        $this->title = $this->data->status.' Networks - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/network';
        $this->renderView();
    }
    
    public function networkDetail($id)
    {
        if(!($id = (int) $id)) $this->redirectTo('/openrtb/network');
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        $this->helper = new \Module\Helper;
        
        if(!($this->data = $db->getNetwork($id))) $this->redirectTo('/openrtb/network');
        $this->data->today = (new \DateTime('now'))->format('Y-m-d');
        $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        
        /* get last 30 days stats */
        $data = $db->listLastNetworkStatistic($id, date('Y-m-d', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->data->module_list = $this->listModule();
        
        $this->title = $this->data->name.' - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/network_detail';
        $this->renderView();
    }
    
    public function __postNetwork()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->name) || !isset($data->url) || !isset($data->description) || !isset($data->module)) {
            $this->data->data = 'Bad request, Missing required params!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        if(!isset($data->id)) {
            try {
                $db->createNetwork($data);
            } catch(\Exception $e) {
                $this->data->data = 'Something was wrong, please try again later!';
                $this->renderView();
            }
        } else {
            if(!$db->updateNetwork($data)) {
                $this->data->data = 'Something was wrong, nothing changed!';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postAds()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if(!($id = (int) $this->postRequest('network_id')) || !($statuses = $this->postRequest('status')) || !is_array($statuses)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $db = new \Model\Admin\superAdmin\Openrtb;
        $af = $db->listAdFormat();
        $adFormat = [];
        foreach($af as $item) {
            $adFormat[$item->id] = $item->name;
        }
        $this->data->data = [];
        foreach($statuses as $status) {
            $data = $db->listAdByNetworkAndStatus($id, $status);
            if($data) {
                foreach($data as $item) {
                    $item->ad_format = $adFormat[$item->ad_format];
                    $this->data->data[] = $item;
                }
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function ad()
    {
        if($this->uri[2] == 'create') return $this->adCreate();
        if($this->uri[2] == 'setup') return $this->adSetup();
        if($this->uri[2] == 'detail') return $this->adDetail();
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Inactive'];
        $network_id = (int) $this->getRequest('network_id');
        $this->data->network = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        if($network_id) {
            $this->data->network = $db->getNetwork($network_id);
            if(!$this->data->network) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($network_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdByNetwork($network_id);
                } else {
                    $this->data->total = $db->countAdSearchByNetwork($network_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdStatusByNetwork($network_id, $this->data->status);
                } else {
                    $this->data->total = $db->countAdStatusSearchByNetwork($network_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAd();
                } else {
                    $this->data->total = $db->countAdSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdStatus($this->data->status);
                } else {
                    $this->data->total = $db->countAdStatusSearch($this->data->status, $this->data->key);
                }
            }
        }
            

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($network_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdByNetwork($network_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdSearchByNetwork($network_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdStatusByNetwork($network_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdStatusSearchByNetwork($network_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAd($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->helper = new \Module\Helper;
        $this->data->weekAgo = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->today = date('Y-m-d');
        
        if($network_id) {
            $this->title = ucwords($this->data->status).' Ads - #'.$network_id.' '.$this->data->network->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Ads - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/openrtb/ad';
        $this->renderView();
    }
    
    public function adDetail()
    {
        $id = (int) $this->getRequest('id');
        if(!$id) $this->redirectTo('/openrtb/ad');
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        $this->helper = new \Module\Helper;
        
        $this->data = $db->getAdWithNetworkName($id);
        if(!$this->data) $this->redirectTo('/openrtb/ad');
        
        $this->data->today = (new \DateTime('now'))->format('Y-m-d');
        $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        
        /* get last 30 days stats */
        $data = $db->listLastAdStatistic($id, date('Y-m-d', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->title = $this->data->name.' - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/ad_detail';
        $this->renderView();
    }
    
    public function adSetup()
    {
        $id = (int) $this->getRequest('id');
        if(!$id) $this->redirectTo('/exchange/ad');
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        $this->helper = new \Module\Helper;
        
        $this->data = $db->getAdWithNetworkName($id);
        if(!$this->data) $this->redirectTo('/exchange/ad');
        $this->data->adFormat = $db->listAdFormatAll();
        $this->data->params = $this->rtb_parameter;
        $this->data->versions = $this->rtb_version;
        
        $this->title = $this->data->name.' - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/ad_setup';
        $this->renderView();
    }
    
    public function adCreate()
    {
        $network_id = $this->getRequest('network_id');
        if(!$network_id) $this->redirectTo('/exchange/network');
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        if(!($this->data->network = $db->getNetwork($network_id))) $this->redirectTo('/exchange/network');
        $this->data->adFormat = $db->listAdFormatAll();
        $this->data->params = $this->rtb_parameter;
        $this->data->versions = $this->rtb_version;
        
        $this->title = 'Ad Creator - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/ad_setup';
        $this->renderView();
    }
    
    public function __postAd()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        $action = $this->uri[2];
        
        if($action == 'setup') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->network_id) && !isset($data->id)) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            if(!$data->name || !$data->ad_format || !$data->pricing_model || !$data->data) {
                $this->data->data = 'Bad request, params are missing or invalid!!!';
                $this->renderView();
            }
            if(!isset($data->data->method) || !isset($data->data->endpoint)) {
                $this->data->data = 'Bad request, RTB informations are missing or invalid!!!';
                $this->renderView();
            }

            $data->status = in_array($data->status, ['Active', 'Inactive']) ? $data->status : 'Inactive';
            $data->pricing_model = in_array($data->pricing_model, ['cpm', 'cpc', 'cpa']) ? $data->pricing_model : 'cpm';
            $data->zone_id = $data->zone_id ?: null;
        
            $db = new \Model\Admin\superAdmin\Openrtb;
            if(isset($data->network_id)) {
                try {
                    $data->id = $db->createAd($data->network_id, $data->name, $data->zone_id, $data->data, $data->ad_format, $data->pricing_model, $data->status);
                } catch(\Exception $e) {
                    $this->data->data = 'Sorry, something was wrong - please try again!';
                    $this->renderView();
                }
        
                /* update network abstract */
                if($data->status != 'Active') {
                    $db->updateNetworkAbstract($data->network_id, 1, 0);
                } else {
                    $db->updateNetworkStatus($data->network_id, 'Active');
                    $db->updateNetworkAbstract($data->network_id, 1, 1);
                }
            } else {
                if(!$db->updateAd($data->id, $data)) {
                    $this->data->data = 'Sorry, something was wrong - please try again!';
                    $this->renderView();
                }
            }
            
            /* update to ad server */
            if($data->status == 'Active') {
                $adServer = new \Module\AdServer;
                $adServer->createAdRTB($data->id);
            }

            $this->data->success = true;
            $this->data->data = '/openrtb/ad';
            $this->renderView();
        }
        
        if($action == 'rename') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name) || !isset($data->id)) {
                $this->data->data = 'Bad request, Name is missing!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Openrtb;
            if(!$db->updateAdName($data->id, $data->name)) {
                $this->data->data = 'Could not update ad name!';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'disable') {
            $id = (int) $this->postRequest('id');
            $db = new \Model\Admin\superAdmin\Openrtb;
            $ad = $db->getAd($id);
            if(!$ad) {
                $this->data->data = 'Ad ID '.$id.' does not exist!';
                $this->renderView();
            }
            if($ad->status != 'Active') {
                $this->data->data = 'Ad ID '.$id.' already disabled!';
                $this->renderView();
            }
            
            $db->updateAdStatus($id, 'Inactive');
            $db->updateNetworkAbstract($ad->network_id, 0, -1);
            
            /* adjust network status base on ad status */
            if($db->countAdStatusByNetwork($ad->network_id, 'Active')) {
                $db->updateNetworkStatus($ad->network_id, 'Active');
            } else {
                $db->updateNetworkStatus($ad->network_id, 'Inactive');
            }
            
            /* update to ad server */
            $adServer = new \Module\AdServer;
            $adServer->removeAdRTB($ad->id);
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'enable') {
            $id = (int) $this->postRequest('id');
            $db = new \Model\Admin\superAdmin\Openrtb;
            $ad = $db->getAd($id);
            if(!$ad) {
                $this->data->data = 'Ad ID '.$id.' does not exist!';
                $this->renderView();
            }
            if($ad->status == 'Active') {
                $this->data->data = 'Ad ID '.$id.' already enabled!';
                $this->renderView();
            }
            
            $db->updateAdStatus($id, 'Active');
            $db->updateNetworkAbstract($ad->network_id, 0, 1);
            
            /* adjust network status base on ad status */
            $db->updateNetworkStatus($ad->network_id, 'Active');
            
            /* update to ad server */
            $adServer = new \Module\AdServer;
            $adServer->createAdRTB($ad->id);
            
            $this->data->success = true;
            $this->renderView();
        }
        
        $this->data->data = 'Bad request!';
        $this->renderView();
    }
    
    /* rate */
    public function rate()
    {
        $this->data->id = (int) $this->getRequest('ad_id');
        if(!$this->data->id) $this->redirectTo('/openrtb/ad');
        
        $adServer = new \Module\AdServer;
        $res = $adServer->getRtbAd($this->data->id);
        if(!$res->success) $this->redirectTo('/openrtb/ad');
        
        $this->data->default = $res->data['rate']['default'];
        unset($res->data['rate']['default']);
        $this->data->adjust = $res->data['adjust'];
        $this->data->data = $res->data['rate'];
        $this->data->total = count($this->data->data);
        
        $this->title = 'Rate by Ad - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/ad_rate';
        $this->renderView();
    }
    
    public function __postRate()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->postRequest('id');
        $rate = (float) $this->postRequest('rate');
        $country = $this->postRequest('code');
        if(!$id || !$rate || !$country) {
            $this->data->data = 'Bad request, required params are missing or invalid!!!';
            $this->renderView();
        }
        
        $adServer = new \Module\AdServer;
        $adServer->updateRtbAdRate($id, ['rate' => [$country => $rate]]);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postAdjust()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->postRequest('id');
        $adjust = (float) $this->postRequest('adjust');
        if(!$id || !$adjust) {
            $this->data->data = 'Bad request, required params are missing or invalid!!!';
            $this->renderView();
        }
        
        $adServer = new \Module\AdServer;
        $adServer->updateRtbAdRate($id, ['adjust' => $adjust]);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    /* payment */
    public function payment()
    {
        $network_id = (int) $this->getRequest('network_id');
        
        $db = new \Model\Admin\superAdmin\Openrtb;
        $this->data->network = null;
        if($network_id) {
            if(!($this->data->network = $db->getNetwork($network_id))) $this->redirectTo('/openrtb/payment');
        }
        
        $this->helper = new \Module\Helper;
        $this->data->key = $this->getRequest('q');
        
        if ($network_id) {
            if(!$this->data->key) {
                $this->data->total = $db->countPaymentByNetwork($network_id);
            } else {
                $this->data->total = $db->countPaymentByNetworkSearch($network_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countPayment();
            } else {
                $this->data->total = $db->countPaymentSearch($this->data->key);
            }
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($network_id) {
                if(!$this->data->key) {
                    $this->data->data = $db->listPaymentByNetwork($network_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listPaymentByNetworkSearch($network_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listPayment($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listPaymentSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        }else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $networks = $db->listNetwork(0,9999);
        $this->data->networks = [];
        foreach($networks as $item) {
            $this->data->networks[$item->id] = $item->name;
        }
        
        $this->title = 'Payments - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/payment';
        $this->renderView();
    }
    
    public function __postPayment()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->network_id) || !isset($data->transaction_id) || !isset($data->method) || !isset($data->amount)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $db = new \Model\Admin\superAdmin\Openrtb;
        try {
            $db->createPayment($data);
        } catch(\Exception $e) {
            $this->data->data = 'Something was wrong, could not add this payment';
            $this->renderView();
        }
        
        $db->increaseNetworkPayment($data->network_id, $data->amount);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    /* report */
    public function report()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Admin\superAdmin\Openrtb;
        
        $this->data->countries = $db->listCountry();
        $this->data->networks = $db->listActiveNetwork();
        
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();
        
        $adformats = $db->listAdFormat();
        $adformat = [];
        foreach($adformats as $item) {
            $adformat[$item->id] = $item->name;
        }
        
        $ads = $db->listAllAd();
        $this->data->ads = [];
        foreach($ads as $item) {
            if(!isset($this->data->ads[$item->network_id])) $this->data->ads[$item->network_id] = [];
            $this->data->ads[$item->network_id][] = ['value' => $item->id, 'text' => $item->id.' - '.$item->name.' - '.$adformat[$item->ad_format]];
        }
        
        $this->data->group_by = $this->group_by;
        $this->data->order_by = $this->order_by;
        $this->data->min_date = date('Y-m-d', strtotime('90 days ago'));
        $this->data->max_date = date('Y-m-d');
        
        $this->title = 'Standard Report - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/openrtb/report';
        $this->renderView();
    }
    
    public function __postReport()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $this->helper = new \Module\Helper;
        $adServer = new \Module\AdServer;
        
        /* Check required params */
        $data = new \stdClass;
        $data->start_date = $this->helper->validDate($this->getRequest('start_date'), 'Y-m-d');
        $data->end_date = $this->helper->validDate($this->getRequest('end_date'), 'Y-m-d');
        if(!$data->start_date || !$data->end_date) {
            $this->data->data = 'Your report link is invalid!';
            $this->renderView();
        }
        
        /* network ids and ad ids */
        $network_id = $this->listToArray($this->getRequest('network_id'), '@(\d+)@');
        $ad_id = $this->listToArray($this->getRequest('ad_id'), '@(\d+)@');
        $data->network_id = null;
        $data->ad_id = null;
        if($network_id) {
            $data->network_id = [];
            foreach($network_id as $id) {
                $data->network_id[] = $adServer->prefixOpenRTBAd($id);
            }
        }
        if($ad_id) {
            $data->ad_id = [];
            foreach($ad_id as $id) {
                $data->ad_id[] = $adServer->prefixOpenRTBAd($id);
            }
        }
        
        /* Get optional params */
        $data->country = $this->listToArray($this->getRequest('country'), '@([A-Z]{2})@');
        $data->browser = $this->listToArray($this->getRequest('browser'), '@([a-zA-Z0-9 ]+)@');
        $data->platform = $this->listToArray($this->getRequest('platform'), '@([a-zA-Z]+)@');
        $data->os = $this->listToArray($this->getRequest('os'), '@([a-zA-Z0-9 ]+)@');
        $data->group_by = $this->elementInArray($this->getRequest('group_by'), $this->group_by);
        $data->order_by = $this->elementInArray($this->getRequest('order_by'), $this->order_by) ?: $this->elementInArray($this->getRequest('order_by'), $this->group_by);
        
        /* Init model */
        $user_id = $this->getSession('id');
        $db = new \Model\Admin\superAdmin\Openrtb;
        
        /* out of hot data range */
        if(!$this->dateInHotRange($data->start_date)) {
            $data->browser = $data->platform = $data->os = null;
            if(in_array($data->group_by, ['browser', 'platform', 'os'])) $data->group_by = 'created_at';
            if(in_array($data->order_by, ['browser', 'platform', 'os'])) $data->order_by = 'created_at';
        }
        
        if(!$data->group_by) $data->group_by = 'created_at';
        if(!$data->order_by) $data->order_by = 'created_at';
        
        // calculate md5 of report url to query in database
        $task_data = json_encode($data);
        $task_id = md5('ex:'.$task_data);
        
        // get informations from database if exists
        $task = $db->getTaskByNameAndId($this->task_name, $task_id);
        if($task) {
            if($task->status == 'Failed') {
                $db->deleteTask($task->id);
                $this->data->data = $task->message;
                $this->renderView();
            }
            
            $this->data->success = true;
            if($task->status != 'Done') {
                $this->data->data = 'Processing';
                $this->renderView();
            }
            
            $db->deleteTask($task->id);
            $this->data->data = $this->buildReportData($data->start_date, $data->end_date, $data->group_by, json_decode($task->task_data));
            $this->renderView();
        }
        
        // otherwise create report
        try {
            $id = $db->createTask($this->task_name, $task_id, $task_data);
            $this->processTask($id);
        } catch(\Exception $e) {
            $this->data->data = 'Something was wrong, please try again later!';
            $this->renderView();
        }
        
        // return
        $this->data->success = true;
        $this->data->data = 'Processing';
        $this->renderView();
    }
    
    /* helper */
    private function buildStatsData($data)
    {
        $now = new \DateTime('now');
        $last30d = new \DateTime('30 days ago');
        $today = $now->format('Y-m-d');
        $this->data->country = ['XX' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        $this->data->date = [$today => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        if(!$data) return true;
        
        foreach($data as $item) {
            $date = $item->created_at;
            
            /* country */
            if(!isset($this->data->country[$item->country])) {
                $this->data->country[$item->country] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->country[$item->country]['impression'] += $item->impression;
            $this->data->country[$item->country]['click'] += $item->click;
            $this->data->country[$item->country]['conversion'] += $item->conversion;
            $this->data->country[$item->country]['revenue'] += $item->revenue;
            $this->data->country[$item->country]['reach'] += $item->reach;
            
            /* date */
            if(!isset($this->data->date[$date])) {
                $this->data->date[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->date[$date]['impression'] += $item->impression;
            $this->data->date[$date]['click'] += $item->click;
            $this->data->date[$date]['conversion'] += $item->conversion;
            $this->data->date[$date]['revenue'] += $item->revenue;
            $this->data->date[$date]['reach'] += $item->reach;
        }
        
        /* fill hole */
        for($i = $now; $i >= $last30d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->date[$date])) {
                $this->data->date[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->date);
        
        return true;
    }
    
    private function listToArray($list, $pattern)
    {
        if(!$list) return null;
        $list = explode(',',$list);
        $arr = [];
        foreach($list as $item) {
            preg_match($pattern, $item, $m);
            $item = isset($m[1]) ? $m[1] : null;
            if($item) $arr[] = $item;
        }
        return $arr ? $arr : null;
    }
    
    private function elementInArray($element, $array)
    {
        if(!$element) return null;
        if(!in_array($element, $array)) return null;
        $element = str_replace(' ', '_', strtolower($element));
        if($element == 'date') $element = 'created_at';
        return $element;
    }
    
    private function dateInHotRange($start_date)
    {
        $min_date = strtotime('90 days ago');
        $start_date = strtotime($start_date);
        
        return $min_date <= $start_date;
    }
    
    private function buildReportData($start_date, $end_date, $group_by, $raw)
    {
        $origin = [];
        if($raw) {
            foreach($raw as $item) {
                if($group_by == 'created_at') {
                    $key = $item->created_at;
                }  else {
                    $key = $item->$group_by;
                }
                unset($item->$key);
                $origin[$key] = $item;
            }
        }
        
        $data = [];
        if($group_by != 'created_at'){
            $data = $origin ?: ['---' => ['reach' => 0, 'impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0]];
        } else {
            $start = new \DateTime($start_date);
            $end = new \DateTime($end_date);
            for($i = $end; $i >= $start; $i->modify('-1 day')) {
                $date = $i->format('Y-m-d');
                $data[$date] = $origin[$date] ?? ['reach' => 0, 'impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0];
            }
        }
        
        return $data;
    }
    
    private function processTask($id)
    {
        $cmd = BASE_PATH.'/cli/'.$this->task_name.'.php '.$id;
        exec($cmd.' > /dev/null 2>&1 &');
        return true;
    }
    
    private function listModule()
    {
        $modules = [];
        $files = scandir($this->module_dir);
        $files = array_slice($files, 2);
        foreach( $files as $file){
            $pieces = explode(".", $file);
            $modules[] = $pieces[0];
        }
        
        return $modules;
    }
}
