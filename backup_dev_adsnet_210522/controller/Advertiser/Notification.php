<?php

namespace Controller\Advertiser;

class Notification extends Controller
{
    public function index()
    {
        $this->redirectTo(MYACCOUNT_URL.'/notification');
    }
    
    public function __postIndex()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->postRequest('id');
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Notification;
        if(!$id) {
            $this->data->data = [];
            $this->data->total = $db->countUnreadNotificationByService($user_id, 'Advertiser');
            $data = $this->data->total ? $db->listUnreadNotificationByService($user_id, 'Advertiser') : null;
            if($data) {
                foreach($data as $item) {
                    $this->data->data[] = ['id' => $item->id, 'type' => $item->type, 'title' => $item->title, 'created_at' => $item->created_at];
                }
            }
            
            $this->data->success = true;
            $this->renderView();
        }
        
        $this->data->data = $db->getNotification($id, $user_id);
        if (!$this->data->data) {
            $this->data->data = 'Error 404: resource not found or not yours!';
            $this->renderView();
        }
        
        if (!$this->data->data->is_read) $db->readNotification($id);
        $this->data->success = true;
        $this->renderView();
    }
}
