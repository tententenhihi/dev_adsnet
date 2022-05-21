<?php

namespace Model\Admin\superAdmin;

class System extends \System\Db
{
    /* overview */
    public function countNetwork()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM exchange_network');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countNetworkStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM exchange_network WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countAd()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM exchange_ad');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countAdStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM exchange_ad WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNetworkByAd($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT name , impression, total_ad FROM exchange_network WHERE created_at >= :created_at ORDER BY total_ad DESC, impression DESC LIMIT 10');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastNetwork($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM exchange_network WHERE created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastAd($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM exchange_ad WHERE created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listNetwork()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM exchange_network ORDER BY impression DESC, revenue DESC, payment DESC LIMIT 9999999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    /* system */
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
    
    public function createPlatform($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_platform (name, description) VALUES (:name, :description)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function createOs($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_os (name, description) VALUES (:name, :description)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function createBrowser($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_browser (name, description) VALUES (:name, :description)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updatePlatform($data)
    {
        $stmt = $this->pdo->prepare('UPDATE system_platform SET name = :name, description = :description WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateOs($data)
    {
        $stmt = $this->pdo->prepare('UPDATE system_os SET name = :name, description = :description WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateBrowser($data)
    {
        $stmt = $this->pdo->prepare('UPDATE system_browser SET name = :name, description = :description WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function unmapPlatform($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_os_platform WHERE platform_id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function unmapOs($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_browser_os WHERE os_id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function mapPlatformOs($platform_id, $os_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_os_platform (platform_id, os_id) VALUES (:platform_id, :os_id)');
        $stmt->bindValue(':platform_id', (int) $platform_id, \PDO::PARAM_INT);
        $stmt->bindValue(':os_id', (int) $os_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function mapOsBrowser($os_id, $browser_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_browser_os (os_id, browser_id) VALUES (:os_id, :browser_id)');
        $stmt->bindValue(':os_id', (int) $os_id, \PDO::PARAM_INT);
        $stmt->bindValue(':browser_id', (int) $browser_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function listCountryCode()
    {
        $stmt = $this->pdo->prepare('SELECT code FROM system_country LIMIT 999');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function countAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_ad_format');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listAdFormat($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_ad_format ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createAdFormat($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_ad_format (name, admin_ctr, admin_icr, min_impression_ctr, min_impression_icr, pricing_model, description, adv_description, svg, creative_required, extension, status, tag_guide, tag_script) 
        VALUES (:name, :admin_ctr, :admin_icr, :min_impression_ctr, :min_impression_icr, :pricing_model, :description, :adv_description, :svg, :creative_required, :extension, :status, :tag_guide, :tag_script)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':admin_ctr', $data->admin_ctr);
        $stmt->bindValue(':admin_icr', $data->admin_icr);
        $stmt->bindValue(':min_impression_ctr', $data->min_impression_ctr);
        $stmt->bindValue(':min_impression_icr', $data->min_impression_icr);
        $stmt->bindValue(':pricing_model', $data->pricing_model);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':adv_description', $data->adv_description);
        $stmt->bindValue(':svg', $data->svg);
        $stmt->bindValue(':creative_required', (int) $data->creative_required, \PDO::PARAM_INT);
        $stmt->bindValue(':extension', $data->extension);
        $stmt->bindValue(':status', $data->status);
        $stmt->bindValue(':tag_guide', $data->tag_guide);
        $stmt->bindValue(':tag_script', $data->tag_script);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateAdFormat($data)
    {
        $stmt = $this->pdo->prepare('UPDATE system_ad_format SET name = :name, admin_ctr = :admin_ctr, admin_icr = :admin_icr, min_impression_ctr = :min_impression_ctr, min_impression_icr = :min_impression_icr, pricing_model = :pricing_model, description = :description, adv_description = :adv_description, svg = :svg, creative_required = :creative_required, extension = :extension, status = :status, tag_guide = :tag_guide, tag_script = :tag_script WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':admin_ctr', $data->admin_ctr);
        $stmt->bindValue(':admin_icr', $data->admin_icr);
        $stmt->bindValue(':min_impression_ctr', $data->min_impression_ctr);
        $stmt->bindValue(':min_impression_icr', $data->min_impression_icr);
        $stmt->bindValue(':pricing_model', $data->pricing_model);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':adv_description', $data->adv_description);
        $stmt->bindValue(':svg', $data->svg);
        $stmt->bindValue(':creative_required', (int) $data->creative_required, \PDO::PARAM_INT);
        $stmt->bindValue(':extension', $data->extension);
        $stmt->bindValue(':status', $data->status);
        $stmt->bindValue(':tag_guide', $data->tag_guide);
        $stmt->bindValue(':tag_script', $data->tag_script);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function removeAdFormat($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_ad_format WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function listAdFormatId()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_format ORDER BY id DESC LIMIT 9999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countCountry()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_country');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countCountrySearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_country WHERE code = :code OR name LIKE :name');
        $stmt->bindValue(':code', strtoupper($key));
        $stmt->bindValue(':name', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listCountry($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country ORDER BY code ASC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listCountrySearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country WHERE code = :code OR name LIKE :name ORDER BY code ASC LIMIT :init, :limit');
        $stmt->bindValue(':code', strtoupper($key));
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function createCountry($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_country (name, code, phone, timezone_offset) VALUES (:name, :code, :phone, :timezone_offset)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':code', $data->code);
        $stmt->bindValue(':phone', $data->phone);
        $stmt->bindValue(':timezone_offset', $data->timezone_offset);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateCountry($data)
    {
        $stmt = $this->pdo->prepare('UPDATE system_country SET name = :name, phone = :phone, timezone_offset = :timezone_offset WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':phone', $data->phone);
        $stmt->bindValue(':timezone_offset', $data->timezone_offset);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function getCountry($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function removeCountry($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_country WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getAdServerCountryBidding($format, $name)
    {
        $stmt = $this->pdo->prepare('SELECT name, count(ad_id) AS total, MIN(value) AS min, AVG(value) AS avg, MAX(value) AS max FROM adserver_data WHERE format = :format AND dimension = "bidding" AND name = :name');
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getCountryRate($format_id, $country)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country_rate WHERE format_id = :format_id AND country = :country');
        $stmt->bindValue(':format_id', (int) $format_id, \PDO::PARAM_INT);
        $stmt->bindValue(':country', $country);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function countAdIdByFomatAndCountryCode($format, $name)
    {
        $stmt = $this->pdo->prepare('SELECT count(ad_id) AS cnt FROM adserver_data WHERE format = :format AND dimension = "bidding" AND name = :name');
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countAdIdByFomatAndCountryCodeAndAdId($format, $name, $ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(ad_id) AS cnt FROM adserver_data WHERE format = :format AND dimension = "bidding" AND name = :name AND ad_id = :ad_id');
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function getAdIdByFomatAndCountryCode($format, $name, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT ad_id, value FROM adserver_data WHERE format = :format AND dimension = "bidding" AND name = :name LIMIT :init, :limit');
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function getAdIdByFomatAndCountryCodeAndAdId($format, $name, $ad_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT ad_id, value FROM adserver_data WHERE format = :format AND dimension = "bidding" AND name = :name AND ad_id = :ad_id LIMIT :init, :limit');
        $stmt->bindValue(':format', (int) $format, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function countLog()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_log');
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function countLogSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_log WHERE message LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function listLog($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_log ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLogSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_log WHERE message LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function removeLog($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_log WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function countTask()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_task');
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function countTaskSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_task WHERE task_name LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();

        return $stmt->fetch()->cnt;
    }
    
    public function listTask($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_task ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listTaskSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_task WHERE task_name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function removeTask($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_task WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function countTaskType($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_task WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listTaskType($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_task WHERE status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTaskTypeSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_task WHERE status = :status AND task_name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listTaskTypeSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_task WHERE status = :status AND task_name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createTask($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_task (task_name, task_data, status) VALUES (:task_name, :task_data, "Pending")');
        $stmt->bindValue(':task_name', $data->task_name);
        $stmt->bindValue(':task_data', $data->task_data);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateCountryRate($format_id, $country, $admin_ctr, $admin_icr)
    {
        $stmt = $this->pdo->prepare('UPDATE system_country_rate SET admin_ctr = :admin_ctr, admin_icr = :admin_icr WHERE format_id = :format_id AND country = :country');
        $stmt->bindValue(':format_id', (int) $format_id, \PDO::PARAM_INT);
        $stmt->bindValue(':country', $country);
        $stmt->bindValue(':admin_ctr', $admin_ctr);
        $stmt->bindValue(':admin_icr', $admin_icr);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function getFormatRate($format_id)
    {
        $stmt = $this->pdo->prepare('SELECT MIN(ctr_min) AS ctr_min, MAX(ctr_max) AS ctr_max, MIN(icr_min) AS icr_min, MAX(icr_max) AS icr_max FROM system_country_rate WHERE format_id = :format_id');
        $stmt->bindValue(':format_id', (int) $format_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
}