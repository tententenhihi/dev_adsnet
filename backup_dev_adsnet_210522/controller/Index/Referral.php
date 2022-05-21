<?php

namespace Controller\Index;

class Referral extends Controller
{
    public function index()
    {
        $this->title = 'Referral Program - '.SITE_NAME;
        $this->view = 'Index/referral/index';
        $this->renderView();
    }
}
