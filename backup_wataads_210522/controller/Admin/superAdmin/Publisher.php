<?php

namespace Controller\Admin\superAdmin;

class Publisher extends Controller
{
    public $max_waiting = REPORT_EMAIL_AFTER;
    public $group_by = ['Date', 'Country', 'Browser', 'Platform', 'OS', 'Website ID', 'Zone ID'];
    public $order_by = ['Date', 'Impression', 'Click', 'Conversion', 'Revenue', 'Reach'];
    public $deal_type = ['fixed' => 'Fixed Revenue Daily', 'min' => 'Min Revenue Daily', 'ecpm' => 'Fixed eCPM Worldwide'];
    public $task_name = 'AdminReporter';
    
    public function index()
    {
        $this->helper = new \Module\Helper;
        $db = new \Model\Admin\superAdmin\Publisher;
        $today = (new \DateTime('now'))->format('Y-m-d');
        
        /* pendding website */
        $this->data->pendingWebsite = $db->countWebsiteStatus('Pending');
        /* pendding withdraw */
        $this->data->pendingWithdraw = $db->countWithdrawStatus('Pending');
        /* opening ticket */
        $this->data->openTicket = $db->countPendingPublisherTicket();
        /* count publisher */
        $this->data->countPublisher= $db->countPublisher();
        
        /* count website */
        $this->data->totalWebsite = $db->countWebsite();
        /* count website active */
        $this->data->activeWebsite = $db->countWebsiteStatus('Active');
        /* count zone */
        $this->data->totalZone = $db->countZone();
        /* count zone active */
        $this->data->activeZone = $db->countZoneStatus('Active');
        
        /* count os */
        $this->data->listOs = $db->listOsStatistic($today);
        /* count platform */
        $this->data->listPlatform = $db->listPlatformStatistic($today);
        /* count browser */
        $this->data->listBrowser = $db->listBrowserStatistic($today);
        
        /* list website popular */
        $this->data->listWebsiteByImpression = $db->listWebsiteByImpression($today);
        /* list publisher popular */
        $this->data->listPublisherByImpression = $db->listPublisherByImpression($today);
        
        /* get last 14 days website and zone*/
        $created_at = (new \DateTime('14 days ago'))->format('Y-m-d');
        $listWebsite = $db->listLastWebsite($created_at);
        $listZone = $db->listLastZone($created_at);
        
        /* get last month stats */
        $created_at = (new \DateTime('30 days ago'))->format('Y-m-d');
        $data = $db->listLastPublisherStatistic($created_at);
        $this->buildHomeStatsData($data, $listWebsite, $listZone);
        
        $this->title = 'Publisher Overview - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/publisher/index';
        $this->renderView();
    }
    
    private function buildHomeStatsData($data, $listWebsite, $listZone)
    {
        /* default data */
        $now = new \DateTime('now');
        $today = $now->format('Y-m-d');
        $this->data->last7day = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
        $this->data->last14day = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
        $this->data->compare = ['impression' => 0, 'impressionPercent' => 0, 'click' => 0,  'clickPercent' => 0,'conversion' => 0, 'conversionPercent' => 0, 'revenue' => 0, 'revenuePercent' => 0, 'reach' => 0, 'reachPercent' => 0];
        $this->data->last7day_stats = [$today => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        $this->data->last30day_stats = [$today => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        $this->data->countryLast7day = ['XX' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        $this->data->countryLast30day = ['XX' => ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0]];
        ////////
        $this->data->last7dayWebsite = ['total' => 0, 'active' => 0];
        $this->data->last14dayWebsite = ['total' => 0, 'active' => 0];
        $this->data->compareWebsite = ['total' => 0, 'totalPercent' => 0, 'active' => 0, 'activePercent' => 0];
        $this->data->last7dayWebsite_stats = [$today => ['total' => 0, 'active' => 0]];
        $this->data->last7dayZone = ['total' => 0, 'active' => 0];
        $this->data->last14dayZone = ['total' => 0, 'active' => 0];
        $this->data->compareZone = ['total' => 0, 'totalPercent' => 0, 'active' => 0, 'activePercent' => 0];
        $this->data->last7dayZone_stats = [$today => ['total' => 0, 'active' => 0]];

        // if(!$data || !$listWebsite || !$listZone) return true;
        
        /* prepare datetime to compare */
        $last14day = (new \DateTime('14 days ago'))->format('Y-m-d');
        $last7d = (new \DateTime('7 days ago'))->format('Y-m-d');
        $last30d = (new \DateTime('30 days ago'))->format('Y-m-d');
        
        /* loop data */
        foreach($data as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            
            /* last 7day */
            if($last7d <= $date) {
                $this->data->last7day['impression'] += $item->impression;
                $this->data->last7day['click'] += $item->click;
                $this->data->last7day['conversion'] += $item->conversion;
                $this->data->last7day['revenue'] += $item->revenue;
                $this->data->last7day['reach'] += $item->reach;
                
                /* 7 days stats */
                if(!isset($this->data->last7day_stats[$date])) {
                    $this->data->last7day_stats[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
                }
                $this->data->last7day_stats[$date]['impression'] += $item->impression;
                $this->data->last7day_stats[$date]['click'] += $item->click;
                $this->data->last7day_stats[$date]['conversion'] += $item->conversion;
                $this->data->last7day_stats[$date]['revenue'] += $item->revenue;
                $this->data->last7day_stats[$date]['reach'] += $item->reach;
                
                /* 7 days country */
                if(!isset($this->data->countryLast7day[$item->country])) {
                    $this->data->countryLast7day[$item->country] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
                }
                $this->data->countryLast7day[$item->country]['impression'] += $item->impression;
                $this->data->countryLast7day[$item->country]['click'] += $item->click;
                $this->data->countryLast7day[$item->country]['conversion'] += $item->conversion;
                $this->data->countryLast7day[$item->country]['revenue'] += $item->revenue;
                $this->data->countryLast7day[$item->country]['reach'] += $item->reach;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                $this->data->last14day['impression'] += $item->impression;
                $this->data->last14day['click'] += $item->click;
                $this->data->last14day['conversion'] += $item->conversion;
                $this->data->last14day['revenue'] += $item->revenue;
                $this->data->last14day['reach'] += $item->reach;
            }
            
            /* 30 days stats */
            if(!isset($this->data->last30day_stats[$date])) {
                $this->data->last30day_stats[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->last30day_stats[$date]['impression'] += $item->impression;
            $this->data->last30day_stats[$date]['click'] += $item->click;
            $this->data->last30day_stats[$date]['conversion'] += $item->conversion;
            $this->data->last30day_stats[$date]['revenue'] += $item->revenue;
            $this->data->last30day_stats[$date]['reach'] += $item->reach;
            
            /* 30 days country */
            if(!isset($this->data->countryLast30day[$item->country])) {
                $this->data->countryLast30day[$item->country] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
            $this->data->countryLast30day[$item->country]['impression'] += $item->impression;
            $this->data->countryLast30day[$item->country]['click'] += $item->click;
            $this->data->countryLast30day[$item->country]['conversion'] += $item->conversion;
            $this->data->countryLast30day[$item->country]['revenue'] += $item->revenue;
            $this->data->countryLast30day[$item->country]['reach'] += $item->reach;
        }
        
        /* compare data */
        if($this->data->last14day['impression']) {
            if($this->data->last14day['impression']-$this->data->last7day['impression'] > 0){
                $this->data->compare['impression'] = $this->data->last7day['impression'] - ($this->data->last14day['impression']-$this->data->last7day['impression']);
                $this->data->compare['impressionPercent'] = round(($this->data->last7day['impression'] - ($this->data->last14day['impression']-$this->data->last7day['impression']))/($this->data->last14day['impression']-$this->data->last7day['impression']), 4)*100;
            }else{
                $this->data->compare['impression'] = 0;
                $this->data->compare['impressionPercent'] = 0;
            }
        } 
        if($this->data->last14day['click']) {
            if($this->data->last14day['click']-$this->data->last7day['click'] > 0){
                $this->data->compare['click'] = $this->data->last7day['click'] - ($this->data->last14day['click']-$this->data->last7day['click']);
                $this->data->compare['clickPercent'] = round(($this->data->last7day['click'] - ($this->data->last14day['click']-$this->data->last7day['click']))/($this->data->last14day['click']-$this->data->last7day['click']), 4)*100;
            }else{
                $this->data->compare['click'] = 0;
                $this->data->compare['clickPercent'] = 0;
            }
        }
        if($this->data->last14day['conversion']) {
            if($this->data->last14day['conversion']-$this->data->last7day['conversion'] > 0){
                $this->data->compare['conversion'] = $this->data->last7day['conversion'] - ($this->data->last14day['conversion']-$this->data->last7day['conversion']);
                $this->data->compare['conversionPercent'] = round(($this->data->last7day['conversion'] - ($this->data->last14day['conversion']-$this->data->last7day['conversion']))/($this->data->last14day['conversion']-$this->data->last7day['conversion']), 4)*100;
            }else{
                $this->data->compare['conversion'] = 0;
                $this->data->compare['conversionPercent'] = 0;
            }
        }
        if($this->data->last14day['revenue']) {
            if($this->data->last14day['revenue']-$this->data->last7day['revenue'] > 0){
                $this->data->compare['revenue'] = $this->data->last7day['revenue'] - ($this->data->last14day['revenue']-$this->data->last7day['revenue']);
                $this->data->compare['revenuePercent'] = round(($this->data->last7day['revenue'] - ($this->data->last14day['revenue']-$this->data->last7day['revenue']))/($this->data->last14day['revenue']-$this->data->last7day['revenue']), 4)*100;
            }else{
                $this->data->compare['revenue'] = 0;
                $this->data->compare['revenuePercent'] = 0;
            }
        }
        if($this->data->last14day['reach']) {
            if($this->data->last14day['reach']-$this->data->last7day['reach'] > 0){
                $this->data->compare['reach'] = $this->data->last7day['reach'] - ($this->data->last14day['reach']-$this->data->last7day['reach']);
                $this->data->compare['reachPercent'] = round(($this->data->last7day['reach'] - ($this->data->last14day['reach']-$this->data->last7day['reach']))/($this->data->last14day['reach']-$this->data->last7day['reach']), 4)*100;
            }else{
                $this->data->compare['reach'] = 0;
                $this->data->compare['reachPercent'] = 0;
            }
        }
        
        /* loop list website */
        foreach($listWebsite as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            
            /* last 7day */
            if($last7d <= $date) {
                
                /* 7 days stats */
                if(!isset($this->data->last7dayWebsite_stats[$date])) {
                    $this->data->last7dayWebsite_stats[$date] = ['total' => 0, 'active' => 0];
                }
                
                if($item->status == 'Active'){
                    $this->data->last7dayWebsite['active'] += 1;
                    $this->data->last7dayWebsite_stats[$date]['active'] +=1;
                }
                $this->data->last7dayWebsite['total'] += 1;
                $this->data->last7dayWebsite_stats[$date]['total'] +=1;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                if($item->status == 'Active'){
                    $this->data->last14dayWebsite['active'] += 1;
                }
                $this->data->last14dayWebsite['total'] += 1;
            }
        }
        
        /* compare website data */
        if($this->data->last14dayWebsite['total']) {
            if($this->data->last14dayWebsite['total']-$this->data->last7dayWebsite['total'] > 0){
                $this->data->compareWebsite['total'] = $this->data->last7dayWebsite['total'] - ($this->data->last14dayWebsite['total']-$this->data->last7dayWebsite['total']);
                $this->data->compareWebsite['totalPercent'] = round(($this->data->last7dayWebsite['total'] - ($this->data->last14dayWebsite['total']-$this->data->last7dayWebsite['total']))/($this->data->last14dayWebsite['total']-$this->data->last7dayWebsite['total']), 4)*100;
            }else{
                $this->data->compareWebsite['total'] = 0;
                $this->data->compareWebsite['totalPercent'] = 0;
            }
        } 
        if($this->data->last14dayWebsite['active']) {
            if($this->data->last14dayWebsite['active']-$this->data->last7dayWebsite['active'] > 0){
                $this->data->compareWebsite['active'] = $this->data->last7dayWebsite['active'] - ($this->data->last14dayWebsite['active']-$this->data->last7dayWebsite['active']);
                $this->data->compareWebsite['activePercent'] = round(($this->data->last7dayWebsite['active'] - ($this->data->last14dayWebsite['active']-$this->data->last7dayWebsite['active']))/($this->data->last14dayWebsite['active']-$this->data->last7dayWebsite['active']), 4)*100;
            }else{
                $this->data->compareWebsite['active'] = 0;
                $this->data->compareWebsite['activePercent'] = 0;
            }
        }
        
        /* loop list zone */
        foreach($listZone as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            /* last 7day */
            if($last7d <= $date) {
                /* 7 days stats */
                if(!isset($this->data->last7dayZone_stats[$date])) {
                    $this->data->last7dayZone_stats[$date] = ['total' => 0, 'active' => 0];
                }
                
                if($item->status == 'Active'){
                    $this->data->last7dayZone['active'] += 1;
                    $this->data->last7dayZone_stats[$date]['active'] +=1;
                }
                $this->data->last7dayZone['total'] += 1;
                $this->data->last7dayZone_stats[$date]['total'] +=1;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                if($item->status == 'Active'){
                    $this->data->last14dayZone['active'] += 1;
                }
                $this->data->last14dayZone['total'] += 1;
            }
        }
        
        /* compare zone data */
        if($this->data->last14dayZone['total']) {
            if($this->data->last14dayZone['total']-$this->data->last7dayZone['total'] > 0){
                $this->data->compareZone['total'] = $this->data->last7dayZone['total'] - ($this->data->last14dayZone['total']-$this->data->last7dayZone['total']);
                $this->data->compareZone['totalPercent'] = round(($this->data->last7dayZone['total'] - ($this->data->last14dayZone['total']-$this->data->last7dayZone['total']))/($this->data->last14dayZone['total']-$this->data->last7dayZone['total']), 4)*100;
            }else{
                $this->data->compareZone['total'] = 0;
                $this->data->compareZone['totalPercent'] = 0;
            }
        } 
        if($this->data->last14dayZone['active']) {
            if($this->data->last14dayZone['active']-$this->data->last7dayZone['active'] > 0){
                $this->data->compareZone['active'] = $this->data->last7dayZone['active'] - ($this->data->last14dayZone['active']-$this->data->last7dayZone['active']);
                $this->data->compareZone['activePercent'] = round(($this->data->last7dayZone['active'] - ($this->data->last14dayZone['active']-$this->data->last7dayZone['active']))/($this->data->last14dayZone['active']-$this->data->last7dayZone['active']), 4)*100;
            }else{
                $this->data->compareZone['active'] = 0;
                $this->data->compareZone['activePercent'] = 0;
            }
        }
        
        /* fill hole last 7d */
        $today = new \DateTime('now');
        $last7d = new \DateTime('7 days ago');
        for($i = $today; $i >= $last7d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last7day_stats[$date])) {
                $this->data->last7day_stats[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
        }
        
        /* fill hole last 30d */
        $today = new \DateTime('now');
        $last30d = new \DateTime('30 days ago');
        for($i = $today; $i >= $last30d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last30day_stats[$date])) {
                $this->data->last30day_stats[$date] = ['impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0, 'reach' => 0];
            }
        }
        
        /* fill hole website last 7d */
        $today = new \DateTime('now');
        $last7d = new \DateTime('7 days ago');
        for($i = $today; $i >= $last7d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last7dayWebsite_stats[$date])) {
                $this->data->last7dayWebsite_stats[$date] = ['total' => 0, 'active' => 0];
            }
        }
        
        /* fill hole zone last 7d */
        $today = new \DateTime('now');
        $last7d = new \DateTime('7 days ago');
        for($i = $today; $i >= $last7d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last7dayZone_stats[$date])) {
                $this->data->last7dayZone_stats[$date] = ['total' => 0, 'active' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->last7day_stats);
        ksort($this->data->last30day_stats);
        ksort($this->data->last7dayWebsite_stats);
        ksort($this->data->last7dayZone_stats);
        
        return true;
    }
    
    public function __postListData()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $type = $this->uri[2];
        $date = $this->uri[3];
        $db = new \Model\Admin\superAdmin\Publisher;
        if($date=='today'){
            $day = (new \DateTime('now'))->format('Y-m-d');
        }else if($date=='lastWeek'){
            $day = (new \DateTime('7 days ago'))->format('Y-m-d');
        }else if($date=='lastMonth'){
            $day = (new \DateTime('30 days ago'))->format('Y-m-d');
        }else if($date=='lastYear'){
            $day = (new \DateTime('-1 years'))->format('Y-m-d');
        }
        
        if($type=='publisher'){
            $this->data->data = $db->listPublisherByImpression($day);
        }else if($type=='website'){
            $this->data->data = $db->listWebsiteByImpression($day);
        }else if($type=='os'){
            $this->data->data = $db->listOsStatistic($day);
        }else if($type=='platform'){
            $this->data->data = $db->listPlatformStatistic($day);
        }else if($type=='browser'){
            $this->data->data = $db->listBrowserStatistic($day);
        }
        $this->data->success = true;
        $this->renderView();
    }
    
    /* website */
    public function website()
    {
        if($this->uri[2] == 'detail') return $this->websiteDetail();
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Pending', 'Rejected'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Publisher;
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
                    $this->data->total = $db->countWebsiteByUser($user_id);
                } else {
                    $this->data->total = $db->countWebsiteSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countWebsiteStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countWebsiteStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countWebsite();
                } else {
                    $this->data->total = $db->countWebsiteSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countWebsiteStatus($this->data->status);
                } else {
                    $this->data->total = $db->countWebsiteStatusSearch($this->data->status, $this->data->key);
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
                        $this->data->data = $db->listWebsiteByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWebsiteSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listWebsiteStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWebsiteStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listWebsite($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWebsiteSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listWebsiteStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWebsiteStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
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
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Websites - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Websites - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/publisher/website';
        $this->renderView();
    }
    
    public function websiteDetail()
    {
        if(!($id = (int) $this->getRequest('id'))) $this->redirectTo('/publisher/website');
        
        $db = new \Model\Admin\superAdmin\Publisher;
        
        $this->data = $db->getWebsite($id);
        if(!$this->data) $this->redirectTo('/publisher/website');
        
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
        
        $this->title = $this->data->domain.' - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/publisher/website_detail';
        $this->renderView();
    }
    
    public function __postWebsite()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if($this->uri[2] == 'detail') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->id) || !isset($data->domain) || !isset($data->description) || !isset($data->category_id)) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            if(!($data->domain = (new \Module\Helper)->validDomain($data->domain))) {
                $this->data->data = 'Website domain is invalid!';
                $this->renderView();
            }
    
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!$db->updateWebsite($data->id, $data->description, $data->category_id)) {
                $this->data->data = 'Sorry, something was wrong, please try again later';
                $this->renderView();
            }
    
            $this->data->success = true;
            $this->renderView();
        }
        
        if($this->uri[2] == 'verify') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!$db->setWebsiteVerified($id)) {
                $this->data->data = 'Website ID '.$id.' not found or already get verified!';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->data->data = '/publisher/website';
            $this->renderView();
        }
        
        if($this->uri[2] == 'reject') {
            if(!($id = (int) $this->postRequest('id')) || !($reason = $this->postRequest('reason'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!($website = $db->getWebsite($id)) || !$db->setWebsiteRejected($id)) {
                $this->data->data = 'Website ID '.$id.' not found or already get rejected!';
                $this->renderView();
            }
            
            $zones = $db->listZoneIdAndStatusByWebsite($website->id);
            if($zones) {
                $adServer = new \Module\AdServer;
                foreach($zones as $zone) {
                    if($zone->status == 'Active') $adServer->removeZone($zone->id);
                }
                $db->rejectZoneByWebsite($id);
            }
            
            $noti = new \Module\NotificationTemplate;
            $db->createNotification($website->user_id, 'danger', 'Publisher', $noti->rejectWebsite($website->id, $website->domain), $noti->rejectWebsiteDescription($reason));
            
            $this->data->success = true;
            $this->data->data = '/publisher/website';
            $this->renderView();
        }
        
        $this->data->data = 'Bad request!!!';
        $this->renderView();
    }
    
    /* category */
    public function category()
    {
        $this->data->key = $this->getRequest('q');
        
        $db = new \Model\Admin\superAdmin\Publisher;
       
        if(!$this->data->key) {
            $this->data->total = $db->countCategory();
        } else {
            $this->data->total = $db->countCategorySearch($this->data->key);
        }
            
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if(!$this->data->key) {
                $this->data->data = $db->listCategorys($pagination->getInit(), $pagination->getLimit());
            } else {
                $this->data->data = $db->listCategorySearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->title = 'Websites Category - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/publisher/category';
        $this->renderView();
    }
    
    public function __postCategory()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->name) || !isset($data->description)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $db = new \Model\Admin\superAdmin\Publisher; 
        $data->id = (int) $data->id;
        
        if(!$data->id) {
            try {
                $id = $db->addCategory($data->name, $data->description);
            } catch(\Exception $e) {
                $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
                $this->renderView();
            }
            $this->data->success = true;
            $this->renderView();
        }
        
        if(!$db->updateCategory($data->id, $data->name, $data->description)) {
            $this->data->data = 'Sorry, something was wrong, please try again later';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    /* zone */
    public function zone()
    {
        if($this->uri[2] == 'detail') return $this->zoneDetail();
        if($this->uri[2] == 'setup') return $this->zoneSetup();
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $db = new \Model\Admin\superAdmin\Publisher;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }

        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Rejected'];
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        
        /* filter by website */
        $website_id = (int) $this->getRequest('website_id');
        if($website_id) {
            if(!($website = $db->getWebsite($website_id))) $this->redirectTo('/publisher/website');
        }
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if($website_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneByWebsite($website_id);
                } else {
                    $this->data->total = $db->countZoneSearchByWebsite($website_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneStatusByWebsite($website_id, $this->data->status);
                } else {
                    $this->data->total = $db->countZoneStatusSearchByWebsite($website_id, $this->data->status, $this->data->key);
                }
            }
        } else if($user_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneByUser($user_id);
                } else {
                    $this->data->total = $db->countZoneSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countZoneStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countZone();
                } else {
                    $this->data->total = $db->countZoneSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneStatus($this->data->status);
                } else {
                    $this->data->total = $db->countZoneStatusSearch($this->data->status, $this->data->key);
                }
            }
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($website_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZoneByWebsite($website_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneSearchByWebsite($website_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZoneStatusByWebsite($website_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneStatusSearchByWebsite($website_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else if($user_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZoneByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZoneStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZone($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZoneStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
                
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->helper = new \Module\Helper;
        $this->data->weekAgo = (new \DateTime('6 days ago'))->format('Y-m-d');
        $this->data->today = (new \DateTime('now'))->format('Y-m-d');
        
        if($website_id) {
            $this->title = $website->domain.'\'s zones - Admin '.SITE_NAME;
            $this->data->page_title = $website->domain.'\'s zones';
        } else if($user_id) {
            $this->title = ucwords($this->data->status).' zones - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
            $this->data->page_title = $this->data->user->name.'\'s zones';
        }else{
            $this->title = 'Zones - Admin '.SITE_NAME;
            $this->data->page_title = 'Zones';
        }
        
        $this->view = 'Admin/superAdmin/publisher/zone';
        $this->renderView();
    }
    
    public function zoneDetail()
    {
        if(!($id = (int) $this->getRequest('id'))) $this->redirectTo('/publisher/zone');
        
        $db = new \Model\Admin\superAdmin\Publisher;
        if(!($this->data = $db->getZone($id))) $this->redirectTo('/publisher/zone');
        
        if($this->data->status == 'Active') {
            $this->data->today = (new \DateTime('now'))->format('Y-m-d');
            $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
            $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        }
        
        $this->helper = new \Module\Helper;
        $this->data->adFormat = $db->getAdFormatTag($this->data->ad_format);
        $domain = ADSERVER_URL;
        $this->data->adFormat->tag_script = str_replace('{{ADSERVER_URL}}', $domain, $this->data->adFormat->tag_script);
        $this->data->adFormat->tag_script = str_replace('{{id}}', $id, $this->data->adFormat->tag_script);
        
        /* get last 30 days stats */
        $data = $db->listLastZoneStatistic($id, date('Y-m-d H:00:00', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->data->deal = $db->getDealByZone($id);
        $this->data->types = $this->deal_type;
        
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/publisher/zone_detail';
        $this->renderView();
    }
    
    public function zoneSetup()
    {
        if(!($id = (int) $this->getRequest('id'))) $this->redirectTo('/publisher/zone');
        
        $db = new \Model\Admin\superAdmin\Publisher;
        if(!($this->data = $db->getZoneSetting($id))) $this->redirectTo('/publisher/zone');
        $this->data->adType = $db->listAdType();
        
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/publisher/zone_setup';
        $this->renderView();
    }
    
    public function __postZone()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if($this->uri[2] == 'detail') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->id) || !isset($data->name) || !isset($data->description)) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!$db->updateZone($data->id, $data->name, $data->description)) {
                $this->data->data = 'Sorry, something was wrong, please try again later';
                $this->renderView();
            }
    
            $this->data->success = true;
            $this->renderView();
        }
        
        if($this->uri[2] == 'setup') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            if(!($data = json_decode($this->postRequest('data')))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
    
            $db = new \Model\Admin\superAdmin\Publisher;
            $zone = $db->getZoneWebsiteAndFormat($id);
            if(!$zone) {
                $this->data->data = 'Zone not found!!';
                $this->renderView();
            }
            
            $floor_cpm = (float) $this->postRequest('floor_cpm');
            $data->excluded_types = $data->excluded_types??[];
            if(!$db->updateZoneSetting($id, json_encode($data), $floor_cpm)) {
                $this->data->data = 'Could not update setting, nothing changed';
                $this->renderView();
            }
            
            /* prepare data */
            $data->user_id = $zone->user_id;
            $data->website_id = $zone->website_id;
            $data->extension = $zone->extension;
            $data->floor_cpm = $floor_cpm;
            $data->ad_format = $zone->ad_format;
            $data->treat_as = $zone->treat_as;
            $data->frequency = $this->validateCapping($data->frequency);
            
            /* apply to adserver */
            $adServer = new \Module\AdServer;
            $r = $adServer->createZone($id, $data);
            if(!$r->success){
                $this->data->data = $r->data;
                $this->renderView(); 
            }
            $this->processZoneCachePurge($id);
            
            $this->data->success = true;
            $this->data->data = '/publisher/zone/detail?id='.$id;
            $this->renderView();
        }
        
        if($this->uri[2] == 'reject') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!($zone = $db->getZone($id)) || !$db->rejectZone($id)) {
                $this->data->data = 'Zone ID '.$id.' not found or already get rejected!';
                $this->renderView();
            }
            
            $noti = new \Module\NotificationTemplate;
            $db->createNotification($zone->user_id, 'danger', 'Publisher', $noti->rejectZone($zone->id), $noti->rejectZoneDescription());
            (new \Module\AdServer)->removeZone($zone->id);
            
            $revenue = $db->getZoneRevenue($zone->zone_id);
            $revshare = $db->getPublisherRevshare($zone->user_id) ?? DEFAULT_REVSHARE;
            $return_amount = $revenue*$revshare;
            $db->decreasePublisherBalance($zone->user_id, $return_amount);
            $db->createBalanceHistory($zone->user_id, 'Publisher', -$return_amount, date('Y-m-d').': refunded $'.$return_amount.' to advertisers from rejected zone #'.$zone->zone_id.' revenue');
            
            $this->data->success = true;
            $this->data->data = '/publisher/zone';
            $this->renderView();
        }
        
        if($this->uri[2] == 'purge') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!($zone = $db->getZone($id))) {
                $this->data->data = 'Zone ID '.$id.' not found!';
                $this->renderView();
            }
            
            $this->processZoneCachePurge($id);
            $this->data->success = true;
            $this->data->data = '/publisher/zone';
            $this->renderView();
        }
        
        $this->data->data = 'Bad request!!!';
        $this->renderView();
    }
    
    /* domain */
    public function domain()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Active'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Publisher;
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
                    $this->data->total = $db->countDomainByUser($user_id);
                } else {
                    $this->data->total = $db->countDomainSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countDomainStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countDomainStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countDomain();
                } else {
                    $this->data->total = $db->countDomainSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countDomainStatus($this->data->status);
                } else {
                    $this->data->total = $db->countDomainStatusSearch($this->data->status, $this->data->key);
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
                        $this->data->data = $db->listDomainByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDomainSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDomainStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDomainStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDomain($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDomainSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDomainStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDomainStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Domains - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Domains - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/publisher/domain';
        $this->renderView();
    }
    
    public function __postDomain()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if($this->uri[2] == 'verify') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!($domain = $db->getDomain($id))) {
                $this->data->data = 'Domain ID '.$id.' not found!';
                $this->renderView();
            }
            if($domain->status != 'Pending') {
                $this->data->data = 'Domain ID '.$id.' not suitable for verifying!';
                $this->renderView();
            }
            
            $cf = new \Module\Cloudflare;
            $res = $cf->get('?name='.$domain->name);
            if(!$res->success) {
                $this->data->data = $res->data;
                $this->renderView();
            }
            if($res->data[0]->status != 'active') {
                $this->data->data = 'Domain is still using follow nameservers:<br><br>'.implode('<br>',$res->data[0]->original_name_servers);
                $this->renderView();
            }
            
            $db->activeDomain($domain->id);
            $this->data->success = true;
            $this->data->data = '/publisher/domain';
            $this->renderView();
        }

        if($this->uri[2] == 'cancel') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!($domain = $db->getDomain($id))) {
                $this->data->data = 'Domain ID '.$id.' not found!';
                $this->renderView();
            }
            $db->removeDomain($id);
            
            /* remove domain from cloudflare only if it is inactive */
            $cf = new \Module\Cloudflare;
            $res = $cf->get('?name='.$domain->name);
            if(isset($res->data[0]->status) && $res->data[0]->status != 'active') {
                $cf->delete($res->data[0]->id);
            }
            
            $this->data->success = true;
            $this->data->data = '/publisher/domain';
            $this->renderView();
        }
        
        $this->data->data = 'Bad request!!!';
        $this->renderView();
    }
    
    /* referrer */
    public function referrer()
    {
        if($this->uri[2] == 'realtime') return $this->referrerRealtime();
        $this->data->key = $this->getRequest('q');
        $this->data->actions = ['All', 'Impression', 'Click', 'Conversion'];
        $user_id = (int) $this->getRequest('user_id');
        $website_id = (int) $this->getRequest('website_id');
        $zone_id = (int) $this->getRequest('zone_id');
        $this->data->user = null;
        $this->data->website = null;
        $this->data->zone = null;
        $action = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($action && in_array($action, $this->data->actions)) {
            $this->data->action = $action;
        } else {
            $this->data->action = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Publisher;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        if($website_id) {
            $this->data->website = $db->getWebsite($website_id);
            if(!$this->data->website) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        if($zone_id) {
            $this->data->zone = $db->getZone($zone_id);
            if(!$this->data->zone) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($zone_id) {
            if ($this->data->action == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrerByZone($zone_id);
                } else {
                    $this->data->total = $db->countReferrerSearchByZone($zone_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrerActionByZone($zone_id, $this->data->action);
                } else {
                    $this->data->total = $db->countReferrerActionSearchByZone($zone_id, $this->data->action, $this->data->key);
                }
            }
        } elseif($website_id) {
            if ($this->data->action == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrerByWebsite($website_id);
                } else {
                    $this->data->total = $db->countReferrerSearchByWebsite($website_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrerActionByWebsite($website_id, $this->data->action);
                } else {
                    $this->data->total = $db->countReferrerActionSearchByWebsite($website_id, $this->data->action, $this->data->key);
                }
            }
        } elseif($user_id) {
            if ($this->data->action == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrerByUser($user_id);
                } else {
                    $this->data->total = $db->countReferrerSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrerActionByUser($user_id, $this->data->action);
                } else {
                    $this->data->total = $db->countReferrerActionSearchByUser($user_id, $this->data->action, $this->data->key);
                }
            }
        } else {
            if ($this->data->action == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrer();
                } else {
                    $this->data->total = $db->countReferrerSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferrerAction($this->data->action);
                } else {
                    $this->data->total = $db->countReferrerActionSearch($this->data->action, $this->data->key);
                }
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($zone_id) {
                if ($this->data->action == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrerByZone($zone_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerSearchByZone($zone_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrerActionByZone($zone_id, $this->data->action, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerActionSearchByZone($zone_id, $this->data->action, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } elseif($website_id) {
                if ($this->data->action == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrerByWebsite($website_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerSearchByWebsite($website_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrerActionByWebsite($website_id, $this->data->action, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerActionSearchByWebsite($website_id, $this->data->action, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } elseif($user_id) {
                if ($this->data->action == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrerByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrerActionByUser($user_id, $this->data->action, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerActionSearchByUser($user_id, $this->data->action, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->action == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrer($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferrerAction($this->data->action, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferrerActionSearch($this->data->action, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->helper = new \Module\Helper;
        if($user_id) {
            $this->title = ucwords($this->data->action).' Referrers - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->action).' Referrers - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/publisher/referrer';
        $this->renderView();
    }
    
    public function referrerRealtime()
    {
        if(!($zone_id = (int) $this->getRequest('zone_id'))) $this->redirectTo('/publisher/referrer');
        $db = new \Model\Admin\superAdmin\Publisher;
        $this->data = $db->getZone($zone_id);
        if(!$this->data) {
            $this->fullPage = true;
            $this->view = 'Global/404';
            $this->renderView();
        }
        
        $this->title = ucwords($this->data->name).' Realtime Referrers - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/publisher/referrer_realtime';
        $this->renderView();
    }
    
    public function __postReferrer()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if($this->uri[2] == 'realtime') {
            if(!($id = (int) $this->postRequest('zone_id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $cursor = (int) $this->postRequest('cursor');
            $action = $this->postRequest('action');
            if(!in_array($action, ['impression', 'click', 'conversion'])) $action = 'impression';
            
            $adServer = new \Module\AdServer;
            $r = $adServer->scanReferrer($id, $action, $cursor);
            if(!$r) {
                $this->data->data = 'Could not get data from server';
                $this->renderView();
            }
            
            $this->data->cursor = (int) $r[0];
            $this->data->data = $r[1];
            $this->data->success = true;
            $this->renderView();
        }

        if($this->uri[2] == 'remove') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!$db->removeReferrer($id)) {
                $this->data->data = 'Referrer ID '.$id.' not found!';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->data->data = '/publisher/referrer';
            $this->renderView();
        }
        
        $this->data->data = 'Bad request!!!';
        $this->renderView();
    }
    
    /* deals */
    public function deal()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Archived'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Publisher;
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
                    $this->data->total = $db->countDealByUser($user_id);
                } else {
                    $this->data->total = $db->countDealSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countDealStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countDealStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countDeal();
                } else {
                    $this->data->total = $db->countDealSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countDealStatus($this->data->status);
                } else {
                    $this->data->total = $db->countDealStatusSearch($this->data->status, $this->data->key);
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
                        $this->data->data = $db->listDealByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDealSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDealStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDealStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDeal($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDealSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDealStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDealStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->data->types = $this->deal_type;
        $this->helper = new \Module\Helper;
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Deals - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Deals - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/publisher/deal';
        $this->renderView();
    }
    
    public function __postDeal()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        if($this->uri[2] == 'update') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name) || !isset($data->type) || !isset($data->user_id) || !isset($data->amount)) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $data->id = isset($data->id) ? (int) $data->id : null;
            $data->user_id = isset($data->user_id) ? (int) $data->user_id : null;
            $data->zone_id = isset($data->zone_id) ? (int) $data->zone_id : null;
            $data->amount = (float) $data->amount;
            if(!$data->user_id || !$data->zone_id || !$data->amount) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if($data->id) {
                if(!$db->updateDeal($data)) {
                    $this->data->data = 'Nothing changed!';
                    $this->renderView();
                }
            } else {
                if($data->zone_id) {
                    $zone = $db->getZone($data->zone_id);
                    if(!$zone || $zone->user_id != $data->user_id) {
                        $this->data->data = 'Zone #'.$data->zone_id.' not found or not belong to user #'.$data->user_id;
                        $this->renderView();
                    }
                }
                try {
                    $db->createDeal($data);
                } catch(\Exception $e) {
                    $this->data->data = 'Something goes wrong, is User ID valid?';
                    $this->renderView();
                }
            }
            
            $this->data->success = true;
            $this->data->data = '/publisher/deal';
            $this->renderView();
        }

        if($this->uri[2] == 'archive') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!$db->archiveDeal($id)) {
                $this->data->data = 'Deal ID '.$id.' not found!';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->data->data = '/publisher/deal';
            $this->renderView();
        }
        
        if($this->uri[2] == 'remove') {
            if(!($id = (int) $this->postRequest('id'))) {
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\Publisher;
            if(!$db->removeDeal($id)) {
                $this->data->data = 'Deal ID '.$id.' not found!';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->data->data = '/publisher/deal';
            $this->renderView();
        }
        
        $this->data->data = 'Bad request!!!';
        $this->renderView();
    }
    
    /* report */
    public function report()
    {
        $db = new \Model\Admin\superAdmin\Publisher;

        $this->data->countries = $db->listCountry();
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
        
        $this->data->group_by = $this->group_by;
        $this->data->order_by = $this->order_by;
        if(RAW_METRIC_DURATION) {
            $this->data->min_date = date('Y-m-', strtotime(RAW_METRIC_DURATION.' months ago')).'01';
        } else {
            $this->data->min_date = date('Y-m-d', strtotime('1 year ago'));
        }
        $this->data->max_date = date('Y-m-d');
        
        $this->title = 'Publisher Report - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/publisher/report';
        $this->renderView();
    }
    
    public function __postInfo()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        if(!$user_id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Publisher;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        
        $adformats = $db->listAdFormat();
        $adformat = [];
        foreach($adformats as $item) {
            $adformat[$item->id] = $item->name;
        }
        
        $websites = $db->listWebsiteForInfo($user_id);
        $zones = [];
        $r = $db->listZoneForInfo($user_id);
        foreach($r as $item) {
            if(!isset($zones[$item->website_id])) $zones[$item->website_id] = [];
            $zones[$item->website_id][] = ['value' => $item->id, 'text' => $item->id.' - '.$item->name.' - '.$adformat[$item->ad_format]];
        }
        
        $this->data->data = ['name' => $user->name, 'email' => $user->email, 'website' => $websites, 'zone' => $zones];
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postReport()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $this->helper = new \Module\Helper;
        
        /* Check required params */
        $data = new \stdClass;
        $data->start_date = $this->helper->validDate($this->getRequest('start_date'), 'Y-m-d');
        $data->end_date = $this->helper->validDate($this->getRequest('end_date'), 'Y-m-d');
        $data->user_id = (int) $this->getRequest('user_id');
        if(!$data->start_date || !$data->end_date || !$data->user_id) {
            $this->data->data = 'Your report link is invalid!';
            $this->renderView();
        }
        
        /* Get optional params */
        $data->website_id = $this->listToArray($this->getRequest('website_id'), '@(\d+)@');
        $data->zone_id = $this->listToArray($this->getRequest('zone_id'), '@(\d+)@');
        $data->country = $this->listToArray($this->getRequest('country'), '@([A-Z]{2})@');
        $data->browser = $this->listToArray($this->getRequest('browser'), '@([a-zA-Z0-9 ]+)@');
        $data->platform = $this->listToArray($this->getRequest('platform'), '@([a-zA-Z]+)@');
        $data->os = $this->listToArray($this->getRequest('os'), '@([a-zA-Z0-9 ]+)@');
        $data->group_by = $this->elementInArray($this->getRequest('group_by'), $this->group_by);
        $data->order_by = $this->elementInArray($this->getRequest('order_by'), $this->order_by) ?: $this->elementInArray($this->getRequest('order_by'), $this->group_by);
        
        /* Init model */
        $data->admin_id = $this->getSession('id');
        $data->report_type = 'pub';
        $db = new \Model\Admin\superAdmin\Publisher;
        
        /* validate zones & websites */
        if($data->zone_id) {
            $r = $db->verifyUserZones($data->user_id, $data->zone_id);
            $data->zone_id = [];
            $data->website_id = [];
            
            if($r) foreach($r as $item) {
                $data->zone_id[] = $item->id;
                if(!in_array($item->website_id, $data->website_id)) $data->website_id[] = $item->website_id;
            }
        } elseif($data->website_id) {
            $r = $db->verifyUserWebsites($data->user_id, $data->website_id);
            $data->website_id = [];
            
            if($r) foreach($r as $item) {
                $data->website_id[] = $item->id;
            }
        }
        
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
        $task_id = md5('adm:'.$task_data);
        
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
    private function processZoneCachePurge($id)
    {
        $cmd = BASE_PATH.'/cli/ZoneCachePurger.php '.$id;
        exec($cmd.' > /dev/null 2>&1 &');
        return true;
    }
    
    private function dateInHotRange($start_date)
    {
        $min_date = RAW_METRIC_DURATION ? strtotime(date('Y-m-', strtotime(RAW_METRIC_DURATION.' months ago')).'01') : strtotime('1 year ago');
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
            $data = $origin ?: ['---' => ['reach' => 0, 'impression' => 0, 'cpc_impression' => 0, 'cpa_impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0]];
        } else {
            $start = new \DateTime($start_date);
            $end = new \DateTime($end_date);
            for($i = $end; $i >= $start; $i->modify('-1 day')) {
                $date = $i->format('Y-m-d');
                $data[$date] = $origin[$date] ?? ['reach' => 0, 'impression' => 0, 'cpc_impression' => 0, 'cpa_impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0];
            }
        }
        
        return $data;
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
    
    private function validateCapping($str)
    {
        $arr = explode(':', $str);
        if($arr[0] == 0) return '';
        if($arr[1] == '0h') return '';
        if($arr[1] == '0m') return '';
        
        $num = (int) $arr[1];
        if(strpos($arr[1], 'h')) {
            $num = $num * 60 * 60;
        } else {
            $num = $num * 60;
        }
        $arr[1] = $num;
        
        return implode(':', $arr);
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
    
    private function processTask($id)
    {
        $cmd = BASE_PATH.'/cli/'.$this->task_name.'.php '.$id;
        exec($cmd.' > /dev/null 2>&1 &');
        return true;
    }
}
