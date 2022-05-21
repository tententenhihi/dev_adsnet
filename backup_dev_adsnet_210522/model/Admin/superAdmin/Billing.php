<?php

namespace Model\Admin\superAdmin;

class Billing extends \System\Db
{
    public function getUser($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    /* overview */
    public function sumAccountantData($type)
    {
        $stmt = $this->pdo->prepare('SELECT SUM(amount) AS amount FROM accountant WHERE type = :type');
        $stmt->bindValue(':type', (int) $type);
        $stmt->execute();

        return $stmt->fetch()->amount ?? 0;
    }
    
    public function sumAccountantDataByMonth($type, $firstDate)
    {
        $stmt = $this->pdo->prepare('SELECT SUM(amount) AS amount FROM accountant WHERE type = :type AND created_at >= :firstDate AND created_at < :firstDate + INTERVAL 1 MONTH');
        $stmt->bindValue(':type', (int) $type);
        $stmt->bindValue(':firstDate', $firstDate);
        $stmt->execute();

        return $stmt->fetch()->amount ?? 0;
    }
    
    public function listLatestAccountantData($type, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM accountant WHERE type = :type ORDER BY id DESC LIMIT :limit');
        $stmt->bindValue(':type', (int) $type);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function sumUserBalance()
    {
        $stmt = $this->pdo->prepare('SELECT SUM(adv_balance) AS adv_balance, SUM(pub_balance) AS pub_balance, SUM(pub_pending) AS pub_pending, SUM(withdraw_value) AS withdraw_value, SUM(deposit_value) AS deposit_value, SUM(receipt_value) AS receipt_value FROM user_balance');
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function countPublisher()
    {
        $stmt = $this->pdo->prepare('SELECT count(first_zone) AS cnt FROM publisher');
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function countAdvertiser()
    {
        $stmt = $this->pdo->prepare('SELECT count(first_ad) AS cnt FROM advertiser');
        $stmt->execute();

        return $stmt->fetch()->cnt ?? 0;
    }
    
    /* overview1 */
    public function listAdvertiserByBalance()
    {
        $stmt = $this->pdo->prepare('SELECT b.name as advertiser_name, a.deposit_value, a.receipt_value, a.adv_balance, (a.deposit_value - a.receipt_value - a.adv_balance) AS spent FROM user_balance a JOIN user b ON a.user_id = b.id ORDER BY a.deposit_value DESC, spent DESC LIMIT 10');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPublisherByImpression()
    {
        $stmt = $this->pdo->prepare('SELECT b.name as publisher_name, a.pub_balance, a.pub_pending, a.withdraw_value FROM user_balance a JOIN user b ON a.user_id = b.id ORDER BY a.pub_balance DESC, a.withdraw_value DESC LIMIT 10');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listNetworkByBalance()
    {
        $stmt = $this->pdo->prepare('SELECT name as network_name, revenue, payment FROM exchange_network ORDER BY revenue DESC, payment DESC LIMIT 10');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositByDate($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_deposit WHERE created_at >= :created_at LIMIT 9999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawByDate($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_withdraw WHERE created_at >= :created_at LIMIT 9999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listExchangeByDate($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM exchange_payment WHERE created_at >= :created_at LIMIT 9999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptByDate($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_receipt WHERE created_at >= :created_at LIMIT 9999999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listLastUserBalance()
    {
        $stmt = $this->pdo->prepare('SELECT a.*, c.code as country FROM user_balance a JOIN user b ON a.user_id = b.id JOIN system_country c ON b.country_id = c.id LIMIT 9999999');
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function totalDeposit()
    {
        $stmt = $this->pdo->prepare('SELECT SUM(amount) AS amount FROM user_deposit');
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function totalDepositStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT SUM(amount) AS amount FROM user_deposit WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function totalWithdraw()
    {
        $stmt = $this->pdo->prepare('SELECT SUM(amount) AS amount FROM user_withdraw');
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function totalWithdrawStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT SUM(amount) AS amount FROM user_withdraw WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function totalRevenuePaymentExchange()
    {
        $stmt = $this->pdo->prepare('SELECT COUNT(id) AS total_network, SUM(total_ad) AS total_ad, SUM(revenue) AS revenue, SUM(payment) AS payment FROM exchange_network');
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function totalUserBalance()
    {
        $stmt = $this->pdo->prepare('SELECT SUM(adv_balance) AS adv_balance, SUM(pub_balance) AS pub_balance, SUM(pub_pending) AS pub_pending, SUM(withdraw_value) AS withdraw_value, SUM(deposit_value) AS deposit_value, SUM(receipt_value) AS receipt_value FROM user_balance');
        $stmt->execute();

        return $stmt->fetch();
    }
    
    /* paygate */
    public function countPaygate()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_paygate');
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countPaygateSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_paygate WHERE name = :key');
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countPaygateStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_paygate WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countPaygateStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM system_paygate WHERE status = :status AND name = :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listPaygate($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_paygate ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPaygateSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_paygate WHERE name = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPaygateStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_paygate WHERE status = :status ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listPaygateStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_paygate WHERE status = :status AND name = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createPaygate($data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_paygate (name, description, type, information, status, min_value, max_value, priority) VALUES (:name, :description, :type, :information, :status, :min_value, :max_value, :priority)');
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':type', $data->type);
        $stmt->bindValue(':information', $data->information);
        $stmt->bindValue(':status', $data->status);
        $stmt->bindValue(':min_value', $data->min_value);
        $stmt->bindValue(':max_value', $data->max_value);
        $stmt->bindValue(':priority', $data->priority);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updatePaygate($data)
    {
        $stmt = $this->pdo->prepare('UPDATE system_paygate SET name = :name, description = :description, type = :type, information = :information, status = :status, min_value = :min_value, max_value = :max_value, priority = :priority WHERE id = :id');
        $stmt->bindValue(':id', (int) $data->id, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $data->name);
        $stmt->bindValue(':description', $data->description);
        $stmt->bindValue(':type', $data->type);
        $stmt->bindValue(':information', $data->information);
        $stmt->bindValue(':status', $data->status);
        $stmt->bindValue(':min_value', $data->min_value);
        $stmt->bindValue(':max_value', $data->max_value);
        $stmt->bindValue(':priority', $data->priority);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    /* deposit */
    public function countDeposit()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit');
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE transaction = :key');
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE status = :status AND transaction = :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listDeposit($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name  FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.status = :status AND a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countDepositByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countDepositStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_deposit WHERE user_id = :user_id AND status = :status AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listDepositByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name  FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listDepositStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_deposit a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.status = :status AND a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getUserDeposit($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_deposit WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function updateDeposit($id, $amount, $status, $transaction = null, $description = null)
    {
        $stmt = $this->pdo->prepare('UPDATE user_deposit SET amount = :amount, status = :status, transaction = :transaction, description = :description WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':transaction', $transaction);
        $stmt->bindValue(':description', $description);
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
    
    public function depositAdvertiserBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET adv_balance = adv_balance + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
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
    
    /* withdraw */
    public function countWithdraw()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw');
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE transaction = :key');
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawStatus($status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE status = :status');
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawStatusSearch($status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE status = :status AND transaction = :key');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listWithdraw($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawSearch($key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawStatus($status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawStatusSearch($status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.status = :status AND a.transaction = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countWithdrawByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawStatusByUser($user_id, $status)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id AND status = :status');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countWithdrawStatusSearchByUser($user_id, $status, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_withdraw WHERE user_id = :user_id AND status = :status AND transaction = :key');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listWithdrawByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.transaction = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawStatusByUser($user_id, $status, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.status = :status ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listWithdrawStatusSearchByUser($user_id, $status, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name AS method, c.name as user_name FROM user_withdraw a LEFT JOIN system_paygate b ON a.paygate_id = b.id JOIN user c ON a.user_id = c.id WHERE a.user_id = :user_id AND a.status = :status AND a.transaction = :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':key', $key);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function getUserPayinfo($user_id, $paygate_id)
    {
        $stmt = $this->pdo->prepare('SELECT information FROM user_payinfo WHERE user_id = :user_id AND paygate_id = :paygate_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':paygate_id', (int) $paygate_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->information ?? null;
    }
    
    public function getUserWithdraw($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_withdraw WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function updateWithdraw($id, $status, $transaction = null, $description = null)
    {
        $stmt = $this->pdo->prepare('UPDATE user_withdraw SET status = :status, transaction = :transaction, description = :description WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':transaction', $transaction);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    /* receipt */
    public function countReceipt()
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt');
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptSearch($key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE campaign_id = :key OR ad_id = :key');
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptType($type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE type = :type');
        $stmt->bindValue(':type', $type);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptTypeSearch($type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE type = :type AND (campaign_id = :key OR ad_id = :key)');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listReceipt($init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id WHERE a.campaign_id = :key OR a.ad_id = :key ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptType($type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id WHERE a.type = :type ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptTypeSearch($type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id WHERE a.type = :type AND (a.campaign_id = :key OR a.ad_id = :key) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countReceiptByUser($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptSearchByUser($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id AND (campaign_id = :key OR ad_id = :key)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptTypeByUser($user_id, $type)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id AND type = :type');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function countReceiptTypeSearchByUser($user_id, $type, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM user_receipt WHERE user_id = :user_id AND type = :type AND (campaign_id = :key OR ad_id = :key)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch()->cnt??0;
    }
    
    public function listReceiptByUser($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptSearchByUser($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND (a.campaign_id = :key OR a.ad_id = :key) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptTypeByUser($user_id, $type, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.type = :type ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function listReceiptTypeSearchByUser($user_id, $type, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT a.*, b.name as user_name FROM user_receipt a JOIN user b ON a.user_id = b.id WHERE a.user_id = :user_id AND a.type = :type AND (a.campaign_id = :key OR a.ad_id = :key) ORDER BY a.id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':type', $type);
        $stmt->bindValue(':key', (int) $key, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createReceipt($user_id, $description, $amount, $campaign_id, $ad_id, $type)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_receipt (user_id, campaign_id, ad_id, description, amount, type) VALUES (:user_id, :campaign_id, :ad_id, :description, :amount, :type)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':type', $type);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function updateReceipt($user_id, $id, $description, $amount, $campaign_id, $ad_id)
    {
        $stmt = $this->pdo->prepare('UPDATE user_receipt SET description = :description, user_id = :user_id, campaign_id = :campaign_id, ad_id = :ad_id, amount = :amount WHERE id = :id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':campaign_id', (int) $campaign_id, \PDO::PARAM_INT);
        $stmt->bindValue(':ad_id', (int) $ad_id, \PDO::PARAM_INT);
        $stmt->bindValue(':description', $description);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function deleteReceipt($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM user_receipt WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->rowCount();
    }

    public function createUserReferralPayment($user_id, $referral_id, $source, $commission, $amount){
        $stmt = $this->pdo->prepare('INSERT INTO user_referral_payment (user_id, referral_id, source, commission, amount) VALUES (:user_id, :referral_id, :source, :commission, :amount)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':referral_id', (int) $referral_id, \PDO::PARAM_INT);
        $stmt->bindValue(':source', $source);
        $stmt->bindValue(':commission', $commission);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }

    public function getUserReferral($ref_user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(*) as count, id, user_id FROM user_referral WHERE ref_user_id = :ref_user_id');
        $stmt->bindValue(':ref_user_id', (int) $ref_user_id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }


    public function getAllReferralUser(){
        $stmt = $this->pdo->prepare('SELECT * FROM user_referral');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function checkPublisherStatistic($user_id){
        $stmt = $this->pdo->prepare('SELECT count(*) FROM publisher_statistic WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch();
    }
    public function getPublisherStatistic($user_id, $created_at){
        $stmt = $this->pdo->prepare('SELECT sum(revenue) as total FROM publisher_statistic WHERE user_id = :user_id AND created_at = :created_at');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();
        return $stmt->fetch();
    }
    public function depositPublisherBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET pub_balance = pub_balance + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
    }
}
