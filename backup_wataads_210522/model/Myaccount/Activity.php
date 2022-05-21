<?php

namespace Model\Myaccount;

class Activity extends \System\Db
{
    public function countActivity($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivity($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivitySearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id AND ip_address LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivitySearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id AND ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivityType($user_id, $type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id AND type = :type');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivityType($user_id, $type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id AND type = :type ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivityTypeSearch($user_id, $type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id AND type = :type AND ip_address LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivityTypeSearch($user_id, $type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id AND type = :type AND ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
