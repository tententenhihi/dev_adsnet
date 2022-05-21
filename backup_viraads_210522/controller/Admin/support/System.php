<?php

namespace Controller\Admin\superAdmin;

class System extends Controller
{
    public $pricingModel = ['cpm', 'cpc', 'cpa'];
    public $templateExtension = ['js' => 'Javascript', 'xml' => 'XML', 'html' => 'HTML'];
    
    public function index()
    {
        /* System overview */
        return $this->overview();
    }
    
    public function overview()
    {
        $adServer = new \Module\AdServer;
        $this->helper = new \Module\Helper;
        $today = (new \DateTime('now'))->format('Y-m-d');
        $this->data->cron = $adServer->getInfo();
        $this->data->cron->online=0;
        $this->data->cron->offline=0;
        foreach($this->data->cron->data  as $item => $val){
            if($val['state']=='online'){
                $this->data->cron->online++;
            }else{
                $this->data->cron->offline++;
            }
        }
        $db = new \Model\Admin\superAdmin\System;
        
        /* count pending items */
        $this->data->finishedTask = $db->countTaskType('Finished');
        $this->data->failTask = $db->countTaskType('Failed');
        
        /* count network */
        $this->data->totalNetwork = $db->countNetwork();
        /* count network active */
        $this->data->activeNetwork = $db->countNetworkStatus('Active');
        /* count ad exchange */
        $this->data->totalAd = $db->countAd();
        /* count ad exchange active */
        $this->data->activeAd = $db->countAdStatus('Active');
        
        /* total revenue, impression, payment */
        $this->data->listNetwork = $db->listNetwork();
        
        /* list network popular */
        $this->data->listNetworkByAd = $db->listNetworkByAd($today);
        
        /* get last 14 days network and ad exchange*/
        $created_at = (new \DateTime('14 days ago'))->format('Y-m-d');
        $listAd = $db->listLastAd($created_at);
        $this->buildHomeStatsData($this->data->listNetwork, $listAd);
        
        $this->title = 'System Overview - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/index';
        $this->renderView();
    }
    
    private function buildHomeStatsData($listNetwork, $listAd)
    {
        /* default data */
        $now = new \DateTime('now');
        $today = $now->format('Y-m-d');
        ////////
        $this->data->last7dayNetwork = ['total' => 0, 'active' => 0];
        $this->data->last14dayNetwork = ['total' => 0, 'active' => 0];
        $this->data->compareNetwork = ['total' => 0, 'totalPercent' => 0, 'active' => 0, 'activePercent' => 0];
        $this->data->last7dayNetwork_stats = [$today => ['total' => 0, 'active' => 0]];
        $this->data->last7dayAd = ['total' => 0, 'active' => 0];
        $this->data->last14dayAd = ['total' => 0, 'active' => 0];
        $this->data->compareAd = ['total' => 0, 'totalPercent' => 0, 'active' => 0, 'activePercent' => 0];
        $this->data->last7dayAd_stats = [$today => ['total' => 0, 'active' => 0]];

        // if(!$listNetwork || !$listAd) return true;
        
        /* prepare datetime to compare */
        $last14day = (new \DateTime('14 days ago'))->format('Y-m-d');
        $last7d = (new \DateTime('7 days ago'))->format('Y-m-d');
        
        /* loop list network */
        foreach($listNetwork as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            
            /* last 7day */
            if($last7d <= $date) {
                
                /* 7 days stats */
                if(!isset($this->data->last7dayNetwork_stats[$date])) {
                    $this->data->last7dayNetwork_stats[$date] = ['total' => 0, 'active' => 0];
                }
                
                if($item->status == 'Active'){
                    $this->data->last7dayNetwork['active'] += 1;
                    $this->data->last7dayNetwork_stats[$date]['active'] +=1;
                }
                $this->data->last7dayNetwork['total'] += 1;
                $this->data->last7dayNetwork_stats[$date]['total'] +=1;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                if($item->status == 'Active'){
                    $this->data->last14dayNetwork['active'] += 1;
                }
                $this->data->last14dayNetwork['total'] += 1;
            }
        }
        
        /* compare network data */
        if($this->data->last14dayNetwork['total']) {
            if($this->data->last14dayNetwork['total']-$this->data->last7dayNetwork['total'] > 0){
                $this->data->compareNetwork['total'] = $this->data->last7dayNetwork['total'] - ($this->data->last14dayNetwork['total']-$this->data->last7dayNetwork['total']);
                $this->data->compareNetwork['totalPercent'] = round(($this->data->last7dayNetwork['total'] - ($this->data->last14dayNetwork['total']-$this->data->last7dayNetwork['total']))/($this->data->last14dayNetwork['total']-$this->data->last7dayNetwork['total']), 4)*100;
            }else{
                $this->data->compareNetwork['total'] = 0;
                $this->data->compareNetwork['totalPercent'] = 0;
            }
        } 
        if($this->data->last14dayNetwork['active']) {
            if($this->data->last14dayNetwork['active']-$this->data->last7dayNetwork['active'] > 0){
                $this->data->compareNetwork['active'] = $this->data->last7dayNetwork['active'] - ($this->data->last14dayNetwork['active']-$this->data->last7dayNetwork['active']);
                $this->data->compareNetwork['activePercent'] = round(($this->data->last7dayNetwork['active'] - ($this->data->last14dayNetwork['active']-$this->data->last7dayNetwork['active']))/($this->data->last14dayNetwork['active']-$this->data->last7dayNetwork['active']), 4)*100;
            }else{
                $this->data->compareNetwork['active'] = 0;
                $this->data->compareNetwork['activePercent'] = 0;
            }
        }
        
        /* loop list ad */
        foreach($listAd as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            /* last 7day */
            if($last7d <= $date) {
                /* 7 days stats */
                if(!isset($this->data->last7dayAd_stats[$date])) {
                    $this->data->last7dayAd_stats[$date] = ['total' => 0, 'active' => 0];
                }
                
                if($item->status == 'Active'){
                    $this->data->last7dayAd['active'] += 1;
                    $this->data->last7dayAd_stats[$date]['active'] +=1;
                }
                $this->data->last7dayAd['total'] += 1;
                $this->data->last7dayAd_stats[$date]['total'] +=1;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                if($item->status == 'Active'){
                    $this->data->last14dayAd['active'] += 1;
                }
                $this->data->last14dayAd['total'] += 1;
            }
        }
        
        /* compare ad data */
        if($this->data->last14dayAd['total']) {
            if($this->data->last14dayAd['total']-$this->data->last7dayAd['total'] > 0){
                $this->data->compareAd['total'] = $this->data->last7dayAd['total'] - ($this->data->last14dayAd['total']-$this->data->last7dayAd['total']);
                $this->data->compareAd['totalPercent'] = round(($this->data->last7dayAd['total'] - ($this->data->last14dayAd['total']-$this->data->last7dayAd['total']))/($this->data->last14dayAd['total']-$this->data->last7dayAd['total']), 4)*100;
            }else{
                $this->data->compareAd['total'] = 0;
                $this->data->compareAd['totalPercent'] = 0;
            }
        } 
        if($this->data->last14dayAd['active']) {
            if($this->data->last14dayAd['active']-$this->data->last7dayAd['active'] > 0){
                $this->data->compareAd['active'] = $this->data->last7dayAd['active'] - ($this->data->last14dayAd['active']-$this->data->last7dayAd['active']);
                $this->data->compareAd['activePercent'] = round(($this->data->last7dayAd['active'] - ($this->data->last14dayAd['active']-$this->data->last7dayAd['active']))/($this->data->last14dayAd['active']-$this->data->last7dayAd['active']), 4)*100;
            }else{
                $this->data->compareAd['active'] = 0;
                $this->data->compareAd['activePercent'] = 0;
            }
        }
        
        /* fill hole network last 7d */
        $today = new \DateTime('now');
        $last7d = new \DateTime('7 days ago');
        for($i = $today; $i >= $last7d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last7dayNetwork_stats[$date])) {
                $this->data->last7dayNetwork_stats[$date] = ['total' => 0, 'active' => 0];
            }
        }
        
        /* fill hole ad last 7d */
        $today = new \DateTime('now');
        $last7d = new \DateTime('7 days ago');
        for($i = $today; $i >= $last7d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last7dayAd_stats[$date])) {
                $this->data->last7dayAd_stats[$date] = ['total' => 0, 'active' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->last7dayNetwork_stats);
        ksort($this->data->last7dayAd_stats);
        
        return true;
    }
    
    public function __postListData()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $type = $this->uri[2];
        $date = $this->uri[3];
        $db = new \Model\Admin\superAdmin\System;
        if($date=='today'){
            $day = (new \DateTime('now'))->format('Y-m-d');
        }else if($date=='lastWeek'){
            $day = (new \DateTime('7 days ago'))->format('Y-m-d');
        }else if($date=='lastMonth'){
            $day = (new \DateTime('30 days ago'))->format('Y-m-d');
        }else if($date=='lastYear'){
            $day = (new \DateTime('-1 years'))->format('Y-m-d');
        }
        
        if($type=='network'){
            $this->data->data = $db->listNetworkByAd($day);
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    /* AD Format */
    public function adformat()
    {
        $db = new \Model\Admin\superAdmin\System;
        $this->data->key = $this->getRequest('q');
        $this->data->total = $db->countAdFormat();
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            $this->data->data = $db->listAdFormat($pagination->getInit(), $pagination->getLimit());
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        foreach($this->data->data as $k => $item) {
            $rate = $db->getFormatRate($item->id);
            $this->data->data[$k]->ctr_min = $rate->ctr_min??null;
            $this->data->data[$k]->ctr_max = $rate->ctr_max??null;
            $this->data->data[$k]->icr_min = $rate->icr_min??null;
            $this->data->data[$k]->icr_max = $rate->icr_max??null;
        }
        
        $this->title = 'Ad Formats - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/ad_format';
        $this->renderView();
    }
    
    public function __postAdformat()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $action = $this->uri[2];
        $data = $this->postRequest('data');
        
        if($action == 'add') {
            $data = json_decode($data);
            if(!isset($data->name) || !isset($data->pricing_model) || !isset($data->description) || !isset($data->adv_description) || !isset($data->svg) || !isset($data->tag_script) || !isset($data->tag_guide)) {
                $this->data->data = 'Bad request, Missing required params!';
                $this->renderView();
            }
            
            foreach($data->pricing_model as $check) {
                if(!in_array($check, $this->pricingModel)) {
                    $this->data->data = 'Pricing <strong>'.$check.'</strong> is invalid!';
                    $this->renderView();
                }
            }
            
            $data->pricing_model = implode(',',$data->pricing_model);
            if(!isset($data->creative_required) || !$data->creative_required) $data->creative_required = 0;
            if(!isset($data->status) || $data->status != 'Active') $data->status = 'Inactive';
            if(!isset($data->extension) || !isset($this->templateExtension[$data->extension])) $data->extension = 'js';
            $data->description = str_replace("\n", PHP_EOL, $data->description);
            $data->adv_description = str_replace("\n", PHP_EOL, $data->adv_description);
            $data->tag_guide = str_replace("\n", PHP_EOL, $data->tag_guide);
            if(!isset($data->admin_ctr) || !$data->admin_ctr) $data->admin_ctr = null;
            if(!isset($data->admin_icr) || !$data->admin_icr) $data->admin_icr = null;
            if(!isset($data->min_impression_ctr) || !$data->min_impression_ctr) $data->min_impression_ctr = null;
            if(!isset($data->min_impression_icr) || !$data->min_impression_icr) $data->min_impression_icr = null;
            if($data->admin_ctr) $data->admin_ctr = $data->admin_ctr / 100;
            if($data->admin_icr) $data->admin_icr = $data->admin_icr / 100;
            
            try {
                $db = new \Model\Admin\superAdmin\System;
                $id = $db->createAdFormat($data);
            } catch(\Exception $e) {
                $this->data->data = 'Something was wrong, please try again';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'remove') {
            if(!($id = (int) $data)) {
                $this->data->data = 'Bad request, invalid ad format id';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\System;
            if(!$db->removeAdFormat($id)) {
                $this->data->data = 'Something was wrong, nothing changed!';
                $this->renderView();
            }
            $this->data->success = true;
            $this->renderView();
            // $adserver = new \Module\AdServer;
            // $this->data = $adserver->removeByDimension('format', [$id]);
        }
        
        if($action == 'update') {
            $data = json_decode($data);
            if(!isset($data->name) || !isset($data->id) || !isset($data->pricing_model) || !isset($data->description) || !isset($data->adv_description) || !isset($data->svg) || !isset($data->tag_script) || !isset($data->tag_guide)) {
                $this->data->data = 'Bad request, Missing required params!';
                $this->renderView();
            }
            
            foreach($data->pricing_model as $check) {
                if(!in_array($check, $this->pricingModel)) {
                    $this->data->data = 'Pricing <strong>'.$check.'</strong> is invalid!';
                    $this->renderView();
                }
            }
            
            $data->pricing_model = implode(',',$data->pricing_model);
            if(!isset($data->creative_required) || !$data->creative_required) $data->creative_required = 0;
            if(!isset($data->status) || $data->status != 'Active') $data->status = 'Inactive';
            if(!isset($data->extension) || !isset($this->templateExtension[$data->extension])) $data->extension = 'js';
            $data->description = str_replace("\n", PHP_EOL, $data->description);
            $data->adv_description = str_replace("\n", PHP_EOL, $data->adv_description);
            $data->tag_guide = str_replace("\n", PHP_EOL, $data->tag_guide);
            if(!isset($data->admin_ctr) || !$data->admin_ctr) $data->admin_ctr = null;
            if(!isset($data->admin_icr) || !$data->admin_icr) $data->admin_icr = null;
            if(!isset($data->min_impression_ctr) || !$data->min_impression_ctr) $data->min_impression_ctr = null;
            if(!isset($data->min_impression_icr) || !$data->min_impression_icr) $data->min_impression_icr = null;
            if($data->admin_ctr) $data->admin_ctr = $data->admin_ctr / 100;
            if($data->admin_icr) $data->admin_icr = $data->admin_icr / 100;
            
            $db = new \Model\Admin\superAdmin\System;
            if(!$db->updateAdFormat($data)) {
                $this->data->data = 'Something was wrong, nothing changed!';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        $this->data->data = 'Bad request, invalid action';
        $this->renderView();
    }
    
    /* country */
    public function country()
    {
        $db = new \Model\Admin\superAdmin\System;
        $this->data->key = $this->getRequest('q');
        $this->data->format_id = $this->getRequest('format');
        
        $formats = $db->listAdFormatId();
        $this->data->ad_formats = [];
        foreach($formats as $format) {
            $this->data->ad_formats[$format->id] = $format->name;
        }
        if(!$this->data->format_id || !isset($this->data->ad_formats[$this->data->format_id])) {
            $this->data->format_id = 1;
        }
        
        if(!$this->data->key) {
            $this->data->total = $db->countCountry();
        } else {
            $this->data->total = $db->countCountrySearch($this->data->key);
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(10);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if(!$this->data->key) {
                $data = $db->listCountry($pagination->getInit(), $pagination->getLimit());
            } else {
                $data = $db->listCountrySearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
            }
        } else {
            $data = null;
            $this->data->pagination = '';
        }
        
        $this->data->data = [];
        if($data) {
            foreach($data as $item) {
                $bid = $db->getAdServerCountryBidding($this->data->format_id, $item->code);
                $item->total_ad = $bid->total??0;
                $item->min_bid = ($bid->min??0) * 1000;
                $item->avg_bid = ($bid->avg??0) * 1000;
                $item->max_bid = ($bid->max??0) * 1000;
                $rate = $db->getCountryRate($this->data->format_id, $item->code);
                $item->ctr_admin = $rate->ctr_admin??null;
                $item->icr_admin = $rate->icr_admin??null;
                $item->ctr_min = $rate->ctr_min??null;
                $item->ctr_max = $rate->ctr_max??null;
                $item->ctr_avg = $rate->ctr_avg??null;
                $item->icr_min = $rate->icr_min??null;
                $item->icr_max = $rate->icr_max??null;
                $item->icr_avg = $rate->icr_avg??null;
                $item->cpm_min = $rate->cpm_min??0;
                $item->cpm_max = $rate->cpm_max??0;
                $item->cpm_avg = $rate->cpm_avg??0;
                $item->cpc_min = $rate->cpc_min??0;
                $item->cpc_max = $rate->cpc_max??0;
                $item->cpc_avg = $rate->cpc_avg??0;
                $item->cpa_min = $rate->cpa_min??0;
                $item->cpa_max = $rate->cpa_max??0;
                $item->cpa_avg = $rate->cpa_avg??0;
                $this->data->data[] = $item;
            }
        }

        $this->title = 'List Countries - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/country';
        $this->renderView();
    }
    
    public function __postCountry()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $action = $this->uri[2];
        $data = json_decode($this->postRequest('data'));
        
        $adserver = new \Module\AdServer;
        $db = new \Model\Admin\superAdmin\System;
        
        if($action == 'add') {
            if(!isset($data->name) || !isset($data->code) || !isset($data->phone) || !isset($data->timezone_offset)) {
                $this->data->data = 'Country Name, Code, Phone, timezone_offset are required!';
                $this->renderView();
            }
            try {
                $db->createCountry($data);
            } catch(\Exception $e) {
                $this->data->data = 'Country code '.$data->code.' already exists!';
                $this->renderView();
            }
            
            $adserver->updateTimezoneOffset();

            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'remove') {
            $data = $db->getCountry($data);
            if(!$data) {
                $this->data->data = 'Country does not exist!';
                $this->renderView();
            }
            if(!$db->removeCountry($data->id)) {
                $this->data->data = 'Something was wrong, nothing changed!';
                $this->renderView();
            }
            
            $adserver->updateTimezoneOffset();

            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'update') {
            if(!isset($data->name) || !isset($data->id) || !isset($data->phone)) {
                $this->data->data = 'Country Name, Id, Phone are required!';
                $this->renderView();
            }
            if(!$db->updateCountry($data)) {
                $this->data->data = 'Something was wrong, nothing changed!';
                $this->renderView();
            }
            
            $adserver->updateTimezoneOffset();
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'rate') {
            if(!isset($data->format) || !isset($data->country) || !isset($data->ctr_admin) || !isset($data->icr_admin)) {
                $this->data->data = 'Bad request!';
                $this->renderView();
            }
            $data->ctr_admin = $data->ctr_admin ? (float) $data->ctr_admin/100 : null;
            $data->icr_admin = $data->icr_admin ? (float) $data->icr_admin/100 : null;
            if(!$db->updateCountryRate($data->format, $data->country, $data->ctr_admin, $data->icr_admin)) {
                $this->data->data = 'Something was wrong!';
                $this->renderView();
            }

            $this->data->success = true;
            $this->renderView();
        }
        
        $this->data->data = 'Bad request, invalid action';
        $this->renderView();
    }
    
    public function bidding()
    {
        $db = new \Model\Admin\superAdmin\System;
        $country = strtoupper($this->uri[2]);
        $this->data->key = $this->getRequest('q');
        $this->data->format_id = $this->getRequest('format');
        
        $formats = $db->listAdFormatId();
        $this->data->ad_formats = [];
        foreach($formats as $format) {
            $this->data->ad_formats[$format->id] = $format->name;
        }
        if(!$this->data->format_id || !isset($this->data->ad_formats[$this->data->format_id])) {
            $this->data->format_id = 1;
        }
        
        if(!$this->data->key) {
            $this->data->total = $db->countAdIdByFomatAndCountryCode($this->data->format_id, $country);
        } else {
            $this->data->total = $db->countAdIdByFomatAndCountryCodeAndAdId($this->data->format_id, $country, $this->data->key);
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal((int) $this->data->total);
            $this->data->pagination = $pagination->setup();
            if(!$this->data->key) {
                 $this->data->data = $db->getAdIdByFomatAndCountryCode($this->data->format_id, $country, $pagination->getInit(), $pagination->getLimit());
            } else {
                 $this->data->data = $db->getAdIdByFomatAndCountryCodeAndAdId($this->data->format_id, $country, $this->data->key, $pagination->getInit(), $pagination->getLimit());
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'List Ad Bidding by Country - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/ad_by_country';
        $this->renderView();
    }
    
    /* Dimension */
    public function dimension()
    {
        $db = new \Model\Admin\superAdmin\System;
        
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();
        
        $this->title = 'Dimension - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/dimension';
        $this->renderView();
    }
    
    public function __postDimension()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $action = $this->uri[2];
        
        $db = new \Model\Admin\superAdmin\System;
        if($action == 'platform') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name)) {
                $this->data->data = 'Bad request, Missing required params!';
                $this->renderView();
            }
            $data->id = (int) $data->id ?? 0;
            
            if(!$data->id) {
                try {
                    $db->createPlatform($data);
                } catch(\Exception $e) {
                    $this->data->data = 'Platform '.$data->name.' already exists!';
                    $this->renderView();
                }
            } else {
                if(!$db->updatePlatform($data)) {
                    $this->data->data = 'Nothing changed, pls try again!';
                    $this->renderView();
                }
            }

            $this->data->success = true;
            $this->renderView();
        }
        if($action == 'os') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name)) {
                $this->data->data = 'Bad request, Missing required params!';
                $this->renderView();
            }
            $data->id = (int) $data->id ?? 0;
            
            if(!$data->id) {
                try {
                    $db->createOs($data);
                } catch(\Exception $e) {
                    $this->data->data = 'OS '.$data->name.' already exists!';
                    $this->renderView();
                }
            } else {
                if(!$db->updateOs($data)) {
                    $this->data->data = 'Nothing changed, pls try again!';
                    $this->renderView();
                }
            }

            $this->data->success = true;
            $this->renderView();
        }
        if($action == 'browser') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->name)) {
                $this->data->data = 'Bad request, Missing required params!';
                $this->renderView();
            }
            $data->id = (int) $data->id ?? 0;
            
            if(!$data->id) {
                try {
                    $db->createBrowser($data);
                } catch(\Exception $e) {
                    $this->data->data = 'Browser '.$data->name.' already exists!';
                    $this->renderView();
                }
            } else {
                if(!$db->updateBrowser($data)) {
                    $this->data->data = 'Nothing changed, pls try again!';
                    $this->renderView();
                }
            }

            $this->data->success = true;
            $this->renderView();
        }
        if($action == 'mapos') {
            $data = json_decode($this->postRequest('data'), true);
            $id = (int) $this->postRequest('id');
            if(!$id) {
                $this->data->data = 'Platform does not exist!';
                $this->renderView();
            }
            
            $db->unmapPlatform($id);
            foreach($data as $os_id) {
                try {$db->mapPlatformOs($id, $os_id);} catch(\Exception $e) {}
            }

            $this->data->success = true;
            $this->renderView();
        }
        if($action == 'mapbrowser') {
            $data = json_decode($this->postRequest('data'), true);
            $id = (int) $this->postRequest('id');
            if(!$id) {
                $this->data->data = 'OS does not exist!';
                $this->renderView();
            }
            
            $db->unmapOs($id);
            foreach($data as $browser_id) {
                try {$db->mapOsBrowser($id, $browser_id);} catch(\Exception $e) {}
            }

            $this->data->success = true;
            $this->renderView();
        }
        
        $this->data->data = 'Bad request, invalid action';
        $this->renderView();
    }
    
    /* Task */ 
    public function task()
    {
        $db = new \Model\Admin\superAdmin\System;
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Processing', 'Failed', 'Done'];
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countTask();
            } else {
                $this->data->total = $db->countTaskSearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countTaskType($this->data->status);
            } else {
                $this->data->total = $db->countTaskTypeSearch($this->data->status, $this->data->key);
            }
        }
    
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listTask($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listTaskSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listTaskType($this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listTaskTypeSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'System Tasks - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/task';
        $this->renderView();
    }
    
    public function __postTask()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $action = $this->uri[2];
        
        if($action == 'create') {
            $data = json_decode($this->postRequest('data'));
            if(!isset($data->task_name) || !isset($data->task_data)) {
                $this->data->data = 'Bad request, invalid params';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\System;
            try {
                $db->createTask($data);
            } catch(\Exception $e) {
                $this->data->data = 'Something was wrong, please try again';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        if($action == 'remove') {
            $id = (int) $this->postRequest('id');
            if(!$id) {
                $this->data->data = 'Bad request, invalid params';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\System;
            if(!$db->removeTask($id)) {
                $this->data->data = 'Task ID '.$id.' not found';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        $this->data->data = 'Method not allowed';
        $this->renderView();
    }
    
    /* Log */ 
    public function log()
    {
        $db = new \Model\Admin\superAdmin\System;
        $this->data->key = $this->getRequest('q');
        
        if(!$this->data->key) {
            $this->data->total = $db->countLog();
        } else {
            $this->data->total = $db->countLogSearch($this->data->key);
        }  
    
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if(!$this->data->key) {
                $this->data->data = $db->listLog($pagination->getInit(), $pagination->getLimit());
            } else {
                $this->data->data = $db->listLogSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'System Logs - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/log';
        $this->renderView();
    }
    
    public function __postLog()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $action = $this->uri[2];
        
        if($action == 'remove') {
            $id = (int) $this->postRequest('id');
            if(!$id) {
                $this->data->data = 'Bad request, invalid params';
                $this->renderView();
            }
            
            $db = new \Model\Admin\superAdmin\System;
            if(!$db->removeLog($id)) {
                $this->data->data = 'Log ID '.$id.' not found';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
            
        $this->data->data = 'Method not allowed';
        $this->renderView();
    }
    
    /* setting */
    public function setting()
    {
        $this->title = 'System Settings - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/system/setting';
        $this->renderView();
    }
    
    public function __postSetting()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $this->data->data = 'Method not allowed';
        $this->renderView();
    }
}
