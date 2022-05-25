<?php

namespace Model\Myaccount;

class Referral extends \System\Db
{
    public function sumUserReferral($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(referral_id) AS cnt, SUM(amount) AS amount FROM user_referral_payment WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row : (object) ['cnt' => 0, 'amount' => 0];
    }
    
    public function countReferral($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_referral WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listReferral($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.name, b.email, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment 
                                    FROM user_referral a JOIN user b ON a.ref_user_id = b.id 
                                    LEFT JOIN user_referral_payment c ON a.id = c.referral_id 
                                    WHERE a.user_id = :user_id 
                                    GROUP BY a.id 
                                    ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(a.id) AS cnt FROM user_referral a JOIN user b ON a.ref_user_id = b.id WHERE a.user_id = :user_id AND (b.name LIKE :name OR b.email = :email)');
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listReferralSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.name, b.email, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE a.user_id = :user_id AND (b.name LIKE :name OR b.email = :email) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_referral WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listReferralStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.name, b.email, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(a.id) AS cnt FROM user_referral a JOIN user b ON a.ref_user_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND (b.name LIKE :name OR b.email = :email)');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listReferralStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.name, b.email, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE a.user_id = :user_id AND a.status = :status AND (b.name LIKE :name OR b.email = :email) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralPayment($user_id, $referral_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_referral_payment WHERE user_id = :user_id AND referral_id = :referral_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':referral_id', (int) $referral_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listReferralPayment($user_id, $referral_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT commission, amount, created_at FROM user_referral_payment WHERE user_id = :user_id AND referral_id = :referral_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':referral_id', (int) $referral_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getUserFromReferral($id)
    {
        $stmt = $this->pdo->prepare('SELECT b.name, b.email FROM user_referral a JOIN user b ON a.ref_user_id = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }

    public function getTotalEarned($user_id)
    {
        $stmt = $this->pdo->prepare("SELECT sum(amount) as total_earned FROM user_referral_payment WHERE user_id = :user_id");
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->total_earned ?? 0;
    }

    public function getActiveReferrals($user_id)
    {
        $stmt = $this->pdo->prepare("SELECT COUNT(ref_user_id) as cnt FROM user_referral WHERE user_id = :user_id AND status = 'Active'");
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }

    public function getPendingReferrals($user_id)
    {
        $stmt = $this->pdo->prepare("SELECT COUNT(ref_user_id) as cnt FROM user_referral WHERE user_id = :user_id AND status = 'Pending'");
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }
}
