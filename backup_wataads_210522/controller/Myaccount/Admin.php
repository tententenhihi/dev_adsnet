<?php

namespace Controller\Myaccount;

class Admin extends Controller
{
    public $fullPage = true;
    
    public function index()
    {
        $this->view = 'Global/403';
        $this->renderView();
    }
    
    public function login()
    {
        if(!($return_url = $this->adminReturn())) {
            $this->view = 'Global/403';
            $this->renderView();
        }

        $this->redirectTo($return_url);
    }
}
