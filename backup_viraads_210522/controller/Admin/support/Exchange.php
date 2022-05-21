<?php

namespace Controller\Admin\superAdmin;

class Exchange extends Controller
{
    public $max_waiting = REPORT_EMAIL_AFTER;
    public $group_by = ['Date', 'Country', 'Browser', 'Platform', 'OS', 'Network ID', 'Ad ID', 'Website ID', 'Zone ID'];
    public $order_by = ['Date', 'Impression', 'Click', 'Conversion', 'Cost', 'Reach'];
    public $module_dir = BASE_PATH.'/module/Exchange';
    public $task_name = 'ExchangeReporter';
    
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Exchange;
        $this->helper = new \Module\Helper;
        $this->data = $db->sumNetworkAbstract();
        $this->data->adjust = $this->adjust($this->data->net_revenue, $this->data->revenue);
        
        $this->title = 'Exchange Overview - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/exchange/index';
        $this->renderView();
    }
    
    public function network()
    {
        $id = (int) $this->getRequest('id');
        if($id) return $this->networkDetail($id);
        
        $db = new \Model\Admin\superAdmin\Exchange;
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
        $this->view = 'Admin/superAdmin/exchange/network';
        $this->renderView();
    }
    
    public function networkDetail($id)
    {
        if(!($id = (int) $id)) $this->redirectTo('/exchange/network');
        
        $db = new \Model\Admin\superAdmin\Exchange;
        $this->helper = new \Module\Helper;
        
        if(!($this->data = $db->getNetwork($id))) $this->redirectTo('/exchange/network');
        $this->data->today = (new \DateTime('now'))->format('Y-m-d');
        $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        
        /* get last 30 days stats */
        $data = $db->listLastNetworkStatistic($id, date('Y-m-d', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->data->module_list = $this->listModule();
        
        $this->title = $this->data->name.' - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/exchange/network_detail';
        $this->renderView();
    }
    
    public function __postNetwork()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->name) || !isset($data->url) || !isset($data->description)) {
            $this->data->data = 'Bad request, Missing required params!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Exchange;
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

        $db = new \Model\Admin\superAdmin\Exchange;
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
        if($this->uri[2] == 'detail') return $this->adDetail();
        if($this->uri[2] == 'setup') return $this->adSetup();
        
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
        
        $db = new \Model\Admin\superAdmin\Exchange;
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
        $this->view = 'Admin/superAdmin/exchange/ad';
        $this->renderView();
    }
    
    public function adDetail()
    {
        $id = (int) $this->getRequest('id');
        if(!$id) $this->redirectTo('/exchange/ad');
        
        $db = new \Model\Admin\superAdmin\Exchange;
        $this->helper = new \Module\Helper;
        
        $this->data = $db->getAdWithNetworkName($id);
        if(!$this->data) $this->redirectTo('/exchange/ad');
        
        $this->data->today = (new \DateTime('now'))->format('Y-m-d');
        $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        
        /* get last 30 days stats */
        $data = $db->listLastAdStatistic($id, date('Y-m-d', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->title = $this->data->name.' - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/exchange/ad_detail';
        $this->renderView();
    }
    
    public function adSetup()
    {
        $id = (int) $this->getRequest('id');
        if(!$id) $this->redirectTo('/exchange/ad');
        
        $db = new \Model\Admin\superAdmin\Exchange;
        $this->helper = new \Module\Helper;
        
        $this->data = $db->getAdWithNetworkName($id);
        if(!$this->data) $this->redirectTo('/exchange/ad');
        
        $this->data->country = $db->listCountry();
        $this->data->adType = $db->listAdType();
        $this->data->adTypeData = $db->listAdExTypeData($id);
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();
        
        $this->title = $this->data->name.' - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/exchange/ad_setup';
        $this->renderView();
    }
    
    public function adCreate()
    {
        $network_id = $this->getRequest('network_id');
        if(!$network_id) $this->redirectTo('/exchange/network');
        
        $db = new \Model\Admin\superAdmin\Exchange;
        if(!($this->data->network = $db->getNetwork($network_id))) $this->redirectTo('/exchange/network');
        
        $this->data->country = $db->listCountry();
        $this->data->adType = $db->listAdType();
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();
        
        $this->title = 'Ad Creator - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/exchange/ad_setup';
        $this->renderView();
    }
    
    public function __postAd()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        $action = $this->uri[2];
        
        if($action == 'create') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name) || !isset($data->url)) {
                $this->data->data = 'Bad request, Name and/or Direct Link are missing or invalid!!!';
                $this->renderView();
            }
            if(!isset($data->module_data) || !($module_data = json_decode($data->module_data))) {
                $this->data->data = 'Bad request, module data is not valid json!!';
                $this->renderView();
            }
            if(!isset($data->bidding) || !($bidding = (float) $data->bidding)) {
                $this->data->data = 'Average eCPM is required!';
                $this->renderView();
            }

            $ad_format = 2;
            $network_id = (int) $this->getRequest('network_id');
            $name = $data->name;
            $url = $data->url;
            $status = isset($data->status) && in_array($data->status, ['Active', 'Inactive']) ? $data->status : 'Inactive';
            
            foreach($data as $k => $v) {
                if(!in_array($k, [
                    'country_include',
                    'country_exclude',
                    'country_bidding',
                    'browser_include',
                    'browser_exclude',
                    'platform_include',
                    'platform_exclude',
                    'os_include',
                    'os_exclude',
                    'time_include',
                    'time_exclude',
                    'ad_type'                
                ])) {
                    unset($data->$k);
                    continue;
                }
                if($k != 'country_bidding' && !is_array($data->$k)) unset($data->$k);
            }
            
            if(!isset($data->country_include) && !isset($data->country_exclude)) {
                $data->country_include = [];
            }
            if(!isset($data->country_bidding) || !is_object($data->country_bidding)) {
                $data->country_bidding = [];
            }
            if(!isset($data->browser_include) && !isset($data->browser_exclude)) {
                $data->browser_include = [];
            }
            if(!isset($data->platform_include) && !isset($data->platform_exclude)) {
                $data->platform_include = [];
            }
            if(!isset($data->os_include) && !isset($data->os_exclude)) {
                $data->os_include = [];
            }
            if(!isset($data->time_include) && !isset($data->time_exclude)) {
                $data->time_include = [];
            }
        
            $db = new \Model\Admin\superAdmin\Exchange;
            try {
                $id = $db->createAd($network_id, $name, $ad_format, $bidding, json_encode($data), $url, $status, json_encode($module_data));
            } catch(\Exception $e) {
                $this->data->data = 'Sorry, something was wrong - please try again!';
                $this->renderView();
            }
    
            if($data->ad_type) {
                foreach($data->ad_type as $tid) {
                    $db->mapAdType($id, $tid);
                }
            }
    
            /* update network abstract */
            if($status != 'Active') {
                $db->updateNetworkAbstract($network_id, 1, 0);
            } else {
                $db->updateNetworkAbstract($network_id, 1, 1);
            }
    
            /* save to adserver */
            $ex_id = $adServer->prefixExchangeAd($id);
            $adServer = new \Module\AdServer;
            $r = $adServer->createAd($ex_id);
            if(!$r->success){
                /* rollback */
                $db->updateNetworkAbstract($network_id, -1, $status != 'Active' ? 0 : -1);
                $db->unmapAdType($id);
                $db->removeAd($id);
                $this->data->data = $r->data;
                $this->renderView();
            }
            
            /* adjust network status base on ad status */
            if($status == 'Active') {
                $db->updateNetworkStatus($network_id, 'Active');
            } else {
                $adServer->pauseAd($ex_id);
            }
            
            $this->data->success = true;
            $this->data->data = '/exchange/ad';
            $this->renderView();
        }
        
        if($action == 'setup') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name) || !isset($data->url) || !isset($data->id) || !($ad_id = (int) $data->id)) {
                $this->data->data = 'Bad request, Name and/or Direct Link are missing or invalid!!!';
                $this->renderView();
            }
            if(!isset($data->module_data) || !($module_data = json_decode($data->module_data))) {
                $this->data->data = 'Bad request, module data is not valid json!!';
                $this->renderView();
            }
            if(!isset($data->bidding) || !($bidding = (float) $data->bidding)) {
                $this->data->data = 'Average eCPM is required!';
                $this->renderView();
            }

            $name = $data->name;
            $url = $data->url;
            
            foreach($data as $k => $v) {
                if(!in_array($k, [
                    'country_include',
                    'country_exclude',
                    'country_bidding',
                    'browser_include',
                    'browser_exclude',
                    'platform_include',
                    'platform_exclude',
                    'os_include',
                    'os_exclude',
                    'time_include',
                    'time_exclude',
                    'ad_type'                
                ])) {
                    unset($data->$k);
                    continue;
                }
                if($k != 'country_bidding' && !is_array($data->$k)) unset($data->$k);
            }
            
            if(!isset($data->country_include) && !isset($data->country_exclude)) {
                $data->country_include = [];
            }
            if(!isset($data->country_bidding) || !is_object($data->country_bidding)) {
                $data->country_bidding = [];
            }
            if(!isset($data->browser_include) && !isset($data->browser_exclude)) {
                $data->browser_include = [];
            }
            if(!isset($data->platform_include) && !isset($data->platform_exclude)) {
                $data->platform_include = [];
            }
            if(!isset($data->os_include) && !isset($data->os_exclude)) {
                $data->os_include = [];
            }
            if(!isset($data->time_include) && !isset($data->time_exclude)) {
                $data->time_include = [];
            }
        
            $db = new \Model\Admin\superAdmin\Exchange;
            /* update ad */
            $db->updateAd($ad_id, $name, $bidding, json_encode($data), $url, json_encode($module_data));
    
            if($data->ad_type) {
                $db->unmapAdType($ad_id);
                foreach($data->ad_type as $tid) {
                    $db->mapAdType($ad_id, $tid);
                }
            }
    
            /* save to adserver */
            $adServer = new \Module\AdServer;
            $r = $adServer->createAd($adServer->prefixExchangeAd($ad_id));
            if(!$r->success){
                $this->data->data = $r->data;
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'rename') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name) || !isset($data->id)) {
                $this->data->data = 'Bad request, Name is missing!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Exchange;
            if(!$db->updateAdName($data->id, $data->name)) {
                $this->data->data = 'Could not update ad name!';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'disable') {
            $id = (int) $this->postRequest('id');
            $db = new \Model\Admin\superAdmin\Exchange;
            $ad = $db->getAd($id);
            if(!$ad) {
                $this->data->data = 'Ad ID '.$id.' does not exist!';
                $this->renderView();
            }
            if($ad->status != 'Active') {
                $this->data->data = 'Ad ID '.$id.' already disabled!';
                $this->renderView();
            }
            
            $adServer = new \Module\AdServer;
            $r = $adServer->pauseAd($adServer->prefixExchangeAd($id));
            if(!$r->success){
                $this->data->data = $r->data;
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
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'enable') {
            $id = (int) $this->postRequest('id');
            $db = new \Model\Admin\superAdmin\Exchange;
            $ad = $db->getAd($id);
            if(!$ad) {
                $this->data->data = 'Ad ID '.$id.' does not exist!';
                $this->renderView();
            }
            if($ad->status == 'Active') {
                $this->data->data = 'Ad ID '.$id.' already enabled!';
                $this->renderView();
            }
            
            $adServer = new \Module\AdServer;
            $r = $adServer->resumeAd($adServer->prefixExchangeAd($id));
            if(!$r->success){
                $this->data->data = $r->data;
                $this->renderView(); 
            }
            
            $db->updateAdStatus($id, 'Active');
            $db->updateNetworkAbstract($ad->network_id, 0, 1);
            
            /* adjust network status base on ad status */
            $db->updateNetworkStatus($ad->network_id, 'Active');
            
            $this->data->success = true;
            $this->renderView();
        }
        
        $this->data->data = 'Bad request!';
        $this->renderView();
    }
    
    /* bidding */
    public function bidding()
    {
        $this->data->id = (int) $this->getRequest('ad_id');
        if(!$this->data->id) $this->redirectTo('/exchange/ad');
        
        $db = new \Model\Admin\superAdmin\Exchange;
        $this->data->data = $db->listAdServerBiddingByAd((new \Module\AdServer)->prefixExchangeAd($this->data->id));
        if($this->data->data) {
            $this->data->total = count($this->data->data);
        } else {
            $this->data->total = 0;
        }
        
        $this->title = 'Bidding by Ad - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/exchange/ad_bidding';
        $this->renderView();
    }
    
    public function __postBidding()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->postRequest('id');
        $value = (float) $this->postRequest('value');
        if(!$id || !$value) {
            $this->data->data = 'Bad request, required params are missing or invalid!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Exchange;
        $item = $db->getAdServerBiddingById($id);
        if(!$item) {
            $this->data->data = 'data not found!';
            $this->renderView();
        }
        if($item->value == $value) {
            $this->data->data = 'Nothing change!';
            $this->renderView();
        }
        if(!$db->updateAdServerBidding($id, $value)) {
            $this->data->data = 'Could not update!';
            $this->renderView();
        }
        
        /* sync change to adserver */
        (new \Module\AdServer)->setQueue([$item->format.':'.$item->dimension.':'.$item->name]);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    /* payment */
    public function payment()
    {
        $network_id = (int) $this->getRequest('network_id');
        
        $db = new \Model\Admin\superAdmin\Exchange;
        $this->data->network = null;
        if($network_id) {
            if(!($this->data->network = $db->getNetwork($network_id))) $this->redirectTo('/exchange/payment');
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
        $this->view = 'Admin/superAdmin/exchange/payment';
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

        $db = new \Model\Admin\superAdmin\Exchange;
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
        $db = new \Model\Admin\superAdmin\Exchange;
        
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
        $this->view = 'Admin/superAdmin/exchange/report';
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
                $data->network_id[] = $adServer->prefixExchangeAd($id);
            }
        }
        if($ad_id) {
            $data->ad_id = [];
            foreach($ad_id as $id) {
                $data->ad_id[] = $adServer->prefixExchangeAd($id);
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
        $db = new \Model\Admin\superAdmin\Exchange;
        
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
            $data = $origin ?: ['---' => ['reach' => 0, 'impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0]];
        } else {
            $start = new \DateTime($start_date);
            $end = new \DateTime($end_date);
            for($i = $end; $i >= $start; $i->modify('-1 day')) {
                $date = $i->format('Y-m-d');
                $data[$date] = $origin[$date] ?? ['reach' => 0, 'impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0];
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
    
    private function adjust($net_revenue, $revenue) {
        if(!$net_revenue || !$revenue) return 0;
        
        $adjust = $revenue > 10000 ? ($net_revenue - $revenue)/10000 : ($net_revenue/$revenue) - 1;
        if($adjust < -0.2) $adjust = -0.2;
        if($adjust > 0.2) $adjust = 0.2;
        
        return $adjust;
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
