<?php

namespace Model\Advertiser;

class Tracking extends \System\Db
{
    public function getTracking($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_tracking WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function createTracking($user_id, $token, $status = 'Inactive')
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_tracking (user_id, token, status) VALUES (:user_id, :token, :status)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':token', $token);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
}