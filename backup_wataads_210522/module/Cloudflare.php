<?php

namespace Module;

class Cloudflare
{
    private $email = '';
    private $apiKey = '';
    private $baseUrl = 'https://api.cloudflare.com/client/v4/zones/';
    private $opts;
    public $nsFirstServer = 'alexa.ns.cloudflare.com';
    public $nsSecondServer = 'trey.ns.cloudflare.com';
    public $cnameDomain = 'd.viranet.work';
    public $assetDomain = 'cdn.viranet.work';
    public $baseZoneId = '1e746f83f1e378d5aae8b118e49ca95f';
    
    public function __construct($email = null, $apiKey = null)
    {
        if($email) $this->email = $email;
        if($apiKey) $this->apiKey = $apiKey;
        $this->opts = [
            'http' => [
                'method' => 'POST',
                'header' => "X-Auth-Email: ".$this->email."\r\nX-Auth-Key: ".$this->apiKey."\r\nContent-Type: application/json\r\n",
                'content' => null,
                'timeout' => 60,
                'ignore_errors' => true
            ],
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false
            ]
        ];
    }
    
    public function __call($method, $arguments)
    {
        $path = isset($arguments[0]) && $arguments[0] ? $arguments[0] : '';
        $data = isset($arguments[1]) && $arguments[1] ? $arguments[1] : [];
        $header = isset($arguments[2]) ? $arguments[2] : [];
        $result = (object) ['success' => false, 'data' => null, 'info' => null];
        
        $this->opts['http']['method'] = strtoupper($method);
        if($data) $this->opts['http']['content'] = json_encode($data);
        if($header) foreach($header as $key => $value) {
            $this->opts['http']['header'] .= $key.": ".$value."\r\n";
        }
        
        try {
		    $res = @file_get_contents(trim($this->baseUrl.$path, '/'), false, stream_context_create($this->opts));
		    $res = json_decode($res);
		    if(!$res || !isset($res->success)) {
		        $result->data = 'API server return unexpected response!';
		        return $result;
		    }
		} catch(\Exception $e) {
		    $result->data = 'Could not connect to API server';
		    return $result;
		}
		
		$result->success = $res->success;
		$result->data = $result->success ? $res->result : $res->errors[0]->message;
		$result->info = isset($res->result_info) ? $res->result_info : null;
		return $result;
    }
}