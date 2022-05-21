<?php

namespace Model\Admin\superAdmin;

class Referral extends \System\Db
{
    public function listReferral()
    {
        $stmt = $this->pdo->prepare("SELECT user.*, SUM(user_referral_payment.amount) as amount, referral.total_referral
                                     FROM user 
                                     JOIN (SELECT COUNT(*) AS total_referral, user_id FROM user_referral GROUP BY user_id ORDER BY ref_user_id) as referral ON user.id = referral.user_id
                                     JOIN user_referral ON user.id = user_referral.user_id 
                                     JOIN user_referral_payment ON user_referral.id = user_referral_payment.referral_id 
                                     GROUP BY user.id");
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
        $stmt = $this->pdo->prepare("SELECT user.name, user.email FROM user JOIN user_referral ON user_referral.ref_user_id = user.id WHERE user_referral.user_id = :id");
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}