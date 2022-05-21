<?php

namespace Controller\Admin;

class Auth extends Controller
{
    public $csrfProtected = false;
    
    public function index()
    {
        $this->authRequired();
        $this->fullPage = true;
        $this->view = 'Global/403';
        $this->renderView();
    }
    
    public function __postSso()
    {
        header('Access-Control-Allow-Origin: '.MYACCOUNT_URL);
        header('Access-Control-Allow-Credentials: true');
        $this->jsonResponse = true;
        $this->data->success = false;
        $session_id = $this->postRequest('token');
        if(!$session_id || !($session_id = $this->decryptCookie($session_id))) {
            $this->data->data = 'Seem you are trying to do something wrong!';
            $this->renderView();
        }
        session_destroy();
        session_id($session_id);
        session_start([
            'cookie_lifetime' => SYSTEM_SESSION_TTL,
            'gc_maxlifetime' => SYSTEM_SESSION_TTL,
            'name' => SYSTEM_SESSION_NAME
        ]);
        if (!$this->getSession('id')) {
            $this->data->data = 'Something was wrong, please try again later!';
            $this->renderView();
        }
        $this->data->success = true;
        $this->renderView();
    }
}