<?php

namespace Controller\Index;

class Youtubers extends Controller
{
    public function index()
    {
        $this->title = 'The Best Services For Youtubers - '.SITE_NAME;
        $this->view = 'Index/youtubers/index';
        $this->renderView();
    }
}
