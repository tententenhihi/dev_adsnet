<?php

namespace Module;

class Email
{
    private $smtp = null;
    public $subject = null;
    public $message = null;
    public $data = [];
    public $template = null;
    
    public function __construct($user = EMAIL_DEFAULT_USER, $pass = EMAIL_DEFAULT_USER_PW, $name = EMAIL_DEFAULT_USER_NAME)
    {
        $this->smtp = new \PHPMailer\PHPMailer\PHPMailer(true);
        $this->smtp->isSMTP();
        $this->smtp->Host = EMAIL_SERVER_HOST;
        $this->smtp->Port = EMAIL_SERVER_PORT;
        $this->smtp->SMTPAuth = true;
        $this->smtp->CharSet = 'UTF-8';
        $this->smtp->Username = $user;
        $this->smtp->Password = $pass;
        $this->smtp->SMTPSecure = 'tls';
        $this->smtp->setFrom($user, $name);
        $this->smtp->addReplyTo($user);
        $this->smtp->isHTML(true);
        $this->smtp->SMTPOptions = ['ssl' => ['verify_peer' => false, 'verify_peer_name' => false, 'allow_self_signed' => true]];
    }
    
    public function subject($subject)
    {
        $this->subject = $subject;
        return $this;
    }
    
    public function message($message)
    {
        $this->message = $message;
        return $this;
    }
    
    public function template($template)
    {
        $this->template = $template;
        return $this;
    }
    
    public function replyTo($email)
    {
        $this->smtp->clearReplyTos();
        $this->smtp->addReplyTo($email);
        return $this;
    }

    public function sendTo($emails)
    {
        if(!$this->smtp) {
            $this->sendFrom();
        }
        if (is_array($emails)) {
            foreach($emails as $email) {
                $this->smtp->addAddress($email);
            }
        } else {
            $this->smtp->addAddress($emails);
        }
        return $this;
    }

    public function sendData($data = [])
    {
        $this->data = $data;
        return $this;
    }

    public function send()
    {
        if (!$this->message && !$this->template) {
            return false;
        }
        if(!$this->smtp) {
            return false;
        }
        if (!$this->message) {
            $this->message = $this->buildContent();
        }
        
        try {
            $this->smtp->Subject = $this->subject;
            $this->smtp->Body = $this->message;
            $this->smtp->send();
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
    
    public function clear()
    {
        $this->smtp = null;
        $this->subject = null;
        $this->message = null;
        $this->data = [];
        $this->template = null;
        return $this;
    }

    private function buildContent()
    {
        $content = file_get_contents(BASE_PATH.'/view/'.$this->template.'.tpl');

        if (!isset($this->data['USER_NAME'])) {
            $this->data['USER_NAME'] = 'You';
        }
        foreach ($this->data as $key => $value) {
            $content = str_replace('{{'.$key.'}}', $value, $content);
        }

        $content = str_replace('{{FRONTEND_URL}}', FRONTEND_URL, $content);
        $content = str_replace('{{API_URL}}', API_URL, $content);
        $content = str_replace('{{MYACCOUNT_URL}}', MYACCOUNT_URL, $content);
        $content = str_replace('{{PUBLISHER_URL}}', PUBLISHER_URL, $content);
        $content = str_replace('{{ADVERTISER_URL}}', ADVERTISER_URL, $content);
        $content = str_replace('{{SITE_NAME}}', SITE_NAME, $content);

        $data = $this->data ? $this->data : [];
        $data['template'] = $this->template;
        $content = str_replace('{{VIEW_ON_BROWSER}}', FRONTEND_URL.'/email/'.$this->opensslEncode($data), $content);

        if (!$this->subject) {
            $subject = explode('<title>', $content);
            $subject = explode('</title>', $subject[1]);
            $subject = $subject[0];
            $this->subject = trim($subject);
        }

        return $content;
    }

    private function base64urlEncode($data)
    {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }

    private function opensslEncode($data)
    {
        $data = json_encode($data);
        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('AES-256-CTR'));
        $data = openssl_encrypt($data, 'AES-256-CTR', SYSTEM_TOKEN, 0, $iv);

        $data = $data.':'.base64_encode($iv);

        return $this->base64urlEncode($data);
    }
}
