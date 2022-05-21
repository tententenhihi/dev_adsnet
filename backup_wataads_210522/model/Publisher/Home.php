<?php

namespace Model\Publisher;

class Home extends \System\Db
{
    public function getPublisher($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getUserBalance($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_balance WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listLastAnnouncement($service, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, description, type, is_long, created_at FROM anouncement WHERE is_shown = 1 AND (service = "Global" OR service = :service) ORDER BY is_sticky DESC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastSupportService($user_id, $service, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, service, subject, status, updated_at FROM user_ticket WHERE user_id = :user_id AND (service = "Global" OR service = :service) ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastPublisherStatistic($user_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT website_id, zone_id, country, (impression + cpc_impression + cpa_impression) AS impression, click, conversion, revenue, reach, created_at FROM publisher_statistic WHERE user_id = :user_id AND created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getPublisherRevshare($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT revshare FROM publisher WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->revshare??null;
    }
}
