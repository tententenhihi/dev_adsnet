<?php

namespace Controller\Index;

class Demo extends Controller
{
    public function index()
    {
        $this->title = 'Demo Ads - '.SITE_NAME;
        $this->view = 'Index/demo/index';
        $this->renderView();
    }
    
    public function ipp()
    {
        $this->title = 'In-page Push Ads - '.SITE_NAME;
        $this->view = 'Index/demo/ipp';
        $this->renderView();
    }
    
    public function pop()
    {
        $this->title = 'Pop Ads - '.SITE_NAME;
        $this->view = 'Index/demo/pop';
        $this->renderView();
    }
    
    public function interstitial()
    {
        $this->title = 'Interstitial Ads - '.SITE_NAME;
        $this->view = 'Index/demo/interstitial';
        $this->renderView();
    }
}
