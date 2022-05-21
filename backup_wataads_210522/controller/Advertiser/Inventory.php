<?php

namespace Controller\Advertiser;

class Inventory extends Controller
{
    public function index()
    {
        $db = new \Model\Advertiser\Inventory;
        $this->helper = new \Module\Helper;
        $created_at = date('Y-m-d', strtotime('60 days ago'));
        $this->data->data = $db->getInventory($created_at);
        
        $this->title = 'Traffic Inventory - '.SITE_NAME;
        $this->view = 'Advertiser/inventory/index';
        $this->renderView();
    }
}