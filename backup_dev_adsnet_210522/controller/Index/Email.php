<?php

namespace Controller\Index;

class Email extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        if (!($hash = $this->uri[1]) || !($data = $this->opensslDecode($hash))) {
            exit;
        }

        $content = file_get_contents(BASE_PATH.'/view/'.$data->template.'.tpl');
        foreach ($data as $key => $value) {
            $content = str_replace('{{'.$key.'}}', $value, $content);
        }

        $content = str_replace('{{FRONTEND_URL}}', FRONTEND_URL, $content);
        $content = str_replace('{{API_URL}}', API_URL, $content);
        $content = str_replace('{{ASSET_URL}}', ASSET_URL, $content);
        $content = str_replace('{{MYACCOUNT_URL}}', MYACCOUNT_URL, $content);
        $content = str_replace('{{PUBLISHER_URL}}', PUBLISHER_URL, $content);
        $content = str_replace('{{ADVERTISER_URL}}', ADVERTISER_URL, $content);
        $content = str_replace('{{SITE_NAME}}', SITE_NAME, $content);
        $content = str_replace('{{VIEW_ON_BROWSER}}', '#', $content);

        echo $content;
        exit;
    }
    
    private function base64urlDecode($data)
    {
        return base64_decode(strtr($data, '-_', '+/'));
    }

    private function opensslDecode($data)
    {
        $data = $this->base64urlDecode($data);
        if (!$data || !strpos($data, ':')) {
            return null;
        }
        $iv = explode(':', $data);
        $data = $iv[0];
        $iv = base64_decode($iv[1]);
        $data = @openssl_decrypt($data, 'AES-256-CTR', SYSTEM_TOKEN, 0, $iv);
        if (!$data) {
            return null;
        }

        return json_decode($data);
    }
}
