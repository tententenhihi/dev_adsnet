<?php

namespace Controller\Admin\superAdmin;

class Loadbalancer extends Controller
{
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Loadbalancer;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Inactive', 'Down'];
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countLoadbalancer();
            } else {
                $this->data->total = $db->countLoadbalancerSearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countLoadbalancerStatus($this->data->status);
            } else {
                $this->data->total = $db->countLoadbalancerStatusSearch($this->data->status, $this->data->key);
            }
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listLoadbalancer($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listLoadbalancerSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listLoadbalancerStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listLoadbalancerStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        }else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'Loadbalancer - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/loadbalancer/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->name) || !isset($data->ip_address) || !isset($data->port_total) || !isset($data->bandwidth_total) || !isset($data->status)) {
            $this->data->data = 'Bad request, Missing required params!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Loadbalancer;
        if(!isset($data->id)) {
            try {
                $db->createLoadbalancer($data);
            } catch(\Exception $e) {
                $this->data->data = 'Something was wrong, please try again later!';
                $this->renderView();
            }
        } else {
            if(!$db->updateLoadbalancer($data)) {
                $this->data->data = 'Something was wrong, nothing changed!';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postStats()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        
        $db = new \Model\Admin\superAdmin\Loadbalancer;
        $this->data->data = $db->listLoadbalancerStats();
        
        $this->data->success = true;
        $this->renderView();
    }
}
