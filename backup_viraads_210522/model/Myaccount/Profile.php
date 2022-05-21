<?php

namespace Model\Myaccount;

class Profile extends \System\Db
{
    public function getUser($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function listCountries()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country LIMIT 999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updateUser($id, $data)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET name = :name, address = :address, country_id = :country_id, phone = :phone, chat_account = :chat_account, birthday = :birthday, timezone = :timezone, language = :language, is_subscribed = :is_subscribed WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':address', $data->address);
        $stmt->bindValue(':country_id', (int) $data->country_id, \PDO::PARAM_INT);
        $stmt->bindValue(':phone', $data->phone);
        $stmt->bindValue(':chat_account', $data->chat_account);
        $stmt->bindValue(':birthday', $data->birthday);
        $stmt->bindValue(':timezone', $data->timezone);
        $stmt->bindValue(':language', $data->language);
        $stmt->bindValue(':is_subscribed', (int) $data->is_subscribed, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function listActiveSession($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function stopSession($id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
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
}
