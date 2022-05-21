<?php

namespace Controller\Advertiser;

class Me extends Controller
{
    public function index()
    {
        $this->redirectTo(MYACCOUNT_URL);
    }
    
    public function __postNote()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $user_id = $this->getSession('id');
        $data = $this->postRequest('data');
        $db = new \Model\Advertiser\Me;
        
        if(!$db->saveNote($user_id, $data)) {
            $this->data->data = 'Could not save your note, please try again later!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
}