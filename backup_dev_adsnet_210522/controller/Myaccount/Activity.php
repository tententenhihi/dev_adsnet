<?php

namespace Controller\Myaccount;

class Activity extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Activity;
        
        $this->data->key = $this->getRequest('q');
        $this->data->types = ['All', 'Account', 'Billing'];
        $type = ucwords($this->uri[1]);
        
        if($type && in_array($type, $this->data->types)) {
            $this->data->type = $type;
        } else {
            $this->data->type = 'All';
        }
        if ($this->data->type == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countActivity($user_id);
            } else {
                $this->data->total = $db->countActivitySearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countActivityType($user_id, $this->data->type);
            } else {
                $this->data->total = $db->countActivityTypeSearch($user_id, $this->data->type, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listActivity($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listActivitySearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listActivityType($user_id, $this->data->type, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listActivityTypeSearch($user_id, $this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'My Activities - '.SITE_NAME;
        $this->view = 'Myaccount/activity/index';
        $this->renderView();
    }

    public function updateLanguage(){
        var_dump('dsadsadsadsa');die();
    }
}
