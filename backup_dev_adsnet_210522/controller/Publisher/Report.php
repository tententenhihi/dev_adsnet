<?php

namespace Controller\Publisher;

class Report extends Controller
{
    public $max_waiting = REPORT_EMAIL_AFTER;
    public $group_by = ['Date', 'Country', 'Browser', 'Platform', 'OS', 'Website ID', 'Zone ID'];
    public $order_by = ['Date', 'Impression', 'Click', 'Conversion', 'Revenue', 'Reach'];
    public $task_name = 'PublisherReporter';
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        
        $this->data->countries = $db->listCountry();
        $this->data->websites = $db->listActiveWebsite($user_id);
        
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
        
        $zones = $db->listZone($user_id);
        $this->data->zones = [];
        foreach($zones as $item) {
            if(!isset($this->data->zones[$item->website_id])) $this->data->zones[$item->website_id] = [];
            $this->data->zones[$item->website_id][] = ['value' => $item->id, 'text' => $item->id.' - '.$item->name.' - '.$adformat[$item->ad_format]];
        }
        
        $this->data->group_by = $this->group_by;
        $this->data->order_by = $this->order_by;
        if(RAW_METRIC_DURATION) {
            $this->data->min_date = date('Y-m-', strtotime(RAW_METRIC_DURATION.' months ago')).'01';
        } else {
            $this->data->min_date = date('Y-m-d', strtotime('1 year ago'));
        }
        $this->data->max_date = date('Y-m-d');
        
        $this->title = 'Standard Report - '.SITE_NAME;
        $this->view = 'Publisher/report/index';
        $this->renderView();
    }
    
    public function schedule()
    {
        if(($id = $this->uri[2])) return $this->scheduleDetail($id);

        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        
        $this->data->key = $this->getRequest('q');
        if(!$this->data->key) {
            $this->data->total = $db->countScheduleReport($user_id);
        } else {
            $this->data->total = $db->countScheduleReportSearch($user_id, $this->data->key);
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if(!$this->data->key) {
                $this->data->data = $db->listScheduleReport($user_id, $pagination->getInit(), $pagination->getLimit());
            } else {
                $this->data->data = $db->listScheduleReportSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->title = 'Scheduled Report - '.SITE_NAME;
        $this->view = 'Publisher/report/schedule';
        $this->renderView();
    }
    
    public function createSchedule()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        
        $this->data->countries = $db->listCountry();
        $this->data->websites = $db->listActiveWebsite($user_id);
        
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
        
        $zones = $db->listZone($user_id);
        $this->data->zones = [];
        foreach($zones as $item) {
            if(!isset($this->data->zones[$item->website_id])) $this->data->zones[$item->website_id] = [];
            $this->data->zones[$item->website_id][] = ['value' => $item->id, 'text' => $item->id.' - '.$item->name.' - '.$adformat[$item->ad_format]];
        }
        
        $this->data->group_by = $this->group_by;
        $this->data->order_by = $this->order_by;
        
        $this->title = 'Create Schedule Report - '.SITE_NAME;
        $this->view = 'Publisher/report/schedule_create';
        $this->renderView();
    }
    
    public function scheduleDetail($id)
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        
        if(is_numeric($id)) {
            $this->data->data = $db->getScheduleReport($user_id, $id);
            if(!$this->data->data) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        } else {
            $this->data->data = null;
        }
            
        $this->data->countries = $db->listCountry();
        $this->data->websites = $db->listActiveWebsite($user_id);
        
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
        
        $zones = $db->listZone($user_id);
        $this->data->zones = [];
        foreach($zones as $item) {
            if(!isset($this->data->zones[$item->website_id])) $this->data->zones[$item->website_id] = [];
            $this->data->zones[$item->website_id][] = ['value' => $item->id, 'text' => $item->id.' - '.$item->name.' - '.$adformat[$item->ad_format]];
        }
        
        $this->data->group_by = $this->group_by;
        $this->data->order_by = $this->order_by;
        
        if($this->data->data) {
            $this->title = $this->data->data->name.' - '.SITE_NAME;
        } else {
            $this->title = 'Create Schedule Report - '.SITE_NAME;
        }
        
        $this->view = 'Publisher/report/schedule_detail';
        $this->renderView();
    }
    
    public function realtime()
    {
        $this->title = 'Realtime Report - '.SITE_NAME;
        $this->view = 'Publisher/report/realtime';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $this->helper = new \Module\Helper;
        
        /* Check required params */
        $data = new \stdClass;
        $data->start_date = $this->helper->validDate($this->getRequest('start_date'), 'Y-m-d');
        $data->end_date = $this->helper->validDate($this->getRequest('end_date'), 'Y-m-d');
        if(!$data->start_date || !$data->end_date) {
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
        $data->user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        
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
        $task_id = md5('pub:'.$task_data);
        
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
    
    public function __postSchedule()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $data = json_decode($this->postRequest('data'));
        if(!$data || !isset($data->date_range) || !isset($data->hour)) {
            $this->data->data = 'Bad request!';
            $this->renderView();
        }
        
        /* exclude unwanted params */
        foreach($data as $k => $v) {
            if(!in_array($k, [
                'id',
                'name',
                'date_range',
                'hour',
                'week_day',
                'month_date',
                'website_id',
                'zone_id',
                'country',
                'browser',
                'platform',
                'os',
                'group_by',
                'order_by'
            ])) {
                unset($data->$k);
                continue;
            }
            if(in_array($k, [
                'website_id',
                'zone_id',
                'country',
                'browser',
                'platform',
                'os'
            ]) && !is_array($data->$k)) unset($data->$k);
        }
        
        /* validate user posted data */
        if(!in_array($data->date_range, ['yesterday', 'lastweek', 'lastmonth', 'last7days', 'last30days'])) {
            $this->data->data = 'Date range is invalid!';
            $this->renderView();
        }
        if(!isset($data->week_day) || !in_array($data->week_day, range(0, 6))) {
            $data->week_day = null;
        }
        if(!isset($data->month_date) || !in_array($data->month_date, range(1, 31))) {
            $data->month_date = null;
        }
        if(!isset($data->hour) || !in_array($data->hour, range(0, 23))) {
            $data->hour = 0;
        }
        if($data->date_range == 'yesterday') {
            $data->week_day = null;
        }
        if(($data->date_range == 'lastweek' || $data->date_range == 'last7days') && $data->week_day === null) {
            $this->data->data = '7 days date range requires valid weekday to send report!';
            $this->renderView();
        }
        if(($data->date_range == 'lastmonth' || $data->date_range == 'last30days') && $data->month_date === null) {
            $this->data->data = '30 days date range requires valid date in month to send report!';
            $this->renderView();
        }
        $data->group_by = $this->elementInArray($data->group_by, $this->group_by);
        $data->order_by = $this->elementInArray($data->order_by, $this->order_by) ?: $this->elementInArray($data->order_by, $this->group_by);
        if(!$data->group_by) $data->group_by = 'created_at';
        if(!$data->order_by) $data->order_by = 'created_at';
        
        /* define default if missing */
        if(!isset($data->website_id)) $data->website_id = [];
        if(!isset($data->zone_id)) $data->zone_id = [];
        if(!isset($data->country)) $data->country = [];
        if(!isset($data->browser)) $data->browser = [];
        if(!isset($data->platform)) $data->platform = [];
        if(!isset($data->os)) $data->os = [];
        
        /* Init model */
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        
        /* check permission */
        if(isset($data->id) && !$db->checkOwnerScheduleReport($user_id, $data->id)) {
            $this->data->data = 'Report ID '.$data->id.' does not exist or not yours!';
            $this->renderView();
        }
        
        /* validate zones & websites */
        if($data->zone_id) {
            $r = $db->verifyUserZones($user_id, $data->zone_id);
            $data->zone_id = [];
            $data->website_id = [];
            
            if($r) foreach($r as $item) {
                $data->zone_id[] = $item->id;
                if(!in_array($item->website_id, $data->website_id)) $data->website_id[] = $item->website_id;
            }
        } elseif($data->website_id) {
            $r = $db->verifyUserWebsites($user_id, $data->website_id);
            $data->website_id = [];
            
            if($r) foreach($r as $item) {
                $data->website_id[] = $item->id;
            }
        }
        
        /* Prepare data */
        $id = $data->id ?? null;
        $name = $data->name;
        $date_range = $data->date_range;
        $week_day = $data->week_day;
        $month_date = $data->month_date;
        $hour = $data->hour;
        unset($data->id);
        unset($data->name);
        unset($data->date_range);
        unset($data->week_day);
        unset($data->month_date);
        unset($data->hour);
        
        if($id) {
            $db->updateScheduleReport($id, $name, json_encode($data), $date_range, $month_date, $week_day, $hour);
        } else {
            try {
                $db->createScheduleReport($user_id, $name, json_encode($data), $date_range, $month_date, $week_day, $hour);
            } catch(\Exception $e) {
                $this->data->data = 'Something was wrong, please try again later!';
                $this->renderView();
            }
        }
            

        $this->data->data = '/report/schedule';
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postDelete()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $id = (int) $this->uri[2];
        if(!$id) {
            $this->data->data = 'Bad request!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        if(!$db->deleteScheduleReport($user_id, $id)) {
            $this->data->data = 'Report ID '.$id.' does not exist or not yours';
            $this->renderView();
        }

        $this->data->data = '/report/schedule';
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postRealtime()
    {
        $this->jsonResponse = true;
        $this->data->success = false;

        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Report;
        $created_at = date('Y-m-d');

        $this->data->data = $this->buildRealtimeData($db->getPublisherStatistic($user_id, $created_at));
        $this->data->success = true;
        $this->renderView();
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
    
    private function buildRealtimeData($raw)
    {
        $data = ['XX' => ['reach' => 0, 'impression' => 0, 'click' => 0, 'conversion' => 0, 'revenue' => 0]];
        if(!$raw) return $data;
        
        foreach($raw as $item) {
            $data[$item->country]['impression'] = $item->impression;
            $data[$item->country]['click'] = $item->click;
            $data[$item->country]['conversion'] = $item->conversion;
            $data[$item->country]['revenue'] = $item->revenue;
            $data[$item->country]['reach'] = $item->reach;
        }
        
        return $data;
    }
    
    private function processTask($id)
    {
        $cmd = BASE_PATH.'/cli/'.$this->task_name.'.php '.$id;
        exec($cmd.' > /dev/null 2>&1 &');
        return true;
    }
}