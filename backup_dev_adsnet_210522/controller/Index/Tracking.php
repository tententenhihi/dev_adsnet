<?php

namespace Controller\Index;

class Tracking extends Controller
{
    public function index()
    {
        $this->title = 'Tracking Test Banner - ViraAds';
        $this->view = 'Index/home/tracking';
        $this->renderView();
    }
    
    public function test()
    {
        $ad_id = (int) $this->getRequest('ad_id');
    }
}