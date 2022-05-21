<?php

namespace Model\Admin\superAdmin;

class User extends \System\Db
{
    /* overview page */
    public function countUserGroupByStatus()
    {
        $stmt = $this->pdo->prepare('SELECT count(*) AS cnt, status FROM user GROUP BY status');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    /* user listing page */
    public function countUser()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listUser($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.name, a.email, a.phone, a.birthday, a.status, a.chat_account, a.timezone, a.two_factor, a.is_subscribed, a.ban_reason, a.created_at, 
        b.adv_balance AS adv_balance, b.pub_balance AS pub_balance, b.pub_pending AS pub_pending, b.withdraw_value AS withdraw_value, b.deposit_value AS deposit_value, b.receipt_value AS receipt_value, 
        c.permission AS permission, 
        d.abs_website AS abs_website, d.abs_zone AS abs_zone, d.admin_note AS pub_note, d.admin_rank AS pub_rank, d.revshare AS revshare, d.first_zone AS first_zone, 
        e.abs_campaign AS abs_campaign, e.abs_ad AS abs_ad, e.admin_note AS adv_note, e.admin_rank AS adv_rank, e.first_ad AS first_ad, e.last_ad AS last_ad 
        FROM user a JOIN user_balance b ON a.id = b.user_id 
        LEFT JOIN admin c ON a.id = c.user_id 
        JOIN publisher d ON a.id = d.user_id 
        JOIN advertiser e ON a.id = e.user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countUserBySearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user WHERE name LIKE :key OR email LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listUserBySearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.name, a.email, a.phone, a.birthday, a.status, a.chat_account, a.timezone, a.two_factor, a.is_subscribed, a.ban_reason, a.created_at, 
        b.adv_balance AS adv_balance, b.pub_balance AS pub_balance, b.pub_pending AS pub_pending, b.withdraw_value AS withdraw_value, b.deposit_value AS deposit_value, b.receipt_value AS receipt_value, 
        c.permission AS permission, 
        d.abs_website AS abs_website, d.abs_zone AS abs_zone, d.admin_note AS pub_note, d.admin_rank AS pub_rank, d.revshare AS revshare, d.first_zone AS first_zone, 
        e.abs_campaign AS abs_campaign, e.abs_ad AS abs_ad, e.admin_note AS adv_note, e.admin_rank AS adv_rank, e.first_ad AS first_ad, e.last_ad AS last_ad 
        FROM user a JOIN user_balance b ON a.id = b.user_id 
        LEFT JOIN admin c ON a.id = c.user_id 
        JOIN publisher d ON a.id = d.user_id 
        JOIN advertiser e ON a.id = e.user_id 
        WHERE a.name LIKE :key OR a.email LIKE :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countUserByStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listUserByStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.name, a.email, a.phone, a.birthday, a.status, a.chat_account, a.timezone, a.two_factor, a.is_subscribed, a.ban_reason, a.created_at, 
        b.adv_balance AS adv_balance, b.pub_balance AS pub_balance, b.pub_pending AS pub_pending, b.withdraw_value AS withdraw_value, b.deposit_value AS deposit_value, b.receipt_value AS receipt_value, 
        c.permission AS permission, 
        d.abs_website AS abs_website, d.abs_zone AS abs_zone, d.admin_note AS pub_note, d.admin_rank AS pub_rank, d.revshare AS revshare, d.first_zone AS first_zone, 
        e.abs_campaign AS abs_campaign, e.abs_ad AS abs_ad, e.admin_note AS adv_note, e.admin_rank AS adv_rank, e.first_ad AS first_ad, e.last_ad AS last_ad 
        FROM user a JOIN user_balance b ON a.id = b.user_id 
        LEFT JOIN admin c ON a.id = c.user_id 
        JOIN publisher d ON a.id = d.user_id 
        JOIN advertiser e ON a.id = e.user_id 
        WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countUserByStatusAndSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user WHERE status = :status AND (name LIKE :key OR email LIKE :key)');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listUserByStatusAndSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.name, a.email, a.phone, a.birthday, a.status, a.chat_account, a.timezone, a.two_factor, a.is_subscribed, a.ban_reason, a.created_at, 
        b.adv_balance AS adv_balance, b.pub_balance AS pub_balance, b.pub_pending AS pub_pending, b.withdraw_value AS withdraw_value, b.deposit_value AS deposit_value, b.receipt_value AS receipt_value, 
        c.permission AS permission, 
        d.abs_website AS abs_website, d.abs_zone AS abs_zone, d.admin_note AS pub_note, d.admin_rank AS pub_rank, d.revshare AS revshare, d.first_zone AS first_zone, 
        e.abs_campaign AS abs_campaign, e.abs_ad AS abs_ad, e.admin_note AS adv_note, e.admin_rank AS adv_rank, e.first_ad AS first_ad, e.last_ad AS last_ad 
        FROM user a JOIN user_balance b ON a.id = b.user_id 
        LEFT JOIN admin c ON a.id = c.user_id 
        JOIN publisher d ON a.id = d.user_id 
        JOIN advertiser e ON a.id = e.user_id 
        WHERE a.status = :status AND (a.name LIKE :key OR a.email LIKE :key) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function getUser($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getUserFull($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.id, a.name, a.email, a.phone, a.birthday, a.status, a.chat_account, a.timezone, a.two_factor, a.is_subscribed, a.ban_reason, a.created_at, 
        b.adv_balance AS adv_balance, b.pub_balance AS pub_balance, b.pub_pending AS pub_pending, b.withdraw_value AS withdraw_value, b.deposit_value AS deposit_value, b.receipt_value AS receipt_value, 
        c.permission AS permission, 
        d.abs_website AS abs_website, d.abs_zone AS abs_zone, d.admin_note AS pub_note, d.admin_rank AS pub_rank, d.revshare AS revshare, d.first_zone AS first_zone, 
        e.abs_campaign AS abs_campaign, e.abs_ad AS abs_ad, e.admin_note AS adv_note, e.admin_rank AS adv_rank, e.first_ad AS first_ad, e.last_ad AS last_ad 
        FROM user a JOIN user_balance b ON a.id = b.user_id 
        LEFT JOIN admin c ON a.id = c.user_id 
        JOIN publisher d ON a.id = d.user_id 
        JOIN advertiser e ON a.id = e.user_id WHERE a.id = :id');
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
    
    public function createMessage($ticket_id, $message)
    {
        $stmt = $this->pdo->prepare('INSERT INTO ticket_message (user_id, ticket_id, message) VALUES (NULL, :ticket_id, :message)');
        $stmt->bindValue(':message', mb_substr($message, 0, 9999));
        $stmt->bindValue(':ticket_id', (int) $ticket_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateUserStatus($id, $status, $ban_reason = null)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET status = :status, ban_reason = :ban_reason WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':ban_reason', $ban_reason);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function listUserActiveSession($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function stopUserActiveSession($user_id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function createUserPermission($user_id, $permission)
    {
        $stmt = $this->pdo->prepare('INSERT INTO admin (user_id, permission) VALUES (:user_id, :permission)');
        $stmt->bindValue(':permission', $permission);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateUserPermission($user_id, $permission)
    {
        $stmt = $this->pdo->prepare('UPDATE admin SET user_id = :user_id, permission = :permission WHERE user_id = :user_id');
        $stmt->bindValue(':permission', $permission);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function clearUserPermission($user_id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM admin WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function updateUserBannedReason($id, $ban_reason)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET ban_reason = :ban_reason WHERE id = :id AND status = "Banned"');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':ban_reason', $ban_reason);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updatePublisherRevenueShare($user_id, $revshare)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher SET revshare = :revshare WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':revshare', $revshare);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function setPublisherRank($user_id, $admin_rank)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher SET admin_rank = :admin_rank WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':admin_rank', (int) $admin_rank, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function setAdvertiserRank($user_id, $admin_rank)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser SET admin_rank = :admin_rank WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':admin_rank', (int) $admin_rank, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function setPublisherNote($user_id, $admin_note)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher SET admin_note = :admin_note WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':admin_note', $admin_note);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function setAdvertiserNote($user_id, $admin_note)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser SET admin_note = :admin_note WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':admin_note', $admin_note);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    /* profile page */
    public function listCountries()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country LIMIT 999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getBalance($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_balance WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getLatestDeposit($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_deposit WHERE user_id = :user_id AND status = "Paid" ORDER BY created_at ASC LIMIT 1');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getLatestWithdraw($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_withdraw WHERE user_id = :user_id AND status = "Paid" ORDER BY created_at ASC LIMIT 1');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getPublisher($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM publisher WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getAdvertiser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function getCountry($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_country WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updateUser($id, $data)
    {
        $stmt = $this->pdo->prepare('UPDATE user SET name = :name, address = :address, country_id = :country_id, email = :email, phone = :phone, chat_account = :chat_account, birthday = :birthday, timezone = :timezone, language = :language, is_subscribed = :is_subscribed WHERE id = :id');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':address', $data->address);
        $stmt->bindValue(':country_id', (int) $data->country_id, \PDO::PARAM_INT);
        $stmt->bindValue(':phone', $data->phone);
        $stmt->bindValue(':email', $data->email);
        $stmt->bindValue(':chat_account', $data->chat_account);
        $stmt->bindValue(':birthday', $data->birthday);
        $stmt->bindValue(':timezone', $data->timezone);
        $stmt->bindValue(':language', $data->language);
        $stmt->bindValue(':is_subscribed', (int) $data->is_subscribed, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    /* api page */
    public function countApi()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApi($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE api_token = :key');
        $stmt->bindValue(':key', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApiSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id WHERE a.api_token = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApiStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE status = :status AND api_token = :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApiStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id WHERE a.status = :status AND a.api_token = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApiByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id AND api_token = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApiSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.api_token = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApiStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countApiStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_api WHERE user_id = :user_id AND status = :status AND api_token = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listApiStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.id as user_id, b.name as user_name FROM user_api a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND a.api_token = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updateUserApi($id, $status, $description)
    {
        $stmt = $this->pdo->prepare('UPDATE user_api SET status = :status, description = :description WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    /* referral page */
    public function countReferral()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_referral');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferral($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(a.id) AS cnt FROM user_referral a JOIN user b ON a.ref_user_id = b.id WHERE (b.name LIKE :name OR b.email = :email)');
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferralSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE (b.name LIKE :name OR b.email = :email) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_referral WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferralStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(a.id) AS cnt FROM user_referral a JOIN user b ON a.ref_user_id = b.id WHERE a.status = :status AND (b.name LIKE :name OR b.email = :email)');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferralStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE a.status = :status AND (b.name LIKE :name OR b.email = :email) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_referral');
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferralByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(a.id) AS cnt FROM user_referral a JOIN user b ON a.ref_user_id = b.id WHERE (b.name LIKE :name OR b.email = :email)');
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferralSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE (b.name LIKE :name OR b.email = :email) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_referral WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferralStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReferralStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(a.id) AS cnt FROM user_referral a JOIN user b ON a.ref_user_id = b.id WHERE a.status = :status AND (b.name LIKE :name OR b.email = :email)');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':name', $key.'%');
        $stmt->bindValue(':email', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listReferralStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT b.id as user_id, b.name as user_name, b.created_at, a.id, a.status, a.description, SUM(c.amount) AS amount, COUNT(c.id) AS payment FROM user_referral a JOIN user b ON a.ref_user_id = b.id LEFT JOIN user_referral_payment c ON a.id = c.referral_id WHERE a.status = :status AND (b.name LIKE :name OR b.email = :email) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    /* notification page */
    public function countNotification()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotification($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE title LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE title LIKE :key ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationService($service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE service = :service');
        $stmt->bindValue(':service', $service);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationService($service, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE service = :service ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationServiceSearch($service, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE service = :service AND title LIKE :key');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationServiceSearch($service, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE service = :service AND title LIKE :key ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND title LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id AND title LIKE :key ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationServiceByUser($user_id, $service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND service = :service');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationServiceByUser($user_id, $service, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id AND service = :service ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countNotificationServiceSearchByUser($user_id, $service, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE user_id = :user_id AND service = :service AND title LIKE :key');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listNotificationServiceSearchByUser($user_id, $service, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, is_read, created_at FROM user_notification WHERE user_id = :user_id AND service = :service AND title LIKE :key ORDER BY is_read ASC, id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getNotification($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_notification WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function readNotification($id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_notification SET is_read = 1 WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function countUnreadNotification()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE is_read = 0');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listUnreadNotification()
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, created_at FROM user_notification WHERE is_read = 0 ORDER BY id DESC LIMIT 0, 10');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countUnreadNotificationByService($service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_notification WHERE service = :service AND is_read = 0');
        $stmt->bindValue(':service', $service);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listUnreadNotificationByService($service)
    {
        $stmt = $this->pdo->prepare('SELECT id, title, type, service, created_at FROM user_notification WHERE service = :service AND is_read = 0 ORDER BY id DESC LIMIT 0, 10');
        $stmt->bindValue(':service', $service);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function markAllRead()
    {
        $stmt = $this->pdo->prepare('UPDATE user_notification SET is_read = 1');
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    /* activity page */
    public function countActivity()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivity($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivitySearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE ip_address LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivitySearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivityType($type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE type = :type');
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivityType($type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE type = :type ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivityTypeSearch($type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE type = :type AND ip_address LIKE :key');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivityTypeSearch($type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE type = :type AND ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivityByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivityByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivitySearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id AND ip_address LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivitySearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id AND ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivityTypeByUser($user_id, $type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id AND type = :type');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivityTypeByUser($user_id, $type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id AND type = :type ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countActivityTypeSearchByUser($user_id, $type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_activity WHERE user_id = :user_id AND type = :type AND ip_address LIKE :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listActivityTypeSearchByUser($user_id, $type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_activity WHERE user_id = :user_id AND type = :type AND ip_address LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    /* session page */
    public function getSession($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_session WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function stopUserSession($id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE id = :id');
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
    
    public function stopActiveSession($user_id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_session SET logged_out = current_timestamp(), status = "Stopped" WHERE user_id = :user_id AND status = "Active"');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        var_dump($stmt->rowCount());
        return $stmt->rowCount();
    }
    
    public function countSession()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session');
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSession($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionSearchCountry($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE country = :key');
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countSessionSearchIp($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE ip_address = :key');
        $stmt->bindValue(':key', $key);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionSearchCountry($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.country = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionSearchIp($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.ip_address = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionStatusSearchCountry($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE country = :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countSessionStatusSearchIp($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE ip_address = :key AND status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionStatusSearchCountry($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.country = :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionStatusSearchIp($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.ip_address = :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionSearchCountryByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND country = :key');
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countSessionSearchIpByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND ip_address = :key');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionSearchCountryByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.country = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionSearchIpByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.ip_address = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countSessionStatusSearchCountryByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND country = :key AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function countSessionStatusSearchIpByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_session WHERE user_id = :user_id AND ip_address = :key AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listSessionStatusSearchCountryByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.country = :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionStatusSearchIpByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name FROM user_session a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.ip_address = :key AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', strtoupper($key));
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastUser($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.code as country FROM user a JOIN system_country b ON a.country_id  = b.id WHERE a.created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionByRegion($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT COUNT(a.id) AS session, b.name as country_name FROM user_session a JOIN system_country b ON a.country  = b.code WHERE a.created_at >= :created_at GROUP By a.country ORDER BY session LIMIT 10');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listSessionByDevice($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT browser, created_at FROM user_session WHERE created_at >= :created_at LIMIT 999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
