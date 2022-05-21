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
        
        /* summary ads */
        $ads = $db->countAdGroupByStatus();
        $this->data->ad_total = 0;
        $this->data->ad = new \stdClass;
        foreach($ads as $item) {
            $this->data->ad->{$item->status} = $item->cnt;
            $this->data->ad_total += $item->cnt;
        }
        
        /* summary website */
        $web = $db->countWebsiteGroupByStatus();
        $this->data->website_total = 0;
        $this->data->website = new \stdClass;
        foreach($web as $item) {
            $this->data->website->{$item->status} = $item->cnt;
            $this->data->website_total += $item->cnt;
        }
        
        /* summary zone */
        $zone = $db->countZoneGroupByStatus();
        $this->data->zone_total = 0;
        $this->data->zone = new \stdClass;
        foreach($zone as $item) {
            $this->data->zone->{$item->status} = $item->cnt;
            $this->data->zone_total += $item->cnt;
        }
        
        /* summary network */
        $network = $db->countNetworkGroupByStatus();
        $this->data->network_total = 0;
        $this->data->network = new \stdClass;
        foreach($network as $item) {
            $this->data->network->{$item->status} = $item->cnt;
            $this->data->network_total += $item->cnt;
        }
        
        /* summary ad exchange */
        $adEx = $db->countAdExchangeGroupByStatus();
        $this->data->adEx_total = 0;
        $this->data->adEx = new \stdClass;
        foreach($adEx as $item) {
            $this->data->adEx->{$item->status} = $item->cnt;
            $this->data->adEx_total += $item->cnt;
        }
        
        /* summary deposit */
        $deposit = $db->countDepositGroupByStatus();
        $this->data->deposit = new \stdClass;
        foreach($deposit as $item) {
            $this->data->deposit->{$item->status} = $item->amount;
        }
        
        /* summary withdraw */
        $withdraw = $db->countWithdrawGroupByStatus();
        $this->data->withdraw = new \stdClass;
        foreach($withdraw as $item) {
            $this->data->withdraw->{$item->status} = $item->amount;
        }
        
        /* summary billing */
        $this->data->billing = $db->totalUserBalance();
        
        /* count pending items */
        $this->data->openingTicket = $db->countOpeningTicket();
        
        /* summary users */
        $users = $db->countUserGroupByStatus();
        $this->data->user = (object) ['All' => 0, 'Active' => 0, 'Inactive' => 0, 'Banned' => 0];
        foreach($users as $item) {
            $this->data->user->{$item->status} = $item->cnt;
            $this->data->user->All += $item->cnt;
        }

        $this->title = 'Dashboard - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/home/index';
        $this->renderView();
    }
}
