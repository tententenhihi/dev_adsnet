<?php

namespace Controller\Myaccount;

class Auth extends Controller
{
    public $fullPage = true;
    public $authRequired = false;
    
    public function index()
    {
        $this->redirectTo('/auth/login');
    }

    public function register()
    {
        $this->checkMaintenance('MAINTENANCE_REGISTER');
        if ($this->isAuthenticated()) $this->redirectTo('/');
        $this->view = 'Myaccount/auth/register';
        $this->renderView();
    }

    public function login()
    {
        if ($this->isAuthenticated()) $this->redirectTo('/');
        $this->view = 'Myaccount/auth/login';
        $this->renderView();
    }

    public function forgotPassword()
    {
        if ($this->isAuthenticated()) $this->redirectTo('/');
        $this->data->is_expired = false;
        $this->view = 'Myaccount/auth/forgot_password';
        $this->renderView();
    }

    public function verify()
    {
        if ($this->isAuthenticated()) $this->redirectTo('/');
        if (!($this->data->token = $this->getRequest('token'))) $this->redirectTo('/auth/login');

        $db = new \Model\Myaccount\Auth;
        if (!$db->getResetToken($this->data->token)) $this->redirectTo('/auth/login');
        $this->data->countries = $db->listCountries();
        $this->data->chats = ['Telegram', 'Skype', 'Facebook', 'Whatsapp', 'Viber', 'Line', 'Other'];
        $this->data->timezones = timezone_identifiers_list();
        $this->data->languages = ['en' => 'English', 'vn' => 'Viet Nam'];
        $this->view = 'Myaccount/auth/verify';
        $this->renderView();
    }

    public function __postRegister()
    {
        $this->checkReadOnly();
        $this->checkMaintenance('MAINTENANCE_REGISTER');
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $this->helper = new \Module\Helper;
        if (!($email = $this->helper->validEmail($this->postRequest('email')))) {
            $this->data->data = 'Bad request, valid email is required';
            $this->renderView();
        }
        if (!($name = $this->postRequest('name'))) {
            $this->data->data = 'Bad request, Your name is required';
            $this->renderView();
        }
        if (!($password = $this->postRequest('password'))) {
            $this->data->data = 'Bad request, valid password is required';
            $this->renderView();
        }

        $db = new \Model\Myaccount\Auth;
        
        try {
            $user_id = $db->createUser($name, $email, $this->createPassword($password));
            if(isset($_COOKIE['referral'])){
                $user_ref = $db->createUserReferral((new \Module\HashIds)->decode($_COOKIE['referral']), $user_id, 'Inactive');
            }
            $db->createUserBalance($user_id);
            $db->createPublisherAccount($user_id);
            $db->createAdvertiserAccount($user_id);
            $token = $this->helper->randomToken(32);
            $browser = $this->getBrowser();
            $ip_address = $this->getIpAddress();
            $country = $this->getCountry();
            $db->createResetToken($user_id, $token);
            $db->logActivity($user_id, 'Account', 'Started the registration from '.$browser.' ('.$country.')', $ip_address);
            
            (new \Module\Email)
                ->template('Email/myaccount/register_welcome')
                ->sendData(['USER_EMAIL' => $email, 'USER_NAME' => $name, 'TOKEN' => $token, 'IP_ADDRESS' => $ip_address, 'BROWSER' => $browser, 'COUNTRY' => $country])
                ->sendTo($email)
                ->send();
        } catch (\Exception $e) {
            $this->data->data = 'This email is already registered with us, please use another one or try to reset password';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }

    public function __postVerify()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        $this->helper = new \Module\Helper;
        if (!($reset_token = $this->postRequest('reset_token'))) {
            $this->data->data = 'Bad request, reset token is required';
            $this->renderView();
        }
        if (!($address = $this->postRequest('address'))) {
            $this->data->data = 'Bad request, address is required';
            $this->renderView();
        }
        if (!($country_id = (int) $this->postRequest('country_id'))) {
            $this->data->data = 'Bad request, country is required';
            $this->renderView();
        }
        if (!($phone = $this->helper->validPhone($this->postRequest('phone')))) {
            $this->data->data = 'Bad request, phone number is required';
            $this->renderView();
        }
        if (!($chat_account = $this->postRequest('chat_account'))) {
            $this->data->data = 'Bad request, chatting account is required';
            $this->renderView();
        }
        if (!($birthday = $this->helper->validDate($this->postRequest('birthday')))) {
            $this->data->data = 'Bad request, valid birthday is required';
            $this->renderView();
        }
        $timezone = $this->postRequest('timezone') ?: 'UTC';
        $language = $this->postRequest('language') ?: 'en';
        $is_subscribed = (int) $this->postRequest('is_subscribed');

        $db = new \Model\Myaccount\Auth;
        if (!($token = $db->getResetToken($reset_token))) {
            $this->data->data = 'Bad request, reset token is not found or expired';
            $this->renderView();
        }
        if(!($ct = $db->getCountry($country_id))) {
            $this->data->data = 'Bad request, valid country is required';
            $this->renderView();
        }
        
        $phone = $ct->phone.' '.$phone;
        $browser = $this->getBrowser();
        $country = $this->getCountry();
        $ip_address = $this->getIpAddress();
        $db->updateUser($token->user_id, $address, $country_id, $phone, $chat_account, $birthday, $timezone, $language, $is_subscribed, 'Active');
        $db->updateUserReferral($token->user_id, 'Active');
        $db->removeResetToken($token->id);
        $db->logActivity($token->user_id, 'Account', 'Verified account and completed the registration from '.$browser.' ('.$country.')', $ip_address);
        $user = $db->getUserById($token->user_id);

        (new \Module\Email)
            ->template('Email/myaccount/register_done')
            ->sendData(['USER_NAME' => $user->name])
            ->sendTo($user->email)
            ->send();
        
        $this->data->success = true;
        $this->data->data = '/';
        $this->renderView();
    }

    public function logout()
    {
        if (!($user_id = $this->isAuthenticated())) $this->redirectTo('/');
        
        $session_id = session_id();
        $this->removeCookie('remember_me');
        $this->stopSession();
        
        $db = new \Model\Myaccount\Auth;
        $db->logActivity($user_id, 'Account', 'Logged out from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
        $db->stopUserSession($user_id, $session_id);
        
        $redirect_to = $this->getRequest('redirect_to');
        if (!$redirect_to) $redirect_to = '/';
        $this->redirectTo($redirect_to);
    }

    public function __postLogin()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $this->data->two_factor = null;

        $this->helper = new \Module\Helper;
        if (!($email = $this->helper->validEmail($this->postRequest('email'))) || !($password = $this->postRequest('password'))) {
            $this->data->data = 'Bad request, both valid email and password are required';
            $this->renderView();
        }

        $db = new \Model\Myaccount\Auth;
        if (!($user = $db->getUserByEmail($email))) {
            $this->data->data = 'Login failed, account not found!';
            $this->renderView();
        }
        if($user->status == 'Banned') {
            $this->data->data = 'sorry, seem you have been banned, reason: '.$user->ban_reason;
            $this->setSession('banned', $user->ban_reason);
            $this->renderView();
        }
        if($user->status == 'Inactive') {
            $this->data->data = 'Your account is unverified, please check your mail box and follow the instruction in our welcome email';
            $this->renderView();
        }
        if (!$this->verifyPassword($password, $user->password)) {
            $this->data->data = 'Login failed, double check your email and password';
            $this->renderView();
        }
        if($user->two_factor) {
            $code_submitted = $this->postRequest('code');
            if($user->two_factor == 'email') {
                if (!$code_submitted) {
                    $code = $this->helper->randomNumber(6);
                    $db->createTwoFactorCode($user->id, $code);
                    (new \Module\Email)
                        ->template('Email/myaccount/2fa')
                        ->sendData(['USER_NAME' => $user->name, '2FA_CODE' => $code])
                        ->sendTo($user->email)
                        ->send();
                    $this->data->two_factor = true;
                    $this->data->data = 'Your account is being protected by Two Factor Authentication, we sent you a 6-digits verification code, please check your mail box and enter it here';
                    $this->renderView();
                }
                if(!$db->removeTwoFactorCode($user->id, $code_submitted)) {
                    $this->data->data = 'Your 2fa verification code is invalid or expired!';
                    $this->renderView();
                }
            } elseif($user->two_factor == 'sms') {
                if (!$code_submitted) {
                    $code = $this->helper->randomNumber(6);
                    $db->createTwoFactorCode($user->id, $code);
                    (new \Module\Sms)
                        ->message('Your '.SITE_NAME.' verification code is: '.$code)
                        ->sendTo($user->phone)
                        ->send();
                    $this->data->two_factor = true;
                    $this->data->data = 'Your account is being protected by Two Factor Authentication, we sent you a 6-digits verification code, please check your phone sms and enter it here';
                    $this->renderView();
                }
                if(!$db->removeTwoFactorCode($user->id, $code_submitted)) {
                    $this->data->data = 'Your 2fa verification code is invalid or expired!';
                    $this->renderView();
                }
            } else {
                if (!$code_submitted) {
                    $this->data->two_factor = true;
                    $this->data->data = 'Your account is being protected by Two Factor Authentication, please open authentication app you registered with us to get 6-digits verification code';
                    $this->renderView();
                }
                if(!(new \Module\GoogleAuthenticator)->verifyCode($user->two_factor, $code_submitted)) {
                    $this->data->data = 'Your 2fa verification code is invalid or expired!';
                    $this->renderView();
                }
            }
        }
        
        $browser = $this->getBrowser();
        $ip_address = $this->getIpAddress();
        $country = $this->getCountry();
        $remember_me = (int) $this->postRequest('remember_me');
        if ($remember_me) {
            if(!$user->remember_token) {
                $user->remember_token = $this->helper->randomToken(8);
                $db->updateRememberToken($user->id, $user->remember_token);
            }
            $this->setRememberMe($user->remember_token);
        }
        $db->startUserSession($user->id, session_id(), $browser, $ip_address, $country, $remember_me);
        $db->logActivity($user->id, 'Account', 'Logged in from '.$browser.' ('.$country.')', $ip_address);
        $user->permission = $db->getAdminPermission($user->id);
        $this->setAuthenticated($user);

        $language = (new \Model\Myaccount\Language)->getLanguage($user->id);
        if($language){
            setcookie('language', $language, time() + 10 * 365 * 24 * 60 * 60, '/', 'viradev.com');
        }
        $this->data->success = true;
        $this->renderView();
    }

    public function __postForgotPassword()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        $this->helper = new \Module\Helper;
        if (!($email = $this->helper->validEmail($this->postRequest('email')))) {
            $this->data->data = 'Invalid request, your registered email with us is required';
            $this->renderView();
        }

        $db = new \Model\Myaccount\Auth;
        if (!($user = $db->getUserByEmail($email))) {
            $this->data->data = 'Double check your email';
            $this->renderView();
        }
        if($user->status == 'Banned') {
            $this->data->data = 'sorry, seem you have been banned, ban_reason: '.$user->ban_reason;
            $this->renderView();
        }

        $token = $this->helper->randomToken(32);
        $browser = $this->getBrowser();
        $ip_address = $this->getIpAddress();
        $country = $this->getCountry();
        $db->createResetToken($user->id, $token);
        $tpl = 'Email/myaccount/register_welcome';
        if($user->status == 'Active') {
            $tpl = 'Email/myaccount/password_forgot';
            $db->logActivity($user->id, 'Account', 'ResetPassword had been requested from '.$browser.' ('.$country.')', $ip_address);
        }

        (new \Module\Email)
            ->template($tpl)
            ->sendData(['USER_EMAIL' => $user->email, 'USER_NAME' => $user->name, 'TOKEN' => $token, 'IP_ADDRESS' => $ip_address, 'BROWSER' => $browser, 'COUNTRY' => $country])
            ->sendTo($user->email)
            ->send();
        
        $this->data->success = true;
        $this->renderView();
    }

    public function resetPassword()
    {
        if ($this->isAuthenticated()) $this->redirectTo('/');
        if (!($this->data->token = $this->getRequest('token'))) $this->redirectTo('/auth/login');

        $db = new \Model\Myaccount\Auth;
        if (!$db->getResetToken($this->data->token)) {
            $this->data->is_expired = true;
            $this->view = 'Myaccount/auth/forgot_password';
        } else {
            $this->view = 'Myaccount/auth/reset_password';
        }

        $this->fullPage = true;
        $this->renderView();
    }

    public function __postResetPassword()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        if (!($password = $this->postRequest('password'))) {
            $this->data->data = 'Invalid request, please using valid password to protect your account';
            $this->renderView();
        }

        $db = new \Model\Myaccount\Auth;
        if (!($token = $db->getResetToken($this->postRequest('token')))) {
            $this->data->data = 'Invalid request, password reset token is invalid or expired!';
            $this->renderView();
        }

        $browser = $this->getBrowser();
        $ip_address = $this->getIpAddress();
        $country = $this->getCountry();
        $user = $db->getUserById($token->user_id);
        $db->updateUserPassword($token->user_id, $this->createPassword($password));
        $db->removeResetToken($token->id);
        $db->logActivity($token->user_id, 'Account', 'Password had been changed from '.$browser.' ('.$country.')', $ip_address);

        (new \Module\Email)
            ->template('Email/myaccount/password_changed')
            ->sendData(['USER_NAME' => $user->name, 'IP_ADDRESS' => $ip_address, 'BROWSER' => $browser, 'COUNTRY' => $country, 'TIME' => date('Y-m-d H:i:s').' '.TIMEZONE])
            ->sendTo($user->email)
            ->send();

        $this->data->success = true;
        $this->data->data = '/';
        $this->renderView();
    }

    public function sso()
    {
        if(!($return = $this->getRequest('return'))) $this->redirectTo('/');
        $this->authRequired();
        $this->data->return_url = $return;
        $this->data->auth_sso = 'http://'.parse_url($return, PHP_URL_HOST).'/auth/sso';
        $this->data->login_token = $this->encryptCookie(session_id());
        $this->view = 'Myaccount/auth/sso';
        $this->renderView();
    }
}
