<?php

namespace Controller\Admin\superAdmin;

class Notification extends Controller
{
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Notification;
        $this->helper = new \Module\Helper;
        
        /* count pending items */
        $this->data->pendingAd = $db->countPendingAd();
        $this->data->openingTicket = $db->countOpeningTicket();
        $this->data->pendingWithdraw = $db->countPendingWithdraw();
        $this->data->unpaidDeposit = $db->countUnpaidDeposit();
        $this->data->pendingWebsite = $db->countPendingWebsite();
        
        $this->title = 'Notification - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/notification/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        /* count pending items */
        $db = new \Model\Admin\superAdmin\Notification;
        $pendingAd = $db->countPendingAd();
        $openingTicket = $db->countOpeningTicket();
        $pendingWithdraw = $db->countPendingWithdraw();
        $unpaidDeposit = $db->countUnpaidDeposit();
        $pendingWebsite = $db->countPendingWebsite();
        
        /* build content */
        $this->data->data = [];
        $this->data->total = ($pendingAd?1:0) + ($openingTicket?1:0) + ($pendingWithdraw?1:0) + ($unpaidDeposit?1:0) + ($pendingWebsite?1:0);
        if($this->data->total) {
            $created_at = (new \DateTime('now'))->format('Y-m-d H:m:s');
            if($pendingAd) {
                $id = '/advertiser/ad/pending';
                $type = 'danger';
                $title = $pendingAd.' Ads awaiting approval';
                $this->data->data[] = ['id' => $id, 'type' => $type, 'title' => $title, 'created_at' => $created_at];
            }
            if($openingTicket) {
                $id = '/support/opening';
                $type = 'info';
                $title = $openingTicket.' Tickets awaiting reply';
                $this->data->data[] = ['id' => $id, 'type' => $type, 'title' => $title, 'created_at' => $created_at];
            }
            if($pendingWithdraw) {
                $id = '/billing/withdraw/pending';
                $type = 'danger';
                $title = $pendingWithdraw.' Withdraw awaiting payment';
                $this->data->data[] = ['id' => $id, 'type' => $type, 'title' => $title, 'created_at' => $created_at];
            }
            if($pendingWebsite) {
                $id = '/publisher/website/pending';
                $type = 'success';
                $title = $pendingWebsite.' Websites awaiting approval';
                $this->data->data[] = ['id' => $id, 'type' => $type, 'title' => $title, 'created_at' => $created_at];
            }
            if($unpaidDeposit) {
                $id = '/billing/deposit/unpaid';
                $type = 'info';
                $title = $unpaidDeposit.' deposit invoices unpaid';
                $this->data->data[] = ['id' => $id, 'type' => $type, 'title' => $title, 'created_at' => $created_at];
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
}
