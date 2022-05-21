<?php

namespace Module\Paygate;

class Internal
{
    protected $invoiceID;
    protected $amount;
    protected $account;
    protected $model = null;
    
    public function __construct($invoiceID, $amount, $account)
    {
        $this->invoiceID = $invoiceID;
        $this->amount = $amount;
        $this->account = $account;
    }
    
    public function initModel()
    {
        if(!$this->model) $this->model = new \Model\PayGate;
    }
    
    public function depositDisplay()
    {
        return '';
    }
    
    public function withdrawPay()
    {
        $this->initModel();
        $invoice = $this->model->getWithdraw($this->invoiceID);
        if(!$invoice) return false;
        
        $id = $this->model->createUserDeposit($invoice->user_id, $invoice->paygate_id, $this->amount, 'Paid', 'TA-PUB-'.$this->invoiceID, 'Paid on '.date('Y-m-d H:i:s'));
        $this->model->setWithdrawPaid($this->invoiceID, 'TA-ADV-'.$id);
        $this->model->increaseUserDeposit($invoice->user_id, $this->amount);
        $this->model->depositAdvertiserBalance($invoice->user_id, $this->amount);
        $this->model->createBalanceHistory($invoice->user_id, 'Advertiser', $this->amount, 'Deposit invoice #'.$id);
        
        return true;
    }
    
    public function withdrawNeedPayinfo()
    {
        return false;
    }
}