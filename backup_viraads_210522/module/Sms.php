<?php

namespace Module;

class Sms
{
    public $base_url = 'https://api.sms.to';
    public $api_key = SMS_APIKEY;
    public $number_to = null;
    public $message = null;
    
    public function __construct($api_key = SMS_APIKEY)
    {
        $this->api_key = $api_key;
    }
    
    public function message($message)
    {
        $this->message = $message;
        return $this;
    }
    
    public function sendTo($number_to)
    {
        $this->number_to = $this->validPhoneNumber($number_to);
        return $this;
    }
    
    public function send()
    {
        $c = curl_init();
        curl_setopt_array($c, [
            CURLOPT_URL => $this->base_url.'/sms/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode(['message' => $this->message, 'to' => $this->number_to, 'sender_id' => SMS_SENDER]),
            CURLOPT_HTTPHEADER => ['Content-Type: application/json', 'Accept: application/json', 'Authorization: Bearer '.$this->api_key]
        ]);
        
        $r = json_encode(curl_exec($c));
        curl_close($c);
        var_dump($r);
        return isset($r->success) && $r->success ? true : false;
    }
    
    private function validPhoneNumber($number)
    {
        return preg_replace("/[^0-9+]/", "", $number);
    }
}
