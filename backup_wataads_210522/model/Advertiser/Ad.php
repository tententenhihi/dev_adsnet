<?php

namespace Model\Advertiser;

class Ad extends \System\Db
{
    public function countAd($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAd($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countAdSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdByCampaign($user_id, $campaign_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdByCampaign($user_id, $campaign_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countAdSearchByCampaign($user_id, $campaign_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdSearchByCampaign($user_id, $campaign_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusByCampaign($user_id, $campaign_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND campaign_id = :campaign_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusByCampaign($user_id, $campaign_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND campaign_id = :campaign_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countAdStatusSearchByCampaign($user_id, $campaign_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND campaign_id = :campaign_id AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdStatusSearchByCampaign($user_id, $campaign_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE user_id = :user_id AND status = :status AND campaign_id = :campaign_id AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_format LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdFormatSVG()
    {
        $stmt = $this->pdo->prepare('SELECT id, name, svg, adv_description, status, pricing_model, creative_required FROM system_ad_format LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getCampaign($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM advertiser_campaign WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function listCountry()
    {
        $stmt = $this->pdo->prepare('SELECT code, name FROM system_country LIMIT 999');
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
    
    public function listAudience($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, duration FROM advertiser_audience WHERE user_id = :user_id LIMIT 999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getCreative($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
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
    
    public function getAudience($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_audience WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updateUserBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET adv_balance = adv_balance + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getUserAdvBalance($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT adv_balance FROM user_balance WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->adv_balance;
    }
    
    public function createAd($user_id, $campaign_id, $ad_format, $creative_id, $name, $pricing_model, $budget, $start_date, $end_date, $data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_ad (user_id, campaign_id, ad_format, creative_id, name, pricing_model, budget, start_date, end_date, data) 
        VALUES (:user_id, :campaign_id, :ad_format, :creative_id, :name, :pricing_model, :budget, :start_date, :end_date, :data)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':ad_format', (int) $ad_format, \PDO::PARAM_INT);
        $stmt->bindValue(':creative_id', $creative_id);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':pricing_model', $pricing_model);
        $stmt->bindValue(':budget', $budget);
        $stmt->bindValue(':start_date', $start_date);
        $stmt->bindValue(':end_date', $end_date);
        $stmt->bindValue(':data', $data);
        $stmt->execute();

        return $this->pdo->lastInsertId();
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
    
    public function updateAdvertiserAbstract($user_id, $abs_campaign, $abs_ad)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser SET abs_campaign = abs_campaign + :abs_campaign, abs_ad = abs_ad + :abs_ad WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':abs_campaign', (int) $abs_campaign, \PDO::PARAM_INT);
        $stmt->bindValue(':abs_ad', (int) $abs_ad, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateAdvertiserAbstractFirstAd($user_id, $first_ad)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser SET first_ad = :first_ad WHERE user_id = :user_id AND first_ad IS NULL');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':first_ad', $first_ad);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateAdvertiserAbstractLastAd($user_id, $last_ad)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser SET last_ad = :last_ad WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':last_ad', $last_ad);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function createBalanceHistory($user_id, $service, $amount, $description)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_balance_history (user_id, service, amount, description) VALUES (:user_id, :service, :amount, :description)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function getAd($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
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
    
    public function updateAdName($user_id, $id, $name)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad SET name = :name WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->execute();
        
        return $stmt->rowCount();
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
    
    public function updateAd($id, $creative_id, $name, $start_date, $end_date, $data)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad SET name = :name, creative_id = :creative_id, start_date = :start_date, end_date = :end_date, data = :data WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':creative_id', $creative_id);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':start_date', $start_date);
        $stmt->bindValue(':end_date', $end_date);
        $stmt->bindValue(':data', $data);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listAdStatusGroupByCampaign($campaign_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt, status FROM advertiser_ad WHERE campaign_id = :campaign_id GROUP BY status LIMIT 999');
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function updateCampaignStatus($id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_campaign SET status = :status WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->rowCount();
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
    
    public function removeAdSchedule($ad_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_ad_schedule WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getAdSchedule($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_ad_schedule WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updateAdSchedule($id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad_schedule SET status = :status WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
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
    
    public function checkConversionTracking($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_tracking WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? null;
    }
    
    public function setAdPending($user_id, $ad_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_ad_pending (user_id, ad_id) VALUES (:user_id, :ad_id)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
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
    
    public function removeAdWarning($ad_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_ad_warning WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
}