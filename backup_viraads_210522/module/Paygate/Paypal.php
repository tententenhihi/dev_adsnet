<?php

namespace Module\Paygate;

class Paypal
{
    protected $baseUrl = 'https://api.sandbox.paypal.com';
    protected $clientId = 'AWniVHyeGSaREkkXusGaQND5bDz0YtAcW1SaxL0pICB9MGI8NQkFPqafpOwICNZaw4lIrWIdknLVpK3b';
    protected $clientSecret = 'EGvZvpV9p28NHZr-Wx61_I_Nk67Nm9vxHG-7q8nOh_RcI0QCD4Pev-TA2fKC1wVTrVoWRgQd_Ypb1-j3';
    protected $merchantId = 'ZQJ2Z2PYHXQ3Y';
    protected $invoiceId;
    protected $amount;
    protected $account;
    protected $client;
    protected $model = null;
    protected $payUrl = 'https://www.paypal.com/myaccount/';
    
    public function __construct($invoiceId, $amount, $account)
    {
        $this->invoiceId = $invoiceId;
        $this->amount = $amount;
        $this->account = $account;
        $this->client = new \GuzzleHttp\Client([
            'base_uri' => $this->baseUrl,
            'http_errors' => false,
            'timeout' => 60
        ]);
    }
    
    public function initModel()
    {
        if(!$this->model) $this->model = new \Model\PayGate;
    }
    
    public function depositDisplay()
    {
        $html = '<div class="columns">';
        $html .= '<div class="column"></div>';
        $html .= '<div class="column is-narrow">';
        $html .= '<div class="notification is-info is-light">';
        $html .= 'Please make a payment from your Paypal Account as bellow: <br />';
        $html .= 'Payment To: <strong>'.$this->account.'</strong><br />';
        $html .= 'Payment Amount: <strong>$'.$this->amount.'</strong><br />';
        $html .= 'Payment Description: <strong>TA'.$this->invoiceId.'</strong><br />';
        $html .= '<div class="buttons is-centered"><a class="button is-success" target="_blank" href="'.$this->payUrl.'">Go to Paypal</a></div>';
        $html .= '</div></div>';
        $html .= '<div class="column"></div>';
        $html .= '</div>';
        
        return $html;
    }
    
    public function withdrawPay()
    {
        $this->initModel();
        $invoice = $this->model->getWithdraw($this->invoiceId);
        if(!$invoice) return false;
        
        return false;
        
        $this->model->setWithdrawPaid($this->invoiceId);
        return true;
    }
    
    public function withdrawNeedPayinfo()
    {
        return true;
    }

    public function getOrder($orderId)
    {
        try {
            $res = $this->client->request('GET', '/v2/checkout/orders/'.$orderId, [
                'headers' => [
                    'Authorization'     => $this->getAccessToken(),
                    'Content-Type'      => 'application/json'
                ]
            ]);
            $res = json_decode((string) $res->getBody());
            if(!isset($res->purchase_units[0]->payments->captures[0]->seller_receivable_breakdown->net_amount->value)) return null;
            if($res->purchase_units[0]->payee->merchant_id != $this->merchantId) return null;
            if($res->status != 'COMPLETED') return null;
            return (object) ['invoice_id' => str_replace('TA','',$res->purchase_units[0]->invoice_id), 'net_amount' => $res->purchase_units[0]->payments->captures[0]->seller_receivable_breakdown->net_amount->value];
        } catch(\Exception $e) {
            return null;
        }
    }
    
    private function getAccessToken()
    {
        $tokenFile = __DIR__.'/Paypal.txt';
        if(is_file($tokenFile)) {
            $json = json_decode(file_get_contents($tokenFile));
            if(isset($json->access_token) && isset($json->expired)) {
                if (time() <= $json->expired) {
                    return $json->access_token;
                } else {
                    unlink($tokenFile);
                }
            }
        }

        $headers = [];
        $headers[] = 'Accept: application/json';
        $headers[] = 'Accept-Language: en_US';
        $headers[] = 'Content-Type: application/x-www-form-urlencoded';
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->baseUrl.'/v1/oauth2/token');
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");
        curl_setopt($ch, CURLOPT_USERPWD, $this->clientId . ':' . $this->clientSecret);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        
        $result = curl_exec($ch);
        $error = curl_errno($ch);
        curl_close($ch);
        if ($error) return null;
		$json = json_decode($result);
		if(!isset($json->access_token)) return null;
		$json->access_token = $json->token_type.' '.$json->access_token;
		file_put_contents($tokenFile, json_encode(['access_token' => $json->access_token, 'expired' => time() + $json->expires_in]));
		
		return $json->access_token;
    }
}