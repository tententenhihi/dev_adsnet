<?php

namespace Controller\Myaccount;

class Referral extends Controller
{
    public $enable404 = false;
    
    public function index()
    {
        if(is_numeric($this->uri[1])) return $this->referralPayment();
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Referral;
        $this->data->referral_code = (new \Module\HashIds)->encode($user_id);
        $this->data->referral_url = REGISTER_URL.'/?ref='.(new \Module\HashIds)->encode($user_id);
        $this->data->referral_sum = $db->sumUserReferral($user_id);
        $this->data->total_earned = $db->getTotalEarned($user_id);
        $this->data->active_referrals = $db->getActiveReferrals($user_id);
        $this->data->pending_referrals = $db->getPendingReferrals($user_id);

        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Active', 'Cancelled'];
        $status = ucwords($this->uri[1]);

        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countReferral($user_id);
            } else {
                $this->data->total = $db->countReferralSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countReferralStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countReferralStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listReferral($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listReferralSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listReferralStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listReferralStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        $this->helper = new \Module\Helper;
        $this->title = 'My Referrals - '.SITE_NAME;
        $this->view = 'Myaccount/referral/index';
        $this->renderView();
    }
    
    public function referralPayment()
    {
        $referral_id = (int) $this->uri[1];
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Referral;

        $this->data->total = $db->countReferralPayment($user_id, $referral_id);
        if(!$this->data->total) $this->redirectTo('/referral');

        $pagination = new \Module\Pagination();
        $pagination->setLimit(20);
        $pagination->setTotal($this->data->total);
        $this->data->pagination = $pagination->setup();
        $this->data->data = $db->listReferralPayment($user_id, $referral_id, $pagination->getInit(), $pagination->getLimit());
        $this->data->referred_user = $db->getUserFromReferral($referral_id);

        $this->helper = new \Module\Helper;
        $this->title = 'My Referrals - '.SITE_NAME;
        $this->view = 'Myaccount/referral/payment';
        $this->renderView();
    }
}
