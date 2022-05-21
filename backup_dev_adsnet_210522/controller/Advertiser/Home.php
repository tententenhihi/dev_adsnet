<?php

namespace Controller\Advertiser;

class Home extends Controller
{
    public function index()
    {
        /* prepare */
        $user_id = $this->getSession('id');
        $this->helper = new \Module\Helper;
        $db = new \Model\Advertiser\Home;
        $created_at = date('Y-m-d', strtotime('30 days ago'));
        
        /* get advertiser data */
        $this->data = $db->getAdvertiser($user_id);
        $this->data->balance = $db->getUserBalance($user_id);
        $this->data->balance->spending = $this->data->balance->deposit_value - $this->data->balance->receipt_value - $this->data->balance->adv_balance;
        $this->data->announcement = $db->listLastAnnouncement('Advertiser', 0, 5);
        $this->data->support = $db->listLastSupportService($user_id, 'Advertiser', 0, 4);
        
        /* get last 30 days stats */
        $data = $db->listLastAdvertiserStatistic($user_id, $created_at);
        $this->buildStatsData($data);
        
        $this->title = 'Advertiser Dashboard - '.SITE_NAME;
        $this->view = 'Advertiser/home/index';
        $this->renderView();
    }
    
    private function buildStatsData($data)
    {
        /* default data */
        $now = new \DateTime('now');
        $today = $now->format('Y-m-d');
        $yesterday = date('Y-m-d', strtotime('yesterday'));
        $last14day = (new \DateTime('14 days ago'));
        $last7d = (new \DateTime('7 days ago'));
        $last30d = (new \DateTime('30 days ago'));
        
        $this->data->today_cost = 0;
        $this->data->yesterday_cost = 0;
        $this->data->last7day = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
        $this->data->last14day = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
        $this->data->compare = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
        $this->data->last30day_stats = [$today => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0]];
        $this->data->country = ['XX' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0]];
        $this->data->campaign = ['Other' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0]];
        $this->data->ad = ['Other' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0]];
        if(!$data) return true;

        /* loop data */
        foreach($data as $item) {
            
            /* today */
            if($item->created_at == $today) {
                $this->data->today_cost = $this->data->today_cost + $item->cost;
            }
            
            /* yesterday */
            if($item->created_at == $yesterday) {
                $this->data->yesterday_cost = $this->data->yesterday_cost + $item->cost;
            }
            
            $date = (new \DateTime($item->created_at));
            
            /* last 7day */
            if($last7d <= $date) {
                $this->data->last7day['impression'] += $item->impression;
                $this->data->last7day['click'] += $item->click;
                $this->data->last7day['conversion'] += $item->conversion;
                $this->data->last7day['cost'] += $item->cost;
                $this->data->last7day['reach'] += $item->reach;
            }
            
            /* last 14day */
            if($date >= $last14day) {
                $this->data->last14day['impression'] += $item->impression;
                $this->data->last14day['click'] += $item->click;
                $this->data->last14day['conversion'] += $item->conversion;
                $this->data->last14day['cost'] += $item->cost;
                $this->data->last14day['reach'] += $item->reach;
            }
            
            /* 30 days stats */
            if(!isset($this->data->last30day_stats[$item->created_at])) {
                $this->data->last30day_stats[$item->created_at] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
            $this->data->last30day_stats[$item->created_at]['impression'] += $item->impression;
            $this->data->last30day_stats[$item->created_at]['click'] += $item->click;
            $this->data->last30day_stats[$item->created_at]['conversion'] += $item->conversion;
            $this->data->last30day_stats[$item->created_at]['cost'] += $item->cost;
            $this->data->last30day_stats[$item->created_at]['reach'] += $item->reach;
            
            /* country */
            if(!isset($this->data->country[$item->country])) {
                $this->data->country[$item->country] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
            $this->data->country[$item->country]['impression'] += $item->impression;
            $this->data->country[$item->country]['click'] += $item->click;
            $this->data->country[$item->country]['conversion'] += $item->conversion;
            $this->data->country[$item->country]['cost'] += $item->cost;
            $this->data->country[$item->country]['reach'] += $item->reach;
            
            /* campaign */
            if(!isset($this->data->campaign[$item->campaign_id])) {
                $this->data->campaign[$item->campaign_id] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
            $this->data->campaign[$item->campaign_id]['impression'] += $item->impression;
            $this->data->campaign[$item->campaign_id]['click'] += $item->click;
            $this->data->campaign[$item->campaign_id]['conversion'] += $item->conversion;
            $this->data->campaign[$item->campaign_id]['cost'] += $item->cost;
            $this->data->campaign[$item->campaign_id]['reach'] += $item->reach;
            
            /* ad */
            if(!isset($this->data->ad[$item->ad_id])) {
                $this->data->ad[$item->ad_id] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
            $this->data->ad[$item->ad_id]['impression'] += $item->impression;
            $this->data->ad[$item->ad_id]['click'] += $item->click;
            $this->data->ad[$item->ad_id]['conversion'] += $item->conversion;
            $this->data->ad[$item->ad_id]['cost'] += $item->cost;
            $this->data->ad[$item->ad_id]['reach'] += $item->reach;
        }
        
        /* compare data */
        if($this->data->last14day['impression']) {
            if($this->data->last14day['impression']-$this->data->last7day['impression'] > 0){
                $this->data->compare['impression'] = round(($this->data->last7day['impression'] - ($this->data->last14day['impression']-$this->data->last7day['impression']))/($this->data->last14day['impression']-$this->data->last7day['impression']), 4)*100;
            }else{
                $this->data->compare['impression'] = 0;
            }
        }
        if($this->data->last14day['click']) {
            if($this->data->last14day['click']-$this->data->last7day['click'] > 0){
                $this->data->compare['click'] = round(($this->data->last7day['click'] - ($this->data->last14day['click']-$this->data->last7day['click']))/($this->data->last14day['click']-$this->data->last7day['click']), 4)*100;
            }else{
                $this->data->compare['click'] = 0;
            }
        }
        if($this->data->last14day['conversion']) {
            if($this->data->last14day['conversion']-$this->data->last7day['conversion'] > 0){
                $this->data->compare['conversion'] = round(($this->data->last7day['conversion'] - ($this->data->last14day['conversion']-$this->data->last7day['conversion']))/($this->data->last14day['conversion']-$this->data->last7day['conversion']), 4)*100;
            }else{
                $this->data->compare['conversion'] = 0;
            }
        }
        if($this->data->last14day['cost']) {
            if($this->data->last14day['cost']-$this->data->last7day['cost'] > 0){
                $this->data->compare['cost'] = round(($this->data->last7day['cost'] - ($this->data->last14day['cost']-$this->data->last7day['cost']))/($this->data->last14day['cost']-$this->data->last7day['cost']), 4)*100;
            }else{
                $this->data->compare['cost'] = 0;
            }
        }
        if($this->data->last14day['reach']) {
            if($this->data->last14day['reach']-$this->data->last7day['reach'] > 0){
                $this->data->compare['reach'] = round(($this->data->last7day['reach'] - ($this->data->last14day['reach']-$this->data->last7day['reach']))/($this->data->last14day['reach']-$this->data->last7day['reach']), 4)*100;
            }else{
                $this->data->compare['reach'] = 0;
            }
        }
        
        /* fill hole last 30d */
        for($i = $now; $i >= $last30d; $i->modify('-1 day')) {
            $created_at = $i->format('Y-m-d');
            if(!isset($this->data->last30day_stats[$created_at])) {
                $this->data->last30day_stats[$created_at] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'cost' => 0, 'reach' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->last30day_stats);
        
        return true;
    }
}