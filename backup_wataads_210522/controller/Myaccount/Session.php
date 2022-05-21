<?php

namespace Controller\Myaccount;

class Session extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Session;
        
        $this->data->currentId = session_id();
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Stopped'];
        $status = ucwords($this->uri[1]);
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countSession($user_id);
            } elseif(strlen($this->data->key) == 2) {
                $this->data->total = $db->countSessionSearchCountry($user_id, $this->data->key);
            } else {
                $this->data->total = $db->countSessionSearchIp($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countSessionStatus($user_id, $this->data->status);
            } elseif(strlen($this->data->key) == 2) {
                $this->data->total = $db->countSessionStatusSearchCountry($user_id, $this->data->status, $this->data->key);
            } else {
                $this->data->total = $db->countSessionStatusSearchIp($user_id, $this->data->status, $this->data->key);
            }
        }
            

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listSession($user_id, $pagination->getInit(), $pagination->getLimit());
                } elseif(strlen($this->data->key) == 2) {
                    $this->data->data = $db->listSessionSearchCountry($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listSessionSearchIp($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listSessionStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } elseif(strlen($this->data->key) == 2) {
                    $this->data->data = $db->listSessionStatusSearchCountry($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listSessionStatusSearchIp($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
                
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'My Sessions - '.SITE_NAME;
        $this->view = 'Myaccount/session/index';
        $this->renderView();
    }
    
    public function __postLogout()
    {
        $this->jsonResponse = true;
        $this->data->success = false;

        $user_id = $this->getSession('id');
        $id = $this->postRequest('id');
        $db = new \Model\Myaccount\Session;
        if(!($session = $db->getUserSession($user_id, $id))) {
            $this->data->data = 'Sorry, session not found or not yours!';
            $this->renderView();
        }
        $db->stopUserSession($user_id, $id);
        (new \System\Session)->deleteSession($session->session_id);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postMasslogout()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Session;
        $db->logActivity($user_id, 'Account', 'Logged out all sessions from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
        $sessions = $db->listActiveSession($user_id);
        if($sessions) {
            $db->stopActiveSession($user_id);
            $redis = new \System\Session;
            foreach($sessions as $session) $redis->deleteSession($session->session_id);
        }
        
        $this->data->success = true;
        $this->renderView();
    }
}
