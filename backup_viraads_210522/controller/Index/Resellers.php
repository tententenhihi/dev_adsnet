<?php

namespace Controller\Index;

class Resellers extends Controller
{
    public function index()
    {
        $this->title = 'Smm Resellers - '.SITE_NAME;
        $this->view = 'Index/resellers/index';
        $this->renderView();
    }
}
