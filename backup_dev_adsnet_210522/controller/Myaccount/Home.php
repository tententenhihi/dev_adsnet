<?php

namespace Controller\Myaccount;

class Home extends Controller
{
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Home;

        $this->data->balance = $db->getUserBalance($user_id);
        $this->data->announcement = $db->listLastAnnouncement(0, 5);
        $this->data->history = $db->listLastBalance($user_id, 0, 10);
        $this->data->activity = $db->listLastActivity($user_id, 0, 10);
        $this->data->support = $db->listLastSupport($user_id, 0, 4);
        $this->data->revshare = $db->getPublisherRevshare($user_id) ?? DEFAULT_REVSHARE;
        
        $this->helper = new \Module\Helper;
        $this->title = 'My Account - '.SITE_NAME;
        $this->view = 'Myaccount/home/index';
        $this->renderView();
    }
}
