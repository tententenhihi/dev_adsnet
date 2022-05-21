<?php

namespace Controller\Myaccount;

class Password extends Controller
{
    public function index()
    {
        $this->title = 'Change Password - '.SITE_NAME;
        $this->view = 'Myaccount/password/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $password = $this->postRequest('password');
        $password_current = $this->postRequest('password_current');
        $logout = (int) $this->postRequest('logout');
        if(!$password || !$password_current) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Myaccount\Password;
        $user = $db->getUserById($user_id);
        if (!$this->verifyPassword($password_current, $user->password)) {
            $this->data->data = 'Your current password is incorrect!!!';
            $this->renderView();
        }
        if(!$db->updateUserPassword($user_id, $this->createPassword($password))) {
            $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
            $this->renderView();
        }
        
        $browser = $this->getBrowser();
        $ip_address = $this->getIpAddress();
        $country = $this->getCountry();
        $db->logActivity($user_id, 'Account', 'Password had been changed from '.$browser.' ('.$country.')', $ip_address);
        if($logout) {
            $db->logActivity($user_id, 'Account', 'Logged out all sessions from '.$browser.' ('.$country.')', $ip_address);
            $db->updateRememberToken($user_id, null);
            $sessions = $db->listActiveSession($user_id);
            if($sessions) {
                $db->stopActiveSession($user_id);
                $redis = new \System\Session;
                foreach($sessions as $session) $redis->deleteSession($session->session_id);
            }
        }

        (new \Module\Email)
            ->template('Email/myaccount/password_changed')
            ->sendData(['USER_NAME' => $user->name, 'IP_ADDRESS' => $ip_address, 'BROWSER' => $browser, 'COUNTRY' => $country, 'TIME' => date('Y-m-d H:i:s').' '.TIMEZONE])
            ->sendTo($user->email)
            ->send();
        
        $this->data->success = true;
        $this->renderView();
    }
}
