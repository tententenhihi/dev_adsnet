<?php

namespace Model\Admin\superAdmin;

class Loadbalancer extends \System\Db
{
    public function countLoadbalancer()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_loadbalancer');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countLoadbalancerSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_loadbalancer WHERE name LIKE :key OR ip_address LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countLoadbalancerStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_loadbalancer WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countLoadbalancerStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_loadbalancer WHERE status = :status AND (name LIKE :key OR ip_address LIKE :key)');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listLoadbalancer($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_loadbalancer ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLoadbalancerSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_loadbalancer WHERE name LIKE :key OR ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLoadbalancerStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_loadbalancer WHERE status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLoadbalancerStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_loadbalancer WHERE status = :status AND (name LIKE :key OR ip_address LIKE :key) ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createLoadbalancer($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO adserver_loadbalancer (name, ip_address, port_total, bandwidth_total, status) VALUES (:name, :ip_address, :port_total, :bandwidth_total, :status)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':ip_address', $data->ip_address);
        $stmt->bindValue(':bandwidth_total', (int) $data->bandwidth_total, \PDO::PARAM_INT);
        $stmt->bindValue(':port_total', (int) $data->port_total, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $data->status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateLoadbalancer($data)
    {
        $stmt = $this->pdo->prepare('UPDATE adserver_loadbalancer SET name = :name, ip_address = :ip_address, port_total = :port_total, bandwidth_total = :bandwidth_total, status = :status WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':ip_address', $data->ip_address);
        $stmt->bindValue(':port_total', (int) $data->port_total, \PDO::PARAM_INT);
        $stmt->bindValue(':bandwidth_total', (int) $data->bandwidth_total, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $data->status);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function listLoadbalancerStats()
    {
        $stmt = $this->pdo->prepare('SELECT id, connection, ram_total, ram_used, cpu_user, cpu_system, cpu_wait, disk_total, disk_used, port_total, port_up, port_down, bandwidth_total, bandwidth_used FROM adserver_loadbalancer WHERE status = "Active" LIMIT 9999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
