<?php

namespace Controller\Admin\superAdmin;

class Referral extends Controller
{
    public function index()
    {
        $db = new \Model\Admin\superAdmin\Referral;

        $this->helper = new \Module\Helper;

        $pagination = new \Module\Pagination();
        $pagination->setLimit(20);
        $pagination->setTotal($this->data->total);
        $this->data->pagination = $pagination->setup();

        if ($this->uri[1] == 'detail') return $this->referralDetail();
        $this->data->key = $this->getRequest('q');

        if(!$this->data->key) {
            $this->data->data = $db->listReferral($pagination->getInit(), $pagination->getLimit());
        } else {
            $this->data->data = $db->listReferralSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
        }

        $this->data->pagination = $pagination->setup();

        $this->data->total_referral = $db->totalReferral();
        $this->data->total_amount = $db->totalAmount();
        $this->data->total_publisher_amount = $db->totalPublisherAmount();
        $this->data->total_advertiser_amount = $db->totalAdvertiserAmount();
        $this->title = 'Referral Overview - Admin ' . SITE_NAME;
        $this->view = 'Admin/superAdmin/referral/index';
        $this->renderView();
    }

    public function publisher()
    {
        $db = new \Model\Admin\superAdmin\Referral;
        $this->helper = new \Module\Helper;
        $this->data->data = $db->listReferralPublisher();
        $this->title = 'Referral Publisher Overview - Admin ' . SITE_NAME;
        $this->view = 'Admin/superAdmin/referral/publisher';
        $this->renderView();
    }

    public function advertiser()
    {
        $db = new \Model\Admin\superAdmin\Referral;
        $this->helper = new \Module\Helper;
        $this->data->data = $db->listReferralAdvertiser();
        $this->title = 'Referral Publisher Overview - Admin ' . SITE_NAME;
        $this->view = 'Admin/superAdmin/referral/advertiser';
        $this->renderView();
    }

    public function referralDetail()
    {
        if (!($id = (int)$this->getRequest('id'))) {
            $this->redirectTo('/referral');
        }
        $db = new \Model\Admin\superAdmin\Referral;
        if (!($this->data = $db->getReferralDetail($id))) {
            $this->redirectTo('/referral');
        }
//        var_dump($this->data);die();

        $this->helper = new \Module\Helper;
//        $this->data->data = $db->listReferral();
        $this->title = 'Referral Overview - Admin ' . SITE_NAME;
        $this->view = 'Admin/superAdmin/referral/detail';
        $this->renderView();
    }
}