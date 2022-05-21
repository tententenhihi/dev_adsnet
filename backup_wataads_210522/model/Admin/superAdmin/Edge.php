<?php

namespace Model\Admin\superAdmin;

class Edge extends \System\Db
{
    public function countEdge()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_edge');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countEdgeSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_edge WHERE name LIKE :key OR ip_address LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countEdgeStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_edge WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countEdgeStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM adserver_edge WHERE status = :status AND (name LIKE :key OR ip_address LIKE :key)');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listEdge($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_edge ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listEdgeSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_edge WHERE name LIKE :key OR ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listEdgeStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_edge WHERE status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listEdgeStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_edge WHERE status = :status AND (name LIKE :key OR ip_address LIKE :key) ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createEdge($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO adserver_edge (name, ip_address, port_total, bandwidth_total, status) VALUES (:name, :ip_address, :port_total, :bandwidth_total, :status)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':ip_address', $data->ip_address);
        $stmt->bindValue(':bandwidth_total', (int) $data->bandwidth_total, \PDO::PARAM_INT);
        $stmt->bindValue(':port_total', (int) $data->port_total, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $data->status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function getEdge($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM adserver_edge WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updateEdge($data)
    {
        $stmt = $this->pdo->prepare('UPDATE adserver_edge SET name = :name, ip_address = :ip_address, port_total = :port_total, bandwidth_total = :bandwidth_total, status = :status WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':ip_address', $data->ip_address);
        $stmt->bindValue(':port_total', (int) $data->port_total, \PDO::PARAM_INT);
        $stmt->bindValue(':bandwidth_total', (int) $data->bandwidth_total, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $data->status);
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function listEdgeStats()
    {
        $stmt = $this->pdo->prepare('SELECT id, connection, ram_total, ram_used, cpu_user, cpu_system, cpu_wait, disk_total, disk_used, port_total, port_up, port_down, bandwidth_total, bandwidth_used FROM adserver_edge WHERE status = "Active" LIMIT 9999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function deleteEdge($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM adserver_edge WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
}
