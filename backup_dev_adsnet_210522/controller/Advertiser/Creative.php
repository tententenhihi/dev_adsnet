<?php

namespace Controller\Advertiser;

class Creative extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Creative;
        
        $this->data->key = $this->getRequest('q');
        $this->data->types = ['All', 'Video', 'Image'];
        $types = ucwords($this->uri[1]);
        
        if(in_array($types, $this->data->types)) {
            $this->data->type = $types;
        } else {
            $this->data->type = 'All';
        }
        if ($this->data->type == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countCreative($user_id);
            } else {
                $this->data->total = $db->countCreativeSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countCreativeType($user_id, $this->data->type);
            } else {
                $this->data->total = $db->countCreativeTypeSearch($user_id, $this->data->type, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listCreative($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listCreativeSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listCreativeType($user_id, $this->data->type, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listCreativeTypeSearch($user_id, $this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'My Creatives - '.SITE_NAME;
        $this->view = 'Advertiser/creative/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->jsonResponse = true;
        $type = $this->postRequest('type');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Creative;
        $this->data->data = $db->listCreativeType($user_id, $type, 0, 999);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postUpload()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        $name = $this->postRequest('name');
        $extension = strtolower(pathinfo($name, PATHINFO_EXTENSION));
        if(!$extension) {
            $this->data->data = 'File is invalid, could not upload!';
            $this->renderView();
        }
        
        if($extension == 'jpeg') $extension = 'jpg';
        $opts = [
            'http' => [
                'method'  => 'POST',
                'timeout' => 30,
                'ignore_errors' => true,
                'header' => "ta-user-id: ".$this->getSession('id')."\r\n"
                            ."ta-extension: ".$extension."\r\n"
                            ."ta-user-ip: ".$this->getIpAddress()."\r\n"
                            ."ta-secret: ".SYSTEM_TOKEN."\r\n"
            ],
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false
            ]
        ];
        try {
		    $res = @file_get_contents(ASSET_URL.'/internal', false, stream_context_create($opts));
		    $res = json_decode($res);
		    if(!$res || !isset($res->success)) {
		        $this->data->data = 'Internal server error, please try again later!';
                $this->renderView();
		    }
		} catch(\Exception $e) {
		    $this->data->data = 'Could not connect to Upload Server, please try again later';
            $this->renderView();
		}
        
        if(!$res->success) {
            $this->data->data = $res->data;
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->data->data = ['endpoint' => ASSET_URL.'/upload/', 'metadata' => ['token' => $res->data]];
        $this->renderView();
    }
    
    public function __postRename()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->name)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Creative;
        if(!$db->updateCreativeName($user_id, $data->id, $data->name)) {
            $this->data->data = 'Sorry, something was wrong, Creative not found or not yours!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postDelete()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if(!($id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Creative;
        $creative = $db->getCreative($user_id, $id);
        if(!$creative) {
            $this->data->data = 'Creative not found or not yours!';
            $this->renderView();
        }
        try{
            $db->removeCreative($user_id, $id);
        }catch(\Exception $e){
            $this->data->data = 'Your creative is assigned to one or more Ads. Please unassign it first!';
            $this->renderView();
        }
        
        $path = explode('/userdata/', $creative->url)[1];
        $opts = [
            'http' => [
                'method'  => 'POST',
                'timeout' => 30,
                'ignore_errors' => true,
                'header' => "ta-path: ".$path."\r\n"
                            ."ta-secret: ".SYSTEM_TOKEN."\r\n"
            ],
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false
            ]
        ];
        try {@file_get_contents(ASSET_URL.'/delete', false, stream_context_create($opts));} catch(\Exception $e) {}
        
        $this->data->success = true;
        $this->data->data = '/creative';
        $this->renderView();
    }
    
    public function __postCreate()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $url = $this->postRequest('url');
        $name = $this->postRequest('name');
        $type = $this->postRequest('type');
        $size = $this->postRequest('size');
        if(!$name || !$url || !in_array($type, ['video', 'image'])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $extension = strtolower(pathinfo($name, PATHINFO_EXTENSION));
        if($extension == 'jpeg') $extension = 'jpg';
        $user_id = $this->getSession('id');
        $url = str_replace('/upload/', '/userdata/'.$user_id.'/', $url).'.'.$extension;
        $thumb = $url;
        if($type == 'video') $thumb = str_replace('.mp4', '.jpg', $url);
        
        $db = new \Model\Advertiser\Creative;
        $id = $db->addCreative($user_id, $name, $type, $thumb, $size, $url);
        
        $this->data->success = true;
        $this->data->data = ['id' => $id, 'url' => $url, 'thumb' => $thumb, 'created_at' => date('Y-m-d H:i:s')];
        $this->renderView();
    }
}