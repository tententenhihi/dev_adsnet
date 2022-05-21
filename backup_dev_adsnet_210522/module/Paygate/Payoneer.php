<?php

namespace Module\Paygate;

class Payoneer
{
    protected $invoiceID;
    protected $amount;
    protected $account;
    protected $payUrl = 'https://myaccount.payoneer.com/ma/pay/makeapayment';
    
    public function __construct($invoiceID, $amount, $account)
    {
        $this->invoiceID = $invoiceID;
        $this->amount = $amount;
        $this->account = $account;
    }
    
    public function depositDisplay()
    {
        $html = '<div class="columns">';
        $html .= '<div class="column"></div>';
        $html .= '<div class="column is-narrow">';
        $html .= '<div class="notification is-info is-light">';
        $html .= 'Please make a payment from your Payoneer Account as bellow: <br />';
        $html .= 'Payment To: <strong>'.$this->account.'</strong><br />';
        $html .= 'Payment Amount: <strong>$'.$this->amount.'</strong><br />';
        $html .= 'Payment Description: <strong>TA'.$this->invoiceID.'</strong><br />';
        $html .= '<div class="buttons is-centered"><a class="button is-success" target="_blank" href="'.$this->payUrl.'">Go to Payoneer</a></div>';
        $html .= '</div></div>';
        $html .= '<div class="column"></div>';
        $html .= '</div>';
        
        return $html;
    }
    
    public function withdrawPay()
    {
        return false;
    }
    
    public function withdrawNeedPayinfo()
    {
        return true;
    }
}