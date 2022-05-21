<?php

namespace Model\Myaccount;

class Notification extends \System\Db
{
    public function countNotification($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotification($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND title LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id AND title LIKE :key ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationService($user_id, $service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND service = :service');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationService($user_id, $service, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id AND service = :service ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationServiceSearch($user_id, $service, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND service = :service AND title LIKE :key');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationServiceSearch($user_id, $service, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id AND service = :service AND title LIKE :key ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getNotification($id, $user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_notification WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function readNotification($id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_notification SET is_read = 1 WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function countUnreadNotification($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND is_read = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listUnreadNotification($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, created_at FROM user_notification WHERE user_id = :user_id AND is_read = 0 ORDER BY id DESC LIMIT 0, 10');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countUnreadNotificationByService($user_id, $service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND service = :service AND is_read = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listUnreadNotificationByService($user_id, $service)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, created_at FROM user_notification WHERE user_id = :user_id AND service = :service AND is_read = 0 ORDER BY id DESC LIMIT 0, 10');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function markAllRead($user_id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_notification SET is_read = 1 WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
}
