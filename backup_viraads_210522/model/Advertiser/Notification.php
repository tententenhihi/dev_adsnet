<?php

namespace Model\Advertiser;

class Notification extends \System\Db
{
    
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
    
    public function countUnreadNotificationByService($user_id, $service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND service = :service AND is_read = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listUnreadNotificationByService($user_id, $service)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, created_at FROM user_notification WHERE user_id = :user_id AND service = :service AND is_read = 0 ORDER BY id DESC LIMIT 0, 10');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
