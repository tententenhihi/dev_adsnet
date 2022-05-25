<?php

namespace Controller\Publisher;

class Controller
{
    public $method;
    public $uri;
    public $arg;
    public $statusCode = 200;
    public $data;
    public $title = 'Please change title';
    public $view = null;
    public $jsonResponse = false;
    public $fullPage = false;
    public $authRequired = true;
    public $csrfProtected = true;
    public $enable404 = true;

    public function __construct($uri)
    {
        $this->uri = $uri;
        $this->data = (object) ['success' => false, 'data' => null];
        $this->method = strtolower($_SERVER['REQUEST_METHOD']);
        $this->arg = $_SERVER['QUERY_STRING']?:'';
        if($this->arg) $this->arg = '?'.$this->arg;
        $this->init();
    }

    protected function init()
    {
        $this->checkMaintenance();
        $this->startSession();
        if($this->authRequired) $this->authRequired();
        if($this->csrfProtected) $this->csrfProtected();
        
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
    
    protected function csrfProtected()
    {
        if($this->method == 'post' && !$this->verifyCsrf($this->postRequest('csrf_token'))) {
            $this->jsonResponse = true;
            $this->data->success = false;
            $this->data->data = 'Bad request, please refresh this page and try again!';
            $this->renderView();
        }
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
            if ($this->method == 'get') {
                $this->fullPage = true;
                $this->view = 'Global/maintenance';
                $this->renderView();
            } else {
                $this->jsonResponse = true;
                $this->data->success = false;
                $this->data->data = 'The system is down for maintenance, please try again later';
                $this->renderView();
            }
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
    
    public function startSession()
    {
        if (session_status() == PHP_SESSION_NONE) {
            session_start([
                'cookie_lifetime' => SYSTEM_SESSION_TTL,
                'gc_maxlifetime' => SYSTEM_SESSION_TTL,
                'name' => SYSTEM_SESSION_NAME
            ]);
        }
        if($this->getSession('banned')) {
            $this->fullPage = true;
            $this->view = 'Global/banned';
            $this->renderView();
        }
    }
    
    public function getSession($key = null)
    {
        if ($key) {
            return isset($_SESSION[$key]) ? $_SESSION[$key] : null;
        }

        return (object) $_SESSION;
    }

    public function setSession($key, $val)
    {
        $_SESSION[$key] = $val;
    }
    
    public function removeSession($key)
    {
        unset($_SESSION[$key]);
    }
    
    public function encryptCookie($data)
    {
        $data = json_encode($data);
        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('AES-256-CTR'));
        $data = openssl_encrypt($data, 'AES-256-CTR', SYSTEM_TOKEN, 0, $iv);

        return $data.':'.base64_encode($iv);
    }

    public function decryptCookie($data)
    {
        $iv = explode(':', $data);
        $data = $iv[0];
        $iv = base64_decode($iv[1]);
        $data = @openssl_decrypt($data, 'AES-256-CTR', SYSTEM_TOKEN, 0, $iv);
        if (!$data) return null;

        return json_decode($data);
    }
    
    public function isLoginAsClient()
    {
        return !!$this->getSession('admin_login');
    }
    
    public function csrf()
    {
        return $this->getSession('csrf_token') ?: $this->createCsrf();
    }

    public function createCsrf()
    {
        $token = bin2hex(random_bytes(32));
        $this->setSession('csrf_token', $token);

        return $token;
    }

    public function verifyCsrf($token)
    {
        if (!$token || !($str = $this->getSession('csrf_token'))) {
            return false;
        }

        return hash_equals($str, $token);
    }
    
    protected function authRequired()
    {
        if (!$this->getSession('id')) {
            $return_url = rawurlencode(PUBLISHER_URL.getenv('REQUEST_URI'));
            $this->redirectTo(MYACCOUNT_URL.'/auth/sso?return='.$return_url);
        }
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
            if(!$this->fullPage) {
                if($_COOKIE["language"] === 'vn'){
                    $lang = 'vn';
                }else{
                    $lang = 'en';
                }
                include BASE_PATH.'/language/locale/'. $lang . '.php';
                include BASE_PATH.'/view/Publisher/header.tpl';
            }
            include BASE_PATH.'/view/'.$this->view.'.tpl';
            if(!$this->fullPage) {
                include BASE_PATH.'/view/Publisher/footer.tpl';
            }
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
    protected function asset2($path)
    {
        $path = ltrim($path, '/');
        if(!$path) return null;
        if (!($version = @filemtime(BASE_PATH.'/asset_v2/'.$path))) return null;

        return ASSET_URL.'/'.$path.'?v='.$version;
    }
}
