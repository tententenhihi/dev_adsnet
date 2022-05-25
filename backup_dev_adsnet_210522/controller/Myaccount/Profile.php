<?php

namespace Controller\Myaccount;

class Profile extends Controller
{
    public $chats = ['Telegram', 'Skype', 'Facebook', 'Whatsapp', 'Viber', 'Line', 'Other'];
    public $languages = ['en' => 'English', 'vn' => 'Viet Nam'];
        
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Profile;
        
        $this->data = $db->getUser($user_id);
        $this->data->countries = $db->listCountries();
        $this->data->chats = $this->chats;
        $this->data->timezones = timezone_identifiers_list();
        $this->data->languages = $this->languages;
        $this->data->phone_prefix = explode(' ', $this->data->phone)[0];
        $this->data->phone = trim(str_replace($this->data->phone_prefix, '', $this->data->phone));
        $this->data->chat_prefix = explode(':', $this->data->chat_account)[0];
        $this->data->chat_account = trim(str_replace($this->data->chat_prefix.':', '', $this->data->chat_account));
        
        $this->title = 'My Profile - '.SITE_NAME;
        $this->view = 'Myaccount/profile/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $this->helper = new \Module\Helper;
        $data = json_decode($this->postRequest('data'));
        if(!$data) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!($data->birthday = $this->helper->validDate($data->birthday))) {
            $this->data->data = 'Bad request, your birthday is required!';
            $this->renderView();
        }
        if (!($data->phone = $this->helper->validPhone($data->phone))) {
            $this->data->data = 'Bad request, phone number is required';
            $this->renderView();
        }
        if(!$this->helper->validTimezone($data->timezone)) {
            $this->data->data = 'Bad request, timezone is invalid';
            $this->renderView();
        }
        if(!isset($this->languages[$data->language])) {
            $this->data->data = 'Bad request, language is invalid';
            $this->renderView();
        }
        
        $db = new \Model\Myaccount\Profile;
        if(!($ct = $db->getCountry($data->country_id))) {
            $this->data->data = 'Bad request, valid country is required';
            $this->renderView();
        }
        $data->phone = $ct->phone.' '.$data->phone;
        
        $user = $db->getUser($user_id);
        if($user->two_factor == 'sms' && $user->phone != $data->phone) {
            $this->data->data = 'Two Factor SMS Verification is enabled, please disable it before changing your phone number';
            $this->renderView();
        }
        
        if($data->language != $user->language || $data->name != $user->name) {
            $this->setSession('language', $data->language);
            $this->setSession('name', $data->name);
            setcookie('language', $data->language, time() + 10 * 365 * 24 * 60 * 60, '/', 'viradev.com');


            $sessions = $db->listActiveSession($user_id);
            if(count($sessions) > 1) {
                $redis = new \System\Session;
                $session_id = session_id();
                foreach($sessions as $session) {
                    if($session->session_id != $session_id) {
                        $redis->deleteSession($session->session_id);
                        $db->stopSession($session->id);
                    }
                }
            }
        }
        
        foreach($user as $key => $value) {
            if(!isset($data->$key) || !$data->$key) continue;
            $user->$key = $data->$key;
        }
        $db->updateUser($user_id, $user);

        $this->data->success = true;
        $this->renderView();
    }
}
