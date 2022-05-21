<?php

namespace Controller\Publisher;

class Website extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Website;

        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Pending', 'Rejected'];
        $status = ucwords($this->uri[1]);
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countWebsite($user_id);
            } else {
                $this->data->total = $db->countWebsiteSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countWebsiteStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countWebsiteStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listWebsite($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listWebsiteSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listWebsiteStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listWebsiteStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        $this->data->categories = $db->listCategory();
        $this->data->weekAgo = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->today = date('Y-m-d');
        
        $this->title = 'My Websites - '.SITE_NAME;
        $this->view = 'Publisher/website/index';
        $this->renderView();
    }
    
    public function verify()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/website');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Website;
        
        $this->data = $db->getWebsite($user_id, $id);
        if(!$this->data) $this->redirectTo('/website');
        if($this->data->is_verified) $this->redirectTo('/website/detail/'.$id);
        
        /* check verify token if not exit create token for verify website */
        if(!$this->data->verify_token) {
            $this->data->verify_token = (new \Module\Helper)->randomToken(16);
            $db->setWebsiteVerifyToken($this->data->id, $this->data->verify_token);
        }
        
        $this->data->verify_name = (new \Module\Verification)->verify_name;
        $this->title = 'Verifying '.$this->data->domain.' - '.SITE_NAME;
        $this->view = 'Publisher/website/verify';
        $this->renderView();
    }
    
    public function detail()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/website');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Website;
        
        $this->data = $db->getWebsite($user_id, $id);
        if(!$this->data) $this->redirectTo('/website');
        if(!$this->data->is_verified) $this->redirectTo('/website/verify/'.$id);
        
        if($this->data->status == 'Active') {
            $this->data->today = (new \DateTime('now'))->format('Y-m-d');
            $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
            $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        }
        
        $this->helper = new \Module\Helper;
        $cats = $db->listCategory();
        $this->data->categories = [];
        foreach($cats as $item) {
            $this->data->categories[$item->id] = $item->name;
        }
        $adformats = $db->listAdFormat();
        $this->data->adformats = [];
        foreach($adformats as $item) {
            $this->data->adformats[$item->id] = $item->name;
        }
        
        /* get last 30 days stats */
        $data = $db->listLastWebsiteStatistic($id, date('Y-m-d H:00:00', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->title = $this->data->domain.' - '.SITE_NAME;
        $this->view = 'Publisher/website/detail';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        $user_id = $this->getSession('id');
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->domain) || !isset($data->description) || !isset($data->category_id)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!($data->domain = (new \Module\Helper)->validDomain($data->domain))) {
            $this->data->data = 'Website domain is invalid!';
            $this->renderView();
        }

        $db = new \Model\Publisher\Website;
        $data->id = (int) $data->id;
        
        if(!$data->id) {
            try {
                $id = $db->addWebsite($user_id, $data->domain, $data->description, $data->category_id);
            } catch(\Exception $e) {
                $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
                $this->renderView();
            }
            $db->updatePublisherAbstract($user_id, 1, 0);
            
            $this->data->data = '/website/verify/'.$id;
            $this->data->success = true;
            $this->renderView();
        }
        
        if(!$db->updateWebsite($user_id, $data->id, $data->description, $data->category_id)) {
            $this->data->data = 'Sorry, something was wrong, please try again later';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postCancel()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Website;
        if(!$db->removeWebsite($user_id, $id)) {
            $this->data->data = 'Website ID '.$id.' not found or not suitable for removal!';
            $this->renderView();
        }
        $db->updatePublisherAbstract($user_id, -1, 0);
        
        $this->data->success = true;
        $this->data->data = '/website';
        $this->renderView();
    }
    
    public function __postVerify()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Website;
        if(!($website = $db->getWebsite($user_id, $id))) {
            $this->data->data = 'Website ID '.$id.' not found or not yours!';
            $this->renderView();
        }
        if(!$website->verify_token || $website->is_verified) {
            $this->data->data = 'Website ID '.$id.' not suitable for verifying!';
            $this->renderView();
        }
        
        $md = new \Module\Verification;
        $md->setDomain($website->domain);
        $md->setToken($website->verify_token);
        if(!$md->verify()) {
            $this->data->data = 'Could not verify your website! Did you follow our instructions correctly?';
            $this->renderView();
        }
        
        $db->setWebsiteVerified($website->id);
        $this->data->success = true;
        $this->data->data = '/website/detail/'.$website->id;
        $this->renderView();
    }
    
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
}
