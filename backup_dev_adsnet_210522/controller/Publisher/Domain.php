<?php

namespace Controller\Publisher;

class Domain extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Domain;
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Active'];
        $status = ucwords($this->uri[1]);
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countDomain($user_id);
            } else {
                $this->data->total = $db->countDomainSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countDomainStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countDomainStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listDomain($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listDomainSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listDomainStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listDomainStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->title = 'My Anti-Adblock Domains - '.SITE_NAME;
        $this->view = 'Publisher/domain/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $name = $this->postRequest('name');
        if(!($name = (new \Module\Helper)->validDomain($name))) {
            $this->data->data = 'Your domain is invalid!';
            $this->renderView();
        }
        
        $cf = new \Module\Cloudflare;
        $res = $cf->post(null, ['name' => $name]);
        if(!$res->success) {
            if(strpos($res->data, 'already exists')) {
                $this->data->data = 'Domain is already in our database. Please use another one or contact support if you think it is a problem';
                $this->renderView();
            } else {
                $this->data->data = $res->data;
                $this->renderView();
            }
        } else {
            $cf_zone_id = $res->data->id;
            $cf->post($cf_zone_id.'/dns_records', ['type' => 'CNAME', 'name' => '@', 'content' => $cf->cnameDomain, 'proxied' => true]);
    		$cf->post($cf_zone_id.'/dns_records', ['type' => 'CNAME', 'name' => 'www', 'content' => $cf->cnameDomain, 'proxied' => true]);
    		$cf->post($cf_zone_id.'/dns_records', ['type' => 'CNAME', 'name' => 'asset', 'content' => $cf->assetDomain, 'proxied' => true]);
            $cf->patch($cf_zone_id.'/settings', [
                'items' => [
        			['id' => 'always_online', 'value' => 'off'],
        			['id' => 'always_use_https', 'value' => 'on'],
        			['id' => 'browser_cache_ttl', 'value' => 120],
        			['id' => 'browser_check', 'value' => 'on'],
        			['id' => 'cache_level', 'value' => 'aggressive'],
        			['id' => 'challenge_ttl', 'value' => 86400],
        			['id' => 'ip_geolocation', 'value' => 'on'],
        			['id' => 'minify', 'value' => ['css' => 'on','html' => 'on','js' => 'on']],
        			['id' => 'brotli', 'value' => 'on'],
        			['id' => 'security_level', 'value' => 'essentially_off'],
        			['id' => 'ssl', 'value' => 'flexible'],
        			['id' => 'tls_1_3', 'value' => 'on'],
        			['id' => 'http3', 'value' => 'on'],
        			['id' => '0rtt', 'value' => 'on'],
        			['id' => 'privacy_pass', 'value' => 'on']
        		]
    		]);
    		$cf->post($cf_zone_id.'/pagerules', [
		        'actions' => [
		            ['id' => 'disable_security'],
        			['id' => 'browser_check', 'value' => 'on'],
        			['id' => 'minify', 'value' => ['css' => 'on','html' => 'on','js' => 'on']],
        			['id' => 'browser_cache_ttl', 'value' => 120],
        			['id' => 'always_online', 'value' => 'off'],
        			['id' => 'cache_level', 'value' => 'cache_everything'],
        			['id' => 'edge_cache_ttl', 'value' => 7200],
        			['id' => 'ip_geolocation', 'value' => 'on'],
        			['id' => 'security_level', 'value' => 'essentially_off'],
        			['id' => 'ssl', 'value' => 'flexible'],
        		],
        		'targets' => [
        		    [
        		        'target' => 'url',
            		    'constraint' => [
            		        'operator' => 'matches',
            		        'value' => '*'.$name.'/pu*'
            		    ],
        		    ]
        		],
        		'status' => 'active'
    		]);
        }

        $db = new \Model\Publisher\Domain;
        try {
            $id = $db->addDomain($user_id, $name, $cf_zone_id, 'Pending');
        } catch(\Exception $e) {
            $cf->delete($cf_zone_id);
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $this->data->data = '/domain/verify/'.$id;
        $this->data->success = true;
        $this->renderView();
    }
    
    public function verify()
    {
        if(!($id = (int) $this->uri[2])) $this->redirectTo('/domain');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Publisher\Domain;
        
        $this->data = $db->getDomain($user_id, $id);
        if(!$this->data) $this->redirectTo('/domain');
        $this->data->cf = new \Module\Cloudflare;

        $this->title = 'Verifying '.$this->data->name.' - '.SITE_NAME;
        $this->view = 'Publisher/domain/verify';
        $this->renderView();
    }
    
    public function __postCancel()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $id = (int) $this->uri[2];
        if(!$id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Publisher\Domain;
        if(!($domain = $db->getDomain($user_id, $id))) {
            $this->data->data = 'Domain ID '.$id.' not found or not yours!';
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
        $this->data->data = '/domain';
        $this->renderView();
    }
    
    public function __postDefault()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $id = (int) $this->uri[2];
        if(!$id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Publisher\Domain;
        if(!$db->setDefaultDomain($user_id, $id)) {
            $this->data->data = 'Domain ID '.$id.' not found or not yours!';
            $this->renderView();
        }
        $db->clearDefaultDomain($user_id, $id);
        
        $this->data->success = true;
        $this->data->data = '/domain';
        $this->renderView();
    }
    
    public function __postVerify()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $id = (int) $this->uri[2];
        if(!$id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Publisher\Domain;
        if(!($domain = $db->getDomain($user_id, $id))) {
            $this->data->data = 'Domain ID '.$id.' not found or not yours!';
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
            $this->data->data = 'Your domain is still using follow nameservers:<br><br>'.implode('<br>',$res->data[0]->original_name_servers);
            $this->renderView();
        }
        
        $db->activeDomain($domain->id);
        $this->data->success = true;
        $this->data->data = '/domain';
        $this->renderView();
    }
}
