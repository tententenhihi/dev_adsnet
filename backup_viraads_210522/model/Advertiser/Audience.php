<?php

namespace Model\Advertiser;

class Audience extends \System\Db
{
    public function countAudience($user_id)
    {

        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }

    public function listAudience($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, duration, daily_reach, total_users, status, created_at FROM advertiser_audience WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function countAudienceSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }

    public function listAudienceSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, duration, daily_reach, total_users, status, created_at FROM advertiser_audience WHERE user_id = :user_id AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function countAudienceStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }

    public function listAudienceStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, duration, daily_reach, total_users, status, created_at FROM advertiser_audience WHERE user_id = :user_id AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function countAudienceStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }

    public function listAudienceStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, duration, daily_reach, total_users, status, created_at FROM advertiser_audience WHERE user_id = :user_id AND status = :status AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function updateAudience($user_id, $id, $name, $duration)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_audience SET name = :name, duration = :duration WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':duration', (int) $duration, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }

    public function addAudience($user_id, $name, $duration)
    {

        $stmt = $this->pdo->prepare('INSERT INTO advertiser_audience (user_id, name, duration) VALUES (:user_id, :name, :duration)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':duration', (int) $duration, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }

    public function archiveAudience($user_id, $id)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_audience SET status = "Archived" WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
}
