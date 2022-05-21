<?php

namespace Model\Api;

class V1 extends \System\Db
{
    public function getUser($api_token)
    {
        $stmt = $this->pdo->prepare('SELECT user_id, service FROM user_api WHERE api_token = :api_token AND status = "Active"');
        $stmt->bindValue(':api_token', $api_token);
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
    //////// publisher //////////
    public function countWebsite($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listWebsite($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE user_id = :user_id AND is_deleted = 0 ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getWebsite($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE id = :id AND user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function addWebsite($user_id, $name, $domain, $description, $category_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO publisher_website (user_id, name, domain, description, category_id) VALUES (:user_id, :name, :domain, :description, :category_id)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':domain', $domain);
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':category_id', (int) $category_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateWebsite($user_id, $id, $name, $description, $category_id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET name = :name, description = :description, category_id = :category_id WHERE id = :id AND user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':category_id', (int) $category_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateWebsiteHideReport($user_id, $id, $is_hidden)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET is_hidden = :is_hidden WHERE id = :id AND user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':is_hidden', (int) $is_hidden, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function hideReportZoneByWebsite($website_id, $is_hidden = 1)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET is_hidden = :is_hidden WHERE website_id = :website_id AND is_deleted = 0');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':is_hidden', (int) $is_hidden, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function deleteWebsite($user_id, $id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET is_deleted = 1 WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updatePublisherAbstract($user_id, $abs_website, $abs_zone)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher SET abs_website = abs_website + '.$abs_website.', abs_zone = abs_zone + '.$abs_zone.' WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateWebsiteAbstract($id, $total_zone, $active_zone)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET total_zone = total_zone + '.$total_zone.', active_zone = active_zone + '.$active_zone.' WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listZoneByWebsite($user_id, $website_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format, description, status, setting FROM publisher_zone WHERE user_id = :user_id AND website_id = :website_id AND is_deleted = 0 ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getZone($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format, description, status, website_id, setting FROM publisher_zone WHERE user_id = :user_id AND id = :id AND is_deleted = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function addZone($user_id, $website_id, $name, $description, $ad_format, $setting)
    {
        $stmt = $this->pdo->prepare('INSERT INTO publisher_zone (user_id, website_id, name, description, ad_format, setting) VALUES (:user_id, :website_id, :name, :description, :ad_format, :setting)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':ad_format', (int) $ad_format, \PDO::PARAM_INT);
        $stmt->bindValue(':setting', $setting);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateZone($user_id, $id, $name, $description)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET name = :name, description = :description WHERE id = :id AND user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function deleteZone($user_id, $id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET is_deleted = 1 WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateZoneSetting($user_id, $id, $setting)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET setting = :setting WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':setting', $setting);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function checkZoneExist($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT website_id FROM publisher_zone WHERE id = :id AND user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function countShownZoneByWebsite($website_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE website_id = :website_id AND is_deleted = 0 AND is_hidden = 0');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function updateZoneHideReport($user_id, $id, $is_hidden)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET is_hidden = :is_hidden WHERE id = :id AND user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':is_hidden', (int) $is_hidden, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function countDomain($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listDomain($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_domain WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getDomain($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_domain WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }
    
    public function addDomain($user_id, $name, $status = 'Pending')
    {
        $stmt = $this->pdo->prepare('INSERT INTO publisher_domain (user_id, name, status) VALUES (:user_id, :name, :status)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function removeDomain($user_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM publisher_domain WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function setDefaultDomain($user_id, $id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_domain SET is_default = 1 WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function clearDefaultDomain($user_id, $id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_domain SET is_default = 0 WHERE user_id = :user_id AND id != :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
     public function getAdFormat($id)
    {
        $stmt = $this->pdo->prepare('SELECT name, svg, status FROM system_ad_format WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    //////// publisher //////////
    
    //////// avertiser /////////
    public function countCampaign($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_campaign WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listCampaign($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, status, active_ad, total_ad FROM advertiser_campaign WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }

    public function getCampaign($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, description, status, total_ad, active_ad, created_at FROM advertiser_campaign WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
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
    
    public function countAdByCampaignId($user_id, $campaign_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listAdByCampaign($user_id, $campaign_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, creative_id, name, status, ad_format, pricing_model, bidding, optimization, budget_total, budget_daily, budget_capping, goal_total, goal_daily, goal_capping, start_date, end_date, after_approval, targeting FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getAd($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format, creative_id, pricing_model, bidding, optimization, budget_total, budget_daily, budget_capping, goal_total, goal_daily, goal_capping, start_date, end_date, after_approval, status, targeting FROM advertiser_ad WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function checkCreative($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_creative WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function checkAudience($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_audience WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function createAd($user_id, $campaign_id, $creative_id, $name, $ad_format, $pricing_model, $bidding, $optimization, $budget_total, $budget_daily, $budget_capping, $goal_total, $goal_daily, $goal_capping, $start_date, $end_date, $after_approval, $targeting)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_ad (user_id, campaign_id, creative_id, name, ad_format, pricing_model, bidding, optimization, budget_total, budget_daily, budget_capping, goal_total, goal_daily, goal_capping, start_date, end_date, after_approval, targeting) 
        VALUES (:user_id, :campaign_id, :creative_id, :name, :ad_format, :pricing_model, :bidding, :optimization, :budget_total, :budget_daily, :budget_capping, :goal_total, :goal_daily, :goal_capping, :start_date, :end_date, :after_approval, :targeting)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':creative_id', $creative_id);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':ad_format', (int) $ad_format, \PDO::PARAM_INT);
        $stmt->bindValue(':pricing_model', $pricing_model);
        $stmt->bindValue(':bidding', $bidding);
        $stmt->bindValue(':optimization', $optimization);
        $stmt->bindValue(':budget_total', $budget_total);
        $stmt->bindValue(':budget_daily', $budget_daily);
        $stmt->bindValue(':budget_capping', $budget_capping);
        $stmt->bindValue(':goal_total', (int) $goal_total, \PDO::PARAM_INT);
        $stmt->bindValue(':goal_daily', (int) $goal_daily, \PDO::PARAM_INT);
        $stmt->bindValue(':goal_capping', $goal_capping);
        $stmt->bindValue(':start_date', $start_date);
        $stmt->bindValue(':end_date', $end_date);
        $stmt->bindValue(':after_approval', $after_approval);
        $stmt->bindValue(':targeting', $targeting);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateAd($user_id, $id, $creative_id, $name, $ad_format, $pricing_model, $bidding, $optimization, $budget_total, $budget_daily, $budget_capping, $goal_total, $goal_daily, $goal_capping, $start_date, $end_date, $after_approval, $targeting)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad SET creative_id = :creative_id, name = :name, ad_format = :ad_format, pricing_model = :pricing_model, bidding = :bidding, optimization = :optimization, budget_total = :budget_total, budget_daily = :budget_daily, budget_capping = :budget_capping, goal_total = :goal_total, goal_daily = :goal_daily, goal_capping = :goal_capping, start_date = :start_date, end_date = :end_date, after_approval = :after_approval, targeting = :targeting WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':creative_id', $creative_id);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':ad_format', (int) $ad_format, \PDO::PARAM_INT);
        $stmt->bindValue(':pricing_model', $pricing_model);
        $stmt->bindValue(':bidding', $bidding);
        $stmt->bindValue(':optimization', $optimization);
        $stmt->bindValue(':budget_total', $budget_total);
        $stmt->bindValue(':budget_daily', $budget_daily);
        $stmt->bindValue(':budget_capping', $budget_capping);
        $stmt->bindValue(':goal_total', (int) $goal_total, \PDO::PARAM_INT);
        $stmt->bindValue(':goal_daily', (int) $goal_daily, \PDO::PARAM_INT);
        $stmt->bindValue(':goal_capping', $goal_capping);
        $stmt->bindValue(':start_date', $start_date);
        $stmt->bindValue(':end_date', $end_date);
        $stmt->bindValue(':after_approval', $after_approval);
        $stmt->bindValue(':targeting', $targeting);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateCampaignAbstract($id, $total_ad, $active_ad)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_campaign SET total_ad = total_ad + '.$total_ad.', active_ad = active_ad + '.$active_ad.' WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function createPreTargeting($user_id, $name, $targeting)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_pretargeting (user_id, name, targeting) VALUES (:user_id, :name, :targeting)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':targeting', $targeting);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function countAudience($user_id)
    {
       
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_audience WHERE user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listAudience($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, duration, daily_reach, total_users, status FROM advertiser_audience WHERE user_id = :user_id AND is_deleted = 0 ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getAudience($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, duration, daily_reach, total_users, status FROM advertiser_audience WHERE id = :id AND user_id = :user_id AND is_deleted = 0');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function addAudience($user_id, $name, $duration)
    {
        
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_audience (user_id, name, duration) VALUES (:user_id, :name, :duration)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':duration', $duration);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateAudience($user_id, $id, $name, $duration)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_audience SET name = :name, duration = :duration WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':duration', $duration);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listStatusAdByCampaign($user_id, $campaign_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listActiveAndPausedAdByCampaign($user_id, $campaign_id)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_ad WHERE user_id = :user_id AND campaign_id = :campaign_id AND (status = "Active" OR status = "Paused")');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function changeCampaignStatus($id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_campaign SET status = :status WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function changeAdStatus($id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_ad SET status = :status WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function countPretargeting($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_pretargeting WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listPretargeting($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, targeting FROM advertiser_pretargeting WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getPreTargeting($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT name, targeting FROM advertiser_pretargeting WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updatePretargeting($id, $targeting, $user_id, $name)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_pretargeting SET targeting = :targeting, name = :name WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':targeting', $targeting);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function removePretargeting($user_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_pretargeting WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function countCreative($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_creative WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listCreative($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_creative WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getCreative($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT name, type, thumb, size, url FROM advertiser_creative WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function addCreative($user_id, $name, $type, $thumb, $size, $url)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_creative (user_id, name, type, thumb, size, url) VALUES (:user_id, :name, :type, :thumb, :size, :url)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':thumb', $thumb);
        $stmt->bindValue(':size', $size);
        $stmt->bindValue(':url', $url);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function removeCreative($user_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_creative WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    //////// avertiser /////////
    
    // added 2020-12-01 by Haru Kado
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT id, name, creative_required FROM system_ad_format LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
}