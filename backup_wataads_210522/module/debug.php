#!/usr/bin/php
<?php

//namespace Module;

class Verification
{
    public $domain = null;
    public $token = null;
    public $verify_name = 'taverify';
    
    public function setDomain($domain)
    {
        $this->domain = $domain;
        return $this;
    }
    
    public function setToken($token)
    {
        $this->token = $token;
        return $this;
    }
    
    public function verify()
    {
        if(!$this->domain || !$this->token) return false;
        if($this->verifyByFile()) return true;
        if($this->verifyByMeta()) return true;
        if($this->verifyByDns()) return true;
        return false;
    }
    
    private function verifyByFile()
    {
        $url = 'https://'.$this->domain.'/'.$this->token.'.txt';
        $html = $this->getHtml($url);
        if(!$html) return false;
        if(trim($html) == $this->token) return true;
        return false;
    }
    
    private function verifyByMeta()
    {
        $url = 'https://'.$this->domain.'/';
        $html = $this->getHtml($url);
        if(!$html) return false;
        $meta_tag = '<meta name="'.$this->verify_name.'" content="'.$this->token.'"';
        if(strpos($html, $meta_tag)) return true;
        return false;
    }
    
    private function verifyByDns()
    {
        $records = dns_get_record($this->verify_name.'.'.$this->domain, DNS_TXT);
        if(!$records) return false;
        
        foreach($records as $item) {
            $txt = $item['txt'] ?? $item->txt;
            if($txt == $this->token) return true;
        }
        return false;
    }
    
    public function getHtml($url)
    {
        $opts = [
            'http' => [
                'method' => 'POST',
                'header' => "TA-Target-Url: ".$url."\r\n",
                'timeout' => 60,
                'ignore_errors' => true
            ],
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false
            ]
        ];
        $htmlUrl = 'http://172.96.161.224/html';
        try {
		    $html = @file_get_contents($htmlUrl, false, stream_context_create($opts));
            echo($html);
		    if(!$html) return null;
		    return @gzdecode($html);
		} catch(\Exception $e) {
            var_dump($e);
		    return null;
		}
    }

    
}

$v = new Verification;
$html = $v->getHtml('https://tintuc.viranet.work');
echo($html);