<?php

namespace Model\Index;

class Legal extends \System\Db
{
    public function storeEmailAgency($name, $personal_email, $work_email, $contact, $message)
    {
        $stmt = $this->pdo->prepare('INSERT INTO blog_agency_subcrible (name, personal_email, work_email, contact, message) VALUES (:name, :personal_email, :work_email, :contact, :message)');
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':personal_email', $personal_email);
        $stmt->bindValue(':work_email', $work_email);
        $stmt->bindValue(':contact', $contact);
        $stmt->bindValue(':message', $message);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function storeEmailAdNetwork($name, $email, $phone, $subscriber, $message)
    {
        $stmt = $this->pdo->prepare('INSERT INTO blog_adnetwork_subcrible (name, email, phone, subscriber, message) VALUES (:name, :email, :phone, :subscriber, :message)');
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':email', $email);
        $stmt->bindValue(':phone', $phone);
        $stmt->bindValue(':subscriber', $subscriber);
        $stmt->bindValue(':message', $message);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
}