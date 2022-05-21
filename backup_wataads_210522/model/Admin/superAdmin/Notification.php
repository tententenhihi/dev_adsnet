<?php

namespace Model\Admin\superAdmin;

class Notification extends \System\Db
{
    public function countPendingAd()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt FROM advertiser_ad WHERE status = "Pending"');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countOpeningTicket()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt FROM user_ticket WHERE status = "Opening"');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countPendingWithdraw()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt FROM user_withdraw WHERE status = "Pending"');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countUnpaidDeposit()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt FROM user_deposit WHERE status = "Unpaid"');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countPendingWebsite()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt FROM publisher_website WHERE status = "Pending" AND is_verified = 1');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
}
