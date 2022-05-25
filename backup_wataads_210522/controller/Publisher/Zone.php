<?php

namespace Controller\Publisher;

class Zone extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Zone;

        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Rejected'];
        $status = ucwords($this->uri[1]);
        
        /* filter by website */
        $website_id = (int) $this->getRequest('website_id');
        if($website_id) {
            if(!($website = $db->getWebsite($user_id, $website_id))) $this->redirectTo('/website');
        }
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if($website_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneByWebsite($user_id, $website_id);
                } else {
                    $this->data->total = $db->countZoneSearchByWebsite($user_id, $website_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneStatusByWebsite($user_id, $website_id, $this->data->status);
                } else {
                    $this->data->total = $db->countZoneStatusSearchByWebsite($user_id, $website_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countZone($user_id);
                } else {
                    $this->data->total = $db->countZoneSearch($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countZoneStatus($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countZoneStatusSearch($user_id, $this->data->status, $this->data->key);
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
                        $this->data->data = $db->listZoneByWebsite($user_id, $website_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneSearchByWebsite($user_id, $website_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZoneStatusByWebsite($user_id, $website_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneStatusSearchByWebsite($user_id, $website_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZone($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listZoneStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listZoneStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
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
        $domain = $db->getUserDefaultDomain($user_id);
        $domain = $domain ? 'https://'.$domain : ADSERVER_URL;
        $adformats = $db->listAdFormatTag();
        $this->data->adformats = [];
        foreach($adformats as $item) {
            if(!isset($this->data->adformats[$item->id])) $this->data->adformats[$item->id] = new \stdClass;
            $this->data->adformats[$item->id]->name = $item->name;
            $this->data->adformats[$item->id]->tag_guide = $item->tag_guide;
            $this->data->adformats[$item->id]->tag_script = str_replace('{{ADSERVER_URL}}', $domain, $item->tag_script);
        }
        
        if($website_id) {
            $this->title = $website->domain.'\'s zones - '.SITE_NAME;
            $this->data->page_title = $website->domain.'\'s zones';
        } else {
            $this->title = 'My Zones - '.SITE_NAME;
            $this->data->page_title = 'My Zones';
        }
        
        $this->view = 'Publisher/zone/index';
        $this->renderView();
    }
    
    public function detail()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/zone');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Zone;
        if(!($this->data = $db->getZone($user_id, $id))) $this->redirectTo('/zone');
        
        if($this->data->status == 'Active') {
            $this->data->today = (new \DateTime('now'))->format('Y-m-d');
            $this->data->last7days = (new \DateTime('6 days ago'))->format('Y-m-d');
            $this->data->last30days = (new \DateTime('29 days ago'))->format('Y-m-d');
        }
        
        $this->helper = new \Module\Helper;
        $this->data->adFormat = $db->getAdFormatTag($this->data->ad_format);
        $domain = $db->getUserDefaultDomain($user_id);
        $domain = $domain ? 'https://'.$domain : ADSERVER_URL;
        $this->data->adFormat->tag_script = str_replace('{{ADSERVER_URL}}', $domain, $this->data->adFormat->tag_script);
        $this->data->adFormat->tag_script = str_replace('{{id}}', $id, $this->data->adFormat->tag_script);
        
        /* warning */
        $this->data->warning = $db->listZoneWarning($id);
        
        /* get last 30 days stats */
        $data = $db->listLastZoneStatistic($id, date('Y-m-d H:00:00', strtotime('30 days ago')));
        $this->buildStatsData($data);
        
        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Publisher/zone/detail';
        $this->renderView();
    }
    
    public function create()
    {
        if(!($website_id = (int) $this->getRequest('website_id'))) $this->redirectTo('/zone');
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Zone;
        $this->data = $db->getWebsite($user_id, $website_id);
        if(!$this->data) $this->redirectTo('/zone');
        if(!$this->data->is_verified) $this->redirectTo('/website/verify/'.$website_id);
        if($this->data->status != 'Active') $this->redirectTo('/website/detail/'.$website_id);
        
        $this->data->adFormat = $db->listAdFormat();
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();
        
        $this->title = 'New zone for '.$this->data->domain.' - '.SITE_NAME;
        $this->view = 'Publisher/zone/create';
        $this->renderView();
    }
    
    public function setup()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/zone');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Zone;
        if(!($this->data = $db->getZoneSetting($user_id, $id))) $this->redirectTo('/zone');

        $this->data->adType = $db->listAdType();
        $this->data->platforms = $db->listPlatform();
        $this->data->oses = $db->listOs();
        $this->data->browsers = $db->listBrowser();
        $this->data->mapPlatformOs = $db->listMapPlatformOs();
        $this->data->mapOsBrowser = $db->listMapOsBrowser();

        $this->title = $this->data->name.' - '.SITE_NAME;
        $this->view = 'Publisher/zone/setup';
        $this->renderView();
    }
    
    public function __postDetail()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->name) || !isset($data->description)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Zone;
        if(!$db->updateZone($user_id, $id, $data->name, $data->description)) {
            $this->data->data = 'Sorry, something was wrong, please try again later';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postCreate()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if(!($website_id = (int) $this->getRequest('website_id'))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!($data = json_decode($this->postRequest('data')))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!isset($data->name) || !isset($data->description) || !isset($data->ad_format)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Zone;
        
        if(!$format = $db->getAdFormatStatus($data->ad_format)) {
            $this->data->data = 'Invalid Ad Format!';
            $this->renderView();
        }
        if($format->status != 'Active') {
            $this->data->data = 'This Ad Format is not available now!';
            $this->renderView();
        }
        if(!($website = $db->getWebsite($user_id, $website_id))) {
            $this->data->data = 'Website ID '.$website_id.' not found or not yours!';
            $this->renderView();
        }
        if($website->status != 'Active') {
            $this->data->data = 'Website ID '.$website_id.' not ready for creating zone!';
            $this->renderView();
        }
        
        try {
            $id = $db->addZone($user_id, $website_id, $data->name, $data->description, $data->ad_format);
        } catch(\Exception $e) {
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }

        $db->updatePublisherAbstract($user_id, 0, 1);
        $db->updateWebsiteAbstract($website_id, 1, 1);
        $db->updatePublisherAbstractFirstZone($user_id, date('Y-m-d H:i:s'));
        
        $this->data->success = true;
        $this->data->data = '/zone/setup/'.$id;
        $this->renderView();
    }
    
    public function __postSetup()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!($data = json_decode($this->postRequest('data')))) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Zone;
        $zone = $db->getZoneWebsiteAndFormat($user_id, $id);
        if(!$zone) {
            $this->data->data = 'Zone not found or not yours!!';
            $this->renderView();
        }
        
        $floor_cpm = (float) $this->postRequest('floor_cpm');
        $data->excluded_types = $data->excluded_types??[];
        if(!$db->updateZoneSetting($user_id, $id, json_encode($data), $floor_cpm)) {
            $this->data->data = 'Could not update setting, nothing changed?';
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
        $this->data->data = '/zone/detail/'.$id;
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
    
    private function processZoneCachePurge($id)
    {
        $cmd = BASE_PATH.'/cli/ZoneCachePurger.php '.$id;
        exec($cmd.' > /dev/null 2>&1 &');
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
}
