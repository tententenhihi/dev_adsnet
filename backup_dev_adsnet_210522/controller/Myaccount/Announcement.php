<?php

namespace Controller\Myaccount;

class Announcement extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $db = new \Model\Myaccount\Announcement;
        
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
                $this->data->total = $db->countAnnouncement();
            } else {
                $this->data->total = $db->countAnnouncementSearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countAnnouncementService($this->data->service);
            } else {
                $this->data->total = $db->countAnnouncementServiceSearch($this->data->service, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->service == 'Global') {
                if(!$this->data->key) {
                    $this->data->data = $db->listAnnouncement($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listAnnouncementSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listAnnouncementService($this->data->service, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listAnnouncementServiceSearch($this->data->service, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'Announcements - '.SITE_NAME;
        $this->view = 'Myaccount/announcement/index';
        $this->renderView();
    }
    
    public function __postContent()
    {
        $this->jsonResponse = true;
        $this->data->success = true;
        $db = new \Model\Myaccount\Announcement;

        $this->data->data = $db->getAnnouncementMessage($this->uri[2]);
        $this->renderView();
    }
}
