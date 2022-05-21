<?php

namespace Controller\Admin\superAdmin;

class Announcement extends Controller
{
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Announcement;
        $this->data->key = $this->getRequest('q');
        $this->data->type = ucwords($this->uri[1]);
        if(!in_array($this->data->type, ['Success', 'Info', 'Warning'])) {
            $this->data->type = 'All';
        }
        
        if($this->data->type == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countAnnouncement();
            } else {
                $this->data->total = $db->countAnnouncementSearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countAnnouncementType($this->data->type);
            } else {
                $this->data->total = $db->countAnnouncementTypeSearch($this->data->type, $this->data->key);
            }
        }
            
    
        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listAnnouncement($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listAnnouncementSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listAnnouncementType($this->data->type, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listAnnouncementTypeSearch($this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
                
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = 'Announcements - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/announcement/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $db = new \Model\Admin\superAdmin\Announcement;
        if($this->uri[1] == 'remove') {
            $id = (int) $this->postRequest('id');
            if(!$id) {
                $this->data->data = 'Bad request, invalid params';
                $this->renderView();
            }
            
            if(!$db->removeAnnouncement($id)) {
                $this->data->data = 'Announcement ID '.$id.' not found';
                $this->renderView();
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->subject) || !isset($data->type) || !isset($data->service) || !isset($data->description) || !isset($data->message) || !isset($data->is_shown) || !isset($data->is_sticky) || !isset($data->is_long)) {
            $this->data->data = 'Bad request, invalid params';
            $this->renderView();
        }
        if(!$data->message) {
            $data->message = null;
            $data->is_long = 0;
        } else {
            $data->is_long = 1;
        }
        
        if(!($data->id = (int) $data->id)) {
            $db->createAnnouncement($data);
        } else {
            $db->updateAnnouncement($data);
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postRemove()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $db = new \Model\Admin\superAdmin\Announcement;
        
        $id = (int) $this->postRequest('id');
        if(!$id) {
            $this->data->data = 'Bad request, invalid params';
            $this->renderView();
        }
        
        if(!$db->removeAnnouncement($id)) {
            $this->data->data = 'Announcement ID '.$id.' not found';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
}