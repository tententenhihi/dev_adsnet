<?php

namespace Model\Myaccount;

class Support extends \System\Db
{
    public function countTicket($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listTicket($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_ticket WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE user_id = :user_id AND subject LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listTicketSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_ticket WHERE user_id = :user_id AND subject LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketType($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listTicketType($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_ticket WHERE user_id = :user_id AND status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countTicketTypeSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_ticket WHERE user_id = :user_id AND status = :status AND subject LIKE :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listTicketTypeSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_ticket WHERE user_id = :user_id AND status = :status AND subject LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getTicket($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_ticket WHERE user_id = :user_id AND id = :id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
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

    public function createMessage($user_id, $ticket_id, $message)
    {
        $stmt = $this->pdo->prepare('INSERT INTO ticket_message (user_id, ticket_id, message) VALUES (:user_id, :ticket_id, :message)');
        $stmt->bindValue(':message', mb_substr($message, 0, 9999));
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':ticket_id', (int) $ticket_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function listMessage($ticket_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ticket_message WHERE ticket_id = :ticket_id');
        $stmt->bindValue(':ticket_id', (int) $ticket_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updateTicketStatus($user_id, $id, $status, $updated_at)
    {
        $stmt = $this->pdo->prepare('UPDATE user_ticket SET status = :status, updated_at = :updated_at WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':updated_at', $updated_at);
        $stmt->execute();

        return $stmt->rowCount();
    }
}
