<?php

namespace Model\Myaccount;

class Home extends \System\Db
{
    public function listLastAnnouncement($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, description, type, is_long, created_at FROM anouncement WHERE is_shown = 1 ORDER BY is_sticky DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastActivity($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastSupport($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, status, updated_at FROM user_ticket WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getUserBalance($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_balance WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listLastBalance($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, amount, service, description, created_at FROM user_balance_history WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getPublisherRevshare($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT revshare FROM publisher WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->revshare??null;
    }
}
