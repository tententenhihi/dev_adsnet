<?php

namespace Model\Advertiser;

class Creative extends \System\Db
{
    public function countCreative($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreative($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCreativeSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE user_id = :user_id AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCreativeType($user_id, $type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id AND type = :type');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeType($user_id, $type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE user_id = :user_id AND type = :type ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCreativeTypeSearch($user_id, $type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id AND type = :type AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeTypeSearch($user_id, $type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE user_id = :user_id AND type = :type AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function addCreative($user_id, $name, $type, $thumb, $size, $url)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_creative (user_id, name, type, thumb, size, url) VALUES (:user_id, :name, :type, :thumb, :size, :url)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':thumb', $thumb);
        $stmt->bindValue(':size', $size);
        $stmt->bindValue(':url', $url);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateCreativeName($user_id, $id, $name)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_creative SET name = :name WHERE user_id = :user_id AND id = :id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function removeCreative($user_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_creative WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getCreative($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE user_id = :user_id AND id = :id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
}