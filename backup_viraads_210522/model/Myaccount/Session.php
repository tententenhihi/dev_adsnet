<?php

namespace Model\Myaccount;

class Session extends \System\Db
{
    public function listActiveSession($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getUserSession($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function stopActiveSession($user_id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function stopUserSession($user_id, $id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function countSession($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSession($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionSearchCountry($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND country = :key');
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countSessionSearchIp($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND ip_address = :key');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionSearchCountry($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND country = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionSearchIp($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND ip_address = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionStatusSearchCountry($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND country = :key AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countSessionStatusSearchIp($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND ip_address = :key AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionStatusSearchCountry($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND country = :key AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionStatusSearchIp($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND ip_address = :key AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
