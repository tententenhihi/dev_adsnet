<?php

namespace Controller\Publisher;

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
        $db = new \Model\Publisher\Announcement;
        
        $this->data->success = true;
        $this->data->data = $db->getAnnouncementMessage($id);
        $this->renderView();
    }
}
