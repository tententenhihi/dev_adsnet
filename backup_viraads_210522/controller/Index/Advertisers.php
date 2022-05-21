<?php

namespace Controller\Index;

class Advertisers extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        $this->title = 'Advertisers - '.SITE_NAME;
        $this->view = 'Index/advertisers/index';
        $this->renderView();
    }
}
