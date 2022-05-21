<?php

namespace Model\Publisher;

class Zone extends \System\Db
{
    public function countZone($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZone($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND name LIKE :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneByWebsite($user_id, $website_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND website_id = :website_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneByWebsite($user_id, $website_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id AND a.website_id = :website_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneSearchByWebsite($user_id, $website_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND website_id = :website_id AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneSearchByWebsite($user_id, $website_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id AND a.website_id = :website_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusByWebsite($user_id, $website_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND website_id = :website_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusByWebsite($user_id, $website_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id AND a.website_id = :website_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusSearchByWebsite($user_id, $website_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND website_id = :website_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusSearchByWebsite($user_id, $website_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.revenue, a.impression, a.created_at, a.floor_cpm, b.domain FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.user_id = :user_id AND a.website_id = :website_id AND a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getZone($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.website_id, a.ad_format, a.name, a.description, a.status, a.created_at, a.floor_cpm, a.impression, a.revenue, b.domain, b.status AS website_status FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.id = :id AND a.user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getZoneWebsiteAndFormat($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT a.user_id, a.website_id, a.ad_format, b.extension, b.treat_as FROM publisher_zone a JOIN system_ad_format b ON a.ad_format = b.id WHERE a.id = :id AND a.user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function updateZone($user_id, $id, $name, $description)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET name = :name, description = :description WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateZoneSetting($user_id, $id, $setting, $floor_cpm)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET setting = :setting, floor_cpm = :floor_cpm WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':setting', $setting);
        $stmt->bindValue(':floor_cpm', $floor_cpm);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listAdFormatTag()
    {
        $stmt = $this->pdo->prepare('SELECT id, name, tag_guide, tag_script FROM system_ad_format LIMIT 999');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function getAdFormatTag($id)
    {
        $stmt = $this->pdo->prepare('SELECT name, tag_guide, tag_script FROM system_ad_format WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getAdFormatStatus($id)
    {
        $stmt = $this->pdo->prepare('SELECT status FROM system_ad_format WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getUserDefaultDomain($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT name FROM publisher_domain WHERE user_id = :user_id AND is_default = 1');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->name ?? null;
    }
    
    public function getWebsite($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id, domain, is_verified, status FROM publisher_website WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT name, description, id, status, svg FROM system_ad_format LIMIT 999');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function listAdType()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_type LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function addZone($user_id, $website_id, $name, $description, $ad_format)
    {
        $stmt = $this->pdo->prepare('INSERT INTO publisher_zone (user_id, website_id, name, description, ad_format) VALUES (:user_id, :website_id, :name, :description, :ad_format)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':ad_format', (int) $ad_format, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updatePublisherAbstract($user_id, $abs_website, $abs_zone)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher SET abs_website = abs_website + :abs_website, abs_zone = abs_zone + :abs_zone WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':abs_website', (int) $abs_website, \PDO::PARAM_INT);
        $stmt->bindValue(':abs_zone', (int) $abs_zone, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateWebsiteAbstract($id, $total_zone, $active_zone)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET total_zone = total_zone + :total_zone, active_zone = active_zone + :active_zone WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':total_zone', (int) $total_zone, \PDO::PARAM_INT);
        $stmt->bindValue(':active_zone', (int) $active_zone, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getZoneSetting($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format, floor_cpm, setting, status FROM publisher_zone WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listZoneWarning($id)
    {
        $stmt = $this->pdo->prepare('SELECT reason, created_at FROM publisher_zone_warning WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastZoneStatistic($zone_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, SUM(impression + cpc_impression + cpa_impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS revenue, SUM(reach) AS reach, created_at FROM publisher_statistic WHERE zone_id = :zone_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 99999');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updatePublisherAbstractFirstZone($user_id, $first_zone)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher SET first_zone = :first_zone WHERE user_id = :user_id AND first_zone IS NULL');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':first_zone', $first_zone);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
}
