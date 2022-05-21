<?php

namespace Model\Admin\superAdmin;

class Announcement extends \System\Db
{
    public function countAnnouncement()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement');
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function countAnnouncementSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement WHERE service = :service OR subject LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':service', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function listAnnouncement($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM anouncement ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAnnouncementSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM anouncement WHERE service = :service OR subject LIKE :key ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $key);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAnnouncementType($type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement WHERE type = :type');
        $stmt->bindValue(':type', $type);
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function countAnnouncementTypeSearch($type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM anouncement WHERE type = :type AND (service = :service OR subject LIKE :key)');
        $stmt->bindValue(':service', $key);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function listAnnouncementType($type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM anouncement WHERE type = :type ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAnnouncementTypeSearch($type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM anouncement WHERE type = :type AND (service = :service OR subject LIKE :key) ORDER BY is_sticky DESC, is_shown DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $key);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function removeAnnouncement($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM anouncement WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function createAnnouncement($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO anouncement (subject, type, service, description, message, is_shown, is_sticky, is_long) VALUES (:subject, :type, :service, :description, :message, :is_shown, :is_sticky, :is_long)');
        $stmt->bindValue(':is_shown', (int) $data->is_shown, \PDO::PARAM_INT);
        $stmt->bindValue(':is_sticky', (int) $data->is_sticky, \PDO::PARAM_INT);
        $stmt->bindValue(':is_long', (int) $data->is_long, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $data->service);
        $stmt->bindValue(':subject', $data->subject);
        $stmt->bindValue(':type', $data->type);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':message', $data->message);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateAnnouncement($data)
    {
        $stmt = $this->pdo->prepare('UPDATE anouncement SET subject = :subject, type = :type, service = :service, description = :description, message = :message, is_shown = :is_shown, is_sticky = :is_sticky, is_long = :is_long WHERE id = :id');
        $stmt->bindValue(':is_shown', (int) $data->is_shown, \PDO::PARAM_INT);
        $stmt->bindValue(':is_sticky', (int) $data->is_sticky, \PDO::PARAM_INT);
        $stmt->bindValue(':is_long', (int) $data->is_long, \PDO::PARAM_INT);
        $stmt->bindValue(':subject', $data->subject);
        $stmt->bindValue(':type', $data->type);
        $stmt->bindValue(':service', $data->service);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':message', $data->message);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
}