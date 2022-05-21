<?php

namespace Controller\Api;

class Home extends Controller
{
    public $jsonResponse = false;
    
    public function index()
    {
        $this->title = 'Api Documentation - '.SITE_NAME;
        $this->view = 'Api/home/index';
        $this->renderView();
    }
    
    public function dev()
    {
        $this->title = 'Api Documentation - '.SITE_NAME;
        $this->view = 'Api/home/index';
        $this->renderView();
    }
}