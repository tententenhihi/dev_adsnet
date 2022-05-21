<?php

namespace Controller\Advertiser;

class Tracking extends Controller
{
    public function index()
    {
        $this->title = 'Conversion Tracking - '.SITE_NAME;
        $db = new \Model\Advertiser\Tracking;
        $user_id = $this->getSession('id');
        $tracking = $db->getTracking($user_id);

        if(!$tracking) {
            while(TRUE) {
                $token = bin2hex(random_bytes(8));
                try {
                    $db->createTracking($user_id, $token);
                    break;
                } catch(\Exception $e) {}
            }
            $tracking = (object) ['token' => $token, 'status' => 'Inactive'];
        }
        
        $this->data->hasTracking = $tracking->status == 'Active';
        $this->data->trackingToken = $tracking->token;
        $this->data->testClickId = $this->generateClickId();
        $this->view = 'Advertiser/tracking/index';
        $this->renderView();
    }
    
    public function __postIndex()
    {
        $this->jsonResponse = true;
        $this->data->success = true;

        $db = new \Model\Advertiser\Tracking;
        $tracking = $db->getTracking($this->getSession('id'));
        $this->data->data = $tracking->status;
        $this->renderView();
    }
    
    private function generateClickId()
    {
        return bin2hex(random_bytes(8));
    }
}