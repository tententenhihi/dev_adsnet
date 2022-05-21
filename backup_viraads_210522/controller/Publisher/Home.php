<?php

namespace Controller\Publisher;

class Home extends Controller
{
    public function index()
    {
        /* prepare */
        $user_id = $this->getSession('id');
        $this->helper = new \Module\Helper;
        $db = new \Model\Publisher\Home;
        $created_at = date('Y-m-d', strtotime('30 days ago'));
        
        /* get publisher data */
        $this->data = $db->getPublisher($user_id);
        $this->data->balance = $db->getUserBalance($user_id);
        $this->data->announcement = $db->listLastAnnouncement('Publisher', 0, 5);
        $this->data->support = $db->listLastSupportService($user_id, 'Publisher', 0, 4);
        $this->data->revshare = $db->getPublisherRevshare($user_id) ?? DEFAULT_REVSHARE;
        
        /* get last 30 days stats */
        $data = $db->listLastPublisherStatistic($user_id, $created_at);
        $this->buildStatsData($data);
       
        $this->title = 'Publisher Dashboard - '.SITE_NAME;
        $this->view = 'Publisher/home/index';
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
        
        $this->data->today_revenue = 0;
        $this->data->yesterday_revenue = 0;
        $this->data->last7day = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
        $this->data->last14day = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
        $this->data->compare = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
        $this->data->last30day_stats = [$today => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        $this->data->country = ['XX' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        $this->data->website = ['Other' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        $this->data->zone = ['Other' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        if(!$data) return true;
        
        /* loop data */
        foreach($data as $item) {
            
            /* today */
            if($item->created_at == $today) {
                $this->data->today_revenue = $this->data->today_revenue + $item->revenue;
            }
            
            /* yesterday */
            if($item->created_at == $yesterday) {
                $this->data->yesterday_revenue = $this->data->yesterday_revenue + $item->revenue;
            }
            
            $date = (new \DateTime($item->created_at));
            
            /* last 7day */
            if($last7d <= $date) {
                $this->data->last7day['impression'] += $item->impression;
                $this->data->last7day['click'] += $item->click;
                $this->data->last7day['conversion'] += $item->conversion;
                $this->data->last7day['revenue'] += $item->revenue;
                $this->data->last7day['reach'] += $item->reach;
            }
            
            /* last 14day */
            if($last14day <= $date) {
                $this->data->last14day['impression'] += $item->impression;
                $this->data->last14day['click'] += $item->click;
                $this->data->last14day['conversion'] += $item->conversion;
                $this->data->last14day['revenue'] += $item->revenue;
                $this->data->last14day['reach'] += $item->reach;
            }
            
            /* 30 days stats */
            if(!isset($this->data->last30day_stats[$item->created_at])) {
                $this->data->last30day_stats[$item->created_at] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->last30day_stats[$item->created_at]['impression'] += $item->impression;
            $this->data->last30day_stats[$item->created_at]['click'] += $item->click;
            $this->data->last30day_stats[$item->created_at]['conversion'] += $item->conversion;
            $this->data->last30day_stats[$item->created_at]['revenue'] += $item->revenue;
            $this->data->last30day_stats[$item->created_at]['reach'] += $item->reach;
            
            /* country */
            if(!isset($this->data->country[$item->country])) {
                $this->data->country[$item->country] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->country[$item->country]['impression'] += $item->impression;
            $this->data->country[$item->country]['click'] += $item->click;
            $this->data->country[$item->country]['conversion'] += $item->conversion;
            $this->data->country[$item->country]['revenue'] += $item->revenue;
            $this->data->country[$item->country]['reach'] += $item->reach;
            
            /* website */
            if(!isset($this->data->website[$item->website_id])) {
                $this->data->website[$item->website_id] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->website[$item->website_id]['impression'] += $item->impression;
            $this->data->website[$item->website_id]['click'] += $item->click;
            $this->data->website[$item->website_id]['conversion'] += $item->conversion;
            $this->data->website[$item->website_id]['revenue'] += $item->revenue;
            $this->data->website[$item->website_id]['reach'] += $item->reach;
            
            /* zone */
            if(!isset($this->data->zone[$item->zone_id])) {
                $this->data->zone[$item->zone_id] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->zone[$item->zone_id]['impression'] += $item->impression;
            $this->data->zone[$item->zone_id]['click'] += $item->click;
            $this->data->zone[$item->zone_id]['conversion'] += $item->conversion;
            $this->data->zone[$item->zone_id]['revenue'] += $item->revenue;
            $this->data->zone[$item->zone_id]['reach'] += $item->reach;
        }
        
        /* compare data */
        if($this->data->last14day['impression']) {
            if($this->data->last14day['impression'] - $this->data->last7day['impression'] > 0){
                $this->data->compare['impression'] = round(($this->data->last7day['impression'] - ($this->data->last14day['impression'] - $this->data->last7day['impression']))/($this->data->last14day['impression'] - $this->data->last7day['impression']), 4)*100;
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
        if($this->data->last14day['revenue']) {
            if($this->data->last14day['revenue']-$this->data->last7day['revenue'] > 0){
                $this->data->compare['revenue'] = round(($this->data->last7day['revenue'] - ($this->data->last14day['revenue']-$this->data->last7day['revenue']))/($this->data->last14day['revenue']-$this->data->last7day['revenue']), 4)*100;
            }else{
                $this->data->compare['revenue'] = 0;
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
                $this->data->last30day_stats[$created_at] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->last30day_stats);
        
        return true;
    }
}