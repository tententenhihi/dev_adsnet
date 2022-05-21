<?php

namespace Model\Myaccount;

class Auth extends \System\Db
{
    public function getUserById($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }

    public function getUserByEmail($email)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE email = :email');
        $stmt->bindValue(':email', $email);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getUserByRememberToken($remember_token)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE remember_token = :remember_token');
        $stmt->bindValue(':remember_token', $remember_token);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function startUserSession($user_id, $session_id, $browser, $ip_address, $country, $is_remember = 0)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_session (user_id, session_id, browser, ip_address, country, is_remember) VALUES (:user_id, :session_id, :browser, :ip_address, :country, :is_remember)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':session_id', $session_id);
        $stmt->bindValue(':browser', $browser);
        $stmt->bindValue(':ip_address', $ip_address);
        $stmt->bindValue(':country', $country);
        $stmt->bindValue(':is_remember', $is_remember);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function createUser($name, $email, $password)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user (name, email, password) VALUES (:name, :email, :password)');
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':email', $email);
        $stmt->bindValue(':password', $password);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }

    public function createUserRef($user_id, $ref_user_id, $status)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_referral (user_id, ref_user_id, status) VALUES (:user_id, :ref_user_id, :status)');
        $stmt->bindValue(':user_id', $user_id);
        $stmt->bindValue(':ref_user_id', $ref_user_id);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function createUserBalance($user_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_balance (user_id) VALUES (:user_id)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function createPublisherAccount($user_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO publisher (user_id) VALUES (:user_id)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function createAdvertiserAccount($user_id)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser (user_id) VALUES (:user_id)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function createResetToken($user_id, $reset_token)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_pwreset (user_id, reset_token) VALUES (:user_id, :reset_token)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':reset_token', $reset_token);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function getResetToken($reset_token)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_pwreset WHERE reset_token = :reset_token');
        $stmt->bindValue(':reset_token', $reset_token);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function listCountries()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country LIMIT 999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updateUser($id, $address, $country_id, $phone, $chat_account, $birthday, $timezone, $language, $is_subscribed, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET address = :address, country_id = :country_id, phone = :phone, chat_account = :chat_account, birthday = :birthday, timezone = :timezone, language = :language, is_subscribed = :is_subscribed, status = :status WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':address', $address);
        $stmt->bindValue(':country_id', (int) $country_id, \PDO::PARAM_INT);
        $stmt->bindValue(':phone', $phone);
        $stmt->bindValue(':chat_account', $chat_account);
        $stmt->bindValue(':birthday', $birthday);
        $stmt->bindValue(':timezone', $timezone);
        $stmt->bindValue(':language', $language);
        $stmt->bindValue(':is_subscribed', (int) $is_subscribed, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function removeResetToken($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM user_pwreset WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function stopUserSession($user_id, $session_id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE user_id = :user_id AND session_id = :session_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':session_id', $session_id);
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
    
    public function updateUserPassword($id, $password)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET password = :password WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':password', $password);
        $stmt->execute();

        return $stmt->rowCount();
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
    
    public function getCountry($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getAdminPermission($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT permission FROM admin WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->permission??null;
    }
}