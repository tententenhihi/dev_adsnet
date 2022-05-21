<?php

namespace Model\Advertiser;

class Home extends \System\Db
{
    public function getAdvertiser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser WHERE user_id = :user_id');
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
    
    public function listLastAdvertiserStatistic($user_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT campaign_id, ad_id, country, impression, click, conversion, cost, reach, created_at FROM advertiser_statistic WHERE user_id = :user_id AND created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
