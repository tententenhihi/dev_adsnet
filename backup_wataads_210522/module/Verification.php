<?php

namespace Module;

class Verification
{
    public $domain = null;
    public $token = null;
    public $verify_name = 'vra-verification';

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
        $html = str_replace(['&quot;', '&#039;'],'"',$html);
        $html = str_replace('&lt;','<',$html);
        $html = str_replace('&gt;','>',$html);
        if(!$html) return false;
        $meta_tag = '<meta name="'.$this->verify_name.'" content="'.$this->token.'"';
//        $meta_tag1 = '<meta content="'.$this->token.'" name="'.$this->verify_name.'"';
//        var_dump(strpos($html, '<meta name="'.$this->verify_name.'" content="'.$this->token.'"'), strpos($html, '<meta content="'.$this->token.'" name="'.$this->verify_name.'"'));die();
        if(strpos($html, '<meta name="'.$this->verify_name.'" content="'.$this->token.'"')){
            return true;
        } elseif(strpos($html, '<meta content="'.$this->token.'" name="'.$this->verify_name.'"')){
            return true;
        }else{
            return false;
        }
//        if(strpos($html, $meta_tag)) return true;
//        return false;
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

    private function getHtml($url)
    {
        $htmlUrl = 'https://verify.wataads.com/verify.php?url='.$url;
        try {
            $html = @file_get_contents($htmlUrl);
            if(!$html) return null;
            return $html;
        } catch(\Exception $e) {
            return null;
        }
    }
}