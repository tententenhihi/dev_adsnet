<?php

namespace Controller\Myaccount;

class Api extends Controller
{
    public $enable404 = false;
    public $services = ['Advertiser' => 'Advertiser API only', 'Publisher' => 'Publisher API only', 'Global' => 'Full access to all resources'];
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Api;
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Inactive'];
        $status = ucwords($this->uri[1]);
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countApi($user_id);
            } else {
                $this->data->total = $db->countApiSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countApiStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countApiStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listApi($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listApiSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listApiStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listApiStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'My API Tokens - '.SITE_NAME;
        $this->view = 'Myaccount/api/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->service) || !isset($data->description) || !isset($data->status)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!isset($this->services[$data->service])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!in_array($data->status, ['Active', 'Inactive'])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Myaccount\Api;
        if($data->id) {
            if(!$db->updateUserApi($user_id, $data->id, $data->description, $data->status)) {
                $this->data->data = 'Nothing changed!';
                $this->renderView();
            }
        } else {
            try {
                $db->createUserApi($user_id, (new \Module\Helper)->randomToken(12), $data->description, $data->service, $data->status);
            } catch(\Exception $e) {
                $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postDelete()
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

        $db = new \Model\Myaccount\Api;
        if(!$db->deleteUserApi($user_id, $id)) {
            $this->data->data = 'API not found or not yours!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
}
