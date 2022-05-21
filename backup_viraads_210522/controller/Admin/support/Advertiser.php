<?php

namespace Controller\Admin\superAdmin;

class Advertiser extends Controller
{
    public function index()
    {
        return $this->overview();
    }
    
    public function overview()
    {
        $this->helper = new \Module\Helper;
        $db = new \Model\Admin\superAdmin\Advertiser;
        $today = date('Y-m-d');
        $last30days = date('Y-m-d', strtotime('30 days ago'));
        
        /* summary ads */
        $ads = $db->countAdGroupByStatus();
        $this->data->ads = new \stdClass;
        $this->data->ads->All = 0;
        foreach($ads as $item) {
            $this->data->ads->{$item->status} = $item->cnt;
            $this->data->ads->All += $item->cnt;
        }
        
        /* sum advertiser */
        $this->data->adv = $db->countUserBalanceSumByDeposit();
        
        $this->title = 'Advertiser Overview - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/advertiser/index';
        $this->renderView();
    } 
    
    public function campaign()
    {
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status == 'Detail') return $this->campaignDetail();
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Active', 'Paused', 'Stopped', 'Rejected'];
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $this->helper = new \Module\Helper;
        $db = new \Model\Admin\superAdmin\Advertiser;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countCampaignByUser($user_id);
                } else {
                    $this->data->total = $db->countCampaignSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countCampaignStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countCampaignStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countCampaign();
                } else {
                    $this->data->total = $db->countCampaignSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countCampaignStatus($this->data->status);
                } else {
                    $this->data->total = $db->countCampaignStatusSearch($this->data->status, $this->data->key);
                }
            }
        }
        
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCampaignByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCampaignSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCampaignStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCampaignStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCampaign($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCampaignSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCampaignStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCampaignStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($this->data->data) {
            foreach($this->data->data as $k => $v) {
                $sum = in_array($v->status, ['Active', 'Stopped', 'Paused']) ? $db->abstractCampaign($v->id) : null;
                if($sum) {
                    $this->data->data[$k]->pricing_model = $sum->pricing_model;
                    $this->data->data[$k]->budget = $sum->budget;
                    $this->data->data[$k]->start_date = $sum->start_date;
                    $this->data->data[$k]->end_date = $sum->end_date;
                } else {
                    $this->data->data[$k]->start_date = $this->data->data[$k]->end_date = 'N/A';
                    $this->data->data[$k]->budget = 0;
                    $this->data->data[$k]->pricing_model = 'N/A';
                }
            }
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Campaigns - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Campaigns - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/advertiser/campaign';
        $this->renderView();
    }
    
    public function campaignDetail()
    {
        if(!($id = (int) $this->uri[3])) $this->redirectTo('/advertiser/campaign');
        
        $db = new \Model\Admin\superAdmin\Advertiser;
        $this->helper = new \Module\Helper;
        
        if(!($this->data = $db->getCampaign($id))) $this->redirectTo('/advertiser/campaign');
        
        $this->data->abstract = $db->abstractCampaign($id);
        if(!$this->data->abstract) {
            $this->data->abstract = new \stdClass;
            $this->data->abstract->start_date = $this->data->abstract->end_date = 'N/A';
            $this->data->abstract->budget = 0;
            $this->data->abstract->pricing_model = 'N/A';
        }
        
        $this->data->today = date('Y-m-d');
        $this->data->last7days = date('Y-m-d', strtotime('6 days ago'));
        $this->data->last30days = date('Y-m-d', strtotime('29 days ago'));
        
        /* get last 30 days stats */
        $data = $db->listLastCampaignStatistic($id, $this->data->last30days);
        $this->buildStatsData($data);
        
        $this->title = $this->data->name.' - Admin - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/advertiser/campaign_detail';
        $this->renderView();
    }
    
    public function __postCampaign()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!$data->id || !isset($data->name) || !isset($data->description) || !$data->name || !$data->description) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Advertiser;
        if(!$db->updateCampaign($data->id, $data->name, $data->description)) {
            $this->data->data = 'Campaign '.$data->id.' not found!';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postAds()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if(!($id = (int) $this->postRequest('campaign_id')) || !($statuses = $this->postRequest('status')) || !is_array($statuses)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $db = new \Model\Admin\superAdmin\Advertiser;
        $af = $db->listAdFormat();
        $adFormat = [];
        foreach($af as $item) {
            $adFormat[$item->id] = $item->name;
        }
        $this->data->data = [];
        foreach($statuses as $status) {
            $data = $db->listAdByCampaignAndStatus($id, $status);
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
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status == 'Detail') return $this->adDetail();
        if($status == 'Setup') return $this->adSetup();
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Active', 'Paused', 'Stopped', 'Rejected'];
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $user_id = (int) $this->getRequest('user_id');
        $campaign_id = (int) $this->getRequest('campaign_id');
        $this->data->user = null;
        $this->data->campaign = null;
        
        $this->helper = new \Module\Helper;
        $db = new \Model\Admin\superAdmin\Advertiser;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        /* filter by campaign */
        if($campaign_id) {
            $this->data->campaign = $db->getCampaign($campaign_id);
            if(!$this->data->campaign) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($campaign_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdByCampaign($campaign_id);
                } else {
                    $this->data->total = $db->countAdSearchByCampaign($campaign_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdStatusByCampaign($campaign_id, $this->data->status);
                } else {
                    $this->data->total = $db->countAdStatusSearchByCampaign($campaign_id, $this->data->status, $this->data->key);
                }
            }
        } else if($user_id){
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdByUser($user_id);
                } else {
                    $this->data->total = $db->countAdSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countAdStatusSearchByUser($user_id, $this->data->status, $this->data->key);
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
            if($campaign_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdByCampaign($campaign_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdSearchByCampaign($campaign_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdStatusByCampaign($campaign_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdStatusSearchByCampaign($campaign_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else if($user_id){
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
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
        
        if($this->data->data) {
            $adFormat = $db->listAdFormat();
            $this->data->adFormat = [];
            foreach($adFormat as $item) {
                $this->data->adFormat[$item->id] = $item->name;
            }
        }
        
        $this->data->ad_type = $db->listAdType();

        $this->title = ucwords($this->data->status).' Ads - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/advertiser/ad';
        $this->renderView();
    }
    
    public function adDetail()
    {
        if(!($id = (int) $this->uri[3])) $this->redirectTo('/advertiser/ad');
        
        $db = new \Model\Admin\superAdmin\Advertiser;
        $this->helper = new \Module\Helper;
        
        if(!($this->data = $db->getAd($id))) $this->redirectTo('/advertiser/ad');
        $this->data->format_name = $db->getAdFormat($this->data->ad_format)->name;
        $this->data->data = json_decode($this->data->data);
        
        $this->data->today = date('Y-m-d');
        $this->data->last7days = date('Y-m-d', strtotime('6 days ago'));
        $this->data->last30days = date('Y-m-d', strtotime('29 days ago'));
        
        /* get last 30 days stats */
        $data = $db->listLastAdStatistic($id, $this->data->last30days);
        $this->buildStatsData($data);
        
        $this->data->ad_type = $db->listAdType();
        
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/advertiser/ad_detail';
        $this->renderView();
    }
    
    public function adSetup()
    {
        if(!($id = (int) $this->uri[3])) $this->redirectTo('/advertiser/ad');
        
        $db = new \Model\Admin\superAdmin\Advertiser;
        $this->helper = new \Module\Helper;
        
        if(!($this->data = $db->getAd($id))) $this->redirectTo('/advertiser/ad');
        $this->data->format_name = $db->getAdFormat($this->data->ad_format)->name;
        $this->data->data = json_decode($this->data->data);
        $this->data->creative = $this->data->creative_id ? $db->getCreative($this->data->creative_id) : null;
        
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/advertiser/ad_setup';
        $this->renderView();
    }
    
    public function __postAd()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $action = $this->uri[2];
        $method = '__postAd'.ucwords($action);
        if(!$action || !is_callable([$this, $method])) {
            $this->data->data = "Method is not allowed: ".$method;
            $this->renderView();
        }

        return $this->$method();
    }
    
    public function __postAdType()
    {
        if(!($name = $this->postRequest('name'))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\Advertiser;
        try {
            $this->data->data = $db->createAdType($name);
        } catch(\Exception $e) {
            $this->data->data = 'Sorry, something was wrong, please try again';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postAdRename()
    {
        if(!($id = (int) $this->uri[3]) || !($name = $this->postRequest('name'))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\Advertiser;
        if(!$db->updateAdName($id, $name)) {
            $this->data->data = 'Could not update Ad name';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postAdApprove()
    {
        if(!($id = (int) $this->uri[3])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $ad_types = json_decode($this->postRequest('ad_type'), true);
        $db = new \Model\Admin\superAdmin\Advertiser;
        if(!($ad = $db->getAd($id)) || $ad->status != 'Pending') {
            $this->data->data = 'Ad is not pending for approval';
            $this->renderView();
        }
        
        if($ad_types) {
            $db->unmapAdType($ad->id);
            foreach($ad_types as $type_id) {
                $db->mapAdType($ad->id, $type_id);
            }
        }
        
        $ad_data = json_decode($ad->data);
        $status = $ad_data->after_approval == 'start' ? 'Active' : 'Paused';
        $db->updateAdStatus($ad->id, $status);
        $db->updateCampaignAbstract($ad->campaign_id, 0, 1);
        $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
        
        /* remove schedule and pending if any */
        $db->removeAdSchedule($ad->id);
        $db->removeAdPending($ad->id);
        
        if(strtotime($ad->start_date) > time()) {
            $db->createAdSchedule($ad->id, $ad->start_date, $status);
            $this->data->success = true;
            $this->data->data = $id;
            $this->renderView();
        }
        
        $adServer = new \Module\AdServer;
        $r = $adServer->createAd($id);
        if(!$r->success){
            $this->data->data = $r->data;
            $this->renderView(); 
        }
        
        if($status == 'Paused') $adServer->pauseAd($id);
        
        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
    }
    
    public function __postAdReject()
    {
        if(!($id = (int) $this->uri[3]) || !($reason = $this->postRequest('reason'))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\Advertiser;
        if(!($ad = $db->getAd($id)) || $ad->status != 'Pending') {
            $this->data->data = 'Ad is not suitable for rejecting';
            $this->renderView();
        }
        
        /* remove schedule if any */
        $db->removeAdSchedule($ad->id);
        
        /* real pending or re-pending after active? */
        if($db->isAdPending($ad->id)) {
            $db->removeAdPending($ad->id);
            $db->updateUserBalance($ad->user_id, $ad->budget);
            $db->createBalanceHistory($ad->user_id, 'Advertiser', $ad->budget, 'Return balance from ad #'.$ad->id);
            $db->updateAdStatus($ad->id, 'Rejected', 'Reject Reason: '.$reason);
            $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
        } else {
            $db->removeAdWarning($ad->id);
            $db->updateAdStatus($ad->id, 'Stopped');
            $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
            $db->setAdStopping($ad->user_id, $ad->id, $ad->pricing_model);
            $noti = new \Module\NotificationTemplate;
            $db->createNotification($ad->user_id, 'success', 'Advertiser', $noti->stopAdTitle($ad->id), $noti->stopAdDescription($ad->pricing_model));
        }

        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
    }
    
    public function __postAdPause()
    {
        if(!($id = (int) $this->uri[3])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\Advertiser;
        if(!($ad = $db->getAd($id))) {
            $this->data->data = 'Ad not found!';
            $this->renderView();
        }
        if($ad->status != 'Active') {
            $this->data->data = 'Ad is not running';
            $this->renderView();
        }
        
        /* if ad is scheduled, just alter status */
        if($db->updateAdSchedule($ad->id, 'Paused')) {
            $db->updateAdStatus($ad->id, 'Paused');
            $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
            $this->data->success = true;
            $this->data->data = $id;
            $this->renderView();
        }
        
        $adServer = new \Module\AdServer;
        $r = $adServer->pauseAd($id);
        if(!$r->success){
            $this->data->data = $r->data;
            $this->renderView(); 
        }
        
        $db->updateAdStatus($ad->id, 'Paused');
        $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));

        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
    }
    
    public function __postAdResume()
    {
        if(!($id = (int) $this->uri[3])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\Advertiser;
        if(!($ad = $db->getAd($id))) {
            $this->data->data = 'Ad not found!';
            $this->renderView();
        }
        if($ad->status != 'Paused') {
            $this->data->data = 'Ad is not paused';
            $this->renderView();
        }
        
        /* if ad is scheduled, just alter status */
        if($db->updateAdSchedule($ad->id, 'Active')) {
            $db->updateAdStatus($ad->id, 'Active');
            $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
            $this->data->success = true;
            $this->data->data = $id;
            $this->renderView();
        }
        
        $adServer = new \Module\AdServer;
        $r = $adServer->resumeAd($id);
        if(!$r->success){
            $this->data->data = $r->data;
            $this->renderView(); 
        }
        
        $db->updateAdStatus($ad->id, 'Active');
        $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));

        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
    }
    
    public function __postAdStop()
    {
        if(!($id = (int) $this->uri[3])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\Advertiser;
        if(!($ad = $db->getAd($id))) {
            $this->data->data = 'Ad not found!';
            $this->renderView();
        }
        if(!in_array($ad->status, ['Active', 'Paused'])) {
            $this->data->data = 'Ad is not Active or Paused';
            $this->renderView();
        }
        
        (new \Module\AdServer)->stopAd($ad->id);
        $db->removeAdSchedule($ad->id);
        $db->removeAdWarning($ad->id);
        $db->updateAdStatus($ad->id, 'Stopped');
        $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
        $db->updateCampaignAbstract($ad->campaign_id, 0, -1);
        $db->setAdStopping($ad->user_id, $ad->id, $ad->pricing_model);
        $noti = new \Module\NotificationTemplate;
        $db->createNotification($ad->user_id, 'success', 'Advertiser', $noti->stopAdTitle($ad->id), $noti->stopAdDescription($ad->pricing_model));
        
        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
    }
    
    public function creative()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->types = ['All', 'Video', 'Image'];
        $types = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if(in_array($types, $this->data->types)) {
            $this->data->type = $types;
        } else {
            $this->data->type = 'All';
        }
        
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $db = new \Model\Admin\superAdmin\Advertiser;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countCreativeByUser($user_id);
                } else {
                    $this->data->total = $db->countCreativeSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countCreativeTypeByUser($user_id, $this->data->type);
                } else {
                    $this->data->total = $db->countCreativeTypeSearchByUser($user_id, $this->data->type, $this->data->key);
                }
            }
        } else {
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countCreative();
                } else {
                    $this->data->total = $db->countCreativeSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countCreativeType($this->data->type);
                } else {
                    $this->data->total = $db->countCreativeTypeSearch($this->data->type, $this->data->key);
                }
            }
        }
        

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->type == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCreativeByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCreativeSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCreativeTypeByUser($user_id, $this->data->type, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCreativeTypeSearchByUser($user_id, $this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->type == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCreative($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCreativeSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listCreativeType($this->data->type, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listCreativeTypeSearch($this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->type).' Creatives - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->type).' Creatives - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/advertiser/creative';
        $this->renderView();
    }
    
    public function audience()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Inactive'];
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $db = new \Model\Admin\superAdmin\Advertiser;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAudienceByUser($user_id);
                } else {
                    $this->data->total = $db->countAudienceSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAudienceStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countAudienceStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        }else{
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAudience();
                } else {
                    $this->data->total = $db->countAudienceSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAudienceStatus($this->data->status);
                } else {
                    $this->data->total = $db->countAudienceStatusSearch($this->data->status, $this->data->key);
                }
            }
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAudienceByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAudienceSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAudienceStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAudienceStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }else{
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAudience($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAudienceSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAudienceStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAudienceStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Audiences - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Audiences - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/advertiser/audience';
        $this->renderView();
    }
    
    private function buildStatsData($data)
    {
        $now = new \DateTime('now');
        $last30d = new \DateTime('30 days ago');
        $today = $now->format('Y-m-d');
        $this->data->country = ['XX' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0]];
        $this->data->date = [$today => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0]];
        if(!$data) return true;
        
        foreach($data as $item) {
            $date = $item->created_at;
            
            /* country */
            if(!isset($this->data->country[$item->country])) {
                $this->data->country[$item->country] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
            $this->data->country[$item->country]['impression'] += $item->impression;
            $this->data->country[$item->country]['click'] += $item->click;
            $this->data->country[$item->country]['conversion'] += $item->conversion;
            $this->data->country[$item->country]['cost'] += $item->cost;
            $this->data->country[$item->country]['reach'] += $item->reach;
            
            /* date */
            if(!isset($this->data->date[$date])) {
                $this->data->date[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
            $this->data->date[$date]['impression'] += $item->impression;
            $this->data->date[$date]['click'] += $item->click;
            $this->data->date[$date]['conversion'] += $item->conversion;
            $this->data->date[$date]['cost'] += $item->cost;
            $this->data->date[$date]['reach'] += $item->reach;
        }
        
        /* fill hole */
        for($i = $now; $i >= $last30d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->date[$date])) {
                $this->data->date[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->date);
        
        return true;
    }
    
    private function alterCampaignStatus($r)
    {
        $s = [];
        foreach($r as $item) {
            $s[$item->status] = 1;
        }
        if(isset($s['Active'])) {
            return 'Active';
        }
        if(isset($s['Paused'])) {
            return 'Paused';
        }
        if(isset($s['Stopped'])) {
            return 'Stopped';
        }
        if(isset($s['Pending'])) {
            return 'Pending';
        }
        
        return 'Rejected';
    }
}
