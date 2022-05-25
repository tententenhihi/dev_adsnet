<?php

namespace Model\Admin\superAdmin;

class Publisher extends \System\Db
{
    /* overview */
    public function countWithdrawStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countPendingPublisherTicket()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE status = "Opening" AND service = "Publisher"');
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function countPublisher()
    {
        $stmt = $this->pdo->prepare('SELECT count(first_zone) AS cnt FROM publisher');
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listLastWebsite($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastZone($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_zone WHERE created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastPublisherStatistic($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, (impression + cpc_impression + cpa_impression) AS impression, click, conversion, revenue, reach, created_at FROM publisher_statistic WHERE created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWebsiteByImpression($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT b.domain, SUM(a.impression + a.cpc_impression + a.cpa_impression) AS impression FROM publisher_statistic a JOIN publisher_website b  ON a.website_id = b.id WHERE a.created_at >= :created_at GROUP BY a.website_id LIMIT 10');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPublisherByImpression($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT b.name as publisher_name, SUM(a.impression + a.cpc_impression + a.cpa_impression) AS impression FROM publisher_statistic a JOIN user b  ON a.user_id = b.id WHERE a.created_at >= :created_at GROUP BY a.user_id LIMIT 10');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listOsStatistic($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT os, SUM(impression) AS impression FROM adserver_metric  WHERE created_at >= :created_at GROUP BY os LIMIT 9999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPlatformStatistic($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT platform, SUM(impression) AS impression FROM adserver_metric  WHERE created_at >= :created_at GROUP BY platform LIMIT 9999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listBrowserStatistic($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT browser, SUM(impression) AS impression FROM adserver_metric  WHERE created_at >= :created_at GROUP BY browser LIMIT 9999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getUser($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function listWebsiteForInfo($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, domain FROM publisher_website WHERE user_id = :user_id LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listZoneForInfo($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, website_id, ad_format FROM publisher_zone WHERE user_id = :user_id LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    /* website */
    public function listCategory()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_web_category LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_format LIMIT 999');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function countWebsite()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsite($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE domain LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id WHERE a.domain LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE status = :status AND domain LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.domain LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id AND domain LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.domain LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id AND status = :status AND domain LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_website a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND a.domain LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getWebsite($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }
    
    public function setWebsiteVerified($id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET is_verified = 1, status = "Active" WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function setWebsiteRejected($id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET status = "Rejected" WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function rejectZoneByWebsite($website_id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET status = "Rejected" WHERE website_id = :website_id');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function rejectZone($id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET status = "Rejected" WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listLastWebsiteStatistic($website_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, SUM(impression + cpc_impression + cpa_impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS revenue, SUM(reach) AS reach, created_at FROM publisher_statistic WHERE website_id = :website_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 99999');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updateWebsite($id, $description, $category_id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET description = :description, category_id = :category_id WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':category_id', (int) $category_id, \PDO::PARAM_INT);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    /* category */
    public function countCategory()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_web_category');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countCategorySearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_web_category WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCategorys($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_web_category ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listCategorySearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_web_category WHERE name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updateCategory($id, $name, $description)
    {
        $stmt = $this->pdo->prepare('UPDATE system_web_category SET description = :description, name = :name WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function addCategory($name, $description)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_web_category (name, description) VALUES (:name, :description)');
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    /* domain */
    public function countDomain()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomain($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDomainSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomainSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDomainStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomainStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDomainStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE name LIKE :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomainStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id WHERE a.name LIKE :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDomainByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomainByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDomainSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomainSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDomainStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomainStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDomainStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_domain WHERE user_id = :user_id AND name LIKE :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDomainStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM publisher_domain a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.name LIKE :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getDomain($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_domain WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }
    
    public function removeDomain($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM publisher_domain WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function activeDomain($id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_domain SET status = "Active" WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    /* referrer */
    public function countReferrer()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrer($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE domain LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.domain LIKE :key ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerAction($action)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerAction($action, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerActionSearch($action, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE domain LIKE :key AND action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerActionSearch($action, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.domain LIKE :key AND a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function countReferrerByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE user_id = :user_id AND domain LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id AND a.domain LIKE :key ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerActionByUser($user_id, $action)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE user_id = :user_id AND action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerActionByUser($user_id, $action, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id AND a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerActionSearchByUser($user_id, $action, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE user_id = :user_id AND domain LIKE :key AND action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerActionSearchByUser($user_id, $action, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id AND a.domain LIKE :key AND a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerByWebsite($website_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE website_id = :website_id');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerByWebsite($website_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.website_id = :website_id ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerSearchByWebsite($website_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE website_id = :website_id AND domain LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerSearchByWebsite($website_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.website_id = :website_id AND a.domain LIKE :key ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerActionByWebsite($website_id, $action)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE website_id = :website_id AND action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerActionByWebsite($website_id, $action, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.website_id = :website_id AND a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerActionSearchByWebsite($website_id, $action, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE website_id = :website_id AND domain LIKE :key AND action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerActionSearchByWebsite($website_id, $action, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.website_id = :website_id AND a.domain LIKE :key AND a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerByZone($zone_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE zone_id = :zone_id');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerByZone($zone_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.zone_id = :zone_id ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerSearchByZone($zone_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE zone_id = :zone_id AND domain LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerSearchByZone($zone_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.zone_id = :zone_id AND a.domain LIKE :key ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerActionByZone($zone_id, $action)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE zone_id = :zone_id AND action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerActionByZone($zone_id, $action, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.zone_id = :zone_id AND a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferrerActionSearchByZone($zone_id, $action, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone_ref WHERE zone_id = :zone_id AND domain LIKE :key AND action = :action');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferrerActionSearchByZone($zone_id, $action, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_zone_ref a JOIN user b ON a.user_id = b.id JOIN publisher_website c ON a.website_id = c.id JOIN publisher_zone d ON a.zone_id = d.id WHERE a.zone_id = :zone_id AND a.domain LIKE :key AND a.action = :action ORDER BY a.time_count DESC LIMIT :init, :limit');
        $stmt->bindValue(':action', $action);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function removeReferrer($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM publisher_zone_ref WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    /* deal */
    public function countDeal()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDeal($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDealSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDealSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDealStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDealStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDealStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal WHERE name LIKE :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDealStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id WHERE a.name LIKE :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDealByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDealByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDealSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDealSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDealStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDealStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDealStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_deal WHERE user_id = :user_id AND name LIKE :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listDealStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name, c.domain as website_domain, d.name as zone_name FROM publisher_deal a JOIN user b ON a.user_id = b.id LEFT JOIN publisher_website c ON a.website_id = c.id LEFT JOIN publisher_zone d ON a.zone_id = d.id WHERE a.user_id = :user_id AND a.name LIKE :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createDeal($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO publisher_deal (name, type, user_id, zone_id, amount, status) VALUES (:name, :type, :user_id, :zone_id, :amount, :status)');
        $stmt->bindValue(':user_id', (int) $data->user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':zone_id', $data->zone_id);
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':type', $data->type);
        $stmt->bindValue(':amount', $data->amount);
        $stmt->bindValue(':status', $data->status);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function removeDeal($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM publisher_deal WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function archiveDeal($id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_deal SET status = "Archived" WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateDeal($data)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_deal SET name = :name, type = :type, amount = :amount, status = :status WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':type', $data->type);
        $stmt->bindValue(':amount', $data->amount);
        $stmt->bindValue(':status', $data->status);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getDealByZone($zone_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_deal WHERE zone_id = :zone_id');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }
    
    /* zone */
    public function countZone()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZone($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name, d.name as name_ad_format
                                    FROM publisher_zone a 
                                    JOIN publisher_website b ON a.website_id = b.id 
                                    JOIN user c ON a.user_id = c.id 
                                    JOIN system_ad_format d ON a.ad_format = d.id
                                    ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE name LIKE :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.name LIKE :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneByWebsite($website_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE website_id = :website_id');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneByWebsite($website_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.website_id = :website_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneSearchByWebsite($website_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE website_id = :website_id AND name LIKE :key');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneSearchByWebsite($website_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.website_id = :website_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusByWebsite($website_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE website_id = :website_id AND status = :status');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusByWebsite($website_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.website_id = :website_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusSearchByWebsite($website_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE website_id = :website_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusSearchByWebsite($website_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.website_id = :website_id AND a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countZoneStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_zone WHERE user_id = :user_id AND name LIKE :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listZoneStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.domain, c.name as user_name FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.name LIKE :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getZone($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.user_id, a.website_id, a.ad_format, a.name, a.description, a.status, a.created_at, a.floor_cpm, a.impression, a.revenue, b.domain, b.status AS website_status FROM publisher_zone a JOIN publisher_website b ON a.website_id = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listLastZoneStatistic($zone_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, SUM(impression + cpc_impression + cpa_impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS revenue, SUM(reach) AS reach, created_at FROM publisher_statistic WHERE zone_id = :zone_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 99999');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
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
    
    public function getZoneSetting($id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format, floor_cpm, setting, status FROM publisher_zone WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listAdType()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_type LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function updateZone($id, $name, $description)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET name = :name, description = :description WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getZoneWebsiteAndFormat($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.user_id, a.website_id, a.ad_format, b.extension, b.treat_as FROM publisher_zone a JOIN system_ad_format b ON a.ad_format = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function updateZoneSetting($id, $setting, $floor_cpm)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_zone SET setting = :setting, floor_cpm = :floor_cpm WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':setting', $setting);
        $stmt->bindValue(':floor_cpm', $floor_cpm);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    /* report */
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
    
    public function verifyUserZones($user_id, $array)
    {
        $stmt = $this->pdo->prepare('SELECT id, website_id FROM publisher_zone WHERE user_id = :user_id AND id IN ('.implode(',', $array).')');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function verifyUserWebsites($user_id, $array)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM publisher_website WHERE user_id = :user_id AND id IN ('.implode(',', $array).')');
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
    
    /* misc */
    public function listZoneIdAndStatusByWebsite($website_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, status FROM publisher_zone WHERE website_id = :website_id ORDER BY id DESC LIMIT 9999');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getZoneRevenue($zone_id)
    {
        $stmt = $this->pdo->prepare('SELECT SUM(revenue) AS revenue FROM publisher_statistic WHERE zone_id = :zone_id');
        $stmt->bindValue(':zone_id', (int) $zone_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->revenue??0;
    }
    
    public function getPublisherRevshare($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT revshare FROM publisher WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->revshare??null;
    }
    
    public function decreasePublisherBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET pub_balance = pub_balance - :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
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

}
