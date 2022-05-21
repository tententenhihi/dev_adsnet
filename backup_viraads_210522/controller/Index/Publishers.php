<?php

namespace Controller\Index;

class Publishers extends Controller
{
    public function index()
    {
        $this->title = 'Publishers - '.SITE_NAME;
        $this->view = 'Index/publishers/index';
        $this->renderView();
    }
}
