<?php

namespace Controller\Myaccount;

class Billing extends Controller
{
    public function index()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data->balance = $db->getUserBalance($user_id);
        $this->data->history = $db->listBalance($user_id, 0, 20);
        $this->data->deposit = $db->listDeposit($user_id, 0, 20);
        $this->data->receipt = $db->listReceipt($user_id, 0, 20);
        $this->data->withdraw = $db->listWithdraw($user_id, 0, 20);
        $this->data->revshare = $db->getPublisherRevshare($user_id) ?? DEFAULT_REVSHARE;
        
        $this->helper = new \Module\Helper;
        $this->title = 'Billing Overview - '.SITE_NAME;
        $this->view = 'Myaccount/billing/index';
        $this->renderView();
    }
    
    public function balance()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data->services = ['All', 'Advertiser', 'Publisher'];
        $service = $this->uri[2] ? ucwords($this->uri[2]) : null;
        
        if(in_array($service, $this->data->services)) {
            $this->data->service = $service;
        } else {
            $this->data->service = 'All';
        }
        if ($this->data->service == 'All') {
            $this->data->total = $db->countBalance($user_id);
        } else {
            $this->data->total = $db->countBalanceService($user_id, $this->data->service);
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->service == 'All') {
                $this->data->data = $db->listBalance($user_id, $pagination->getInit(), $pagination->getLimit());
            } else {
                $this->data->data = $db->listBalanceService($user_id, $this->data->service, $pagination->getInit(), $pagination->getLimit());
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }
        
        $this->helper = new \Module\Helper;
        $this->title = 'My Balances - '.SITE_NAME;
        $this->view = 'Myaccount/billing/balance';
        $this->renderView();
    }

    public function receipt()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data->key = $this->getRequest('q');
        $this->data->types = ['All', 'Automatic', 'Manual'];
        $type = $this->uri[2] ? ucwords($this->uri[2]) : null;
        
        if($type && in_array($type, $this->data->types)) {
            $this->data->type = $type;
        } else {
            $this->data->type = 'All';
        }
        if ($this->data->type == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countReceipt($user_id);
            } else {
                $this->data->total = $db->countReceiptSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countReceiptType($user_id, $this->data->type);
            } else {
                $this->data->total = $db->countReceiptTypeSearch($user_id, $this->data->type, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->type == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listReceipt($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listReceiptSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listReceiptType($user_id, $this->data->type, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listReceiptTypeSearch($user_id, $this->data->type, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        $this->title = $this->data->type.' Receipts - '.SITE_NAME;
        $this->view = 'Myaccount/billing/receipt';
        $this->renderView();
    }

    public function deposit()
    {
        if($this->uri[2] == 'history') return $this->depositHistory();
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data->balance = $db->getUserBalance($user_id);
        $this->data->balance->adv_pending = $this->data->balance->deposit_value - $this->data->balance->receipt_value - $this->data->balance->adv_balance;
        $this->data->paygate = $db->listPaygate('Deposit');
        
        $this->helper = new \Module\Helper;
        $this->title = 'Deposit Money - '.SITE_NAME;
        $this->view = 'Myaccount/billing/deposit';
        $this->renderView();
    }
    
    public function __postDeposit()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $paygate_id = (int) $this->postRequest('paygate_id');
        $amount = (float) $this->postRequest('amount');
        if(!$paygate_id || !$amount) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Myaccount\Billing;
        if(!($paygate = $db->getPaygateById($paygate_id)) || $paygate->type != 'Deposit' || $paygate->status != 'Active') {
            $this->data->data = 'Deposit method is not supported!!!';
            $this->renderView();
        }
        if($amount < $paygate->min_value || $amount > $paygate->max_value) {
            $this->data->data = 'Amount to deposit is invalid, should be beetween min and max amount!!!';
            $this->renderView();
        }
        
        $id = $db->createUserDeposit($user_id, $paygate->id, $amount, 'Unpaid');
        $db->logActivity($user_id, 'Billing', 'Deposit $'.$amount.' via '.$paygate->name.' has been requested (invoice #'.$id.') from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
        $this->data->success = true;
        $this->data->data = '/billing/invoice/'.$id;
        $this->renderView();
    }
    
    public function invoice()
    {
        $id = (int) $this->uri[2];
        if(!$id) $this->redirectTo('/billing');
        
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data = $db->getUserDeposit($user_id, $id);
        $this->fullPage = true;
        if(!$this->data) {
            $this->view = 'Global/403';
            $this->renderView();
        }
        
        $this->data->user = $db->getUserById($user_id);
        $this->helper = new \Module\Helper;
        
        if($this->data->status == 'Unpaid') {
            $module = '\\Module\\Paygate\\'.str_replace(' ', '', ucwords($this->data->paygate_name));
            $this->data->module = new $module($this->data->id, $this->data->amount, $this->data->information);
        }
        
        $this->view = 'Myaccount/billing/invoice';
        $this->renderView();
    }

    public function depositHistory()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Unpaid', 'Paid', 'Cancelled'];
        $status = $this->uri[3] ? ucwords($this->uri[3]) : null;
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countDeposit($user_id);
            } else {
                $this->data->total = $db->countDepositSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countDepositStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countDepositStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listDeposit($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listDepositSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listDepositStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listDepositStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        $this->title = $this->data->status.' Deposits - '.SITE_NAME;
        $this->view = 'Myaccount/billing/deposit_history';
        $this->renderView();
    }

    public function withdraw()
    {
        if($this->uri[2] == 'history') return $this->withdrawHistory();
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data->balance = $db->getUserBalance($user_id);
        $this->data->paygate = $db->listPaygate('Withdraw');
        $this->data->user_payinfo = $db->listUserPayinfo($user_id);
        $this->data->revshare = $db->getPublisherRevshare($user_id) ?? DEFAULT_REVSHARE;
        
        $this->helper = new \Module\Helper;
        $this->title = 'Withdraw Money - '.SITE_NAME;
        $this->view = 'Myaccount/billing/withdraw';
        $this->renderView();
    }

    public function withdrawHistory()
    {
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        
        $this->data->key = $this->getRequest('q');
        $this->data->statuses = ['All', 'Pending', 'Paid', 'Cancelled'];
        $status = $this->uri[3] ? ucwords($this->uri[3]) : null;
        
        if($status && in_array($status, $this->data->statuses)) {
            $this->data->status = $status;
        } else {
            $this->data->status = 'All';
        }
        if ($this->data->status == 'All') {
            if(!$this->data->key) {
                $this->data->total = $db->countWithdraw($user_id);
            } else {
                $this->data->total = $db->countWithdrawSearch($user_id, $this->data->key);
            }
        } else {
            if(!$this->data->key) {
                $this->data->total = $db->countWithdrawStatus($user_id, $this->data->status);
            } else {
                $this->data->total = $db->countWithdrawStatusSearch($user_id, $this->data->status, $this->data->key);
            }
        }

        if ($this->data->total) {
            $pagination = new \Module\Pagination();
            $pagination->setLimit(20);
            $pagination->setTotal($this->data->total);
            $this->data->pagination = $pagination->setup();
            if ($this->data->status == 'All') {
                if(!$this->data->key) {
                    $this->data->data = $db->listWithdraw($user_id, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listWithdrawSearch($user_id, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            } else {
                if(!$this->data->key) {
                    $this->data->data = $db->listWithdrawStatus($user_id, $this->data->status, $pagination->getInit(), $pagination->getLimit());
                } else {
                    $this->data->data = $db->listWithdrawStatusSearch($user_id, $this->data->status, $this->data->key, $pagination->getInit(), $pagination->getLimit());
                }
            }
        } else {
            $this->data->pagination = '';
            $this->data->data = [];
        }

        $this->helper = new \Module\Helper;
        $this->title = $this->data->status.' Withdraws - '.SITE_NAME;
        $this->view = 'Myaccount/billing/withdraw_history';
        $this->renderView();
    }

    public function __postWithdraw()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $user_id = $this->getSession('id');
        $data = json_decode($this->postRequest('data'));
        if(!$data) {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $db = new \Model\Myaccount\Billing;
        if(!isset($data->paygate_id) || !($paygate = $db->getPaygateById($data->paygate_id)) || $paygate->type != 'Withdraw' || $paygate->status != 'Active') {
            $this->data->data = 'Withdraw method is not supported!!!';
            $this->renderView();
        }
        
        $data->amount = (float) $data->amount;
        if($data->amount < $paygate->min_value || $data->amount > $paygate->max_value) {
            $this->data->data = 'Amount to withdraw is invalid, should be beetween min and max amount!!!';
            $this->renderView();
        }
        
        $db->updatePublisherBalance($user_id, -$data->amount);
        $balance = $db->getUserBalance($user_id);
        if($balance->pub_balance <= 0) {
            $db->updatePublisherBalance($user_id, $data->amount);
            $this->data->data = 'You have insufficient balance to withdraw $'.$data->amount;
            $this->renderView();
        }

        /* create invoice */
        $id = $db->createUserWithdraw($user_id, $paygate->id, $data->amount, 'Pending');
        $db->createBalanceHistory($user_id, 'Publisher', -$data->amount, 'Withdraw invoice #'.$id);
        $db->increaseUserWithdraw($user_id, $data->amount);
        $db->logActivity($user_id, 'Billing', 'Withdraw $'.$data->amount.' to '.$paygate->name.' has been requested from '.$this->getBrowser().' ('.$this->getCountry().')', $this->getIpAddress());
        
        /* call module */
        $payinfo = $db->getUserPayinfo($user_id, $paygate->id);
        $module = '\\Module\\Paygate\\'.str_replace(' ', '', ucwords($paygate->name));
        $module = new $module($id, $data->amount, $payinfo);
        $paid = $module->withdrawPay();
        
        if($module->withdrawNeedPayinfo()) {
            unset($data->amount);
            unset($data->paygate_id);
            $db->createUserPayinfo($user_id, $paygate->id, json_encode($data));
        }
        
        if($paid) {
            $description = 'We have paid your withdraw #'.$id.' with amount $'.$data->amount.' successfully!. Once again, thank you for chosing our service and hope you enjoy it'.PHP_EOL.PHP_EOL.'Best Regards';
            $db->createNotification($user_id, 'success', 'Publisher', 'Withdraw #'.$id.' has been paid', $description);
        } else {
            /* send email to admin */
            $permissions = \Controller\Admin\superAdmin\Roles::canPayWithrawInvoice();
//            if($permissions) {
//                $admins = $db->listAdminByPermission($permissions);
//                if($admins) {
//                    $emails = [];
//                    foreach($admins as $admin) $emails[] = $admin->email;
//                    (new \Module\Email)
//                        ->subject('Withraw pending for payment')
//                        ->message('Check it out: '.ADMIN_URL.'/billing/withdraw')
//                        ->sendTo($emails)
//                        ->send();
//                }
//            }
        }
        
        $this->data->success = true;
        $this->data->data = '/billing/withdraw/history';
        $this->renderView();
    }
    
    public function __postInvoice()
    {
        $this->checkReadOnly();
        $this->jsonResponse = true;
        $this->data->success = false;
        
        $id = (int) $this->uri[2];
        $act = $this->postRequest('act');
        if(!$id || $act != 'cancel') {
            $this->data->data = 'Bad request!!!';
            $this->renderView();
        }
        
        $user_id = $this->getSession('id');
        $db = new \Model\Myaccount\Billing;
        if(!$db->setDepositStatus($user_id, $id, 'Cancelled')) {
            $this->data->data = 'Invoice is not suitable for cancelling, or not yours';
            $this->renderView();
        }
        
        $this->data->success = true;
        $this->data->data = '/billing/invoice/'.$id;
        $this->renderView();
    }
    
    public function __postPaypal()
    {
        $this->jsonResponse = true;
        $this->data->success = false;
        $transaction_id = $this->uri[2];
        $user_id = $this->getSession('id');

        $module = new \Module\Paygate\Paypal(null, null, null);
        $order = $module->getOrder($transaction_id);
        if(!$order) {
            $this->data->data = 'Transaction ID does not found!';
            $this->renderView();
        }
        
        $db = new \Model\Myaccount\Billing;
        if(!($invoice = $db->getUserDeposit($user_id, $order->invoice_id)) || $invoice->status != 'Unpaid') {
            $this->data->data = 'Invoice not found or not suitable for payment';
            $this->renderView();
        }
        
        $db->updateDeposit($invoice->id, 'Paid', $transaction_id, $order->net_amount, 'Paid on '.date('Y-m-d H:i:s'));
        $db->depositAdvertiserBalance($user_id, $order->net_amount);
        $db->increaseUserDeposit($user_id, $order->net_amount);
        $db->createBalanceHistory($user_id, 'Advertiser', $order->net_amount, 'Deposit via Paypal, invoice #'.$invoice->id);
        $description = 'You have paid your deposit invoice #'.$invoice->id.' with amount $'.$order->net_amount.' successfully! Your Advertiser Balance has been updated and ready to use. Once again, thank you for chosing our service and hope you enjoy it'.PHP_EOL.PHP_EOL.'Best Regards';
        $db->createNotification($user_id, 'success', 'Advertiser', 'Deposit #'.$invoice->id.' has been paid', $description);
        
        $this->data->success = true;
        $this->renderView();
    }
}
