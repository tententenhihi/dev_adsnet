<?php

namespace Controller\Admin\superAdmin;

class Edge extends Controller
{
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Edge;
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
                $this->data->total = $db->countEdge();
            } else {
                $this->data->total = $db->countEdgeSearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countEdgeStatus($this->data->status);
            } else {
                $this->data->total = $db->countEdgeStatusSearch($this->data->status, $this->data->key);
            }
        }
        
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listEdge($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listEdgeSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listEdgeStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listEdgeStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        }else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'Edge - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/edge/index';
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
        
        $db = new \Model\Admin\superAdmin\Edge;
        if(!isset($data->id)) {
            try {
                $id = $db->createEdge($data);
                $confEditor = new \Module\ConfEditor;
                $confEditor->lbConfigAddEdge($data->status, $data->ip_address, $id);
                $confEditor->rlConfigAddEdge($data->ip_address, $id);
                $confEditor->save();
            } catch(\Exception $e) {
                $this->data->data = 'Something was wrong, please try again later!';
                $this->renderView();
            }
            $this->data->success = true;
            $this->renderView();
        }
        
        $edge = $db->getEdge($data->id);
        if(!$edge || !$db->updateEdge($data)) {
            $this->data->data = 'Something was wrong, nothing changed!';
            $this->renderView();
        }
        
        /* change load balancer conf if ip and/or status changed */
        if(($edge->status != $data->status && ($edge->status == 'Active' || $data->status == 'Active')) || $edge->ip_address != $data->ip_address) {
            $confEditor = new \Module\ConfEditor;
            if($edge->ip_address != $data->ip_address) {
                $confEditor->lbConfigChangeEdgeIP($data->ip_address, $edge->ip_address, $data->id);
            }
            if($edge->status != $data->status) {
                $confEditor->lbConfigChangeEdgeStatus($data->status, $edge->status, $data->id);
            }
            $confEditor->save();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postDelete()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->postRequest('id');
        if(!$id) {
            $this->data->data = 'Bad request, Missing required params!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Edge;
        $edge = $db->getEdge($id);
        if(!$edge || !$db->deleteEdge($id)) {
            $this->data->data = 'Edge does not exist or something was wrong!';
            $this->renderView();
        }
        
        $confEditor = new \Module\ConfEditor;
        $confEditor->lbConfigDeleteEdge($edge->ip_address, $edge->id);
        $confEditor->rlConfigDeleteEdge($edge->ip_address, $edge->id);
        $confEditor->save();
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postStats()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        
        $db = new \Model\Admin\superAdmin\Edge;
        $this->data->data = $db->listEdgeStats();
        
        $this->data->success = true;
        $this->renderView();
    }
}
