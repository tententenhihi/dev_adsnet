<?php

namespace Model\Admin\superAdmin;

class Home extends \System\Db
{
    public function getAdmin($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM admin WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listLastActivity($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM admin_activity WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActiveAndPendingAds()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt, status FROM advertiser_ad WHERE status = "Active" OR status = "Pending" GROUP BY status');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countActiveAndPendingWebsites()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt, status FROM publisher_website WHERE status = "Active" OR status = "Pending" GROUP BY status');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countOpeningTicket()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt FROM user_ticket WHERE status = "Opening"');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function sumPaidAndPendingWithdraw()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt, SUM(amount) AS amount, status FROM user_withdraw WHERE status = "Paid" OR status = "Pending" GROUP BY status');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countActiveZone()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt FROM publisher_zone WHERE status = "Active"');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
}
