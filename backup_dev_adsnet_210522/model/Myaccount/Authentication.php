<?php

namespace Model\Myaccount;

class Authentication extends \System\Db
{
    public function getuserToken($id)
    {
        $stmt = $this->pdo->prepare('SELECT remember_token, two_factor FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getTwoFactor($id)
    {
        $stmt = $this->pdo->prepare('SELECT two_factor, phone FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function createTwoFactorCode($user_id, $code)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_2fa (user_id, code) VALUES (:user_id, :code)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':code', (int) $code, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function removeTwoFactorCode($user_id, $code)
    {
        $stmt = $this->pdo->prepare('DELETE FROM user_2fa WHERE user_id = :user_id AND code = :code');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':code', (int) $code, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateTwoFactorToken($id, $two_factor)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET two_factor = :two_factor WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':two_factor', $two_factor);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateRememberToken($id, $remember_token)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET remember_token = :remember_token WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':remember_token', $remember_token);
        $stmt->execute();

        return $stmt->rowCount();
    }
}
