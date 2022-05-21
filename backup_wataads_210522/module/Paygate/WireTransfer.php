<?php

namespace Module\Paygate;

class WireTransfer
{
    protected $invoiceID;
    protected $amount;
    protected $bankDetails;
    
    public function __construct($invoiceID, $amount, $bankDetails)
    {
        $this->invoiceID = $invoiceID;
        $this->amount = $amount;
        $this->bankDetails = $bankDetails;
    }
    
    public function depositDisplay()
    {
        $html = '<div class="columns">';
        $html .= '<div class="column"></div>';
        $html .= '<div class="column is-narrow">';
        $html .= '<div class="notification is-info is-light">';
        $html .= 'Please make a payment to our bank account as bellow: <br />';
        $html .= nl2br($this->bankDetails).'<br />';
        $html .= 'Payment Amount: <strong>$'.$this->amount.'</strong><br />';
        $html .= 'Payment Description: <strong>TA'.$this->invoiceID.'</strong>';
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