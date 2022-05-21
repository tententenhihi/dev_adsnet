<?php

namespace Controller\Index;

class Home extends Controller
{
    public function index()
    {
        $this->title = 'Home - WataAds';
        $this->view = 'Index/home/index';
        // $this->htmlCache = true;
        $this->renderView();
    }
}