<?php

namespace Controller\Admin\superAdmin;

class User extends Controller
{
    public $chats = ['Telegram', 'Skype', 'Facebook', 'Whatsapp', 'Viber', 'Line', 'Other'];
    public $languages = ['en' => 'English'];
    public $statuses = ['All', 'Active', 'Inactive', 'Banned'];
    public $services = ['Global', 'Publisher', 'Advertiser'];
    public $notificationTypes = ['success', 'info', 'warning', 'danger'];
    
    public function index()
    {
        /* single user */
        $user_id = (int) $this->getRequest('id');
        if($user_id) {
            $this->data->status = 'All';
            $this->data->key = $user_id;
            $this->data->pagination = '';
            $db = new \Model\Admin\superAdmin\User;
            $user = $db->getUserFull($user_id);
            if(!$user) {
                $this->data->total = 0;
                $this->data->data = [];
            } else {
                $this->helper = new \Module\Helper;
                $this->data->total = 1;
                $this->data->data = [$user];
            }
                
            $this->title = 'User ID #'.$user_id.' - '.SITE_NAME;
            $this->view = 'Admin/superAdmin/user/list';
            $this->renderView();
        }
        
        /* list users by status */
        $status = $this->uri[1] ? ucwords($this->uri[1]) : null;
        if(in_array($status, $this->statuses)) {
            return $this->status($status);
        }
        
        /* Users overview */
        return $this->overview();
    }
    
    public function overview()
    {
        $db = new \Model\Admin\superAdmin\User;
        $this->helper = new \Module\Helper;
        
        /* summary users */
        $users = $db->countUserGroupByStatus();
        $this->data = (object) ['All' => 0, 'Active' => 0, 'Inactive' => 0, 'Banned' => 0];
        foreach($users as $item) {
            $this->data->{$item->status} = $item->cnt;
            $this->data->All += $item->cnt;
        }
        
        /* get last 180 days stats */
        $created_at = (new \DateTime('180 days ago'))->format('Y-m-d');
        $data = $db->listLastUser($created_at);
        $this->buildUserData($data);
        
        /* get last year session */
        $created_at = (new \DateTime('-1 years'))->format('Y-m-d');
        $today = (new \DateTime('now'))->format('Y-m-d');
        $this->data->listSessionRegion = $db->listSessionByRegion($today);
        $listSessionDevice = $db->listSessionByDevice($created_at);
        $this->buildSessionData($listSessionDevice);
       
        $this->title = 'Users Overview - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/user/index';
        $this->renderView();
    }
    
    private function buildSessionData($data)
    {
        /* default data */
        $this->data->sessionDeviceToday = ['pc' => 0, 'mobile' => 0, 'tablet'=> 0, 'total'=> 0];
        $this->data->sessionDeviceLast7day = ['pc' => 0, 'mobile' => 0, 'tablet'=> 0, 'total'=> 0];
        $this->data->sessionDeviceLast14day = ['pc' => 0, 'mobile' => 0, 'tablet'=> 0, 'total'=> 0];
        $this->data->sessionDeviceLast30day = ['pc' => 0, 'mobile' => 0, 'tablet'=> 0, 'total'=> 0];
        $this->data->sessionDeviceLastyear = ['pc' => 0, 'mobile' => 0, 'tablet'=> 0, 'total'=> 0];
        
        $this->data->compareSessionDevice7day = ['percent' => 0, 'total'=> 0];
        // if(!$data) return true;
        
        /* prepare datetime to compare */
        $today = (new \DateTime('now'))->format('Y-m-d');
        $last7d = (new \DateTime('7 days ago'))->format('Y-m-d');
        $last14d = (new \DateTime('14 days ago'))->format('Y-m-d');
        $last30d = (new \DateTime('30 days ago'))->format('Y-m-d');
        $lastyear = (new \DateTime('-1 years'))->format('Y-m-d');
        
        /* loop data */
        foreach($data as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            
            /* today */
            if($today <= $date) {
                if(str_contains($item->browser, 'Mac') || str_contains($item->browser, 'Win')){
                    $this->data->sessionDeviceToday['pc'] += 1 ;
                }else if(str_contains($item->browser, 'iOS') || str_contains($item->browser, 'Android') || str_contains($item->browser, 'Mobile')){
                    $this->data->sessionDeviceToday['mobile'] += 1 ;
                }else {
                    $this->data->sessionDeviceToday['tablet'] += 1 ;
                }
                $this->data->sessionDeviceToday['total'] += 1 ;
            }
            
            /* last 7day */
            if($last7d <= $date) {
                if(str_contains($item->browser, 'Mac') || str_contains($item->browser, 'Win')){
                    $this->data->sessionDeviceLast7day['pc'] += 1 ;
                }else if(str_contains($item->browser, 'iOS') || str_contains($item->browser, 'Android') || str_contains($item->browser, 'Mobile')){
                    $this->data->sessionDeviceLast7day['mobile'] += 1 ;
                }else {
                    $this->data->sessionDeviceLast7day['tablet'] += 1 ;
                }
                $this->data->sessionDeviceLast7day['total'] += 1 ;
            }
            
            /* last 14day */
            if($last14d <= $date) {
                if(str_contains($item->browser, 'Mac') || str_contains($item->browser, 'Win')){
                    $this->data->sessionDeviceLast14day['pc'] += 1 ;
                }else if(str_contains($item->browser, 'iOS') || str_contains($item->browser, 'Android') || str_contains($item->browser, 'Mobile')){
                    $this->data->sessionDeviceLast14day['mobile'] += 1 ;
                }else {
                    $this->data->sessionDeviceLast14day['tablet'] += 1 ;
                }
                $this->data->sessionDeviceLast14day['total'] += 1 ;
            }
            
            /* last 30day */
            if($last30d <= $date) {
                if(str_contains($item->browser, 'Mac') || str_contains($item->browser, 'Win')){
                    $this->data->sessionDeviceLast30day['pc'] += 1 ;
                }else if(str_contains($item->browser, 'iOS') || str_contains($item->browser, 'Android') || str_contains($item->browser, 'Mobile')){
                    $this->data->sessionDeviceLast30day['mobile'] += 1 ;
                }else {
                    $this->data->sessionDeviceLast30day['tablet'] += 1 ;
                }
                $this->data->sessionDeviceLast30day['total'] += 1 ;
            }
            
            
            
            /* last year */
            if($lastyear <= $date) {
                if(str_contains($item->browser, 'Mac') || str_contains($item->browser, 'Win')){
                    $this->data->sessionDeviceLastyear['pc'] += 1 ;
                }else if(str_contains($item->browser, 'iOS') || str_contains($item->browser, 'Android') || str_contains($item->browser, 'Mobile')){
                    $this->data->sessionDeviceLastyear['mobile'] += 1 ;
                }else {
                    $this->data->sessionDeviceLastyear['tablet'] += 1 ;
                }
                $this->data->sessionDeviceLastyear['total'] += 1 ;
            }
        }
        
        /* compare data */
        
        if($this->data->sessionDeviceLast14day['total']) {
            if($this->data->sessionDeviceLast14day['total'] - $this->data->sessionDeviceLast7day['total']>0){
                $this->data->compareSessionDevice7day['total'] = $this->data->sessionDeviceLast7day['total'] - ($this->data->sessionDeviceLast14day['total'] - $this->data->sessionDeviceLast7day['total']);
                $this->data->compareSessionDevice7day['percent'] = round(($this->data->sessionDeviceLast7day['total'] - ($this->data->sessionDeviceLast14day['total'] - $this->data->sessionDeviceLast7day['total']))/($this->data->sessionDeviceLast14day['total'] - $this->data->sessionDeviceLast7day['total']), 4)*100;
            }else{
                $this->data->compareSessionDevice7day['total'] = 0;
                $this->data->compareSessionDevice7day['percent'] = 0;
            }
        }
        
        return true;
    }
    
    private function buildUserData($data)
    {
        /* default data */
        $today = (new \DateTime('now'))->format('Y-m-d');
        $this->data->last7day = ['active' => 0, 'inactive' => 0, 'total'=> 0];
        $this->data->last14day = ['active' => 0, 'inactive' => 0, 'total'=> 0];
        $this->data->last30day = ['active' => 0, 'inactive' => 0, 'total'=> 0];
        $this->data->last60day = ['active' => 0, 'inactive' => 0, 'total'=> 0];
        $this->data->last90day = ['active' => 0, 'inactive' => 0, 'total'=> 0];
        $this->data->last180day = ['active' => 0, 'inactive' => 0, 'total'=> 0];
        $this->data->compare7day = ['percent' => 0, 'total'=> 0];
        $this->data->compare30day = ['percent' => 0, 'total'=> 0];
        $this->data->compare90day = ['percent' => 0, 'total'=> 0];
        $this->data->last7day_stats = [$today => ['active' => 0, 'inactive' => 0, 'total'=> 0]];
        $this->data->country = ['XX' => ['active' => 0, 'inactive' => 0, 'total'=> 0]];
        // if(!$data) return true;
        
        /* prepare datetime to compare */
        
        $last7d = (new \DateTime('7 days ago'))->format('Y-m-d');
        $last14d = (new \DateTime('14 days ago'))->format('Y-m-d');
        $last30d = (new \DateTime('30 days ago'))->format('Y-m-d');
        $last60d = (new \DateTime('60 days ago'))->format('Y-m-d');
        $last90d = (new \DateTime('90 days ago'))->format('Y-m-d');
        $last180d = (new \DateTime('180 days ago'))->format('Y-m-d');
        
        /* loop data */
        foreach($data as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            
            /* last 7day */
            if($last7d <= $date) {
                /* 7 days stats */
                if(!isset($this->data->last7day_stats[$date])) {
                    $this->data->last7day_stats[$date] = ['active' => 0, 'inactive' => 0, 'total' => 0];
                }
                
                
                if($item->status == 'Active'){
                    $this->data->last7day['active'] += 1;
                    $this->data->last7day_stats[$date]['active'] += 1;
                    
                }else if($item->status == 'Inactive'){
                    $this->data->last7day['inactive'] += 1;
                    $this->data->last7day_stats[$date]['inactive'] += 1;
                    
                }
                $this->data->last7day['total'] += 1;
                $this->data->last7day_stats[$date]['total'] += 1;
                
            }
            
            /* last 14day */
            if($last14d <= $date) {
                if($item->status == 'Active'){
                    $this->data->last14day['active'] += 1;
                }else if($item->status == 'Inactive'){
                    $this->data->last14day['inactive'] += 1;
                }
                $this->data->last14day['total'] += 1;
            }
            
            /* last 30day */
            if($last30d <= $date) {
                if($item->status == 'Active'){
                    $this->data->last30day['active'] += 1;
                }else if($item->status == 'Inactive'){
                    $this->data->last30day['inactive'] += 1;
                }
                $this->data->last30day['total'] += 1;
            }
            
            /* last 60day */
            if($last60d <= $date) {
                if($item->status == 'Active'){
                    $this->data->last60day['active'] += 1;
                }else if($item->status == 'Inactive'){
                    $this->data->last60day['inactive'] += 1;
                }
                $this->data->last60day['total'] += 1;
            }
            
            /* last 90day */
            if($last90d <= $date) {
                if($item->status == 'Active'){
                    $this->data->last90day['active'] += 1;
                }else if($item->status == 'Inactive'){
                    $this->data->last90day['inactive'] += 1;
                }
                $this->data->last90day['total'] += 1;
            }
            
            /* last 180day */
            if($last180d <= $date) {
                /* country */
                if(!isset($this->data->country[$item->country])) {
                    $this->data->country[$item->country] = ['active' => 0, 'inactive' => 0, 'total' => 0];
                }
                if($item->status == 'Active'){
                    $this->data->last180day['active'] += 1;
                    $this->data->country[$item->country]['active'] += 1;
                }else if($item->status == 'Inactive'){
                    $this->data->last180day['inactive'] += 1;
                    $this->data->country[$item->country]['inactive'] += 1;
                }
                $this->data->last180day['total'] += 1;
                $this->data->country[$item->country]['total'] += 1;
            }
        }
        
        /* compare data */
        if($this->data->last14day['total']) {
            
            if($this->data->last14day['total'] - $this->data->last7day['total']>0){
                $this->data->compare7day['total'] = $this->data->last7day['total'] - ($this->data->last14day['total'] - $this->data->last7day['total']);
                $this->data->compare7day['percent'] = round(($this->data->last7day['total'] - ($this->data->last14day['total'] - $this->data->last7day['total']))/($this->data->last14day['total'] - $this->data->last7day['total']), 4)*100;
            }else{
                $this->data->compare7day['total'] = 0;
                $this->data->compare7day['percent'] = 0;
            }
        }
        if($this->data->last60day['total']) {
            if($this->data->last60day['total'] - $this->data->last30day['total']>0){
                $this->data->compare30day['total'] = $this->data->last30day['total'] - ($this->data->last60day['total'] - $this->data->last30day['total']);
                $this->data->compare30day['percent'] = round(($this->data->last30day['total'] - ($this->data->last60day['total'] - $this->data->last30day['total']))/($this->data->last60day['total'] - $this->data->last30day['total']), 4)*100;
            }else{
                $this->data->compare30day['total'] = 0;
                $this->data->compare30day['percent'] = 0;
            }
        }
        if($this->data->last180day['total']) {
            if($this->data->last180day['total'] - $this->data->last90day['total']>0){
                $this->data->compare90day['total'] = $this->data->last90day['total'] - ($this->data->last180day['total'] - $this->data->last90day['total']);
                $this->data->compare90day['percent'] = round(($this->data->last90day['total'] - ($this->data->last180day['total'] - $this->data->last90day['total']))/($this->data->last180day['total'] - $this->data->last90day['total']), 4)*100;
            }else{
                $this->data->compare90day['total'] = 0;
                $this->data->compare90day['percent'] = 0;
            }
        }
        
        $today = new \DateTime('now');
        $last7d = new \DateTime('7 days ago');
        /* fill hole last 7d */
        for($i = $today; $i >= $last7d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last7day_stats[$date])) {
                $this->data->last7day_stats[$date] = ['active' => 0, 'inactive' => 0, 'total' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->last7day_stats);
        
        return true;
    }
    
    public function __postListSessionByRegion()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $id = $this->uri[2];
        $db = new \Model\Admin\superAdmin\User;
        if($id=='today'){
            $day = (new \DateTime('now'))->format('Y-m-d');
        }else if($id=='lastWeek'){
            $day = (new \DateTime('7 days ago'))->format('Y-m-d');
        }else if($id=='lastMonth'){
            $day = (new \DateTime('30 days ago'))->format('Y-m-d');
        }else if($id=='lastYear'){
            $day = (new \DateTime('-1 years'))->format('Y-m-d');
        }
        $this->data->success = true;
        $this->data->data = $db->listSessionByRegion($day);
        $this->renderView();
    }
    
    public function status($status)
    {
        $db = new \Model\Admin\superAdmin\User;
        $this->helper = new \Module\Helper;
        $this->data->key = $this->getRequest('q');
        $this->data->status = $status;
        
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countUser();
            } else {
                $this->data->total = $db->countUserBySearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countUserByStatus($this->data->status);
            } else {
                $this->data->total = $db->countUserByStatusAndSearch($this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listUser($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listUserBySearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listUserByStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listUserByStatusAndSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->title = ucwords($this->data->status).' Users - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/user/list';
        $this->renderView();
    }
    
    public function __postTicket()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->user_id) || !isset($data->service) || !isset($data->subject) || !isset($data->message)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($data->user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$data->user_id.' does not exist!';
            $this->renderView();
        }
        
        try {
            $ticket_id = $db->createTicket($user->id, $data->service, $data->subject, 'Replied');
            $db->createMessage($ticket_id, $data->message);
        } catch(\Exception $e) {
            $this->data->data = 'Something was wrong!';
            $this->renderView();
        }
        
        if(isset($data->send_email) && $data->send_email) {
            $data->message .= PHP_EOL.PHP_EOL.'#######################'.PHP_EOL.'Do not reply this email, go here instead: '.MYACCOUNT_URL.'/support/ticket/'.$ticket_id;
            (new \Module\Email)
                ->subject('[Ticket #'.$ticket_id.'] '.$data->subject)
                ->message(nl2br($data->message))
                ->sendTo($user->email)
                ->send();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postSms()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $user_id = (int) $this->postRequest('user_id');
        $message = $this->postRequest('message');
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id '.$user_id.' does not exist!';
            $this->renderView();
        }
        if(!$user->phone) {
            $this->data->data = 'User id '.$user_id.' does not have valid phone number!';
            $this->renderView();
        }
        
        (new \Module\Sms)->message($message)->sendTo($user->phone)->send();
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postEmail()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->user_id) || !isset($data->subject) || !isset($data->message)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($data->user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$data->user_id.' does not exist!';
            $this->renderView();
        }
        
        (new \Module\Email)
            ->subject($data->subject)
            ->message(nl2br($data->message))
            ->sendTo($user->email)
            ->send();
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postNotification()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->user_id) || !isset($data->type) || !isset($data->service) || !isset($data->title) || !isset($data->description)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        try {
            $db->createNotification($data->user_id, $data->type, $data->service, $data->title, $data->description);
        } catch(\Exception $e) {
            $this->data->data = 'Something was wrong!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postLogin()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        $return_url = $this->postRequest('return_url');
        if(!$user_id || !$return_url) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        
        $admin_login = $this->getSession();
        if($admin_login->id == $user->id) {
            $this->data->data = 'Could not login as yourself!';
            $this->renderView();
        }
        
        $admin_login->return_url = $return_url;
        $user->admin_login = $admin_login;
        $this->setAuthenticated($user);
        
        $this->data->data = MYACCOUNT_URL;
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postBan()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        $ban_reason = $this->postRequest('reason');
        if(!$user_id || !$ban_reason) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        if(!$db->updateUserStatus($user_id, 'Banned', $ban_reason)) {
            $this->data->data = 'Something was wrong!';
            $this->renderView();
        }
        
        $sessions = $db->listUserActiveSession($user_id);
        if($sessions) {
            $db->stopUserActiveSession($user_id);
            $redis = new \System\Session;
            foreach($sessions as $session) $redis->deleteSession($session->session_id);
        }
        
        (new \Module\Email)
            ->template('Email/admin/user_banned')
            ->sendData(['USER_EMAIL' => $user->email, 'USER_NAME' => $user->name, 'REASON' => $ban_reason])
            ->sendTo($user->email)
            ->send();
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postActivate()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        if(!$user_id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        if(!$db->updateUserStatus($user_id, 'Active')) {
            $this->data->data = 'Something was wrong!';
            $this->renderView();
        }
        
        (new \Module\Email)
            ->template('Email/admin/user_reactivated')
            ->sendData(['USER_EMAIL' => $user->email, 'USER_NAME' => $user->name])
            ->sendTo($user->email)
            ->send();
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postPermission()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $user_id = (int) $this->postRequest('id');
        $permission = $this->postRequest('permission');
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        
        if($permission) {
            $class = '\\Controller\\Admin\\'.$permission.'\\Home';
            if (!class_exists($class)) {
                $this->data->data = 'Permission "'.$permission.'" does not exist!';
                $this->renderView();
            }
            
            try {
                $db->createUserPermission($user->id, $permission);
            } catch(\Exception $e) {
                $db->updateUserPermission($user->id, $permission);
            }
        } else {
            $db->clearUserPermission($user->id);
        }
        
        $sessions = $db->listUserActiveSession($user->id);
        if($sessions) {
            $db->stopUserActiveSession($user->id);
            $redis = new \System\Session;
            foreach($sessions as $session) $redis->deleteSession($session->session_id);
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postReason()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        $ban_reason = $this->postRequest('reason');
        if(!$user_id || !$ban_reason) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        if(!$db->updateUserBannedReason($user_id, $ban_reason)) {
            $this->data->data = 'Something was wrong!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postRevshare()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        $revshare = $this->postRequest('revshare');
        if(!$user_id || !is_numeric($revshare)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }

        $db->updatePublisherRevenueShare($user->id, $revshare);
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postRank()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        $pub_rank = (int) $this->postRequest('pub');
        $adv_rank = (int) $this->postRequest('adv');
        if(!$user_id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        if($pub_rank && !$db->setPublisherRank($user_id, $pub_rank)) {
            $this->data->data = 'Something was wrong!';
            $this->renderView();
        }
        if($adv_rank && !$db->setAdvertiserRank($user_id, $adv_rank)) {
            $this->data->data = 'Something was wrong!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postNote()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('id');
        $pub_note = $this->postRequest('pub');
        $adv_note = $this->postRequest('adv');
        if(!$user_id || ($pub_note === null && $adv_note === null)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        $user = $db->getUser($user_id);
        if(!$user) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        if($pub_note !== null) {
            if(!$pub_note) $pub_note = null;
            $db->setPublisherNote($user->id, $pub_note);
        }
        if($adv_note !== null) {
            if(!$adv_note) $adv_note = null;
            $db->setAdvertiserNote($user->id, $adv_note);
        }
        
        $this->data->success = true;
        $this->renderView();
    }

    public function profile()
    {
        $user_id = (int) $this->getRequest('user_id');
        if(!$user_id) $this->redirectTo('/user');
        
        $db = new \Model\Admin\superAdmin\User;
        $this->data = $db->getUser($user_id);
        if(!$this->data) $this->redirectTo('/user');
       
        $this->data->countries = $db->listCountries();
        $this->data->chats = $this->chats;
        $this->data->timezones = timezone_identifiers_list();
        $this->data->languages = $this->languages;
        $this->data->phone_prefix = $this->data->phone ? explode(' ', $this->data->phone)[0] : '';
        $this->data->phone = $this->data->phone ? trim(str_replace($this->data->phone_prefix, '', $this->data->phone)) : '';
        $this->data->chat_prefix = $this->data->chat_account ? explode(':', $this->data->chat_account)[0] : '';
        $this->data->chat_account = $this->data->chat_account ? trim(str_replace($this->data->chat_prefix.':', '', $this->data->chat_account)) : '';
        
        $this->data->balance = $db->getBalance($user_id);
        $this->data->deposit = $db->getLatestDeposit($user_id);
        $this->data->withdraw = $db->getLatestWithdraw($user_id);
        $this->data->publisher = $db->getPublisher($user_id);
        $this->data->advertiser = $db->getAdvertiser($user_id);
        
        $this->data->timeline = [];
        $this->data->timeline[$this->data->created_at] = ['icon' => '<path fill="currentColor" d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,14C16.42,14 20,15.79 20,18V20H4V18C4,15.79 7.58,14 12,14Z" />', 'color' => 'is-success', 'content' => 'Completed the registration and fully activated account'];
        if($this->data->deposit) {
            $this->data->timeline[$this->data->deposit->created_at] = ['icon' => '<path fill="currentColor" d="M20 4H4C2.9 4 2 4.89 2 6V18C2 19.11 2.9 20 4 20H13.09C13.03 19.67 13 19.34 13 19C13 15.69 15.69 13 19 13C20.06 13 21.09 13.28 22 13.81V6C22 4.89 21.11 4 20 4M20 11H4V8H20M17.75 22L15 19L16.16 17.84L17.75 19.43L21.34 15.84L22.5 17.25L17.75 22"></path>', 'color' => 'is-warning', 'content' => 'First time deposit'];
        }
        if($this->data->withdraw) {
            $this->data->timeline[$this->data->withdraw->created_at] = ['icon' => '<path fill="currentColor" d="M3 6V18H13.32C13.1 17.33 13 16.66 13 16H7C7 14.9 6.11 14 5 14V10C6.11 10 7 9.11 7 8H17C17 9.11 17.9 10 19 10V10.06C19.67 10.06 20.34 10.18 21 10.4V6H3M12 9C10.3 9.03 9 10.3 9 12C9 13.7 10.3 14.94 12 15C12.38 15 12.77 14.92 13.14 14.77C13.41 13.67 13.86 12.63 14.97 11.61C14.85 10.28 13.59 8.97 12 9M21.63 12.27L17.76 16.17L16.41 14.8L15 16.22L17.75 19L23.03 13.68L21.63 12.27Z" />', 'color' => 'is-primary', 'content' => 'First time withdraw'];;
        }
        if($this->data->publisher->first_zone) {
            $this->data->timeline[$this->data->publisher->first_zone] = ['icon' => '<path fill="currentColor" d="M23,11H18A1,1 0 0,0 17,12V21A1,1 0 0,0 18,22H23A1,1 0 0,0 24,21V12A1,1 0 0,0 23,11M23,20H18V13H23V20M20,2H2C0.89,2 0,2.89 0,4V16A2,2 0 0,0 2,18H9V20H7V22H15V20H13V18H15V16H2V4H20V9H22V4C22,2.89 21.1,2 20,2M11.97,9L11,6L10.03,9H7L9.47,10.76L8.53,13.67L11,11.87L13.47,13.67L12.53,10.76L15,9H11.97Z"></path>', 'color' => 'is-link', 'content' => 'Created first zone'];;
        }
        if($this->data->advertiser->first_ad) {
            $this->data->timeline[$this->data->advertiser->first_ad] = ['icon' => '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>', 'color' => 'is-info', 'content' => 'Created first ad'];;
        }
        if($this->data->advertiser->last_ad) {
            $this->data->timeline[$this->data->advertiser->last_ad] = ['icon' => '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>', 'color' => 'is-danger', 'content' => 'Latest ad'];;
        }
        ksort($this->data->timeline);
        
        $this->title = $this->data->name.' Profile - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/user/profile';
        $this->renderView();
    }
    
    public function __postProfile()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        if (!($user_id = (int) $this->uri[2])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $data = json_decode($this->postRequest('data'));
        if(!$data) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\User;
        if(!($user = $db->getUser($user_id))) {
            $this->data->data = 'User id #'.$user_id.' does not exist!';
            $this->renderView();
        }
        if(!($ct = $db->getCountry($data->country_id))) {
            $this->data->data = 'Bad request, valid country is required';
            $this->renderView();
        }
        
        $helper = new \Module\Helper;
        if(!($data->birthday = $helper->validDate($data->birthday))) $data->birthday = null;
        if (!($data->phone = $helper->validPhone($data->phone))) $data->phone = null;
        if($data->phone) $data->phone = $ct->phone.' '.$data->phone;
        
        
        foreach($user as $key => $value) {
            if(!isset($data->$key)) continue;
            $user->$key = $data->$key;
        }
        $db->updateUser($id, $user);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function api()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Inactive'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\User;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countApiByUser($user_id);
                } else {
                    $this->data->total = $db->countApiSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countApiStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countApiStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countApi();
                } else {
                    $this->data->total = $db->countApiSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countApiStatus($this->data->status);
                } else {
                    $this->data->total = $db->countApiStatusSearch($this->data->status, $this->data->key);
                }
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listApiByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listApiSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }  
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listApiStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listApiStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listApi($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listApiSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }  
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listApiStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listApiStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' APIs - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' APIs - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/user/api';
        $this->renderView();
    }
    
    public function __postApi()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->status) || !isset($data->description)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        if(!in_array($data->status, ['Active', 'Inactive'])) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $db = new \Model\Admin\superAdmin\User;
        if(!$db->updateUserApi($data->id, $data->status, $data->description)) {
            $this->data->data = 'Nothing changed!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function referral()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Earning', 'Cancelled'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\User;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }

        if($user_id) {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferralByUser($user_id);
                } else {
                    $this->data->total = $db->countReferralSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferralStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countReferralStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferral();
                } else {
                    $this->data->total = $db->countReferralSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReferralStatus($this->data->status);
                } else {
                    $this->data->total = $db->countReferralStatusSearch($this->data->status, $this->data->key);
                }
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferralByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferralSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferralStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferralStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferral($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferralSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReferralStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReferralStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Referrals - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Referrals - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/user/referral';
        $this->renderView();
    }
    
    public function notification()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->services = ['Global', 'Advertiser', 'Publisher'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $service = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if(in_array($service, $this->data->services)) {
            $this->data->service = $service;
        } else {
            $this->data->service = 'Global';
        }
        
        $db = new \Model\Admin\superAdmin\User;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if ($this->data->service == 'Global') {
                if(!$this->data->key) {
                    $this->data->total = $db->countNotificationByUser($user_id);
                } else {
                    $this->data->total = $db->countNotificationSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countNotificationServiceByUser($user_id, $this->data->service);
                } else {
                    $this->data->total = $db->countNotificationServiceSearchByUser($user_id, $this->data->service, $this->data->key);
                }
            }
        } else {
            if ($this->data->service == 'Global') {
                if(!$this->data->key) {
                    $this->data->total = $db->countNotification();
                } else {
                    $this->data->total = $db->countNotificationSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countNotificationService($this->data->service);
                } else {
                    $this->data->total = $db->countNotificationServiceSearch($this->data->service, $this->data->key);
                }
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->service == 'Global') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listNotificationByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listNotificationSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listNotificationServiceByUser($user_id, $this->data->service, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listNotificationServiceSearchByUser($user_id, $this->data->service, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->service == 'Global') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listNotification($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listNotificationSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listNotificationService($this->data->service, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listNotificationServiceSearch($this->data->service, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
                
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->service).' Notifications - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->service).' Notifications - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/user/notification';
        $this->renderView();
    }
    
    public function __postReadNotification()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->postRequest('id');
        $service = $this->postRequest('service');
        $db = new \Model\Admin\superAdmin\User;
        if(!$id) {
            $this->data->data = [];
            if($service) {
                $this->data->total = $db->countUnreadNotificationByService($service);
                $data = $this->data->total ? $db->listUnreadNotificationByService($service) : null;
            } else {
                $this->data->total = $db->countUnreadNotification();
                $data = $this->data->total ? $db->listUnreadNotification() : null;
            }
            if($data) {
                foreach($data as $item) {
                    $this->data->data[] = ['id' => $item->id, 'type' => $item->type, 'title' => $item->title, 'created_at' => $item->created_at];
                }
            }
            
            $this->data->success = true;
            $this->renderView();
        }

        $this->data->data = $db->getNotification($id);
        if (!$this->data->data) {
            $this->data->data = 'Error 404: resource not found or not yours!';
            $this->renderView();
        }
        
        if (!$this->data->data->is_read) $db->readNotification($id);
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postNotificationReadAll()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        $db = new \Model\Admin\superAdmin\User;
        $db->markAllRead();

        $this->data->success = true;
        $this->renderView();
    }
    
    public function activity()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->types = ['All', 'Account', 'Billing'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $type = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($type && in_array($type, $this->data->types)) {
            $this->data->type = $type;
        } else {
            $this->data->type = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\User;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countActivityByUser($user_id);
                } else {
                    $this->data->total = $db->countActivitySearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countActivityTypeByUser($user_id, $this->data->type);
                } else {
                    $this->data->total = $db->countActivityTypeSearchByUser($user_id, $this->data->type, $this->data->key);
                }
            }
        } else {
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countActivity();
                } else {
                    $this->data->total = $db->countActivitySearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countActivityType($this->data->type);
                } else {
                    $this->data->total = $db->countActivityTypeSearch($this->data->type, $this->data->key);
                }
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if ($this->data->type == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listActivityByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listActivitySearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listActivityTypeByUser($user_id, $this->data->type, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listActivityTypeSearchByUser($user_id, $this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if ($this->data->type == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listActivity($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listActivitySearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listActivityType($this->data->type, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listActivityTypeSearch($this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
                
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->type).' Activities - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->type).' Activities - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/user/activity';
        $this->renderView();
    }
    
    public function session()
    {
        $this->data->currentId = session_id();
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Stopped'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\User;
        if($user_id) {
            $this->data->user = $db->getUser($user_id);
            if(!$this->data->user) {
                $this->fullPage = true;
                $this->view = 'Global/404';
                $this->renderView();
            }
        }
        
        if($user_id) {
            if($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countSessionByUser($user_id);
                } elseif(strlen($this->data->key) == 2) {
                    $this->data->total = $db->countSessionSearchCountryByUser($user_id, $this->data->key);
                } else {
                    $this->data->total = $db->countSessionSearchIpByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countSessionStatusByUser($user_id, $this->data->status);
                } elseif(strlen($this->data->key) == 2) {
                    $this->data->total = $db->countSessionStatusSearchCountryByUser($user_id, $this->data->status, $this->data->key);
                } else {
                    $this->data->total = $db->countSessionStatusSearchIpByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        } else {
            if($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countSession();
                } elseif(strlen($this->data->key) == 2) {
                    $this->data->total = $db->countSessionSearchCountry($this->data->key);
                } else {
                    $this->data->total = $db->countSessionSearchIp($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countSessionStatus($this->data->status);
                } elseif(strlen($this->data->key) == 2) {
                    $this->data->total = $db->countSessionStatusSearchCountry($this->data->status, $this->data->key);
                } else {
                    $this->data->total = $db->countSessionStatusSearchIp($this->data->status, $this->data->key);
                }
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if($user_id) {
                if($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listSessionByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } elseif(strlen($this->data->key) == 2) {
                        $this->data->data = $db->listSessionSearchCountryByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listSessionSearchIpByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listSessionStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } elseif(strlen($this->data->key) == 2) {
                        $this->data->data = $db->listSessionStatusSearchCountryByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listSessionStatusSearchIpByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            } else {
                if($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listSession($pagination->getInit(), $pagination->getLimit());
                    } elseif(strlen($this->data->key) == 2) {
                        $this->data->data = $db->listSessionSearchCountry($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listSessionSearchIp($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listSessionStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } elseif(strlen($this->data->key) == 2) {
                        $this->data->data = $db->listSessionStatusSearchCountry($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listSessionStatusSearchIp($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        if($user_id) {
            $this->title = ucwords($this->data->status).' Sessions - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Sessions - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/user/session';
        $this->renderView();
    }
    
    public function __postSessionLogout()
    {
        $this->jsonResponse = true;
        $this->data->success = false;

        $id = $this->postRequest('id');
        $db = new \Model\Admin\superAdmin\User;
        if(!($session = $db->getSession($id))) {
            $this->data->data = 'Sorry, session not found!';
            $this->renderView();
        }
        $db->stopUserSession($id);
        (new \System\Session)->deleteSession($session->session_id);
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postSessionMasslogout()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getRequest('user_id');
        $db = new \Model\Admin\superAdmin\User;
        $sessions = $db->listActiveSession($user_id);
        if($sessions) {
            $db->stopActiveSession($user_id);
            $redis = new \System\Session;
            foreach($sessions as $session) $redis->deleteSession($session->session_id);
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function authentication()
    {
        $user_id = (int) $this->getRequest('user_id');
        if(!$user_id) $this->redirectTo('/user');
        
        $db = new \Model\Admin\superAdmin\User;
        $this->data = $db->getUser($user_id);
        if(!$this->data) $this->redirectTo('/user');
        
        $this->data->twoFactorToken = $this->data->two_factor;
        $this->data->rememberMeToken = $this->data->remember_token;
        if($this->data->twoFactorToken && $this->data->twoFactorToken != 'sms' && $this->data->twoFactorToken != 'email') $this->data->twoFactorToken = 'app';

        $this->title = $this->data->name.' Authentication - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/user/authentication';
        $this->renderView();
    }
}
