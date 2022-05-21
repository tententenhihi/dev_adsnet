<?php

namespace Controller\Admin\superAdmin;

class Billing extends Controller
{
    public $paygateType = ['Deposit', 'Withdraw'];
    
    public function index()
    {
        return $this->overview();
    }

    public function overview()
    {
        $this->helper = new \Module\Helper;
        $db = new \Model\Admin\superAdmin\Billing;
        $today = (new \DateTime('now'))->format('Y-m-d');
        
        /* pendding deposit */
        $this->data->pendingDeposite = $db->countDepositStatus('Unpaid');
        /* pendding withdraw */
        $this->data->pendingWithdraw = $db->countWithdrawStatus('Pending');
        /* count advertiser */
        $this->data->countAdvertiser = $db->countAdvertiser();
        /* count publisher */
        $this->data->countPublisher= $db->countPublisher();
        
        /* list advertiser popular */
        $this->data->listAdvertiserByBalance = $db->listAdvertiserByBalance();
        /* list publisher popular */
        $this->data->listPublisherByBalance = $db->listPublisherByImpression();
        /* list network popular */
        $this->data->listNetworkByBalance = $db->listNetworkByBalance();
        
        /* total deposit */
        $this->data->totalDeposit = $db->totalDeposit();
        /* total deposit paid */
        $this->data->paidDeposit = $db->totalDepositStatus('Paid');
        /* total withdraw */
        $this->data->totalWithdraw = $db->totalWithdraw();
        /* total withdraw paid */
        $this->data->paidWithdraw = $db->totalWithdrawStatus('Paid');
        /* total exchange revenue and payment*/
        $this->data->totalRevenuePaymentExchange = $db->totalRevenuePaymentExchange();
        /* total user balance*/
        $this->data->totalUserBalance = $db->totalUserBalance();
        
        /* get last month deposit, withdraw, receipt exchange revenue, user balance*/
        $created_at = (new \DateTime('30 days ago'))->format('Y-m-d');
        $listDeposit= $db->listDepositByDate($created_at);
        $listWithdraw = $db->listWithdrawByDate($created_at);
        $listReceipt = $db->listReceiptByDate($created_at);
        $listExchange = $db->listExchangeByDate($created_at);

        $data = $db->listLastUserBalance();
        $this->buildHomeStatsData($data, $listDeposit, $listWithdraw, $listExchange, $listReceipt);

        $this->title = 'Billing Overview - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/billing/index';
        $this->renderView();
    }
    
    private function buildHomeStatsData($data, $listDeposit, $listWithdraw, $listExchange, $listReceipt)
    {
        /* default data */
        $now = new \DateTime('now');
        $today = $now->format('Y-m-d');
        
        $this->data->country = ['XX' => ['deposit' => 0, 'spent' => 0, 'earn' => 0, 'withdraw' => 0]];
        
        $this->data->last7dayDeposit = ['total' => 0, 'paid' => 0, 'totalNet' => 0];
        $this->data->last14dayDeposit = ['total' => 0, 'paid' => 0, 'totalNet' => 0];
        $this->data->last7dayDepositStats = [$today => ['total' => 0, 'paid' => 0]];
        $this->data->compareDeposit = ['total' => 0, 'totalPercent' => 0, 'paid' => 0, 'paidPercent' => 0];
        
        $this->data->last7dayWithdraw = ['total' => 0, 'paid' => 0, 'totalNet' => 0];
        $this->data->last14dayWithdraw = ['total' => 0, 'paid' => 0, 'totalNet' => 0];
        $this->data->last7dayWithdrawStats = [$today => ['total' => 0, 'paid' => 0]];
        $this->data->compareWithdraw = ['total' => 0, 'totalPercent' => 0, 'paid' => 0, 'paidPercent' => 0];
        
        $this->data->compareRevenue = ['total' => 0, 'totalPercent' => 0, 'totalNet' => 0, 'totalNetPercent' => 0];
        
        $this->data->last7dayReceipt= ['total' => 0];
        $this->data->last14dayReceipt = ['total' => 0];
        $this->data->last7dayReceiptStats = [$today => ['total' => 0]];
        $this->data->compareReceipt = ['total' => 0, 'totalPercent' => 0];
        
        $this->data->last7dayExchangePayment= ['total' => 0];
        $this->data->last14dayExchangePayment = ['total' => 0];
        $this->data->last7dayExchangePaymentStats = [$today => ['total' => 0]];
        $this->data->compareExchangePayment = ['total' => 0, 'totalPercent' => 0];
        
        $this->data->last7day_stats = [$today => ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0]];
        $this->data->last30day_stats = [$today => ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0]];

        // if(!$data || !$listWebsite || !$listZone) return true;
        
        /* prepare datetime to compare */
        $last14day = (new \DateTime('14 days ago'));
        $last7d = (new \DateTime('7 days ago'));
        $last30d = (new \DateTime('30 days ago'));
        
        /* loop data */
        foreach($data as $item) {
            if(!isset($this->data->country[$item->country])) {
                $this->data->country[$item->country] = ['deposit' => 0, 'spent' => 0, 'earn' => 0, 'withdraw' => 0];
            }
            $this->data->country[$item->country]['deposit'] += $item->deposit_value;
            $this->data->country[$item->country]['spent'] += $item->receipt_value;
            $this->data->country[$item->country]['earn'] += $item->pub_balance + $item->pub_pending;
            $this->data->country[$item->country]['withdraw'] += $item->withdraw_value;
        }
        
        /* loop list deposit */
        foreach($listDeposit as $item) {
            $date = (new \DateTime($item->created_at));
            
            /* last 7day */
            if($last7d <= $date) {
                
                /* 7 days stats */
                if(!isset($this->data->last7day_stats[$date->format('Y-m-d')])) {
                    $this->data->last7day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                /* 7 days deposit stats */
                if(!isset($this->data->last7dayDepositStats[$date->format('Y-m-d')])) {
                    $this->data->last7dayDepositStats[$date->format('Y-m-d')] = ['total' => 0, 'paid' => 0];
                }
                
                if($item->status == 'Paid'){
                    $this->data->last7dayDeposit['paid'] += $item->amount;
                    $this->data->last7day_stats[$date->format('Y-m-d')]['depositPaid'] += $item->amount;
                    $this->data->last7dayDepositStats[$date->format('Y-m-d')]['paid'] += $item->amount;
                }
                $this->data->last7dayDeposit['total'] += $item->amount;
                $this->data->last7dayDeposit['totalNet'] += $item->net_amount;
                $this->data->last7day_stats[$date->format('Y-m-d')]['depositTotal'] += $item->amount;
                $this->data->last7dayDepositStats[$date->format('Y-m-d')]['total'] += $item->amount;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                if($item->status == 'Paid'){
                    $this->data->last14dayDeposit['paid'] += $item->amount;
                }
                $this->data->last14dayDeposit['total'] += $item->amount;
            }
            
            /* last 30day */
            if($date >= $last30d) {
                
                /* 30 days stats */
                if(!isset($this->data->last30day_stats[$date->format('Y-m-d')])) {
                    $this->data->last30day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                if($item->status == 'Paid'){
                    $this->data->last30day_stats[$date->format('Y-m-d')]['depositPaid'] += $item->amount;
                }
                $this->data->last30day_stats[$date->format('Y-m-d')]['depositPaid'] += $item->amount;
            }
        }
        
        /* compare deposit data */
        if($this->data->last14dayDeposit['total']) {
            if($this->data->last14dayDeposit['total']-$this->data->last7dayDeposit['total'] > 0){
                $this->data->compareDeposit['total'] = $this->data->last7dayDeposit['total'] - ($this->data->last14dayDeposit['total']-$this->data->last7dayDeposit['total']);
                $this->data->compareDeposit['totalPercent'] = round(($this->data->last7dayDeposit['total'] - ($this->data->last14dayDeposit['total']-$this->data->last7dayDeposit['total']))/($this->data->last14dayDeposit['total']-$this->data->last7dayDeposit['total']), 4)*100;
            }else{
                $this->data->compareDeposit['total'] = 0;
                $this->data->compareDeposit['totalPercent'] = 0;
            }
        } 
        if($this->data->last14dayDeposit['paid']) {
            if($this->data->last14dayDeposit['paid']-$this->data->last7dayDeposit['paid'] > 0){
                $this->data->compareDeposit['paid'] = $this->data->last7dayDeposit['paid'] - ($this->data->last14dayDeposit['paid']-$this->data->last7dayDeposit['paid']);
                $this->data->compareDeposit['paidPercent'] = round(($this->data->last7dayDeposit['paid'] - ($this->data->last14dayDeposit['paid']-$this->data->last7dayDeposit['paid']))/($this->data->last14dayDeposit['paid']-$this->data->last7dayDeposit['paid']), 4)*100;
            }else{
                $this->data->compareDeposit['paid'] = 0;
                $this->data->compareDeposit['paidPercent'] = 0;
            }
        }
        
        /* loop list withdraw */
        foreach($listWithdraw as $item) {
            $date = (new \DateTime($item->created_at))->format('Y-m-d');
            /* last 7day */
            if($last7d <= $date) {
                /* 7 days stats */
               if(!isset($this->data->last7day_stats[$date->format('Y-m-d')])) {
                    $this->data->last7day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                /* 7 days withdraw stats */
                if(!isset($this->data->last7dayWithdrawStats[$date])) {
                    $this->data->last7dayWithdrawStats[$date] = ['total' => 0, 'paid' => 0];
                }
                
                if($item->status == 'Paid'){
                    $this->data->last7dayWithdraw['paid'] += $item->amount;
                    $this->data->last7dayWithdrawStats[$date->format('Y-m-d')]['paid'] += $item->amount;
                    $this->data->last7day_stats[$date->format('Y-m-d')]['WithdrawPaid'] += $item->amount;
                }
                $this->data->last7dayWithdraw['total'] += $item->amount;
                $this->data->last7dayWithdraw['totalNet'] += $item->net_amount;
                $this->data->last7dayWithdrawStats[$date->format('Y-m-d')]['total'] += $item->amount;
                $this->data->last7day_stats[$date->format('Y-m-d')]['WithdrawTotal'] += $item->amount;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                if($item->status == 'Paid'){
                    $this->data->last14dayWithdraw['paid'] += $item->amount;
                }
                $this->data->last14dayWithdraw['total'] += $item->amount;
            }
            
            /* last 30day */
            if($date >= $last30d) {
                
                /* 30 days stats */
                if(!isset($this->data->last30day_stats[$date->format('Y-m-d')])) {
                    $this->data->last30day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                if($item->status == 'Paid'){
                    $this->data->last30day_stats[$date->format('Y-m-d')]['WithdrawPaid'] += $item->amount;
                }
                $this->data->last30day_stats[$date->format('Y-m-d')]['WithdrawTotal'] += $item->amount;
            }
        }
        
        /* compare withdraw data */
        if($this->data->last14dayWithdraw['total']) {
            if($this->data->last14dayWithdraw['total']-$this->data->last7dayWithdraw['total'] > 0){
                $this->data->compareWithdraw['total'] = $this->data->last7dayWithdraw['total'] - ($this->data->last14dayWithdraw['total']-$this->data->last7dayWithdraw['total']);
                $this->data->compareWithdraw['totalPercent'] = round(($this->data->last7dayWithdraw['total'] - ($this->data->last14dayWithdraw['total']-$this->data->last7dayWithdraw['total']))/($this->data->last14dayWithdraw['total']-$this->data->last7dayWithdraw['total']), 4)*100;
            }else{
                $this->data->compareWithdraw['total'] = 0;
                $this->data->compareWithdraw['totalPercent'] = 0;
            }
        } 
        if($this->data->last14dayWithdraw['paid']) {
            if($this->data->last14dayWithdraw['paid']-$this->data->last7dayWithdraw['paid'] > 0){
                $this->data->compareWithdraw['paid'] = $this->data->last7dayWithdraw['paid'] - ($this->data->last14dayWithdraw['paid']-$this->data->last7dayWithdraw['paid']);
                $this->data->compareWithdraw['paidPercent'] = round(($this->data->last7dayWithdraw['paid'] - ($this->data->last14dayWithdraw['paid']-$this->data->last7dayWithdraw['paid']))/($this->data->last14dayWithdraw['paid']-$this->data->last7dayWithdraw['paid']), 4)*100;
            }else{
                $this->data->compareWithdraw['paid'] = 0;
                $this->data->compareWithdraw['paidPercent'] = 0;
            }
        }
        
        /* compare revenue data */
        if($this->data->last14dayDeposit['total'] && $this->data->last14dayWithdraw['total']) {
            $last7dayRevenue['total'] = $this->data->last7dayDeposit['total'] - $this->data->last7dayWithdraw['total'];
            $last14dayRevenue['total'] = $this->data->last14dayDeposit['total'] - $this->data->last14dayWithdraw['total'];
            if($last14dayRevenue['total'] - $last7dayRevenue['total'] > 0){
                $this->data->compareRevenue['total'] = $last7dayRevenue['total'] - ($last14dayRevenue['total']-$last7dayRevenue['total']);
                $this->data->compareRevenue['totalPercent'] = round(($last7dayRevenue['total'] - ($last14dayRevenue['total']-$last7dayRevenue['total']))/($last14dayRevenue['total']-$last7dayRevenue['total']), 4)*100;
            }else{
                $this->data->compareRevenue['total'] = 0;
                $this->data->compareRevenue['totalPercent'] = 0;
            }
        }
        if($this->data->last14dayDeposit['totalNet'] && $this->data->last14dayWithdraw['totalNet']) {
            $last7dayRevenue['totalNet'] = $this->data->last7dayDeposit['totalNet'] - $this->data->last7dayWithdraw['totalNet'];
            $last14dayRevenue['totalNet'] = $this->data->last14dayDeposit['totalNet'] - $this->data->last14dayWithdraw['totalNet'];
            if($last14dayRevenue['totalNet'] - $last7dayRevenue['totalNet'] > 0){
                $this->data->compareRevenue['totalNet'] = $last7dayRevenue['totalNet'] - ($last14dayRevenue['totalNet']-$last7dayRevenue['totalNet']);
                $this->data->compareRevenue['totalNetPercent'] = round(($last7dayRevenue['totalNet'] - ($last14dayRevenue['totalNet']-$last7dayRevenue['totalNet']))/($last14dayRevenue['totalNet']-$last7dayRevenue['totalNet']), 4)*100;
            }else{
                $this->data->compareRevenue['totalNet'] = 0;
                $this->data->compareRevenue['totalNetPercent'] = 0;
            }
        }
        
        /* loop list receipt */
        foreach($listReceipt as $item) {
            $date = (new \DateTime($item->created_at));
            /* last 7day */
            if($last7d <= $date) {
                /* 7 days stats */
               if(!isset($this->data->last7day_stats[$date->format('Y-m-d')])) {
                    $this->data->last7day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                /* 7 days receipt stats */
                if(!isset($this->data->last7dayReceiptStats[$date->format('Y-m-d')])) {
                    $this->data->last7dayReceiptStats[$date->format('Y-m-d')] = ['total' => 0];
                }
                
                $this->data->last7dayReceipt['total'] += $item->amount;
                $this->data->last7dayReceiptStats[$date->format('Y-m-d')]['total'] += $item->amount;
                $this->data->last7day_stats[$date->format('Y-m-d')]['receipt'] += $item->amount;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                $this->data->last14dayReceipt['total'] += $item->amount;
            }
            
            /* last 30day */
            if($date >= $last30d) {
                
                /* 30 days stats */
                if(!isset($this->data->last30day_stats[$date->format('Y-m-d')])) {
                    $this->data->last30day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                $this->data->last30day_stats[$date->format('Y-m-d')]['receipt'] += $item->amount;
            }
        }
        
        /* compare receipt data */
        if($this->data->last14dayReceipt['total']) {
            if($this->data->last14dayReceipt['total']-$this->data->last7dayReceipt['total'] > 0){
                $this->data->compareReceipt['total'] = $this->data->last7dayReceipt['total'] - ($this->data->last14dayReceipt['total']-$this->data->last7dayReceipt['total']);
                $this->data->compareReceipt['totalPercent'] = round(($this->data->last7dayReceipt['total'] - ($this->data->last14dayReceipt['total']-$this->data->last7dayReceipt['total']))/($this->data->last14dayReceipt['total']-$this->data->last7dayReceipt['total']), 4)*100;
            }else{
                $this->data->compareReceipt['total'] = 0;
                $this->data->compareReceipt['totalPercent'] = 0;
            }
        } 
        
        /* loop list exchange payment */
        foreach($listExchange as $item) {
            $date = (new \DateTime($item->created_at));
            /* last 7day */
            if($last7d <= $date) {
                /* 7 days stats */
               if(!isset($this->data->last7day_stats[$date->format('Y-m-d')])) {
                    $this->data->last7day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                /* 7 days exchange payment stats */
                if(!isset($this->data->last7dayExchangePaymentStats[$date->format('Y-m-d')])) {
                    $this->data->last7dayExchangePaymentStats[$date->format('Y-m-d')] = ['total' => 0];
                }
                
                $this->data->last7dayExchangePayment['total'] += $item->amount;
                $this->data->last7dayExchangePaymentStats[$date->format('Y-m-d')]['total'] += $item->amount;
                $this->data->last7day_stats[$date->format('Y-m-d')]['exchangePayment'] += $item->amount;
            }
            
            
            /* last 14day */
            if($date >= $last14day) {
                $this->data->last14dayExchangePayment['total'] += $item->amount;
            }
            
            /* last 30day */
            if($date >= $last30d) {
                
                /* 30 days stats */
                if(!isset($this->data->last30day_stats[$date->format('Y-m-d')])) {
                    $this->data->last30day_stats[$date->format('Y-m-d')] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
                }
                
                $this->data->last30day_stats[$date->format('Y-m-d')]['exchangePayment'] += $item->amount;
            }
        }
        
        /* compare exchange payment data */
        if($this->data->last14dayExchangePayment['total']) {
            if($this->data->last14dayExchangePayment['total']-$this->data->last7dayExchangePayment['total'] > 0){
                $this->data->compareExchangePayment['total'] = $this->data->last7dayExchangePayment['total'] - ($this->data->last14dayExchangePayment['total']-$this->data->last7dayExchangePayment['total']);
                $this->data->compareExchangePayment['totalPercent'] = round(($this->data->last7dayExchangePayment['total'] - ($this->data->last14dayExchangePayment['total']-$this->data->last7dayExchangePayment['total']))/($this->data->last14dayExchangePayment['total']-$this->data->last7dayExchangePayment['total']), 4)*100;
            }else{
                $this->data->compareExchangePayment['total'] = 0;
                $this->data->compareExchangePayment['totalPercent'] = 0;
            }
        } 
        
        /* fill hole last 7d */
        $today = new \DateTime('now');
        $last7d = new \DateTime('7 days ago');
        for($i = $today; $i >= $last7d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last7day_stats[$date])) {
                $this->data->last7day_stats[$date] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
            }
            if(!isset($this->data->last7dayDepositStats[$date])) {
                $this->data->last7dayDepositStats[$date] = ['total' => 0, 'paid' => 0];
            }
            if(!isset($this->data->last7dayWithdrawStats[$date])) {
                $this->data->last7dayWithdrawStats[$date] = ['total' => 0, 'paid' => 0];
            }
            if(!isset($this->data->last7dayReceiptStats[$date])) {
                $this->data->last7dayReceiptStats[$date] = ['total' => 0];
            }
            if(!isset($this->data->last7dayExchangePaymentStats[$date])) {
                $this->data->last7dayExchangePaymentStats[$date] = ['total' => 0];
            }
        }
        
        /* fill hole last 30d */
        $today = new \DateTime('now');
        $last30d = new \DateTime('30 days ago');
        for($i = $today; $i >= $last30d; $i->modify('-1 day')) {
            $date = $i->format('Y-m-d');
            if(!isset($this->data->last30day_stats[$date])) {
                $this->data->last30day_stats[$date] = ['depositTotal' => 0, 'depositPaid' => 0, 'WithdrawTotal' => 0, 'WithdrawPaid' => 0, 'receipt' => 0, 'exchangePayment' => 0];
            }
        }
        
        /* sort data */
        ksort($this->data->last7dayDepositStats);
        ksort($this->data->last7dayWithdrawStats);
        ksort($this->data->last7dayReceiptStats);
        ksort($this->data->last7dayExchangePaymentStats);
        ksort($this->data->last7day_stats);
        ksort($this->data->last30day_stats);
        
        return true;
    }
    
    public function paygate()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Active', 'Inactive'];
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countPaygate();
            } else {
                $this->data->total = $db->countPaygateSearch($this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countPaygateStatus($this->data->status);
            } else {
                $this->data->total = $db->countPaygateStatusSearch($this->data->status, $this->data->key);
            }
        }
        

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listPaygate($pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listPaygateSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listPaygateStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listPaygateStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        $this->title = $this->data->status.' Paygates - Admin '.SITE_NAME;
        $this->view = 'Admin/superAdmin/billing/paygate';
        $this->renderView();
    }
    
    public function __postPaygate()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->name) || !isset($data->description) || !isset($data->type) || !isset($data->min_value) || !isset($data->max_value) || !isset($data->status)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $module = '\\Module\\Paygate\\'.str_replace(' ', '', ucwords($data->name));
        if(!class_exists($module)) {
            $this->data->data = 'Sorry, you have to create module '.$module.' first!';
            $this->renderView();
        }
        
        $image = '/asset/img/paygate/'.str_replace(' ', '', strtolower($data->name)).'.png';
        if(!file_exists(BASE_PATH.$image)) {
            $this->data->data = 'Sorry, you have to upload '.$image.' first!';
            $this->renderView();
        }
        
        if(!isset($data->information)) $data->information = null;
        if(!isset($data->priority)) $data->priority = 0;
        if(!in_array($data->type, $this->paygateType)) $data->type = $this->paygateType[0];
        $data->id = (int) $data->id;
        
        $db = new \Model\Admin\superAdmin\Billing;
        if($data->id) {
            if(!$db->updatePaygate($data)) {
                $this->data->data = 'Nothing changed!';
                $this->renderView();
            }
        } else {
            try {
                $db->createPaygate($data);
            } catch(\Exception $e) {
                $this->data->data = 'Sorry, something was wrong, please try again';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }

    public function deposit()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Unpaid', 'Paid', 'Cancelled'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
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
                    $this->data->total = $db->countDepositByUser($user_id);
                } else {
                    $this->data->total = $db->countDepositSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countDepositStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countDepositStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        }else{
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countDeposit();
                } else {
                    $this->data->total = $db->countDepositSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countDepositStatus($this->data->status);
                } else {
                    $this->data->total = $db->countDepositStatusSearch($this->data->status, $this->data->key);
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
                        $this->data->data = $db->listDepositByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDepositSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDepositStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDepositStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }else{
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDeposit($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDepositSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listDepositStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listDepositStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        if($user_id) {
            $this->title = ucwords($this->data->status).' Deposits - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Deposits - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/billing/deposit';
        $this->renderView();
    }
    
    public function __postDeposit()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->amount) || !isset($data->status)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data->transaction = $data->transaction ? $data->transaction : null;
        $data->description = $data->description ? $data->description : null;
        if($data->status == 'Paid' && !$data->transaction) {
            $this->data->data = 'Transaction ID is required';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
        $deposit = $db->getUserDeposit($data->id);
        if(!$deposit) {
            $this->data->data = 'Not found!';
            $this->renderView();
        }
        if($deposit->status != 'Unpaid') {
            $this->data->data = 'Only Unpaid invoice is editable!';
            $this->renderView();
        }
        if(!$db->updateDeposit($data->id, $data->amount, $data->status, $data->transaction, $data->description)) {
            $this->data->data = 'Nothing changed!';
            $this->renderView();
        }
        if($data->status != 'Paid') {
            $this->data->success = true;
            $this->renderView();
        }
        
        $db->increaseUserDeposit($deposit->user_id, $data->amount);
        $db->depositAdvertiserBalance($deposit->user_id, $data->amount);
        $db->createBalanceHistory($deposit->user_id, 'Advertiser', $data->amount, 'Deposit invoice #'.$deposit->id);
        
        $this->data->success = true;
        $this->renderView();
    }

    public function withdraw()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Paid', 'Cancelled'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $status = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
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
                    $this->data->total = $db->countWithdrawByUser($user_id);
                } else {
                    $this->data->total = $db->countWithdrawSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countWithdrawStatusByUser($user_id, $this->data->status);
                } else {
                    $this->data->total = $db->countWithdrawStatusSearchByUser($user_id, $this->data->status, $this->data->key);
                }
            }
        }else{
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countWithdraw();
                } else {
                    $this->data->total = $db->countWithdrawSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countWithdrawStatus($this->data->status);
                } else {
                    $this->data->total = $db->countWithdrawStatusSearch($this->data->status, $this->data->key);
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
                        $this->data->data = $db->listWithdrawByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWithdrawSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listWithdrawStatusByUser($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWithdrawStatusSearchByUser($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }else{
                if ($this->data->status == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listWithdraw($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWithdrawSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listWithdrawStatus($this->data->status, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listWithdrawStatusSearch($this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        if($user_id) {
            $this->title = ucwords($this->data->status).' Withdraws - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->status).' Withdraws - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/billing/withdraw';
        $this->renderView();
    }

    public function receipt()
    {
        $this->data->key = $this->getRequest('q');
        $this->data->types = ['All', 'Automatic', 'Manual'];
        $user_id = (int) $this->getRequest('user_id');
        $this->data->user = null;
        $type = $this->uri[2] ? ucwords($this->uri[2]) : null;
        if($type && in_array($type, $this->data->types)) {
            $this->data->type = $type;
        } else {
            $this->data->type = 'All';
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
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
                    $this->data->total = $db->countReceiptByUser($user_id);
                } else {
                    $this->data->total = $db->countReceiptSearchByUser($user_id, $this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReceiptTypeByUser($user_id, $this->data->type);
                } else {
                    $this->data->total = $db->countReceiptTypeSearchByUser($user_id, $this->data->type, $this->data->key);
                }
            }
        }else{
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->total = $db->countReceipt();
                } else {
                    $this->data->total = $db->countReceiptSearch($this->data->key);
                }
            } else {
                if(!$this->data->key) {
                    $this->data->total = $db->countReceiptType($this->data->type);
                } else {
                    $this->data->total = $db->countReceiptTypeSearch($this->data->type, $this->data->key);
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
                        $this->data->data = $db->listReceiptByUser($user_id, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReceiptSearchByUser($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReceiptTypeByUser($user_id, $this->data->type, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReceiptTypeSearchByUser($user_id, $this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }else{
                if ($this->data->type == 'All') {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReceipt($pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReceiptSearch($this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                } else {
                    if(!$this->data->key) {
                        $this->data->data = $db->listReceiptType($this->data->type, $pagination->getInit(), $pagination->getLimit());
                    } else {
                        $this->data->data = $db->listReceiptTypeSearch($this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                    }
                }
            }
            
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        if($user_id) {
            $this->title = ucwords($this->data->type).' Receipts - #'.$user_id.' '.$this->data->user->name.' - Admin '.SITE_NAME;
        } else {
            $this->title = ucwords($this->data->type).' Receipts - Admin '.SITE_NAME;
        }
        $this->view = 'Admin/superAdmin/billing/receipt';
        $this->renderView();
    }
    
    public function __postReceipt()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id) || !isset($data->user_id) || !isset($data->amount) || !isset($data->campaign_id) || !isset($data->ad_id)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
        if($data->id) {
            if(!$db->updateReceipt($data->user_id, $data->id, $data->description, $data->amount, $data->campaign_id, $data->ad_id)) {
                $this->data->data = 'Nothing changed!';
                $this->renderView();
            }
        } else {
            try {
                $db->createReceipt($data->user_id, $data->description, $data->amount, $data->campaign_id, $data->ad_id, 'Manual');
            } catch(\Exception $e) {
                $this->data->data = 'Sorry, something was wrong, please try again or contact our support team';
                $this->renderView();
            }
        }
        
        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postReceiptDelete()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->uri[2];
        if(!$id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }

        $db = new \Model\Admin\superAdmin\Billing;
        if(!$db->deleteReceipt($id)) {
            $this->data->data = 'Receipt not found or not yours!';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->renderView();
    }
}
