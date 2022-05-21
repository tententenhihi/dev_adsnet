<?php

namespace Controller\Advertiser;

class Ad extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        $this->helper = new \Module\Helper;
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Active', 'Stopped', 'Paused', 'Rejected'];
        $status = ucwords($this->uri[1]);
        
        /* filter by campaign */
        $campaign_id = (int) $this->getRequest('campaign_id');
        if($campaign_id) {
            if(!($campaign = $db->getCampaign($user_id, $campaign_id))) $this->redirectTo('/campaign');
        }
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }

        if($campaign_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdByCampaign($user_id, $campaign_id);
                } else {
                    $this->data->total = $db->countAdSearchByCampaign($user_id, $campaign_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdStatusByCampaign($user_id, $campaign_id, $this->data->status);
                } else {
                    $this->data->total = $db->countAdStatusSearchByCampaign($user_id, $campaign_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countAd($user_id);
                } else {
                    $this->data->total = $db->countAdSearch($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countAdStatus($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countAdStatusSearch($user_id, $this->data->status, $this->data->key);
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
                        $this->data->data = $db->listAdByCampaign($user_id, $campaign_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdSearchByCampaign($user_id, $campaign_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdStatusByCampaign($user_id, $campaign_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdStatusSearchByCampaign($user_id, $campaign_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAd($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listAdStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listAdStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
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
        
        if($campaign_id) {
            $this->title = 'Ads of '.$campaign->name.' - '.SITE_NAME;
            $this->data->page_title = 'Zones of '.$campaign->name;
        } else {
            $this->title = 'My Ads - '.SITE_NAME;
            $this->data->page_title = 'My Ads';
        }

        $this->view = 'Advertiser/ad/index';
        $this->renderView();
    }
    
    public function create()
    {
        $campaign_id = (int) $this->getRequest('campaign_id');
        if(!$campaign_id) $this->redirectTo('/campaign');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        if(!($this->data = $db->getCampaign($user_id, $campaign_id))) {
            $this->fullPage = true;
            $this->view = 'Global/404';
            $this->renderView();
        }

        $this->data->data = null;
        $this->data->adFormat = $db->listAdFormatSVG();
        $this->data->country = $db->listCountry();
        $this->data->audience = $db->listAudience($user_id);
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();
        
        $this->helper = new \Module\Helper;
        $this->data->page_title = 'Ad Creator';
        $this->title = 'New Ad for '.$this->data->name.' - '.SITE_NAME;
        $this->view = 'Advertiser/ad/setup';
        $this->renderView();
    }
    
    public function detail()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/ad');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        $this->helper = new \Module\Helper;
        
        if(!($this->data = $db->getAd($user_id, $id))) $this->redirectTo('/ad');
        $this->data->format_name = $db->getAdFormat($this->data->ad_format)->name;
        $this->data->data = json_decode($this->data->data);
        
        if($this->data->status == 'Active' || $this->data->status == 'Paused' || $this->data->status == 'Stopped') {
            $this->data->today = (new \DateTime('now'))->format('Y-m-d');
            $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
            $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        }
        
        /* get last 30 days stats */
        $data = $db->listLastAdStatistic($id, date('Y-m-d', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Advertiser/ad/detail';
        $this->renderView();
    }
    
    public function setup()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/ad');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        if(!($this->data = $db->getAd($user_id, $id))) $this->redirectTo('/ad');
        
        $this->data->adFormat = $db->listAdFormatSVG();
        $this->data->country = $db->listCountry();
        $this->data->audience = $db->listAudience($user_id);
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();
        
        if($this->data->creative_id) {
            $this->data->creative = $db->getCreative($user_id, $this->data->creative_id);
            unset($this->data->creative_id);
        }
        
        $this->helper = new \Module\Helper;
        $this->data->page_title = 'Ad #'.$this->data->id;
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Advertiser/ad/setup';
        $this->renderView();
    }
    
    public function __postSetup()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $post_data = json_decode($this->postRequest('data'));
        $campaign_id = isset($post_data->campaign_id) ? (int) $post_data->campaign_id : null;
        $id = isset($post_data->id) ? (int) $post_data->id : null;
        if(!$id && !$campaign_id) {
            $this->data->data = 'Bad request, Missing one or more required params 1!!!';
            $this->renderView();
        }
        if(!isset($post_data->name) || !isset($post_data->content->url) || !isset($post_data->bidding->default)) {
            $this->data->data = 'Bad request, Missing one or more required params 2!!!';
            $this->renderView();
        }
        $this->helper = new \Module\Helper;
        if(!isset($post_data->start_date) || !$this->helper->validDate($post_data->start_date)) {
            $this->data->data = 'Bad request, Start Date is invalid!!!';
            $this->renderView();
        }
        if(!isset($post_data->end_date) || !$this->helper->validDate($post_data->end_date)) {
            $this->data->data = 'Bad request, Start Date is invalid!!!';
            $this->renderView();
        }
        $budget = isset($post_data->budget) ? round($post_data->budget, 3) : 0;
        if($budget < MIN_AD_BUDGET) {
            $this->data->data = 'Minimum ad budget is $'.MIN_AD_BUDGET;
            $this->renderView();
        }

        $name = $post_data->name;
        $ad_format = $post_data->ad_format;
        $start_date = $post_data->start_date;
        $end_date = $post_data->end_date;
        $pricing_model = isset($post_data->pricing_model) && in_array($post_data->pricing_model, ['cpm', 'cpc', 'cpa']) ? $post_data->pricing_model : 'cpm';
        $creative_id = isset($post_data->creative_id) ? (int) $post_data->creative_id : null;
        $collect_id = isset($post_data->collect) ? explode(':',$post_data->collect)[1] : null;
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        
        if($pricing_model == 'cpa' && !$db->checkConversionTracking($user_id)) {
            $this->data->data = 'You do not have any active Conversion Tracking, please <a href="/tracking" target="_blank">setup one first!</a>';
            $this->renderView();
        }
        if($campaign_id) {
            if(!$db->getCampaign($user_id, $campaign_id)) {
                $this->data->data = 'Could not create ad from campaign #'.$campaign_id.', is it yours?';
                $this->renderView();
            }
        } else {
            if(!($ad = $db->getAd($user_id, $id))) {
                $this->data->data = 'Ad #'.$id.' not found or not yours!';
                $this->renderView();
            }
            if(!in_array($ad->status, ['Pending', 'Paused', 'Active'])) {
                $this->data->data = 'This Ad is not suitable for resetup';
                $this->renderView();
            }
        }
        if($creative_id && !($creative = $db->getCreative($user_id, $creative_id))) {
            $this->data->data = 'Could not access creative #'.$creative_id.', is it yours?';
            $this->renderView();
        }
        if(!($format = $db->getAdFormat($ad_format)) || $format->status != 'Active') {
            $this->data->data = 'Bad request, Ad Format is invalid!!!';
            $this->renderView();
        }
        if($format->creative_required && !$creative_id) {
            $this->data->data = 'Oppsss, Ad Creative is required but missing';
            $this->renderView();
        }
        if($collect_id && !$db->getAudience($user_id, $collect_id)) {
            $this->data->data = 'Oppsss, Audience #'.$collect_id.' not found or not yours!';
            $this->renderView();
        }
        
        $data = new \stdClass;
        $data->content = $post_data->content;
        $data->bidding = $post_data->bidding;
        $data->after_approval = isset($post_data->after_approval) && $post_data->after_approval == 'start' ? 'start' : 'pause';
        $data->optimization = isset($post_data->optimization) && in_array($post_data->optimization, ['auto', 'speed', 'cost']) ? $post_data->optimization : 'auto';
        $data->budget_daily = isset($post_data->budget_daily) ? (float) $post_data->budget_daily : 0;
        $data->goal_daily = isset($post_data->goal_daily) ? (int) $post_data->goal_daily : 0;
        $data->goal_total = isset($post_data->goal_total) ? (int) $post_data->goal_total : 0;
        $data->budget_capping = $this->helper->validCapping($post_data->budget_capping);
        $data->goal_capping = $this->helper->validCapping($post_data->goal_capping);

        foreach($post_data as $k => $v) {
            if(!in_array($k, [
                'country_include',
                'country_exclude',
                'browser_include',
                'browser_exclude',
                'platform_include',
                'platform_exclude',
                'os_include',
                'os_exclude',
                'time_include',
                'time_exclude',
                'audience_include',
                'audience_exclude',
                'website_include',
                'website_exclude',
                'zone_include',
                'zone_exclude',
            ])) continue;

            if(!is_array($v)) continue;
            $data->$k = $v;
        }
        
        if(!isset($data->time_include) && !isset($data->time_exclude)) {
            $data->time_include = [];
        }
        if(!isset($data->audience_include) && !isset($data->audience_exclude)) {
            $data->audience_include = [];
        }
        if(!isset($data->website_include) && !isset($data->website_exclude)) {
            $data->website_include = [];
        }
        if(!isset($data->zone_include) && !isset($data->zone_exclude)) {
            $data->zone_include = [];
        }
        if(!isset($data->country_include) && !isset($data->country_exclude)) {
            $data->country_include = [];
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
        
        /* create ad */
        if($campaign_id) {
            /* charge first */
            $db->updateUserBalance($user_id, -$budget);
            $adv_balance = $db->getUserAdvBalance($user_id);
            if($adv_balance < 0) {
                $db->updateUserBalance($user_id, $budget);
                $this->data->data = 'Sorry, you do not have '.$this->helper->currencyFormat($budget).' in your account, please deposit money first!';
                $this->renderView();
            }
    
            try {
                $id = $db->createAd($user_id, $campaign_id, $ad_format, $creative_id, $name, $pricing_model, $budget, $start_date, $end_date, json_encode($data));
                $db->setAdPending($user_id, $id);
            } catch(\Exception $e) {
                $db->updateUserBalance($user_id, $budget);
                $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
                $this->renderView();
            }
            
            $db->createBalanceHistory($user_id, 'Advertiser', -$budget, 'Hold balance for ad #'.$id);
            $db->updateCampaignAbstract($campaign_id, 1, 0);
            $db->updateAdvertiserAbstract($user_id, 0, 1);
            $now = date('Y-m-d H:i:s');
            $db->updateAdvertiserAbstractFirstAd($user_id, $now);
            $db->updateAdvertiserAbstractLastAd($user_id, $now);
            
            /* send email to admin */
            $permissions = \Controller\Admin\Roles::canApproveAd();
            if($permissions) {
                $admins = $db->listAdminByPermission($permissions);
                if($admins) {
                    $emails = [];
                    foreach($admins as $admin) $emails[] = $admin->email;
                    (new \Module\Email)
                        ->subject('Ad pending for approval')
                        ->message('Check it out: '.ADMIN_URL.'/advertiser/ad/detail/'.$id)
                        ->sendTo($emails)
                        ->send();
                }
            }

            $this->data->success = true;
            $this->data->data = '/ad?campaign_id='.$campaign_id;
            $this->renderView();
        }

        /* update ad */
        $db->updateAd($ad->id, $creative_id, $name, $start_date, $end_date, json_encode($data));
        
        /* pending ad - just stop here */
        if($ad->status == 'Pending') {
            $this->data->success = true;
            $this->data->data = '/ad/detail/'.$ad->id;
            $this->renderView();
        }
        
        /* remove schedule if any */
        $db->removeAdSchedule($ad->id);
        
        /* init module for managing ads */
        $adServer = new \Module\AdServer;
        $ad_data = json_decode($ad->data);
        
        /* target url/creative changed: we have to change status to pending */
        if($creative_id != $ad->creative_id || $this->isTargetUrlChanged($data->content->url, $ad_data->content->url)) {
            $adServer->pauseAd($ad->id); // stop delivering to prevent any errors
            $adServer->cleanAd($ad->id); // now clean ad targeting from server
            $db->removeAdWarning($ad->id);
            $db->updateCampaignAbstract($ad->campaign_id, 0, -1); // minus 1 active ad from campaign abstract
            $db->updateAdStatus($ad->id, 'Pending'); // set status back to pending
            $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
            
            /* send email to admin */
            $permissions = \Controller\Admin\Roles::canApproveAd();
            if($permissions) {
                $admins = $db->listAdminByPermission($permissions);
                if($admins) {
                    $emails = [];
                    foreach($admins as $admin) $emails[] = $admin->email;
                    (new \Module\Email)
                        ->subject('Ad re-pending for approval')
                        ->message('Check it out: '.ADMIN_URL.'/advertiser/ad/detail/'.$ad->id)
                        ->sendTo($emails)
                        ->send();
                }
            }
            
            /* return here */
            $this->data->success = true;
            $this->data->data = '/ad/detail/'.$ad->id;
            $this->renderView();
        }
        
        /* start_date is in the future - schedule ad */
        if(strtotime($start_date) > time()) {
            $adServer->pauseAd($ad->id);
            $adServer->cleanAd($ad->id);
            $db->createAdSchedule($ad->id, $start_date, $ad->status);
            
            /* return here */
            $this->data->success = true;
            $this->data->data = '/ad/detail/'.$ad->id;
            $this->renderView();
        }
        
        /* live updating ad */
        $adServer->createAd($ad->id);
        
        $this->data->success = true;
        $this->data->data = '/ad/detail/'.$ad->id;
        $this->renderView();
    }
    
    public function __postRename()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        if(!($id = (int) $this->uri[2]) || !($name = $this->postRequest('name'))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        if(!$db->updateAdName($user_id, $id, $name)) {
            $this->data->data = 'Could not update Ad name, is it yours?';
            $this->renderView();
        }

        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
    }
    
    public function __postReject()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        $ad = $db->getAd($user_id, $id);
        if(!$ad || $ad->status != 'Pending') {
            $this->data->data = 'Could not reject non-pending or non-exist Ad!';
            $this->renderView();
        }
        
        /* remove schedule if any */
        $db->removeAdSchedule($ad->id);
        
        /* real pending or re-pending after active? */
        if($db->isAdPending($ad->id)) {
            $db->removeAdPending($ad->id);
            $db->updateUserBalance($ad->user_id, $ad->budget);
            $db->createBalanceHistory($ad->user_id, 'Advertiser', $ad->budget, 'Return balance from ad #'.$ad->id);
            $db->updateAdStatus($ad->id, 'Rejected', 'Rejected by user from IP '.$this->getIpAddress());
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
        $this->data->data = $ad->id;
        $this->renderView();
    }
    
    public function __postPause()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        $ad = $db->getAd($user_id, $id);
        
        if(!$ad || $ad->status != 'Active') {
            $this->data->data = 'This ad is not Active, or not yours!';
            $this->renderView();
        }
        
        /* if ad is scheduled, just alter status */
        if(($schedule = $db->getAdSchedule($id))) {
            $db->updateAdSchedule($schedule->id, 'Paused');
            $db->updateAdStatus($id, 'Paused');
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
        
        /* alter status */
        $db->updateAdStatus($id, 'Paused');
        $r = $db->listAdStatusGroupByCampaign($ad->campaign_id);
        $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($r));

        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
    }
    
    public function __postStop()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        $ad = $db->getAd($user_id, $id);
        if(!$ad || !in_array($ad->status, ['Active', 'Paused'])) {
            $this->data->data = 'Ad does not found or not suitable for stopping';
            $this->renderView();
        }

        (new \Module\AdServer)->stopAd($id);
        $db->removeAdSchedule($id);
        $db->removeAdWarning($ad->id);
        $db->updateAdStatus($ad->id, 'Stopped');
        $db->updateCampaignStatus($ad->campaign_id, $this->alterCampaignStatus($db->listAdStatusGroupByCampaign($ad->campaign_id)));
        $db->updateCampaignAbstract($ad->campaign_id, 0, -1);
        $db->setAdStopping($ad->user_id, $ad->id, $ad->pricing_model);
        $noti = new \Module\NotificationTemplate;
        $db->createNotification($ad->user_id, 'success', 'Advertiser', $noti->stopAdTitle($ad->id), $noti->stopAdDescription($ad->pricing_model));

        $this->data->success = true;
        $this->data->data = $ad->id;
        $this->renderView();
    }
    
    public function __postResume()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Ad;
        $ad = $db->getAd($user_id, $id);
        if(!$ad || $ad->status != 'Paused') {
            $this->data->data = 'This ad is not Paused, or not yours!';
            $this->renderView();
        }
        
        $db->updateCampaignStatus($ad->campaign_id, 'Active');
        $db->updateAdStatus($id, 'Active');
        
        /* if ad is scheduled, just alter status */
        if(($schedule = $db->getAdSchedule($id))) {
            $db->updateAdSchedule($schedule->id, 'Active');
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
        
        $this->data->success = true;
        $this->data->data = $id;
        $this->renderView();
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
    
    private function validateCapping($str)
    {
        $arr = explode(':', $str);
        if($arr[0] == 0) return [];
        if($arr[1] == '0h') return [];
        if($arr[1] == '0m') return [];
        
        $num = (int) $arr[1];
        if(strpos($arr[1], 'h')) {
            $num = $num * 60 * 60;
        } else {
            $num = $num * 60;
        }
        $arr[1] = $num;
        
        return $arr;
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
    
    private function isTargetUrlChanged($newUrl, $oldUrl)
    {
        $new = parse_url($newUrl);
        $old = parse_url($oldUrl);
        
        $new['path'] = $new['path'] ?? '/';
        $old['path'] = $old['path'] ?? '/';
        if($new['host'] != $old['host']) return true;
        if($new['path'] != $old['path']) return true;
        return false;
    }
}