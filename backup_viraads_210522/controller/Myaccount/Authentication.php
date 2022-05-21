<?php

namespace Controller\Myaccount;

class Authentication extends Controller
{
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Authentication;

        $this->data->userTokens = $db->getuserToken($user_id);
        $this->data->twoFactorToken = $this->data->userTokens->two_factor;
        $this->data->rememberMeToken = $this->data->userTokens->remember_token;
        if($this->data->twoFactorToken && $this->data->twoFactorToken != 'sms' && $this->data->twoFactorToken != 'email') $this->data->twoFactorToken = 'app';

        $this->title = 'Authentication - '.SITE_NAME;
        $this->view = 'Myaccount/authentication/index';
        $this->renderView();
    }
    
    public function __postTwoFactor()
    {
        $this->jsonResponse = true;
        $this->data->success = false;

        if(!($type = $this->postRequest('type')) || !in_array($type, ['app','email','sms'])) {
            $this->data->data = 'Bad request, authentication type is required!';
            $this->renderView();
        }
        $code_submitted = $this->postRequest('code');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Authentication;
        $user = $db->getTwoFactor($user_id);
        if($user->two_factor) {
            $this->data->data = 'Your account was already enabled 2FA!';
            $this->renderView();
        }
        
        $this->helper = new \Module\Helper;
        if($type == 'email') {
            if ($code_submitted == null) {
                $code = $this->helper->randomNumber(6);
                $db->createTwoFactorCode($user_id, $code);
                (new \Module\Email)
                    ->template('Email/myaccount/2fa')
                    ->sendData(['USER_NAME' => $this->getSession('name'), '2FA_CODE' => $code])
                    ->sendTo($this->getSession('email'))
                    ->send();
                $this->data->success = true;
                $this->renderView();
            }
            if(!$db->removeTwoFactorCode($user_id, $code_submitted)) {
                $this->data->data = 'Your code is invalid or expired!';
                $this->renderView();
            }
            $db->updateTwoFactorToken($user_id, 'email');
            $db->logActivity($user_id, 'Account', 'Enabled two-factor email authentication from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
            $this->data->success = true;
            $this->renderView();
        }
        if($type == 'sms') {
            if ($code_submitted == null) {
                $code = $this->helper->randomNumber(6);
                $db->createTwoFactorCode($user_id, $code);
                (new \Module\Sms)
                    ->message('Your '.SITE_NAME.' verification code is: '.$code)
                    ->sendTo($user->phone)
                    ->send();
                $this->data->success = true;
                $this->renderView();
            }
            if(!$db->removeTwoFactorCode($user_id, $code_submitted)) {
                $this->data->data = 'Your code is invalid or expired!';
                $this->renderView();
            }
            $db->updateTwoFactorToken($user_id, 'sms');
            $db->logActivity($user_id, 'Account', 'Enabled two-factor sms authentication from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
            $this->data->success = true;
            $this->renderView();
        }
        
        $ga = new \Module\GoogleAuthenticator;
        if ($code_submitted == null) {
            $secret = $ga->createSecret();
            $this->data->qrcode = $ga->getQRCode(SITE_NAME, $secret);
            if(!$this->data->qrcode) {
                $this->data->data = 'Something was wrong, please try again!';
                $this->renderView();
            }
            $this->setSession('ga_secret', $secret);
            $this->data->success = true;
            $this->renderView();
        }
        $secret = $this->getSession('ga_secret');
        if(!$secret || !$ga->verifyCode($secret, $code_submitted)) {
            $this->data->data = 'Your code is invalid or expired!';
            $this->renderView();
        }
        $this->removeSession('ga_secret');
        $db->updateTwoFactorToken($user_id, $secret);
        $db->logActivity($user_id, 'Account', 'Enabled two-factor app authentication from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postDisable2fa()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Authentication;
        $db->updateTwoFactorToken($user_id, null);
        $db->logActivity($user_id, 'Account', 'Disable two-factor authentication from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postRememberme()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Authentication;
        $db->updateRememberToken($user_id, null);
        $this->removeCookie('remember_me');
        $db->logActivity($user_id, 'Account', 'Invalidated all RememberMe cookies from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
        
        $this->data->success = true;
        $this->renderView();
    }
}
