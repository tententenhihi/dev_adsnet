<?php

namespace Controller\Index;

class Controller
{
    public $method;
    public $uri;
    public $statusCode = 200;
    public $data;
    public $title = 'Please change title';
    public $view = null;
    public $jsonResponse = false;
    public $fullPage = true;
    public $enable404 = true;
    public $htmlCache = false;

    public function __construct($uri)
    {
        $this->uri = $uri;
        $this->data = (object) ['success' => false, 'data' => null];
        $this->method = strtolower($_SERVER['REQUEST_METHOD']);
        $this->init();
    }

    protected function init()
    {
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
        if(!$this->enable404 || !SYSTEM_PAGE_404) return $this->index();
        if ($this->method == 'get') {
            $this->fullPage = true;
            $this->view = 'Global/404';
            $this->renderView();
        } else {
            $this->jsonResponse = true;
            $this->data->data = 'Error!!! 404 not found';
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
            ob_start();
            if(!$this->fullPage) {
                include BASE_PATH.'/view/Index/blog/header.tpl';
            }
            include BASE_PATH.'/view/'.$this->view.'.tpl';
            if(!$this->fullPage) {
                include BASE_PATH.'/view/Index/blog/footer.tpl';
            }
            if ($this->htmlCache && HTML_CACHE) {
                $this->saveHTMLCache(ob_get_contents());
            }
            ob_end_flush();
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
    
    private function saveHTMLCache($html)
    {
        $uri = trim(implode('/', $this->uri), '/');
        $cachepath = BASE_PATH.'/public/__cache/'.$uri.'/index.html';
        $cachepath = str_replace('/home/index/', '/', $cachepath);
        $cachepath = str_replace('/index/', '/', $cachepath);
        if (is_file($cachepath)) return true;
        if (strlen($cachepath) > 254) return false;
        if (!is_dir(($dir = dirname($cachepath)))) @mkdir($dir, 0777, true);

        $html .= PHP_EOL.'<!-- cached at '.date('Y-m-d H:i:s').' -->';

        return @file_put_contents($cachepath, $html);
    }
}
