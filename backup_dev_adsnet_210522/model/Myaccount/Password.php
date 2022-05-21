<?php

namespace Model\Myaccount;

class Password extends \System\Db
{
    public function getUserById($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updateRememberToken($id, $remember_token)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET remember_token = :remember_token WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':remember_token', $remember_token);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateUserPassword($id, $password)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET password = :password WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':password', $password);
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
    
    public function stopActiveSession($user_id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
}