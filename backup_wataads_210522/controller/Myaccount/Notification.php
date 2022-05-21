<?php

namespace Controller\Myaccount;

class Notification extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Notification;
        
        $this->data->key = $this->getRequest('q');
        $this->data->services = ['Global', 'Advertiser', 'Publisher'];
        $service = ucwords($this->uri[1]);
        
        if(in_array($service, $this->data->services)) {
            $this->data->service = $service;
        } else {
            $this->data->service = 'Global';
        }
        if ($this->data->service == 'Global') {
            if(!$this->data->key) {
                $this->data->total = $db->countNotification($user_id);
            } else {
                $this->data->total = $db->countNotificationSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countNotificationService($user_id, $this->data->service);
            } else {
                $this->data->total = $db->countNotificationServiceSearch($user_id, $this->data->service, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->service == 'Global') {
                if(!$this->data->key) {
                    $this->data->data = $db->listNotification($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listNotificationSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listNotificationService($user_id, $this->data->service, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listNotificationServiceSearch($user_id, $this->data->service, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'My Notifications - '.SITE_NAME;
        $this->view = 'Myaccount/notification/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $id = (int) $this->postRequest('id');
        $service = $this->postRequest('service');
        $db = new \Model\Myaccount\Notification;
        if(!$id) {
            $this->data->data = [];
            if($service) {
                $this->data->total = $db->countUnreadNotificationByService($user_id, $service);
                $data = $this->data->total ? $db->listUnreadNotificationByService($user_id, $service) : null;
            } else {
                $this->data->total = $db->countUnreadNotification($user_id);
                $data = $this->data->total ? $db->listUnreadNotification($user_id) : null;
            }
            if($data) {
                foreach($data as $item) {
                    $this->data->data[] = ['id' => $item->id, 'type' => $item->type, 'title' => $item->title, 'created_at' => $item->created_at];
                }
            }
            
            $this->data->success = true;
            $this->renderView();
        }

        $this->data->data = $db->getNotification($id, $user_id);
        if (!$this->data->data) {
            $this->data->data = 'Error 404: resource not found or not yours!';
            $this->renderView();
        }
        
        if (!$this->data->data->is_read) $db->readNotification($id);
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postReadAll()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        $db = new \Model\Myaccount\Notification;
        $db->markAllRead($this->getSession('id'));

        $this->data->success = true;
        $this->renderView();
    }
}
