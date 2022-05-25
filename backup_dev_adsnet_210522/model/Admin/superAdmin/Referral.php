<?php

namespace Model\Admin\superAdmin;

class Referral extends \System\Db
{
    public function listReferral($init, $limit)
    {
        $stmt = $this->pdo->prepare("SELECT user.*, SUM(user_referral_payment.amount) as amount, referral.total_referral
                                     FROM user 
                                     JOIN (SELECT COUNT(*) AS total_referral, user_id FROM user_referral GROUP BY user_id ORDER BY ref_user_id) as referral ON user.id = referral.user_id
                                     JOIN user_referral ON user.id = user_referral.user_id 
                                     JOIN user_referral_payment ON user_referral.id = user_referral_payment.referral_id 
                                     GROUP BY user.id
                                     LIMIT :init, :limit");
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function listReferralSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare("SELECT user.*, SUM(user_referral_payment.amount) as amount, referral.total_referral
                                     FROM user 
                                     JOIN (SELECT COUNT(*) AS total_referral, user_id FROM user_referral GROUP BY user_id ORDER BY ref_user_id) as referral ON user.id = referral.user_id
                                     JOIN user_referral ON user.id = user_referral.user_id 
                                     JOIN user_referral_payment ON user_referral.id = user_referral_payment.referral_id 
                                     WHERE user.name LIKE :key OR user.email LIKE :key
                                     GROUP BY user.id
                                     LIMIT :init, :limit");
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function listReferralPublisher()
    {
        $stmt = $this->pdo->prepare("SELECT user.name, user.email, SUM(user_referral_payment.amount) as amount 
                                     FROM user 
                                     JOIN user_referral ON user.id = user_referral.user_id 
                                     JOIN user_referral_payment ON user_referral.id = user_referral_payment.referral_id 
                                     WHERE user_referral_payment.source = 'Publisher'
                                     GROUP BY user.id");
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function listReferralAdvertiser()
    {
        $stmt = $this->pdo->prepare("SELECT user.name, user.email, SUM(user_referral_payment.amount) as amount 
                                     FROM user 
                                     JOIN user_referral ON user.id = user_referral.user_id 
                                     JOIN user_referral_payment ON user_referral.id = user_referral_payment.referral_id 
                                     WHERE user_referral_payment.source = 'Advertiser'
                                     GROUP BY user.id");
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function getReferralDetail($id)
    {
        $stmt = $this->pdo->prepare("SELECT b.name, b.email, SUM(c.amount) AS amount
                                    FROM user_referral a JOIN user b ON a.ref_user_id = b.id 
                                    LEFT JOIN user_referral_payment c ON a.id = c.referral_id 
                                    WHERE a.user_id = :id 
                                    GROUP BY a.id 
                                    ORDER BY a.id DESC");
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function totalReferral()
    {
        $stmt = $this->pdo->prepare("SELECT COUNT(user.id) as total_referral 
                                     FROM user 
                                     JOIN(SELECT user_id FROM user_referral GROUP BY user_id) as user_referral ON user_referral.user_id = user.id");
        $stmt->execute();

        return $stmt->fetch()->total_referral ?? 0;
    }

    public function totalAmount()
    {
        $stmt = $this->pdo->prepare("SELECT sum(amount) as total_amount FROM user_referral_payment");
        $stmt->execute();

        return $stmt->fetch()->total_amount ?? 0;
    }

    public function totalPublisherAmount()
    {
        $stmt = $this->pdo->prepare("SELECT sum(amount) as total_publisher_amount FROM user_referral_payment WHERE source = 'Publisher';");
        $stmt->execute();

        return $stmt->fetch()->total_publisher_amount ?? 0;
    }

    public function totalAdvertiserAmount()
    {
        $stmt = $this->pdo->prepare("SELECT sum(amount) as total_advertiser_amount FROM user_referral_payment WHERE source = 'Advertiser';");
        $stmt->execute();

        return $stmt->fetch()->total_advertiser_amount ?? 0;
    }
}