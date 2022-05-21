<?php

namespace Controller\Advertiser;

class Campaign extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Campaign;
        $this->helper = new \Module\Helper;
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Stopped', 'Paused', 'Rejected', 'Pending'];
        $status = ucwords($this->uri[1]);
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countCampaign($user_id);
            } else {
                $this->data->total = $db->countCampaignSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countCampaignStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countCampaignStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listCampaign($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listCampaignSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listCampaignStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listCampaignStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
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
        
        $this->title = 'My Campaigns - '.SITE_NAME;
        $this->view = 'Advertiser/campaign/index';
        $this->renderView();
    }
    
    public function detail()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/campaign');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Campaign;
        $this->helper = new \Module\Helper;
        
        if(!($this->data = $db->getCampaign($user_id, $id))) $this->redirectTo('/campaign');
        
        $this->data->abstract = $db->abstractCampaign($id);
        if(!$this->data->abstract) {
            $this->data->abstract = new \stdClass;
            $this->data->abstract->start_date = $this->data->abstract->end_date = 'N/A';
            $this->data->abstract->budget = 0;
            $this->data->abstract->pricing_model = 'N/A';
        }
        
        if($this->data->status == 'Active' || $this->data->status == 'Paused' || $this->data->status == 'Stopped') {
            $this->data->today = (new \DateTime('now'))->format('Y-m-d');
            $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
            $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        }
        
        /* get last 30 days stats */
        $data = $db->listLastCampaignStatistic($id, date('Y-m-d', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Advertiser/campaign/detail';
        $this->renderView();
    }
        
    public function __postIndex()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->name) || !isset($data->description) || !$data->name || !$data->description) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Campaign;
        if(isset($data->id)) {
            if(!$db->updateCampaign($user_id, $data->id, $data->name, $data->description)) {
                $this->data->data = 'Campaign '.$data->id.' not found or not yours!';
                $this->renderView();
            }

            $this->data->success = true;
            $this->renderView();
        }
        
        try {
            $id = $db->addCampaign($user_id, $data->name, $data->description);
        } catch(\Exception $e) {
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        $db->updateAdvertiserAbstract($user_id, 1, 0);
        
        $this->data->success = true;
        $this->data->data = '/ad/create?campaign_id='.$id;
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

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Campaign;
        $af = $db->listAdFormat();
        $adFormat = [];
        foreach($af as $item) {
            $adFormat[$item->id] = $item->name;
        }
        $this->data->data = [];
        foreach($statuses as $status) {
            $data = $db->listAdByCampaignAndStatus($user_id, $id, $status);
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
}