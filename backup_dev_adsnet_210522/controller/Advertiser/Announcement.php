<?php

namespace Controller\Advertiser;

class Announcement extends Controller
{
    public function index()
    {
        $this->redirectTo(MYACCOUNT_URL.'/announcement');
    }
    
    public function __postContent()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $id = (int) $this->uri[2];
        $db = new \Model\Myaccount\Announcement;
        
        $this->data->success = true;
        $this->data->data = $db->getAnnouncementMessage($id);
        $this->renderView();
    }
    
}
