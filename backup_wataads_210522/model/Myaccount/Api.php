<?php

namespace Model\Myaccount;

class Api extends \System\Db
{
    public function countApi($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listApi($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_api WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id AND api_token = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listApiSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_api WHERE user_id = :user_id AND api_token = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listApiStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_api WHERE user_id = :user_id AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id AND status = :status AND api_token = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listApiStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_api WHERE user_id = :user_id AND status = :status AND api_token = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createUserApi($user_id, $api_token, $description, $service, $status)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_api (user_id, api_token, description, service, status) VALUES (:user_id, :api_token, :description, :service, :status)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':api_token', $api_token);
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateUserApi($user_id, $id, $description, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE user_api SET description = :description, status = :status WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function deleteUserApi($user_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM user_api WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
}
