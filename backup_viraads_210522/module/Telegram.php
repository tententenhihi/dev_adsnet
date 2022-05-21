<?php

namespace Module;

class Telegram
{
    public $base_url = 'https://api.telegram.org/bot';
    public $bot_key = TELEGRAM_BOT_TOKEN;
    public $send_to = null;
    public $message = null;
    
    public function __construct($bot_key = TELEGRAM_BOT_TOKEN)
    {
        $this->bot_key = $bot_key;
    }
    
    public function message($message)
    {
        $this->message = $message;
        return $this;
    }
    
    public function sendTo($send_to)
    {
        $this->send_to = $send_to;
        return $this;
    }
    
    public function send()
    {
        $c = curl_init();
        curl_setopt_array($c, [
            CURLOPT_URL => $this->base_url.$this->bot_key.'/sendMessage',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode(['text' => $this->message, 'chat_id' => $this->send_to]),
            CURLOPT_HTTPHEADER => ['Content-Type: application/json', 'Accept: application/json']
        ]);
        
        $r = json_encode(curl_exec($c));
        curl_close($c);
        var_dump($r);
        return isset($r->success) && $r->success ? true : false;
    }
    
}
