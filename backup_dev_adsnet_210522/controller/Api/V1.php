<?php

namespace Controller\Api;

class V1 extends Controller
{
    public $db = null;
    public $user = null;
    public $min_budget = 5;
    
    public function index()
    {
        $this->data->success = false;
        $api_token = $_SERVER['HTTP_API_TOKEN']??null;
        if(!$api_token) {
            $this->data->data = "Forbidden, missing API token in request headers !!!!!";
            $this->data->statusCode = 403;
            $this->renderView();
        }
        
        $this->db = new \Model\Api\V1;
        $this->user = $this->db->getUser($api_token);
        if(!$this->user) {
            $this->data->data = "Forbidden, your API token is invalid or inactive !!!!!";
            $this->data->statusCode = 403;
            $this->renderView();
        }
        if(!in_array($this->uri[1], ['pub', 'adv'])) {
            $this->data->data = "Method is not allowed !!!!!";
            $this->data->statusCode = 405;
            $this->renderView();
        }
        if($this->user->service != 'Global' && ($this->uri[1] == 'pub' && $this->user->service != 'Publisher' || $this->uri[1] == 'adv' && $this->user->service != 'Advertiser')) {
            $this->data->data = "API Token is unusable for current request!";
            $this->data->statusCode = 409;
            $this->renderView();
        }
        
        return $this->{'__'.$this->uri[1]}();
    }
    
    public function __pub()
    {
        if(!($param = strtolower($this->uri[2]))) {
            $this->data->data = 'Bad request!!!';
            $this->data->statusCode = 400;
            $this->renderView();
        }
        if(!($param2 = strtolower($this->uri[4]))) {
            $pubMethod = $this->method.'Pub'.ucwords($param);
        }else{
            $pubMethod = $this->method.'Pub'.ucwords($param).ucwords($param2);
        }
        
        if(!is_callable([$this, $pubMethod])) {
            $this->data->data = "Method is not allowed !!!!!";
            $this->data->statusCode = 405;
            $this->renderView();
        }
        
        return $this->$pubMethod();
    }
    
    public function getPubBalance()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        $balance = $db->getUserBalance($this->user->user_id);
        if(!$balance) {
            $this->data->data = 'User ID '.$this->user->user_id.' not found!';
            $this->data->statusCode = 404;
            $this->renderView();
        }
        $this->data->data = $balance->pub_balance;
        $this->data->success = true;
        $this->renderView();
    }
    
    /////// web //////////
    
    public function getPubWeb()
    {
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $id = (int) $this->uri[3];
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        if($id){
            if (!($website = $db->getWebsite($this->user->user_id, $id))) {
                $this->data->statusCode = 412;
                $this->data->data = 'Website id is invalid !!!!!';
                $this->renderView();
            } else {
                $this->data->data = (object) [
                    'id' => (int) $website->id,
                    'name' => $website->name,
                    'domain' => $website->domain,
                    'description' => $website->description,
                    'status' => $website->status,
                    'category_id' => (int) $website->category_id
                ];
            }
        }else{
            if(!isset($page) || !isset($limit)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countWebsite($this->user->user_id);
            if ($this->data->data->total) {
                $websites = $db->listWebsite($this->user->user_id, $page, $limit);
                foreach ($websites as $website) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $website->id,
                        'name' => $website->name,
                        'domain' => $website->domain,
                        'description' => $website->description,
                        'status' => $website->status,
                        'category_id' => (int) $website->category_id
                    ];
                }
            } else {
                $this->data->statusCode = 404;
                $this->data->data = 'Have no any website. Please create new one !!!!!';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postPubWeb()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $data = [
            'name' => $this->getRequest('name'),
            'description' => $this->getRequest('description'),
            'domain' => $this->getRequest('domain'),
            'category_id' => $this->getRequest('category_id')
        ];
        try {
            if (!isset($data['name']) || !isset($data['domain']) || !isset($data['description']) || !isset($data['category_id'])) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            if (!($data['domain'] = $this->validDomain($data['domain']))) {
                $this->data->statusCode = 412;
                $this->data->data = 'Website domain is invalid!';
                $this->renderView();
            }
            $db = new \Model\Api\V1;
            $web_id = $db->addWebsite($this->user->user_id, $data['name'], $data['domain'], $data['description'], $data['category_id']);
            $db->updatePublisherAbstract($this->user->user_id, 1, 0);
            $this->data->statusCode = 201;
            $this->data->data->message = "Created new website successfully !!!!!";
            $this->data->data->id = (int) $web_id;
        } catch (\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putPubWeb()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        $data = [
            'name' => $this->getRequest('name'),
            'description' => $this->getRequest('description'),
            'category_id' => $this->getRequest('category_id')
        ];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!isset($data['name']) || !isset($data['description']) || !isset($data['category_id'])) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Api\V1;
        if(!$db->updateWebsite($this->user->user_id, $id, $data['name'], $data['description'], $data['category_id'])) {
            $this->data->statusCode = 500;
            $this->data->data = 'Something wrong, please contact support !!!!!';
            $this->renderView();
        }
        $this->data->data = "Updated website successfully !!!!!";
        $this->data->success = true;
        $this->renderView();
    }
    
    public function deletePubWeb()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Api\V1;
        if(!$db->deleteWebsite($this->user->user_id, $id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Website '.$id.' is invalid or not your !!!!!';
            $this->renderView();
        }
        $this->data->data = "Deleted website ".$id." successfully !!!!!";
        $db->updatePublisherAbstract($this->user->user_id, -1, 0);
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putPubWebOnreport()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        $opt = $this->getRequest('opt');
        if(!isset($id) || !isset($opt)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Api\V1;
        switch ($opt) {
            case 'show':
                if(!$db->updateWebsiteHideReport($this->user->user_id, $id, 0)) {
                    $this->data->statusCode = 412;
                    $this->data->data = 'Website '.$id.' already being showed from report, or not yours';
                    $this->renderView();
                }
                $db->hideReportZoneByWebsite($id, 0);
                $this->data->statusCode = 200;
                $this->data->data = 'Updated website '.$id.' to be showed on report !!!!!';
                break;
            case 'hide':
                if(!$db->updateWebsiteHideReport($this->user->user_id, $id, 1)) {
                    $this->data->statusCode = 412;
                    $this->data->data = 'Website '.$id.' already being hidden from report, or not yours';
                    $this->renderView();
                }
                $db->hideReportZoneByWebsite($id, 1);
                $this->data->statusCode = 200;
                $this->data->data = 'Updated website '.$id.' to be hidden on report !!!!!';
                break;
        }
        $this->data->success = true;
        $this->renderView();
    }
    
    //////// zone ///////
    
    public function getPubZone()
    {
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $web_id = $this->getRequest('web_id');
        $id = $this->uri[3];
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        if($id){
            $zone = $db->getZone($this->user->user_id, $id);
            if ($zone) {
                $this->data->data = (object) [
                    'id' => (int) $zone->id,
                    'name' => $zone->name,
                    'ad_format' => $zone->ad_format,
                    'description' => $zone->description,
                    'status' => $zone->status,
                    'web_id' => (int) $zone->web_id,
                    'setting' => json_decode($zone->setting)
                ];
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Zone '.$id.' is invalid or not your !!!!!';
                $this->renderView();
            }
        }else{
            if(!isset($page) || !isset($limit) || !isset($web_id)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countShownZoneByWebsite($web_id);
            if ($this->data->data->total) {
                $zones = $db->listZoneByWebsite($this->user->user_id, $web_id, $page, $limit);
                foreach ($zones as $zone) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $zone->id,
                        'name' => $zone->name,
                        'ad_format' => $zone->ad_format,
                        'description' => $zone->description,
                        'status' => $zone->status,
                        'web_id' => (int) $web_id,
                        'setting' => json_decode($zone->setting)
                    ];
                }
            } else {
                $this->data->statusCode = 404;
                $this->data->data = 'Website '.$web_id.' has not any zone or it not your.!!!!!';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postPubZone()
    {
        $this->checkReadOnly();
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $web_id = (int) $this->getRequest('web_id');
        $data = file_get_contents('php://input');
        if(!isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->rednderView();
        }
        $data = json_decode($data);
        if(!isset($data->name) || !isset($data->description) || !isset($data->ad_format) || !isset($data->setting)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!($web_id = (int) $this->getRequest('web_id'))) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!!!';
            $this->renderView();
        }
        if(!($format = $db->getAdFormat($data->ad_format)) || $format->status != 'Active') {
            $this->data->statusCode = 412;
            $this->data->data = 'Invalid Ad Format!';
            $this->renderView();
        }
        $website = $db->getWebsite($this->user->user_id, $web_id);
        if (!$website->is_verified) {
            $this->data->statusCode = 412;
            $this->data->data = 'Website '.$web_id.' is not verified. Please verify first !!!!!';
            $this->renderView();
        }
        if ($website->status !== 'Active') {
            $this->data->statusCode = 412;
            $this->data->data = 'Website '.$web_id.' is inactive. Please active first !!!!!';
            $this->renderView();
        }
        try {
            $zone_id = $db->addZone($this->user->user_id, $web_id, $data->name, $data->description, $data->ad_format, json_encode($data->setting));
            $db->updatePublisherAbstract($this->user->user_id, 0, 1);
            $db->updateWebsiteAbstract($web_id, 1, 1);
            $this->data->statusCode = 201;
            $this->data->data->message = "Created new Ad zone successfully !!!!!";
            $this->data->data->id = (int) $zone_id;
        } catch (\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data= 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
    }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putPubZone()
    {
        $this->checkReadOnly();
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        $data = file_get_contents('php://input');
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->rednderView();
        }
        if(!isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->rednderView();
        }
        $data = json_decode($data);
        if(!isset($data->name) || !isset($data->description) || !isset($data->ad_format) || !isset($data->setting)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if (!$db->updateZone($this->user->user_id, $id, $data->name, $data->description, $data->ad_format) && !$db->updateZoneSetting($this->user->user_id, $id, json_encode($data->setting))) {
            $this->data->statusCode = 412;
            $this->data->data= 'Could not update zone '.$id.' setting, is this zone yours?';
            $this->renderView();
        }
        $this->data->data = "Updated Ad zone ".$id." successfully !!!!!";
        $this->data->success = true;
        $this->renderView();
    }
    
    public function deletePubZone()
    {
        $this->checkReadOnly();
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        if(!isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->rednderView();
        }
        if(!$db->deleteZone($this->user->user_id, $id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Zone '.$id.' is invalid !!!!!';
            $this->renderView();
        }
        $this->data->data = "Delete Zone ".$id." successfully !!!!!";
        $db->updatePublisherAbstract($this->user->user_id, 0, -1);
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putPubZoneOnreport()
    {
        $this->checkReadOnly();
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        $opt = $this->getRequest('opt');
        if(!isset($id) || !isset($opt)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!($zone = $db->checkZoneExist($this->user->user_id, $id))) {
            $this->data->statusCode = 412;
            $this->data->data = 'Zone '.$id.' is invalid or not your !!!!!';
            $this->renderView();
        }
        switch ($opt) {
            case 'show':
                if(!$db->updateZoneHideReport($this->user->user_id, $id, 0)) {
                    $this->data->statusCode = 412;
                    $this->data->data = 'Zone '.$id.' is already being shown from report, or not yours';
                    $this->renderView();
                }
                $db->updateWebsiteHideReport($this->user->user_id, $zone->website_id, 0);
                $this->data->statusCode = 200;
                $this->data->data = 'Updated Zone '.$id.' to be shown on report successfully !!!!!';
                break;
            case 'hide':
                if(!$db->updateZoneHideReport($this->user->user_id, $id, 1)) {
                    $this->data->statusCode = 412;
                    $this->data->data = 'Zone '.$id.' is already being hidden from report, or not yours';
                    $this->renderView();
                }
                if(!$db->countShownZoneByWebsite($this->user->user_id, $zone->website_id)) {
                    $db->updateWebsiteHideReport($this->user->user_id, $zone->website_id, 1);
                    $this->data->statusCode = 200;
                    $this->data->data = 'Updated Zone '.$id.' to be hidden from report successfully !!!!!';
                }
                break;
        }
        $this->data->success = true;
        $this->renderView();
    }
    
    ///////////domain/////
    
    public function getPubDomain()
    {
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $id = $this->uri[3];
        if($id){
            if (!($domain = $db->getDomain($this->user->user_id, $id))) {
                $this->data->statusCode = 412;
                $this->data->data = 'Domain '.$id.' is invalid or not your !!!!!';
                $this->renderView();
            } else {
                $this->data->statusCode = 200;
                $this->data->data = (object) [
                    'id' => (int) $domain->id,
                    'name' => $domain->name,
                    'status' => $domain->status,
                    'is_default' => (int) $domain->is_default == 1 ? true : false
                ];
            }
        }else{
            if(!isset($page) || !isset($limit)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countDomain($this->user->user_id);
            if (!$this->data->data->total) {
                $this->data->statusCode = 404;
                $this->data->data = 'Have no any domain. Please create new one !!!!!';
                $this->renderView();
            } else {
                $domains = $db->listDomain($this->user->user_id, $page, $limit);
                foreach ($domains as $domain) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $domain->id,
                        'name' => $domain->name,
                        'status' => $domain->status,
                        'is_default' => (int) $domain->is_default == 1 ? true : false
                    ];
                }
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postPubDomain()
    {
        $this->checkReadOnly();
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $name = $this->getRequest('name');
        if (!isset($name) || !$this->validDomain($name)) {
            $this->data->statusCode = 412;
            $this->data->data->message = 'Domain is invalid !!!!!';
            $this->renderView();
        }
        try {
            $domain_id = $db->addDomain($this->user->user_id, $name, 'Pending');
            $this->data->statusCode = 201;
            $this->data->data->message = "Created new domain successfully !!!!!";
            $this->data->data->id = (int) $domain_id;
        } catch (\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putPubDomain()
    {
        $this->checkReadOnly();
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if (!$db->getDomain($this->user->user_id, $id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Domain '.$id.' is invalid !!!!!';
            $this->renderView();
        }
        if (!$db->setDefaultDomain($this->user->user_id, $id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Domain '.$id.' was already set default !!!!!';
            $this->renderView();
        }
        $db->clearDefaultDomain($this->user->user_id, $id);
        $this->data->data = 'Change default domain '.$id.' successfully !!!!!';
        $this->data->success = true;
        $this->renderView();
    }
    
    public function deletePubDomain()
    {
        $this->checkReadOnly();
        $db = new \Model\Api\V1;
        $this->data->data = new \stdClass;
        $this->data->success = false;
        
        $id = (int) $this->uri[3];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!$db->removeDomain($this->user->user_id, $id)) {
            $this->data->statusCode = 404;
            $this->data->data = 'Domain '.$id.' not found or not your!!!!!';
            $this->renderView();
        } else {
            $this->data->data = 'Removed domain '.$id.' successfully !!!!!';
        }
        $this->data->success = true;
        $this->renderView();
    }
    
    ///////adv//////
    
    public function __adv()
    {
        if(!($param = strtolower($this->uri[2]))) {
            $this->data->data = 'Bad request!!!';
            $this->data->statusCode = 400;
            $this->renderView();
        }
        if(!($param2 = strtolower($this->uri[4]))) {
            $advMethod = $this->method.'Adv'.ucwords($param);
        }else{
            $advMethod = $this->method.'Adv'.ucwords($param).ucwords($param2);
        }
        
        if(!is_callable([$this, $advMethod])) {
            $this->data->data = "Method is not allowed !!!!!";
            $this->data->statusCode = 405;
            $this->renderView();
        }
        
        return $this->$advMethod();
    }
    
    public function getAdvBalance()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        $balance = $db->getUserBalance($this->user->user_id);
        if(!$balance) {
            $this->data->data = 'User ID '.$this->user->user_id.' not found!';
            $this->data->statusCode = 404;
            $this->renderView();
        }
        $this->data->data = $balance->adv_balance;
        $this->data->success = true;
        $this->renderView();
    }
    
    /////// campaign //////////
    
    public function getAdvCampaign()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $id = $this->uri[3];
        if($id){
            if($campaign = $db->getCampaign($this->user->user_id, $id)) {
                $this->data->data->data = (object) [
                    'id' => (int) $campaign->id,
                    'name' => $campaign->name,
                    'description' => $campaign->description,
                    'status' => $campaign->status,
                    'total_ad' => (int) $campaign->total_ad,
                    'active_ad' => (int) $campaign->active_ad
                ];
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Campaign '.$id.' is invalid !!!!!';
                $this->renderView();
            }
        }else{
            if(!isset($page) || !isset($limit)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countCampaign($this->user->user_id);
            if($this->data->data->total) {
                $campaigns = $db->listCampaign($this->user->user_id, $page, $limit);
                foreach ($campaigns as $campaign) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $campaign->id,
                        'name' => $campaign->name,
                        'status' => $campaign->status,
                        'total_ad' => (int) $campaign->total_ad,
                        'active_ad' => (int) $campaign->active_ad
                    ];
                }
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 404;
                $this->data->data = 'Have no any campaign. Please create new one !!!!!' ;
                $this->renderView();
            }
        }
        
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postAdvCampaign()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $data = [
            'name' => $this->getRequest('name'),
            'description' => $this->getRequest('description'),
        ];
        if (!isset($data['name']) || !isset($data['description']) || !$data['name'] || !$data['description']) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        try {
            $id = $db->addCampaign($this->user->user_id, $data['name'], $data['description']);
            $this->data->statusCode = 201;
            $this->data->data->message = 'Create new campaign successfully !!!!!';
            $this->data->data->id = (int) $id;
        } catch(\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putAdvCampaign()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = (int) $this->uri[3];
        $data = [
            'name' => $this->getRequest('name'),
            'description' => $this->getRequest('description'),
        ];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if (!isset($data['name']) || !isset($data['description']) || !$data['name'] || !$data['description']) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!$db->updateCampaign($this->user->user_id, $id, $data['name'], $data['description'])) {
            $this->data->statusCode = 412;
            $this->data->data = 'Campaign '.$id.' is invalid !!!!!!';
            $this->renderView();
        }
        
        $this->data->data = 'Updated campaign '.$id.' successfully !!!!!';
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putAdvCampaignAction()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = (int) $this->uri[3];
        $opt = $this->getRequest('opt');
        if(!isset($id) || !isset($opt)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if ($opt == 'pause') {
            if(!($ads = $db->listStatusAdByCampaign($this->user->user_id, $id, 'Active'))) {
                $this->data->statusCode = 412;
                $this->data->data = 'Could not pause the campaign '.$id.'. Please check Ads status again !!!!!';
                $this->renderView();
            }
            //TODO: actually pause ads from adserver
            
            foreach($ads as $item) $db->changeAdStatus($item->id, 'Paused');
            $db->changeCampaignStatus($id, 'Paused');
            $this->data->data = 'Paused campaign '.$id.' successfully !!!!!';
        } else if ($opt == 'stop') {
            if(!($ads = $db->listActiveAndPausedAdByCampaign($this->user->user_id, $id))) {
                $this->data->statusCode = 412;
                $this->data->data = 'Could not stop the campaign '.$id.'. Please retry by a valid campaign !!!!!';
                $this->renderView();
            }
            //TODO: actually stop ads from adserver
            
            foreach($ads as $item) $db->changeAdStatus($item->id, 'Stopped');
            $db->changeCampaignStatus($id, 'Stopped');
            $this->data->data = 'Stopped campaign '.$id.' successfully !!!!!';
        } else if ($opt == 'resume') {
            if(!($ads = $db->listStatusAdByCampaign($this->user->user_id, $id, 'Paused'))) {
                $this->data->statusCode = 412;
                $this->data->data = 'Could not resume the campaign '.$id.'. Please check Ads status again !!!!!';
                $this->renderView();
            }
            //TODO: actually resume ads from adserver
            
            foreach($ads as $item) $db->changeAdStatus($item->id, 'Active');
            $db->changeCampaignStatus($id, 'Active');
            $this->data->data = 'Resumed campaign '.$id.' successfully !!!!!';
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    ////////// ad//////////
    
    public function getAdvAd()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $id = $this->uri[3];
        if($id){
            $ad = $db->getAd($this->user->user_id, $id);
            if($ad) {
                $this->data->statusCode = 200;
                $this->data->data = (object) [
                    // 'id' => (int) $ad->id,
                    'name' => $ad->name,
                    'status' => $ad->status,
                    'creative_id' => (int) $ad->creative_id,
                    'ad_format' => $ad->ad_format,
                    'pricing_model' => (int) $ad->bidding,
                    'bidding' => (int) $ad->bidding,
                    'optimization' => $ad->optimization,
                    'budget_total' => (int) $ad->budget_total,
                    'budget_daily' => (int) $ad->budget_daily,
                    'budget_capping' => $ad->budget_capping,
                    'goal_total' => (int) $ad->goal_total,
                    'goal_daily' => (int) $ad->goal_daily,
                    'goal_capping' => $ad->goal_capping,
                    'start_date' => $ad->start_date,
                    'end_date' => $ad->end_date,
                    'after_approval' => $ad->after_approval,
                    'targeting' => json_decode($ad->targeting)  
                ];
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Ad '.$id.' is invalid !!!!!';
                $this->renderView();
            }
        }else{
            $camp_id = $this->getRequest('camp_id');
            if(!isset($page) || !isset($limit) || !isset($camp_id)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countAdByCampaignId($this->user->user_id, $camp_id);
       
            if($this->data->data->total) {
                $ads = $db->listAdByCampaign($this->user->user_id, $camp_id, $page, $limit);
                foreach ($ads as $ad) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $ad->id,
                        'name' => $ad->name,
                        'status' => $ad->status,
                        'creative_id' => (int) $ad->creative_id,
                        'ad_format' => $ad->ad_format,
                        'pricing_model' => (int) $ad->bidding,
                        'bidding' => (int) $ad->bidding,
                        'optimization' => $ad->optimization,
                        'budget_total' => (int) $ad->budget_total,
                        'budget_daily' => (int) $ad->budget_daily,
                        'budget_capping' => $ad->budget_capping,
                        'goal_total' => (int) $ad->goal_total,
                        'goal_daily' => (int) $ad->goal_daily,
                        'goal_capping' => $ad->goal_capping,
                        'start_date' => $ad->start_date,
                        'end_date' => $ad->end_date,
                        'after_approval' => $ad->after_approval,
                        'targeting' => json_decode($ad->targeting)
                    ];
                }
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Campaign '.$camp_id.' is invalid !!!!!';
                $this->renderView();
            }
        }
        
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postAdvAd()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $camp_id = (int) $this->getRequest('camp_id');
        $data = file_get_contents('php://input');
        if(!isset($camp_id) || !isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data = json_decode($data);
        if(!isset($data->name) || !isset($data->targeting->url)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Ad name and target url are invalid!!!';
            $this->renderView();
        }
        if(!isset($data->start_date) || !$this->validDate($data->start_date)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Start Date is invalid!!!';
            $this->renderView();
        }
        if(!isset($data->end_date) || !$this->validDate($data->end_date)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Start Date is invalid!!!';
            $this->renderView();
        }
        
        $name = $data->name;
        $ad_format = $data->ad_format;
        $start_date = $data->start_date;
        $end_date = $data->end_date;
        $pricing_model = isset($data->pricing_model) && $data->pricing_model == 'cpc' ? 'cpc' : 'cpm';
        $creative_id = isset($data->creative_id) ? (int) $data->creative_id : null;
        $budget_total = isset($data->budget_total) ? (float) $data->budget_total : 0;
        $after_approval = isset($data->after_approval) && in_array($data->after_approval, ['draft', 'start', 'pause']) ? $data->after_approval : 'draft';
        $optimization = isset($data->optimization) && in_array($data->optimization, ['auto', 'speed', 'cost']) ? $data->optimization : 'auto';
        $budget_daily = isset($data->budget_daily) ? (float) $data->budget_daily : 0;
        $goal_daily = isset($data->goal_daily) ? (int) $data->goal_daily : 0;
        $goal_total = isset($data->goal_total) ? (int) $data->goal_total : 0;
        $bidding = isset($data->bidding) ? (float) $data->bidding : 0;
        $budget_capping = isset($data->budget_capping) && preg_match('/^[\d\.]+:\d{1,2}[mh]$/', $data->budget_capping) ? $data->budget_capping : '0:1h';
        $goal_capping = isset($data->goal_capping) && preg_match('/^\d+:\d{1,2}[mh]$/', $data->goal_capping) ? $data->goal_capping : '0:1h';
        
        if($after_approval != 'draft' && $budget_total < $this->min_budget) {
            $this->data->statusCode = 412;
            $this->data->data = 'Minimum budget is $'.$this->min_budget;
            $this->renderView();
        }
        $ad_formats = $db->listAdFormat();
        $invalid = true;
        foreach($ad_formats as $format) {
            if($format->id != $ad_format) continue;
            if($format->creative_required && !$creative_id) {
                $this->data->statusCode = 412;
                $this->data->data = 'Oppsss, Ad Creative is required but missing';
                $this->renderView();
            }
            $invalid = false;
            break;
        }
        if($invalid) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Ad Format is invalid!!!';
            $this->renderView();
        }
        if(!$db->getCampaign($this->user->user_id, $camp_id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Campaign '.$camp_id.' is invalid !!!!!';
            $this->renderView();
        }
        if($creative_id && !$db->checkCreative($this->user->user_id, $creative_id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Could not access creative '.$creative_id.', is it yours?';
            $this->renderView();
        }
        if(isset($data->targeting->collect) && !$db->checkAudience($this->user->user_id, explode(':',$data->targeting->collect)[1])) {
            $this->data->statusCode = 412;
            $this->data->data = 'Oppsss, Audience '.$data->collect.' not found or not yours!';
            $this->renderView();
        }
        
        foreach($data->targeting as $k => $v) {
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
                'country_include',
                'country_exclude',
                'browser_include',
                'browser_exclude',
                'platform_include',
                'platform_exclude',
                'os_include',
                'os_exclude',
                'device_include',
                'device_exclude',
                'time_include',
                'time_exclude',
                'audience_include',
                'audience_exclude',
                'website_include',
                'website_exclude',
                'zone_include',
                'zone_exclude',
            ])) {
                unset($data->targeting->$k);
                continue;
            }
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
            ]) && !is_array($data->targeting->$k)) unset($data->targeting->$k);
        }
        
        if(!isset($data->targeting->time_include) && !isset($data->targeting->time_exclude)) {
            $data->targeting->time_include = [];
        }
        if(!isset($data->targeting->audience_include) && !isset($data->targeting->audience_exclude)) {
            $data->targeting->audience_include = [];
        }
        if(!isset($data->targeting->website_include) && !isset($data->targeting->website_exclude)) {
            $data->targeting->website_include = [];
        }
        if(isset($data->targeting->zone_include) && !isset($data->targeting->zone_exclude)) {
            $data->targeting->zone_include = [];
        }
        if(!isset($data->targeting->country_include) && !isset($data->targeting->country_exclude)) {
            $data->targeting->country_include = [];
        }
        if(!isset($data->targeting->browser_include) && !isset($data->targeting->browser_exclude)) {
            $data->targeting->browser_include = [];
        }
        if(!isset($data->targeting->platform_include) && !isset($data->targeting->platform_exclude)) {
            $data->targeting->platform_include = [];
        }
        if(!isset($data->targeting->os_include) && !isset($data->targeting->os_exclude)) {
            $data->targeting->os_include = [];
        }
        if(!isset($data->targeting->device_include) && !isset($data->targeting->device_exclude)) {
            $data->targeting->device_include = [];
        }
        if(!isset($data->traffic)) {
            $data->traffic = ['Adblock', 'Normal'];
        }
        
        try {
            if($after_approval != 'draft') {
                $id = $db->createAd($this->user->user_id, $camp_id, $creative_id, $name, $ad_format, $pricing_model, $bidding, $optimization, $budget_total, $budget_daily, $budget_capping, $goal_total, $goal_daily, $goal_capping, $start_date, $end_date, $after_approval, json_encode($data->targeting));
                $db->updateCampaignAbstract($camp_id, 1, 0);
                $this->data->statusCode = 201;
                $this->data->data->message = 'Create new Ad successfully !!!!!';
                $this->data->data->id = (int) $id;
            } else {
                $id = $db->createPreTargeting($this->user->user_id, $name, json_encode($data->targeting));
            }
        } catch(\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putAdvAd()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = (int) $this->uri[3];
        $data = file_get_contents('php://input');
        if(!isset($id) || !isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data = json_decode($data);
        if(!isset($data->name) || !($this->validDomain($data->targeting->url))) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Ad name and target url are invalid!!!';
            $this->renderView();
        }
        if(!isset($data->start_date) || !$this->validDate($data->start_date)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Start Date is invalid!!!';
            $this->renderView();
        }
        if(!isset($data->end_date) || !$this->validDate($data->end_date)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Start Date is invalid!!!';
            $this->renderView();
        }
        
        $name = $data->name;
        $ad_format = $data->ad_format;
        $start_date = $data->start_date;
        $end_date = $data->end_date;
        $pricing_model = isset($data->pricing_model) && $data->pricing_model == 'cpc' ? 'cpc' : 'cpm';
        $creative_id = isset($data->creative_id) ? (int) $data->creative_id : null;
        $budget_total = isset($data->budget_total) ? (float) $data->budget_total : 0;
        $after_approval = isset($data->after_approval) && in_array($data->after_approval, ['draft', 'start', 'pause']) ? $data->after_approval : 'draft';
        $optimization = isset($data->optimization) && in_array($data->optimization, ['auto', 'speed', 'cost']) ? $data->optimization : 'auto';
        $budget_daily = isset($data->budget_daily) ? (float) $data->budget_daily : 0;
        $goal_daily = isset($data->goal_daily) ? (int) $data->goal_daily : 0;
        $goal_total = isset($data->goal_total) ? (int) $data->goal_total : 0;
        $bidding = isset($data->bidding) ? (float) $data->bidding : 0;
        $budget_capping = isset($data->budget_capping) && preg_match('/^[\d\.]+:\d{1,2}[mh]$/', $data->budget_capping) ? $data->budget_capping : '0:1h';
        $goal_capping = isset($data->goal_capping) && preg_match('/^\d+:\d{1,2}[mh]$/', $data->goal_capping) ? $data->goal_capping : '0:1h';

        if($after_approval != 'draft' && $budget_total < $this->min_budget) {
            $this->data->statusCode = 412;
            $this->data->data = 'Minimum budget is $'.$this->min_budget;
            $this->renderView();
        }
        if(!$db->getAd($this->user->user_id, $id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Ad '.$id.' is invalid !!!!!';
            $this->renderView();
        }
        if($creative_id && !$db->checkCreative($this->user->user_id, $creative_id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'Could not access creative '.$creative_id.', is it yours?';
            $this->renderView();
        }
        if(isset($data->targeting->collect) && !$db->checkAudience($this->user->user_id, explode(':',$data->targeting->collect)[1])) {
            $this->data->statusCode = 412;
            $this->data->data = 'Oppsss, Audience '.$data->collect.' not found or not yours!';
            $this->renderView();
        }
        
        foreach($data->targeting as $k => $v) {
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
                'country_include',
                'country_exclude',
                'browser_include',
                'browser_exclude',
                'platform_include',
                'platform_exclude',
                'os_include',
                'os_exclude',
                'device_include',
                'device_exclude',
                'time_include',
                'time_exclude',
                'audience_include',
                'audience_exclude',
                'website_include',
                'website_exclude',
                'zone_include',
                'zone_exclude',
            ])) {
                unset($data->targeting->$k);
                continue;
            }
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
            ]) && !is_array($data->targeting->$k)) unset($data->targeting->$k);
        }

        if(!isset($data->targeting->time_include) && !isset($data->targeting->time_exclude)) {
            $data->targeting->time_include = [];
        }
        if(!isset($data->targeting->audience_include) && !isset($data->targeting->audience_exclude)) {
            $data->targeting->audience_include = [];
        }
        if(!isset($data->targeting->website_include) && !isset($data->targeting->website_exclude)) {
            $data->targeting->website_include = [];
        }
        if(!isset($data->targeting->zone_include) && !isset($data->targeting->zone_exclude)) {
            $data->targeting->zone_include = [];
        }
        if(!isset($data->targeting->country_include) && !isset($data->targeting->country_exclude)) {
            $data->targeting->country_include = [];
        }
        if(!isset($data->targeting->browser_include) && !isset($data->targeting->browser_exclude)) {
            $data->targeting->browser_include = [];
        }
        if(!isset($data->targeting->platform_include) && !isset($data->targeting->platform_exclude)) {
            $data->targeting->platform_include = [];
        }
        if(!isset($data->targeting->os_include) && !isset($data->targeting->os_exclude)) {
            $data->targeting->os_include = [];
        }
        if(!isset($data->targeting->device_include) && !isset($data->targeting->device_exclude)) {
            $data->targeting->device_include = [];
        }
        if(!isset($data->traffic)) {
            $data->traffic = ['Adblock', 'Normal'];
        }
        
        try {
            if($after_approval != 'draft') {
                $db->updateAd($this->user->user_id, $id, $creative_id, $name, $ad_format, $pricing_model, $bidding, $optimization, $budget_total, $budget_daily, $budget_capping, $goal_total, $goal_daily, $goal_capping, $start_date, $end_date, $after_approval, json_encode($data->targeting));
                $this->data->statusCode = 200;
                $this->data->data = 'Updated Ad '.$id.' successfully !!!!!';
            } else {
                $id = $db->createPreTargeting($this->user->user_id, $name, json_encode($data));
            }
        } catch (\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    ///////PreTargeting////////
    
    public function getAdvPreTargeting()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $id = $this->uri[3];
        if($id){
            $pretargeting = $db->getPreTargeting($this->user->user_id, $id);
            if($pretargeting) {
                $this->data->statusCode = 200;
                $this->data->data = (object) [
                    'name' => $pretargeting->name,
                    'targeting' => json_decode($pretargeting->targeting)  
                ];
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'PreTargeting '.$id.' is invalid !!!!!';
                $this->renderView();
            }
        }else{
            if(!isset($page) || !isset($limit)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countPretargeting($this->user->user_id);
       
            if($this->data->data->total) {
                $pretargeting = $db->listPretargeting($this->user->user_id, $page, $limit);
                foreach ($pretargeting as $pre) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $pre->id,
                        'name' => $pre->name,
                        'targeting' => json_decode($pre->targeting)
                    ];
                }
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Have no any pretargeting. Please create new one !!!!!';
                $this->renderView();
            }
        }
        
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postAdvPreTargeting()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $data = file_get_contents('php://input');
        if(!isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data = json_decode($data);
        if(!isset($data->name) || !isset($data->targeting->url)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Ad name and target url are invalid!!!';
            $this->renderView();
        }
        $name = $data->name;
        
        if(isset($data->targeting->collect) && !$db->checkAudience($this->user->user_id, explode(':',$data->targeting->collect)[1])) {
            $this->data->statusCode = 412;
            $this->data->data = 'Oppsss, Audience '.$data->collect.' not found or not yours!';
            $this->renderView();
        }
        
        foreach($data->targeting as $k => $v) {
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
                'country_include',
                'country_exclude',
                'browser_include',
                'browser_exclude',
                'platform_include',
                'platform_exclude',
                'os_include',
                'os_exclude',
                'device_include',
                'device_exclude',
                'time_include',
                'time_exclude',
                'audience_include',
                'audience_exclude',
                'website_include',
                'website_exclude',
                'zone_include',
                'zone_exclude',
            ])) {
                unset($data->targeting->$k);
                continue;
            }
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
            ]) && !is_array($data->targeting->$k)) unset($data->targeting->$k);
        }
        
        if(!isset($data->targeting->time_include) && !isset($data->targeting->time_exclude)) {
            $data->targeting->time_include = [];
        }
        if(!isset($data->targeting->audience_include) && !isset($data->targeting->audience_exclude)) {
            $data->targeting->audience_include = [];
        }
        if(!isset($data->targeting->website_include) && !isset($data->targeting->website_exclude)) {
            $data->targeting->website_include = [];
        }
        if(isset($data->targeting->zone_include) && !isset($data->targeting->zone_exclude)) {
            $data->targeting->zone_include = [];
        }
        if(!isset($data->targeting->country_include) && !isset($data->targeting->country_exclude)) {
            $data->targeting->country_include = [];
        }
        if(!isset($data->targeting->browser_include) && !isset($data->targeting->browser_exclude)) {
            $data->targeting->browser_include = [];
        }
        if(!isset($data->targeting->platform_include) && !isset($data->targeting->platform_exclude)) {
            $data->targeting->platform_include = [];
        }
        if(!isset($data->targeting->os_include) && !isset($data->targeting->os_exclude)) {
            $data->targeting->os_include = [];
        }
        if(!isset($data->targeting->device_include) && !isset($data->targeting->device_exclude)) {
            $data->targeting->device_include = [];
        }
        if(!isset($data->traffic)) {
            $data->traffic = ['Adblock', 'Normal'];
        }
        
        try {
            if($after_approval != 'draft') {
                $id = $db->createPreTargeting($this->user->user_id, $name, json_encode($data->targeting));
                $this->data->statusCode = 201;
                $this->data->data->message = 'Create new pretargeting successfully !!!!!';
                $this->data->data->id = (int) $id;
            } else {
                $id = $db->createPreTargeting($this->user->user_id, $name, json_encode($data->targeting));
            }
        } catch(\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putAdvPreTargeting()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = (int) $this->uri[3];
        $data = file_get_contents('php://input');
        if(!isset($id) || !isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data = json_decode($data);
        if(!isset($data->name) || !($this->validDomain($data->targeting->url))) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Ad name and target url are invalid!!!';
            $this->renderView();
        }
        
        $name = $data->name;
        
        if(!$db->getPreTargeting($this->user->user_id, $id)) {
            $this->data->statusCode = 412;
            $this->data->data = 'PreTargeting '.$id.' is invalid !!!!!';
            $this->renderView();
        }
        
        if(isset($data->targeting->collect) && !$db->checkAudience($this->user->user_id, explode(':',$data->targeting->collect)[1])) {
            $this->data->statusCode = 412;
            $this->data->data = 'Oppsss, Audience '.$data->collect.' not found or not yours!';
            $this->renderView();
        }
        
        foreach($data->targeting as $k => $v) {
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
                'country_include',
                'country_exclude',
                'browser_include',
                'browser_exclude',
                'platform_include',
                'platform_exclude',
                'os_include',
                'os_exclude',
                'device_include',
                'device_exclude',
                'time_include',
                'time_exclude',
                'audience_include',
                'audience_exclude',
                'website_include',
                'website_exclude',
                'zone_include',
                'zone_exclude',
            ])) {
                unset($data->targeting->$k);
                continue;
            }
            if(!in_array($k, [
                'url',
                'ad_title',
                'ad_description',
                'ad_size',
                'track_impression',
                'track_click',
                'collect',
                'traffic',
            ]) && !is_array($data->targeting->$k)) unset($data->targeting->$k);
        }

        if(!isset($data->targeting->time_include) && !isset($data->targeting->time_exclude)) {
            $data->targeting->time_include = [];
        }
        if(!isset($data->targeting->audience_include) && !isset($data->targeting->audience_exclude)) {
            $data->targeting->audience_include = [];
        }
        if(!isset($data->targeting->website_include) && !isset($data->targeting->website_exclude)) {
            $data->targeting->website_include = [];
        }
        if(!isset($data->targeting->zone_include) && !isset($data->targeting->zone_exclude)) {
            $data->targeting->zone_include = [];
        }
        if(!isset($data->targeting->country_include) && !isset($data->targeting->country_exclude)) {
            $data->targeting->country_include = [];
        }
        if(!isset($data->targeting->browser_include) && !isset($data->targeting->browser_exclude)) {
            $data->targeting->browser_include = [];
        }
        if(!isset($data->targeting->platform_include) && !isset($data->targeting->platform_exclude)) {
            $data->targeting->platform_include = [];
        }
        if(!isset($data->targeting->os_include) && !isset($data->targeting->os_exclude)) {
            $data->targeting->os_include = [];
        }
        if(!isset($data->targeting->device_include) && !isset($data->targeting->device_exclude)) {
            $data->targeting->device_include = [];
        }
        if(!isset($data->traffic)) {
            $data->traffic = ['Adblock', 'Normal'];
        }
        
        $res = $db->updatePretargeting($id, json_encode($data->targeting), $this->user->user_id, $name);
        if(!$res) {
            $this->data->statusCode = 500;
            $this->data->data = 'Nothing was changed, please review your pretargeting and try again';
            $this->renderView();
        }
        $this->data->data = 'Updated Ad '.$id.' successfully !!!!!';
        $this->data->success = true;
        $this->renderView();
    }
    
    public function deleteAdvPreTargeting()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = (int) $this->uri[3];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!$db->removePretargeting($this->user->user_id, $id)) {
            $this->data->statusCode = 404;
            $this->data->data = 'PreTargeting '.$id.' not found or not your!!!!!';
            $this->renderView();
        } else {
            $this->data->data = 'Removed pretargeting '.$id.' successfully !!!!!';
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    ///////Creative////////
    
    public function getAdvCreative()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $id = $this->uri[3];
        if($id){
            $creative = $db->getCreative($this->user->user_id, $id);
            if($creative) {
                $this->data->statusCode = 200;
                $this->data->data = (object) [
                    'name' => $creative->name,
                    'type' => $creative->type,
                    'thumb' => $creative->thumb,
                    'size' => $creative->size,
                    'url' => $creative->url
                ];
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Creative '.$id.' is invalid !!!!!';
                $this->renderView();
            }
        }else{
            if(!isset($page) || !isset($limit)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countCreative($this->user->user_id);
       
            if($this->data->data->total) {
                $creative = $db->listCreative($this->user->user_id, $page, $limit);
                foreach ($creative as $cre) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $cre->id,
                        'name' => $cre->name,
                        'type' => $cre->type,
                        'thumb' => $cre->thumb,
                        'size' => $cre->size,
                        'url' => $cre->url
                    ];
                }
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Have no any creative. Please create new one !!!!!';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postAdvCreative()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $url = $this->getRequest('url');
        $name = $this->getRequest('name');
        $type = $this->getRequest('type');
        $size = $this->getRequest('size');
        $thumb = $this->getRequest('thumb');
        
        if(!$name || !$url || !$type || !$size || !$thumb || !in_array($type, ['video', 'image'])) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        try {
            $id = $db->addCreative($this->user->user_id, $name, $type, $thumb, $size, $url);
            $this->data->statusCode = 201;
            $this->data->data->message = "Created new creative successfully !!!!!";
            $this->data->data->id = (int) $id;
        } catch (\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function deleteAdvCreative()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = (int) $this->uri[3];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!$db->removeCreative($this->user->user_id, $id)) {
            $this->data->statusCode = 404;
            $this->data->data = 'Creative '.$id.' not found or not your!!!!!';
            $this->renderView();
        } else {
            $this->data->data = 'Removed creative '.$id.' successfully !!!!!';
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    ///////audience////////
    
    public function getAdvAudience()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $limit = $this->getRequest('per_page');
        $page = $this->getRequest('page');
        $id = $this->uri[3];
        if($id){
            if($audience = $db->getAudience($this->user->user_id, $id)) {
                $this->data->data->data = (object) [
                    'id' => (int) $audience->id,
                    'name' => $audience->name,
                    'duration' => (int) $audience->duration,
                    'daily_reach' => (int) $audience->daily_reach,
                    'total_users' => (int) $audience->total_users,
                    'status' => $audience->status,
                ];
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 412;
                $this->data->data = 'Audience '.$id.' is invalid !!!!!';
                $this->renderView();
            }
        }else{
            if(!isset($page) || !isset($limit)) {
                $this->data->statusCode = 400;
                $this->data->data = 'Bad request!!!';
                $this->renderView();
            }
            $this->data->data->total = (int) $db->countAudience($this->user->user_id);
            if($this->data->data->total) {
                $audiences= $db->listAudience($this->user->user_id, $page, $limit);
                foreach ($audiences as $audience) {
                    $this->data->data->data[] = (object) [
                        'id' => (int) $audience->id,
                        'name' => $audience->name,
                        'duration' => (int) $audience->duration,
                        'daily_reach' => (int) $audience->daily_reach,
                        'total_users' => (int) $audience->total_users,
                        'status' => $audience->status
                    ];
                }
                $this->data->success = true;
                $this->renderView();
            } else {
                $this->data->statusCode = 404;
                $this->data->data = 'Have no audience. Please create new one !!!!!';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postAdvAudience()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $data = [
            'name' => $this->getRequest('name'),
            'duration' => $this->getRequest('duration'),
        ];
        if (!isset($data['name']) || !isset($data['duration'])) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        try {
            $id = $db->addAudience($this->user->user_id, $data['name'], $data['duration']);
            $this->data->statusCode = 201;
            $this->data->data->message = 'Create new audience successfully !!!!!';
            $this->data->data->id = (int) $id;
        } catch(\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function putAdvAudience()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = (int) $this->uri[3];
        $data = [
            'name' => $this->getRequest('name'),
            'duration' => $this->getRequest('duration')
        ];
        if (!isset($data['name']) || !isset($data['duration']) || !$data['name'] || !$data['duration']) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        if(!$db->updateAudience($this->user->user_id, $id, $data['name'], $data['duration'])) {
            $this->data->statusCode = 412;
            $this->data->data = 'Audience '.$id.' is invalid !!!!!';
            $this->renderView();
        }
        $this->data->data = 'Update audience '.$id.' successfully !!!!!';
        
        $this->data->success = true;
        $this->renderView();
    }
    
     ///////standard report////////
    public function getAdvReport()
    {
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $id = $this->uri[3];
        if(!isset($id)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        if($audience = $db->getAudience($this->user->user_id, $id)) {
            $this->data->data->data = (object) [
                'id' => (int) $audience->id,
                'name' => $audience->name,
                'duration' => (int) $audience->duration,
                'daily_reach' => (int) $audience->daily_reach,
                'total_users' => (int) $audience->total_users,
                'status' => $audience->status,
            ];
            $this->data->success = true;
            $this->renderView();
        } else {
            $this->data->statusCode = 412;
            $this->data->data = 'Audience '.$id.' is invalid !!!!!';
            $this->renderView();
        }
        
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function postAdvReport()
    {
        $this->checkReadOnly();
        $this->data->data = new \stdClass;
        $this->data->success = false;
        $db = new \Model\Api\V1;
        
        $data = file_get_contents('php://input');
        if(!isset($data)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data = json_decode($data);
        if(!isset($data->name) || !isset($data->targeting->url)) {
            $this->data->statusCode = 400;
            $this->data->data = 'Bad request, Ad name and target url are invalid!!!';
            $this->renderView();
        }
        try {
            $id = $db->addAudience($this->user->user_id, $data['name'], $data['duration']);
            $this->data->statusCode = 201;
            $this->data->data->message = 'Create new audience successfully !!!!!';
            $this->data->data->id = (int) $id;
        } catch(\Exception $e) {
            $this->data->statusCode = 500;
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    ////////////////////////////////
    
    private function validDomain($str)
    {
        if(!$str) return null;
        $str = strtolower($str);
        return parse_url($str, PHP_URL_HOST) ?: parse_url('http://'.$str, PHP_URL_HOST);
    }
    
    private function validDate($date, $format = 'Y-m-d')
    {
        $d = \DateTime::createFromFormat($format, $date);
        if($d && $d->format($format) == $date) return $date;
        return null;
    }
}