<?php

namespace Controller\Api;

class Controller
{
    public $method;
    public $uri;
    public $statusCode = 200;
    public $data;
    public $title = 'Please change title';
    public $view = null;
    public $jsonResponse = true;

    public function __construct($uri)
    {
        $this->uri = $uri;
        $this->data = (object) ['statusCode' => 200, 'success' => false, 'data' => null];
        $this->method = strtolower($_SERVER['REQUEST_METHOD']);
        $this->init();
    }

    protected function init()
    {
        $this->checkMaintenance();
        $ctrl = $this->parseCtrl($this->uri[1]);
        if(!$ctrl) return $this->notFound();
        
        $f = lcfirst($ctrl);
        $mf = '__'.$this->method.$ctrl;

        if (is_callable([$this, $mf])) return $this->$mf();
        if (is_callable([$this, $f])) return $this->$f();
        return $this->notFound();
    }

    protected function parseCtrl($str)
    {
        if (!$str || strlen($str) > 50) return null;
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $str)));
    }
    
    protected function notFound()
    {
        $this->jsonResponse = true;
        $this->data->data = 'Error!!! 404 not found';
        $this->renderView();
    }
    
    protected function checkReadOnly()
    {
        if(MAINTENANCE_READONLY) {
            $this->jsonResponse = true;
            $this->data->success = false;
            $this->data->data = 'The system is ReadOnly enabled, could not make any update now!';
            $this->renderView();
        }
    }
    
    protected function checkMaintenance($str = 'MAINTENANCE')
    {
        if(constant($str)) {
            $this->jsonResponse = true;
            $this->data->success = false;
            $this->data->data = 'The system is down for maintenance, please try again later';
            $this->renderView();
        }
    }
    
    protected function request($key = null)
    {
        if ($key) {
            return isset($_REQUEST[$key]) ? $_REQUEST[$key] : null;
        }

        return (object) $_REQUEST;
    }

    protected function getRequest($key = null)
    {
        if ($key) {
            return isset($_GET[$key]) ? $_GET[$key] : null;
        }

        return (object) $_GET;
    }

    protected function postRequest($key = null)
    {
        if ($key) {
            return isset($_POST[$key]) ? $_POST[$key] : null;
        }

        return (object) $_POST;
    }
    
    protected function getIpAddress()
    {
        return isset($_SERVER['HTTP_CF_CONNECTING_IP']) ? $_SERVER['HTTP_CF_CONNECTING_IP'] : $_SERVER['REMOTE_ADDR'];
    }
    
    protected function getBrowser()
    {
        $info = get_browser();
        return $info->browser.'/'.$info->platform;
    }
    
    protected function getCountry()
    {
        if(isset($_SERVER['HTTP_CF_IPCOUNTRY'])) return strtoupper($_SERVER['HTTP_CF_IPCOUNTRY']);
        
        try {
            return (new \GeoIp2\Database\Reader(BASE_PATH.'/system/GeoLite2-Country.mmdb'))->country($this->getIpAddress())->country->isoCode;
        } catch(\Exception $e) {
            return 'XX';
        }
    }

    protected function renderView()
    {
        http_response_code($this->statusCode);
        if ($this->jsonResponse) {
            header('Content-Type: application/json');
            echo json_encode($this->data, JSON_PRETTY_PRINT);
        } else {
            include BASE_PATH.'/view/'.$this->view.'.tpl';
        }
        exit;
    }

    protected function redirectTo($url, $code = 302)
    {
        header("Location: $url", true, $code);
        exit;
    }
    
    protected function asset($path)
    {
        $path = ltrim($path, '/');
        if(!$path) return null;
        if (!($version = @filemtime(BASE_PATH.'/asset/'.$path))) return null;

        return ASSET_URL.'/'.$path.'?v='.$version;
    }
}
