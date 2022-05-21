<?php

namespace Model\Myaccount;

class Billing extends \System\Db
{
    public function getUserBalance($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_balance WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function countDeposit($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id AND status = :status AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listDeposit($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id AND a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWithdraw($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawStatus($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawStatusSearch($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id AND status = :status AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listWithdraw($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id AND a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawStatus($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawStatusSearch($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id AND a.status = :status AND a.transaction = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReceipt($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id AND (campaign_id = :key OR ad_id = :key)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptType($user_id, $type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id AND type = :type');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptTypeSearch($user_id, $type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id AND type = :type AND (campaign_id = :key OR ad_id = :key)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listReceipt($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_receipt WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_receipt WHERE user_id = :user_id AND (campaign_id = :key OR ad_id = :key) ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptType($user_id, $type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_receipt WHERE user_id = :user_id AND type = :type ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptTypeSearch($user_id, $type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_receipt WHERE user_id = :user_id AND type = :type AND (campaign_id = :key OR ad_id = :key) ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPaygate($type)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_paygate WHERE status = "Active" AND type = :type ORDER BY priority DESC');
        $stmt->bindValue(':type', $type);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listUserPayinfo($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_payinfo WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function updatePublisherBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET pub_balance = pub_balance + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function createUserWithdraw($user_id, $paygate_id, $amount, $status)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_withdraw (user_id, paygate_id, amount, status) VALUES (:user_id, :paygate_id, :amount, :status)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':paygate_id', $paygate_id);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function getUserPayinfo($user_id, $paygate_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_payinfo WHERE user_id = :user_id AND paygate_id = :paygate_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':paygate_id', (int) $paygate_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function createUserPayinfo($user_id, $paygate_id, $information)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_payinfo (user_id, paygate_id, information) VALUES (:user_id, :paygate_id, :information) ON DUPLICATE KEY UPDATE information = :information');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':paygate_id', (int) $paygate_id, \PDO::PARAM_INT);
        $stmt->bindValue(':information', $information);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function increaseUserWithdraw($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET withdraw_count = withdraw_count + 1, withdraw_value = withdraw_value + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function createUserDeposit($user_id, $paygate_id, $amount, $status, $description = null)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_deposit (user_id, paygate_id, amount, status, description) VALUES (:user_id, :paygate_id, :amount, :status, :description)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':paygate_id', $paygate_id);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function getPaygateById($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_paygate WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getUserDeposit($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS paygate_name, b.information AS information FROM user_deposit a JOIN system_paygate b ON a.paygate_id = b.id WHERE a.user_id = :user_id AND a.id = :id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getUserById($id)
    {
        $stmt = $this->pdo->prepare('SELECT a.name, a.phone, a.email, a.address, b.code AS country FROM user a JOIN system_country b ON a.country_id = b.id WHERE a.id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function setDepositStatus($user_id, $id, $status)
    {
        $stmt = $this->pdo->prepare('UPDATE user_deposit SET status = :status WHERE user_id = :user_id AND id = :id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function updateDeposit($id, $status, $transaction, $amount, $description = null)
    {
        $stmt = $this->pdo->prepare('UPDATE user_deposit SET status = :status, transaction = :transaction, amount = :amount, description = :description WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':transaction', $transaction);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function depositAdvertiserBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET adv_balance = adv_balance + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function increaseUserDeposit($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET deposit_count = deposit_count + 1, deposit_value = deposit_value + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function countBalance($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_balance_history WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listBalance($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, amount, service, description, created_at FROM user_balance_history WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countBalanceService($user_id, $service)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_balance_history WHERE user_id = :user_id AND service = :service');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt??0;
    }
    
    public function listBalanceService($user_id, $service, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, amount, service, description, created_at FROM user_balance_history WHERE user_id = :user_id AND service = :service ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createBalanceHistory($user_id, $service, $amount, $description)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_balance_history (user_id, service, amount, description) VALUES (:user_id, :service, :amount, :description)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':service', $service);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function getPublisherRevshare($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT revshare FROM publisher WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->revshare??null;
    }
}
