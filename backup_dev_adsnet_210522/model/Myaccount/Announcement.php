<?php

namespace Model\Myaccount;

class Announcement extends \System\Db
{
    public function countAnnouncement()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listAnnouncement($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, description, type, is_long, created_at FROM anouncement ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAnnouncementSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement WHERE subject LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listAnnouncementSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, description, type, is_long, created_at FROM anouncement WHERE subject LIKE :key ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAnnouncementService($service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement WHERE service = :service');
        $stmt->bindValue(':service', $service);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listAnnouncementService($service, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, description, type, is_long, created_at FROM anouncement WHERE service = :service ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAnnouncementServiceSearch($service, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement WHERE service = :service AND subject LIKE :key');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listAnnouncementServiceSearch($service, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, description, type, is_long, created_at FROM anouncement WHERE service = :service AND subject LIKE :key ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getAnnouncementMessage($id)
    {
        $stmt = $this->pdo->prepare('SELECT message FROM anouncement WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->message??'';
    }
}
