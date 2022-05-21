<?php

namespace Model;

class AdServer extends \System\Db
{
    public function getAd($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.url AS ad_file, c.treat_as FROM advertiser_ad a LEFT JOIN advertiser_creative b ON a.creative_id = b.id JOIN system_ad_format c ON a.ad_format = c.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();    
    }
    
    public function getAdEx($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.treat_as FROM exchange_ad a JOIN system_ad_format b ON a.ad_format = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();    
    }
    
    public function getAdRTB($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.treat_as FROM openrtb_ad a JOIN system_ad_format b ON a.ad_format = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();    
    }
    
    public function listAdData($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_data WHERE ad_id = :ad_id LIMIT 99999');
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdBidding($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_data WHERE ad_id = :ad_id AND dimension = "bidding" LIMIT 99999');
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function clearAdData($ad_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM adserver_data WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listCountries()
    {
        $stmt = $this->pdo->prepare('SELECT code FROM system_country LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function createAdData($ad_id, $format, $dimension, $name, $value = 1)
    {
        $stmt = $this->pdo->prepare('INSERT INTO adserver_data (ad_id, format, dimension, name, value) VALUES (:ad_id, :format, :dimension, :name, :value)');
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':dimension', $dimension);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':value', $value);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function updateAdData($ad_id, $format, $dimension, $name, $value)
    {
        $stmt = $this->pdo->prepare('UPDATE adserver_data SET value = :value WHERE ad_id = :ad_id AND format = :format AND dimension = :dimension AND name = :name');
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':dimension', $dimension);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':value', $value);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function removeAdData($ad_id, $format, $dimension, $name)
    {
        $stmt = $this->pdo->prepare('DELETE FROM adserver_data WHERE ad_id = :ad_id AND format = :format AND dimension = :dimension AND name = :name');
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':dimension', $dimension);
        $stmt->bindValue(':name', $name);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listAdTypeData($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT type_id FROM advertiser_ad_type WHERE ad_id = :ad_id LIMIT 99999');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdExTypeData($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT type_id FROM exchange_ad_type WHERE ad_id = :ad_id LIMIT 99999');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listTimezoneOffset()
    {
        $stmt = $this->pdo->prepare('SELECT code, timezone_offset FROM system_country LIMIT 999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
}