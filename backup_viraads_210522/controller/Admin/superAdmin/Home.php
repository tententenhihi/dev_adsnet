<?php

namespace Controller\Admin\superAdmin;

class Home extends Controller
{
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Home;
        $this->helper = new \Module\Helper;
        
        /* get admin */
        $user_id = $this->getSession('id');
        $this->data = $db->getAdmin($user_id);
        $this->data->activity = $db->listLastActivity($user_id, 0, 10);
        
        /* sum ads */
        $items = $db->countActiveAndPendingAds();
        $this->data->ad = (object) ['Pending' => 0, 'Active' => 0];
        foreach($items as $item) {
            $this->data->ad->{$item->status} = $item->cnt;
        }
        
        /* sum websites */
        $items = $db->countActiveAndPendingWebsites();
        $this->data->website = (object) ['Pending' => 0, 'Active' => 0];
        foreach($items as $item) {
            $this->data->website->{$item->status} = $item->cnt;
        }
        
        /* sum open ticket */
        $this->data->openingTicket = $db->countOpeningTicket();
        
        /* sum withdraw */
        $items = $db->sumPaidAndPendingWithdraw();
        $this->data->withdraw = (object) ['Pending' => (object) ['cnt' => 0, 'amount' => 0], 'Paid' => (object) ['cnt' => 0, 'amount' => 0]];
        foreach($items as $item) {
            $this->data->withdraw->{$item->status} = (object) ['cnt' => $item->cnt, 'amount' => $item->amount];
        }
        
        /* sum active zone */
        $this->data->activeZone = $db->countActiveZone();
        

        $this->title = 'Dashboard - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/home/index';
        $this->renderView();
    }
}
