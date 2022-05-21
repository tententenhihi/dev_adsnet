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

        /* accountant */
        $this->data->totalIncome = $db->sumAccountantData('Income');
        $this->data->totalExpense = $db->sumAccountantData('Expense');
        $this->data->totalProfit = $this->data->totalIncome - $this->data->totalExpense;
        $this->data->thisMonthIncome = $db->sumAccountantDataByMonth('Income', date('Y-m-01'));
        $this->data->thisMonthExpense = $db->sumAccountantDataByMonth('Expense', date('Y-m-01'));
        $this->data->thisMonthProfit = $this->data->thisMonthIncome - $this->data->thisMonthExpense;
        $this->data->lastMonthIncome = $db->sumAccountantDataByMonth('Income', date('Y-m-01', strtotime('-1 month')));
        $this->data->lastMonthExpense = $db->sumAccountantDataByMonth('Expense', date('Y-m-01', strtotime('-1 month')));
        $this->data->lastMonthProfit = $this->data->lastMonthIncome - $this->data->lastMonthExpense;
        $this->data->twoMonthsAgoIncome = $db->sumAccountantDataByMonth('Income', date('Y-m-01', strtotime('-2 months')));
        $this->data->twoMonthsAgoExpense = $db->sumAccountantDataByMonth('Expense', date('Y-m-01', strtotime('-2 months')));
        $this->data->twoMonthsAgoProfit = $this->data->twoMonthsAgoIncome - $this->data->twoMonthsAgoExpense;
        $this->data->incomes = $db->listLatestAccountantData('Income', 10);
        $this->data->expenses = $db->listLatestAccountantData('Expense', 10);

        /* balance */
        $this->data->totalPublisher = $db->countPublisher();
        $this->data->totalAdvertiser = $db->countPublisher();
        $this->data->sumBalance = $db->sumUserBalance();

        $this->title = 'Billing Overview - '.SITE_NAME;
        $this->view = 'Admin/superAdmin/billing/index';
        $this->renderView();
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

        $userReferral = $db->getUserReferral($deposit->user_id);
        if($userReferral->count === 1){
            $commission = REFERRAL_COMMISSION;
            $source = 'Advertiser';
            $amount = $data->amount * $commission;
            $db->createUserReferralPayment($userReferral->user_id, $userReferral->id, $source, $commission, $amount);
            $db->depositAdvertiserBalance($userReferral->user_id, $amount);
        }

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
    
    public function __postPayinfo()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = (int) $this->postRequest('user_id');
        $paygate_id = (int) $this->postRequest('paygate_id');
        
        if(!$user_id || !$paygate_id) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
        $this->data->data = $db->getUserPayinfo($user_id, $paygate_id);
        if(!$this->data->data) {
            $this->data->data = 'Not found!';
            $this->renderView();
        }

        $this->data->success = true;
        $this->renderView();
    }
    
    public function __postWithdraw()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $data = json_decode($this->postRequest('data'));
        if(!isset($data->id)) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        $data->transaction = $data->transaction ?? null;
        $data->description = $data->description ?? null;
        if(!$data->transaction) {
            $this->data->data = 'Transaction ID is required';
            $this->renderView();
        }
        
        $db = new \Model\Admin\superAdmin\Billing;
        $withdraw = $db->getUserWithdraw($data->id);
        if(!$withdraw) {
            $this->data->data = 'Not found!';
            $this->renderView();
        }
        if($withdraw->status != 'Pending') {
            $this->data->data = 'Only Pending invoice is payable!';
            $this->renderView();
        }
        if(!$db->updateWithdraw($data->id, 'Paid', $data->transaction, $data->description)) {
            $this->data->data = 'Nothing changed!';
            $this->renderView();
        }
        
        $description = 'We have paid your withdraw #'.$withdraw->id.' with amount $'.$withdraw->amount.' successfully!. Once again, thank you for chosing our service and hope you enjoy it'.PHP_EOL.PHP_EOL.'Best Regards';
        $db->createNotification($withdraw->user_id, 'success', 'Publisher', 'Withdraw #'.$withdraw->id.' has been paid', $description);
        
        $this->data->success = true;
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

    public function depositPub(){
        $db = new \Model\Admin\superAdmin\Billing;
        $get_all_referral_user = $db->getAllReferralUser();

        foreach($get_all_referral_user as $referral_user) {
            $check_publisher_statistic = $db->checkPublisherStatistic($referral_user->ref_user_id);
            foreach($check_publisher_statistic as $check){
                if($check === 0){
                    echo $referral_user->ref_user_id . 'User nay khong co tien';
                }else{
                    $today = date('Y-m-d');
                    $create_at = strtotime(date("Y-m-d", strtotime($today)) . " -1 day");
                    $create_at = strftime("%Y-%m-%d", $create_at);

                    $total_revenue = $db->getPublisherStatistic($referral_user->ref_user_id, $create_at);

                    $commission = REFERRAL_PUB_COMMISSION;
                    $source = 'Publisher';
                    $amount = $total_revenue->total * $commission;

                    if($total_revenue->total !== null){
                        $db->createUserReferralPayment($referral_user->user_id, $referral_user->id, $source, $commission, $amount);
                        $db->depositPublisherBalance($referral_user->user_id, $amount);
                    }
                }
            }
        }
die();

        $today = date('Y-m-d');
        $create_at = strtotime(date("Y-m-d", strtotime($today)) . " -1 day");
        $create_at = strftime("%Y-%m-%d", $create_at);
        $b = $db->getPublisherStatistic($a->ref_user_id, $create_at);

//        $userReferral = $db->getUserReferral($a->ref_user_id);
        $commission = REFERRAL_PUB_COMMISSION;
        $source = 'Publisher';
        $amount = $b->total * $commission;
//        var_dump($a->ref_user_id, $a->id, $source, $commission, $amount, $b->total); die();
        $db->createUserReferralPayment($a->ref_user_id, $a->id, $source, $commission, $amount);
        $db->depositPublisherBalance($a->user_id, $amount);

        var_dump($b->total, $create_at);die();
    }
}
