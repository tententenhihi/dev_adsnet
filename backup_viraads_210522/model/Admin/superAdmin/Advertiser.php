<?php

namespace Model\Admin\superAdmin;

class Advertiser extends \System\Db
{
    public function getUser($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    /* overview */
    public function countAdGroupByStatus()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt, status FROM advertiser_ad GROUP BY status');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countUserBalanceSumByDeposit()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt, SUM(deposit_value) AS deposit_value, SUM(receipt_value) AS receipt_value FROM user_balance WHERE deposit_value > 0');
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    /* campaign */
    public function countCampaign()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaign($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCampaignSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCampaignStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCampaignStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCampaignByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCampaignSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCampaignStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCampaignStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCampaignStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
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
    
    public function updateCampaign($id, $name, $description)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_campaign SET name = :name, description = :description WHERE id = :id');
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
    
    public function listAdByCampaignAndStatus($campaign_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format FROM advertiser_ad WHERE campaign_id = :campaign_id AND status = :status');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getCampaign($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS user_name FROM advertiser_campaign a JOIN user b ON a.user_id = b.id WHERE a.id = :id');
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
    
    /* ads */
    public function countAd()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAd($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countAdSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdByCampaign($campaign_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE campaign_id = :campaign_id');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdByCampaign($campaign_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.campaign_id = :campaign_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countAdSearchByCampaign($campaign_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE campaign_id = :campaign_id AND name LIKE :key');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdSearchByCampaign($campaign_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.campaign_id = :campaign_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusByCampaign($campaign_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE status = :status AND campaign_id = :campaign_id');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusByCampaign($campaign_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.campaign_id = :campaign_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusSearchByCampaign($campaign_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND campaign_id = :campaign_id AND name LIKE :key');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusSearchByCampaign($campaign_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.campaign_id = :campaign_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countAdSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdType()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_ad_type  ORDER BY id DESC LIMIT 9999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getAd($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS user_name FROM advertiser_ad a JOIN user b ON a.user_id = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getAdFormat($id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, status, creative_required FROM system_ad_format WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function listLastAdStatistic($ad_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, SUM(impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(cost) AS cost, SUM(reach) AS reach, created_at FROM advertiser_statistic WHERE ad_id = :ad_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 99999');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createAdType($name)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_ad_type (name) VALUES (:name)');
        $stmt->bindValue(':name', $name);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function unmapAdType($ad_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_ad_type WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function mapAdType($ad_id, $type_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_ad_type (ad_id, type_id) VALUES (:ad_id, :type_id)');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type_id', (int) $type_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function createAdSchedule($ad_id, $start_date, $status)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_ad_schedule (ad_id, start_date, status) VALUES (:ad_id, :start_date, :status)');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':start_date', $start_date);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function listAdStatusGroupByCampaign($campaign_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt, status FROM advertiser_ad WHERE campaign_id = :campaign_id GROUP BY status LIMIT 999');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function updateAdStatus($id, $status, $reject_reason = null)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad SET status = :status, reject_reason = :reject_reason WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':reject_reason', $reject_reason);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateCampaignStatus($id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_campaign SET status = :status WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateCampaignAbstract($id, $total_ad, $active_ad)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_campaign SET total_ad = total_ad + :total_ad, active_ad = active_ad + :active_ad WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':total_ad', (int) $total_ad, \PDO::PARAM_INT);
        $stmt->bindValue(':active_ad', (int) $active_ad, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateUserBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET adv_balance = adv_balance + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function createBalanceHistory($user_id, $service, $amount, $description = null)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_balance_history (user_id, service, amount, description) VALUES (:user_id, :service, :amount, :description)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateAdSchedule($ad_id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad_schedule SET status = :status WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function removeAdSchedule($ad_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_ad_schedule WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function isAdPending($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_ad_pending WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->id ?? null;
    }
    
    public function removeAdPending($ad_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_ad_pending WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function setAdStopping($user_id, $ad_id, $pricing_model)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_ad_stopping (user_id, ad_id, pricing_model) VALUES (:user_id, :ad_id, :pricing_model)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':pricing_model', $pricing_model);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function removeAdWarning($ad_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_ad_warning WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getCreative($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    /* creative */
    public function countCreative()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreative($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCreativeSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCreativeType($type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE type = :type');
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeType($type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id WHERE a.type = :type ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCreativeTypeSearch($type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE type = :type AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeTypeSearch($type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id WHERE a.type = :type AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCreativeByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id WHERE user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCreativeSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCreativeTypeByUser($user_id, $type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id AND type = :type');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeTypeByUser($user_id, $type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.type = :type ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countCreativeTypeSearchByUser($user_id, $type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id AND type = :type AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCreativeTypeSearchByUser($user_id, $type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_creative a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.type = :type AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    /* audience */
    public function countAudience()
    {
       
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudience($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAudienceSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudienceSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAudienceStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudienceStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAudienceStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudienceStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAudienceByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudienceByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAudienceSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudienceSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAudienceStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudienceStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAudienceStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAudienceStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM advertiser_audience a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listCountry()
    {
        $stmt = $this->pdo->prepare('SELECT code, name FROM system_country LIMIT 9999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listPlatform()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_platform LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listOs()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_os LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listBrowser()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_browser LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listMapPlatformOs()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_os_platform LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listMapOsBrowser()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_browser_os LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listCampaignForInfo($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM advertiser_campaign WHERE user_id = :user_id AND status != "Pending" AND status != "Rejected" LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAudienceForInfo($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_audience WHERE user_id = :user_id LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdForInfo($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, campaign_id, ad_format FROM advertiser_ad WHERE user_id = :user_id LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function verifyUserAds($user_id, $array)
    {
        $stmt = $this->pdo->prepare('SELECT id, campaign_id FROM advertiser_ad WHERE user_id = :user_id AND id IN ('.implode(',', $array).')');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function verifyUserCampaigns($user_id, $array)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_campaign WHERE user_id = :user_id AND id IN ('.implode(',', $array).')');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getTaskByNameAndId($task_name, $task_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, task_data, message, status FROM system_task WHERE task_name = :task_name AND task_id = :task_id');
        $stmt->bindValue(':task_name', $task_name);
        $stmt->bindValue(':task_id', $task_id);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function deleteTask($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_task WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function createTask($task_name, $task_id, $task_data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_task (task_name, task_id, task_data) VALUES (:task_name, :task_id, :task_data)');
        $stmt->bindValue(':task_name', $task_name);
        $stmt->bindValue(':task_id', $task_id);
        $stmt->bindValue(':task_data', $task_data);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }

    public function updateAdName($id, $name)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad SET name = :name WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->execute();

        return $stmt->rowCount();
    }
}