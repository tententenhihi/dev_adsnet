<?php

namespace Model\Publisher;

class Website extends \System\Db
{
    public function listCategory()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_web_category LIMIT 999');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function countWebsite($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsite($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id AND domain LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE user_id = :user_id AND domain LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE user_id = :user_id AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWebsiteStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM publisher_website WHERE user_id = :user_id AND status = :status AND domain LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listWebsiteStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE user_id = :user_id AND status = :status AND domain LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function addWebsite($user_id, $domain, $description, $category_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO publisher_website (user_id, domain, description, category_id) VALUES (:user_id, :domain, :description, :category_id)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':domain', $domain);
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':category_id', (int) $category_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function getWebsite($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher_website WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }
    
    public function setWebsiteVerifyToken($id, $verify_token)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET verify_token = :verify_token WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':verify_token', $verify_token);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function removeWebsite($user_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM publisher_website WHERE id = :id AND user_id = :user_id AND status = "Pending"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function setWebsiteVerified($id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET is_verified = 1, status = "Active" WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateWebsite($user_id, $id, $description, $category_id)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher_website SET description = :description, category_id = :category_id WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':category_id', (int) $category_id, \PDO::PARAM_INT);
        $stmt->bindValue(':description', $description);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getPublisher($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
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
    
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_format LIMIT 999');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function listLastWebsiteStatistic($website_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, SUM(impression + cpc_impression + cpa_impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS revenue, SUM(reach) AS reach, created_at FROM publisher_statistic WHERE website_id = :website_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 99999');
        $stmt->bindValue(':website_id', (int) $website_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
