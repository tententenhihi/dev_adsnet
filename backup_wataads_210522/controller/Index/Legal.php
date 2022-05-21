<?php

namespace Controller\Index;

class Legal extends Controller
{
    public function index()
    {
        $this->redirectTo('/legal/terms');
    }
    
    public function faqs()
    {
        $this->title = 'Frequently Asked Question - '.SITE_NAME;
        $this->view = 'Index/legal/faqs';
        $this->renderView();
    }
    
    public function terms()
    {
        $this->title = 'Term of Services - '.SITE_NAME;
        $this->view = 'Index/legal/terms';
        $this->renderView();
    }
    
    public function privacy()
    {
        $this->title = 'Privacy Policy - '.SITE_NAME;
        $this->view = 'Index/legal/privacy';
        $this->renderView();
    }
    
    public function cookie()
    {
        $this->title = 'Cookie Policy - '.SITE_NAME;
        $this->view = 'Index/legal/cookie';
        $this->renderView();
    }
    
    public function dmca()
    {
        $this->title = 'DMCA report - '.SITE_NAME;
        $this->view = 'Index/legal/dmca';
        $this->renderView();
    }
    
    public function agency()
    {
        $this->title = 'For Agency - '.SITE_NAME;
        $this->view = 'Index/legal/agency';
        $this->renderView();
    }
    
    public function adNetwork()
    {
        $this->title = 'For Ad Network - '.SITE_NAME;
        $this->view = 'Index/legal/ad_network';
        $this->renderView();
    }
    
    public function __postContact()
    {
        $this->jsonResponse = true;
        $this->data->success = false;

        $name = trim($this->postRequest('name'));
        $email = trim($this->postRequest('email'));
        $subject = trim($this->postRequest('subject'));
        $message = trim($this->postRequest('message'));
        $recaptcha = trim($this->postRequest('recaptcha'));
        if(!$subject || strlen($subject) < 3 || !$message || strlen($message) < 10 || strlen($email) < 6) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $post_data = http_build_query(
            array(
                'secret' => '6LcJqdcUAAAAAP_YQOdgieb1ebagz__wrf8sExIt',
                'response' => $recaptcha,
            )
        );
        $opts = array('http' =>
            array(
                'method'  => 'POST',
                'timeout' => 30,
                'header'  => 'Content-type: application/x-www-form-urlencoded',
                'content' => $post_data
            )
        );
        $context  = stream_context_create($opts);
        $response = @file_get_contents('https://www.google.com/recaptcha/api/siteverify', false, $context);
        $result = json_decode($response);
        
        if(!@$result->success) {
            $this->data->data = 'Could not verify google reCaptcha! refresh then try again please!';
            $this->renderView();
        }
        
        try {
            $m = new \Module\Email;
            $m->subject(SITE_NAME.' contact form: '.$name)->message('Subject: '.$subject.'<br>Message: '.$message.'<br>Email: '.$email)->sendTo(EMAIL_CONTACTUS)->send();
            $m->clear();
            $m->subject('Thank you for contacting us')->message('We received your message via contact form on '.SITE_NAME.', we will get back with you shortly<br><br>Best Regard,<br>'.SITE_NAME)->sendTo($email)->send();
        } catch(\Exception $e) {}
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postSubscribe()
    {
        $this->jsonResponse = true;
        $this->data->success = false;

        $email = trim($this->postRequest('email'));
        $recaptcha = trim($this->postRequest('recaptcha'));
        if(strlen($email) < 6) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $post_data = http_build_query(
            array(
                'secret' => '6LcJqdcUAAAAAP_YQOdgieb1ebagz__wrf8sExIt',
                'response' => $recaptcha,
            )
        );
        $opts = array('http' =>
            array(
                'method'  => 'POST',
                'timeout' => 30,
                'header'  => 'Content-type: application/x-www-form-urlencoded',
                'content' => $post_data
            )
        );
        $context  = stream_context_create($opts);
        $response = @file_get_contents('https://www.google.com/recaptcha/api/siteverify', false, $context);
        $result = json_decode($response);
        
        if(!@$result->success) {
            $this->data->data = 'Could not verify google reCaptcha! refresh then try again please!';
            $this->renderView();
        }
        
        try {
            $m = new \Module\Email;
            $m->subject('Thank You For Subscribing')->message('You have just subscribed '.SITE_NAME.' Newsletter, you will be the first to know about our latest news and Special Offers. Stay tuned<br><br>Best Regard,<br>'.SITE_NAME)->sendTo($email)->send();
        } catch(\Exception $e) {}
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postAgency()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if (!$data) {
            $this->data->data = 'Bad request!';
            $this->renderView();
        }
        
        $db = new \Model\Index\Legal;
        try {
            $this->data->data = $db->storeEmailAgency($data->name, $data->personal_email, $data->work_email, $data->contact, $data->message);
        } catch (\Exception $e) {
            $this->data->data = 'Bad request!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postAdNetwork()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if (!$data) {
            $this->data->data = 'Bad request!';
            $this->renderView();
        }
        
        $db = new \Model\Index\Legal;
        try {
            $this->data->data = $db->storeEmailAdNetwork($data->name, $data->email, $data->phone, $data->subscriber, $data->message);
        } catch (\Exception $e) {
            $this->data->data = 'Bad request!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
}
