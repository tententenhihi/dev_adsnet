<?php

namespace Model\Admin\superAdmin;

class Openrtb extends \System\Db
{
    public function sumNetworkAbstract()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS total_net, sum(total_ad) AS total_ad, sum(active_ad) AS active_ad, sum(impression) AS impression, sum(click) AS click, sum(revenue) AS revenue, sum(net_revenue) AS net_revenue, sum(payment) AS payment FROM openrtb_network');
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function countNetwork()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_network');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countNetworkSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_network WHERE name LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countNetworkStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_network WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countNetworkStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_network WHERE status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNetwork($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_network ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listNetworkSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_network WHERE name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listNetworkStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_network WHERE status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listNetworkStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_network WHERE status = :status AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createNetwork($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO openrtb_network (name, url, description, module) VALUES (:name, :url, :description, :module)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':url', $data->url);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':module', $data->module);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateNetwork($data)
    {
        $stmt = $this->pdo->prepare('UPDATE openrtb_network SET name = :name, url = :url, description = :description, module = :module WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':url', $data->url);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':module', $data->module);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT id, name FROM system_ad_format LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdFormatAll()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_ad_format LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdByNetworkAndStatus($network_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, ad_format FROM openrtb_ad WHERE network_id = :network_id AND status = :status');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getNetwork($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_network WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function listLastNetworkStatistic($network_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, created_at, SUM(impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS revenue, SUM(reach) AS reach FROM openrtb_statistic WHERE network_id = :network_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 9999');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listCountry()
    {
        $stmt = $this->pdo->prepare('SELECT name, code FROM system_country LIMIT 999');
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
    
    public function listAdType()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_ad_type ORDER BY id DESC LIMIT 9999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function countAd()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad');
        $stmt->execute();
        $row = $stmt->fetch();
        
        return $row->cnt??0;
    }
    
    public function countAdSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad WHERE name LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        $row = $stmt->fetch();
        
        return $row->cnt??0;
    }
    
    public function countAdStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return $row->cnt??0;
    }
    
    public function countAdStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad WHERE status = :status AND name LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        $row = $stmt->fetch();
        
        return $row->cnt??0;
    }
    
    public function countAdByNetwork($network_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad WHERE network_id = :network_id');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return $row->cnt??0;
    }
    
    public function countAdSearchByNetwork($network_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad WHERE network_id = :network_id AND name LIKE :key');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        $row = $stmt->fetch();
        
        return $row->cnt??0;
    }
    
    public function countAdStatusByNetwork($network_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad WHERE network_id = :network_id AND status = :status');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return $row->cnt??0;
    }
    
    public function countAdStatusSearchByNetwork($network_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_ad WHERE network_id = :network_id AND status = :status AND name LIKE :key');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listAd($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdByNetwork($network_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.network_id = :network_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdSearchByNetwork($network_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.network_id = :network_id AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdStatusByNetwork($network_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.network_id = :network_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listAdStatusSearchByNetwork($network_id, $status, $key, $init, $limit)
    {
        if($status == 'All') return $this->listAdStatusByNetwork($key, $init, $limit);
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.network_id = :network_id AND a.status = :status AND a.name LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createAd($network_id, $name, $zone_id, $data, $ad_format, $pricing_model, $status)
    {
        $stmt = $this->pdo->prepare('INSERT INTO openrtb_ad (network_id, name, zone_id, data, ad_format, pricing_model, status) VALUES (:network_id, :name, :zone_id, :data, :ad_format, :pricing_model, :status)');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':zone_id', $zone_id);
        $stmt->bindValue(':data', json_encode($data));
        $stmt->bindValue(':ad_format', (int) $ad_format, \PDO::PARAM_INT);
        $stmt->bindValue(':pricing_model', $pricing_model);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function listLastAdStatistic($ad_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, created_at, SUM(impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS revenue, SUM(reach) AS reach FROM openrtb_statistic WHERE ad_id = :ad_id AND created_at >= :created_at GROUP BY country, created_at LIMIT 99999');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updateNetworkAbstract($id, $total_ad, $active_ad)
    {
        $stmt = $this->pdo->prepare('UPDATE openrtb_network SET total_ad = total_ad + :total_ad, active_ad = active_ad + :active_ad WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':total_ad', (int) $total_ad, \PDO::PARAM_INT);
        $stmt->bindValue(':active_ad', (int) $active_ad, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function removeAd($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM openrtb_ad WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateNetworkStatus($id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE openrtb_network SET status = :status WHERE id = :id');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function getAd($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_ad WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getAdWithNetworkName($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as network_name FROM openrtb_ad a JOIN openrtb_network b ON a.network_id = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updateAdStatus($id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE openrtb_ad SET status = :status WHERE id = :id');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateAdName($id, $name)
    {
        $stmt = $this->pdo->prepare('UPDATE openrtb_ad SET name = :name WHERE id = :id');
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateAd($id, $data)
    {
        $stmt = $this->pdo->prepare('UPDATE openrtb_ad SET name = :name, data = :data, zone_id = :zone_id WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':data', json_encode($data->data));
        $stmt->bindValue(':zone_id', $data->zone_id);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function reportByAdAllTime($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT SUM(reach) AS reach, SUM(impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS revenue FROM openrtb_statistic WHERE ad_id = :ad_id');
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listAdExTypeData($ad_id)
    {
        $stmt = $this->pdo->prepare('SELECT type_id FROM openrtb_ad_type WHERE ad_id = :ad_id LIMIT 99999');
        $stmt->bindValue(':ad_id', $ad_id);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    /* report */
    public function listActiveNetwork()
    {
        $stmt = $this->pdo->prepare('SELECT id, name, status FROM openrtb_network WHERE status != "Inactive" LIMIT 9999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAllAd()
    {
        $stmt = $this->pdo->prepare('SELECT id, name, network_id, ad_format FROM openrtb_ad LIMIT 9999');
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
    
    /* payment */
    public function countPayment()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_payment');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countPaymentSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_payment WHERE transaction_id LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countPaymentByNetwork($network_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_payment WHERE network_id = :network_id');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countPaymentByNetworkSearch($network_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM openrtb_payment WHERE network_id = :network_id AND transaction_id LIKE :key');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listPayment($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_payment ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPaymentSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_payment WHERE transaction_id LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPaymentByNetwork($network_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_payment WHERE network_id = :network_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPaymentByNetworkSearch($network_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM openrtb_payment WHERE network_id = :network_id AND transaction_id LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':network_id', (int) $network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createPayment($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO openrtb_payment (network_id, transaction_id, method, description, amount) VALUES (:network_id, :transaction_id, :method, :description, :amount)');
        $stmt->bindValue(':network_id', (int) $data->network_id, \PDO::PARAM_INT);
        $stmt->bindValue(':transaction_id', $data->transaction_id);
        $stmt->bindValue(':method', $data->method);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':amount', $data->amount);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function increaseNetworkPayment($id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE openrtb_network SET payment = payment + :amount WHERE id = :id');
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
}