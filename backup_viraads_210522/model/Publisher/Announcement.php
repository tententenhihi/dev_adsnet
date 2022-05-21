<?php

namespace Model\Myaccount;

class Announcement extends \System\Db
{
    public function getAnnouncementMessage($id)
    {
        $stmt = $this->pdo->prepare('SELECT message FROM anouncement WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->message??'';
    }
}
