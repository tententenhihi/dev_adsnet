<?php

namespace Controller\Advertiser;

class Audience extends Controller
{
    public $enable404 = false;

    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Audience;

        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Archived'];
        $status = ucwords($this->uri[1]);

        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'Active';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countAudience($user_id);
            } else {
                $this->data->total = $db->countAudienceSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countAudienceStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countAudienceStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listAudience($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listAudienceSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listAudienceStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listAudienceStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->title = 'My Audiences - '.SITE_NAME;
        $this->view = 'Advertiser/audience/index';
        $this->renderView();
    }

    public function __postCreate()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;

        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->name) || !isset($data->duration)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Audience;
        $data->id = (int) $data->id;

        if(!$data->id) {
            try {
                $data->id = $db->addAudience($user_id, $data->name, $data->duration);
            } catch(\Exception $e) {
                $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
                $this->renderView();
            }
        } else {
            $db->updateAudience($user_id, $data->id, $data->name, $data->duration);
        }

        $this->data->data = $data->id;
        $this->data->success = true;
        $this->renderView();
    }

    public function __postArchive()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $id = (int) $this->uri[2];
        if(!$id) {
            $this->data->data = 'Bad request!';
            $this->renderView();
        }

        $user_id = $this->getSession('id');
        $db = new \Model\Advertiser\Audience;
        if(!$db->archiveAudience($user_id, $id)) {
            $this->data->data = 'Audience ID '.$id.' not found or not yours';
            $this->renderView();
        }

        $this->data->data = '/audience';
        $this->data->success = true;
        $this->renderView();
    }
}
