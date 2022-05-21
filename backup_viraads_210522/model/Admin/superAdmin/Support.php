<?php

namespace Model\Admin\superAdmin;

class Support extends \System\Db
{
    public function getUser($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getUserAndBalance($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.name, a.email, a.phone, a.birthday, a.status, a.ban_reason, a.created_at, 
        b.adv_balance AS adv_balance, b.pub_balance AS pub_balance, b.pub_pending AS pub_pending, b.deposit_count AS deposit_count, b.withdraw_value AS withdraw_value, b.deposit_value AS deposit_value, b.receipt_count as receipt_count, b.receipt_value as receipt_value, b.withdraw_count AS withdraw_count,
        c.permission AS permission, 
        d.abs_website AS abs_website, d.abs_zone AS abs_zone, d.admin_note AS pub_note, d.admin_rank AS pub_rank, 
        e.abs_campaign AS abs_campaign, e.abs_ad AS abs_ad, e.admin_note AS adv_note, e.admin_rank AS adv_rank 
        FROM user a JOIN user_balance b ON a.id = b.user_id 
        LEFT JOIN admin c ON a.id = c.user_id 
        LEFT JOIN publisher d ON a.id = d.user_id 
        LEFT JOIN advertiser e ON a.id = e.user_id 
        WHERE a.id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function countTicket()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket');
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicket($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE user_id = :user_id OR subject LIKE :key');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':user_id', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicketSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id WHERE a.subject LIKE :key ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketType($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicketType($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketTypeSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE status = :status AND (user_id = :user_id OR subject LIKE :key)');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':user_id', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicketTypeSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND (a.user_id = :user_id OR a.subject LIKE :key) ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':user_id', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicketByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id  WHERE a.user_id = :user_id ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE user_id = :user_id AND subject LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':user_id', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicketSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.subject LIKE :key ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':user_id', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketTypeByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE status = :status AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicketTypeByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.user_id = :user_id ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketTypeSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE status = :status AND user_id = :user_id AND subject LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':user_id', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();
        $row = $stmt->fetch();
        
        return isset($row->cnt) ? $row->cnt : 0;
    }
    
    public function listTicketTypeSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_ticket a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.user_id = :user_id AND a.subject LIKE :key ORDER BY a.updated_at DESC, a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', '%'.$key.'%');
        $stmt->bindValue(':user_id', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getTicket($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_ticket WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listMessage($ticket_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ticket_message WHERE ticket_id = :ticket_id');
        $stmt->bindValue(':ticket_id', (int) $ticket_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createMessage($ticket_id, $message)
    {
        $stmt = $this->pdo->prepare('INSERT INTO ticket_message (user_id, ticket_id, message) VALUES (NULL, :ticket_id, :message)');
        $stmt->bindValue(':message', mb_substr($message, 0, 9999));
        $stmt->bindValue(':ticket_id', (int) $ticket_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateTicketStatus($id, $status, $updated_at)
    {
        $stmt = $this->pdo->prepare('UPDATE user_ticket SET status = :status, updated_at = :updated_at WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':updated_at', $updated_at);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateTicketEscalate($id, $updated_at)
    {
        $stmt = $this->pdo->prepare('UPDATE user_ticket SET status = "Opening", is_escalated = 1, updated_at = :updated_at WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':updated_at', $updated_at);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function createTicket($user_id, $service, $subject, $status)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_ticket (user_id, service, subject, status) VALUES (:user_id, :service, :subject, :status)');
        $stmt->bindValue(':subject', mb_substr($subject, 0, 253));
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function deleteMessage($ticket_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM ticket_message WHERE id = :id AND ticket_id = :ticket_id');
        $stmt->bindValue(':ticket_id', (int) $ticket_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateMessage($ticket_id, $id, $message)
    {
        $stmt = $this->pdo->prepare('UPDATE ticket_message SET message = :message WHERE id = :id AND ticket_id = :ticket_id');
        $stmt->bindValue(':ticket_id', (int) $ticket_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':message', $message);
        $stmt->execute();

        return $stmt->rowCount();
    }
}