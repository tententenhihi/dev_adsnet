<?php

namespace Model\Advertiser;

class Campaign extends \System\Db
{
    public function countCampaign($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaign($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_campaign WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCampaignSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_campaign WHERE user_id = :user_id AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCampaignStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_campaign WHERE user_id = :user_id AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCampaignStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_campaign WHERE user_id = :user_id AND status = :status AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function abstractCampaign($campaign_id)
    {
        $stmt = $this->pdo->prepare('SELECT GROUP_CONCAT(DISTINCT pricing_model SEPARATOR ", ") AS pricing_model, MIN(start_date) AS start_date, MAX(end_date) AS end_date, SUM(budget) AS budget FROM advertiser_ad WHERE campaign_id = :campaign_id GROUP BY campaign_id');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function addCampaign($user_id, $name, $description)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_campaign (user_id, name, description) VALUES (:user_id, :name, :description)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function updateAdvertiserAbstract($user_id, $abs_campaign, $abs_ad)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser SET abs_campaign = abs_campaign + :abs_campaign, abs_ad = abs_ad + :abs_ad WHERE user_id = :user_id');
        $stmt->bindValue(':abs_campaign', (int) $abs_campaign, \PDO::PARAM_INT);
        $stmt->bindValue(':abs_ad', (int) $abs_ad, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateCampaign($user_id, $id, $name, $description)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_campaign SET name = :name, description = :description WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_format LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdByCampaignAndStatus($user_id, $campaign_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND campaign_id = :campaign_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getCampaign($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_campaign WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function listLastCampaignStatistic($campaign_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, SUM(impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(cost) AS cost, SUM(reach) AS reach, created_at FROM advertiser_statistic WHERE campaign_id = :campaign_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 99999');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}