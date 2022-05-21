<?php

namespace Model;

class PayGate extends \System\Db
{
    public function getWithdraw($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM user_withdraw WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function setWithdrawPaid($id, $transaction = null)
    {
        $stmt = $this->pdo->prepare('UPDATE user_withdraw SET status = "Paid", transaction = :transaction WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':transaction', $transaction);
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
    
    public function depositAdvertiserBalance($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET adv_balance = adv_balance + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
    }
    
    public function createUserDeposit($user_id, $paygate_id, $amount, $status, $transaction = null, $description = null)
    {
        $stmt = $this->pdo->prepare('INSERT INTO user_deposit (user_id, paygate_id, amount, status, transaction, description) VALUES (:user_id, :paygate_id, :amount, :status, :transaction, :description)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':paygate_id', $paygate_id);
        $stmt->bindValue(':amount', $amount);
        $stmt->bindValue(':status', $status);
        $stmt->bindValue(':transaction', $transaction);
        $stmt->bindValue(':description', $description);
        $stmt->execute();

        return $this->pdo->lastInsertId();
    }
    
    public function increaseUserDeposit($user_id, $amount)
    {
        $stmt = $this->pdo->prepare('UPDATE user_balance SET deposit_count = deposit_count + 1, deposit_value = deposit_value + :amount WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':amount', $amount);
        $stmt->execute();

        return $stmt->rowCount();
    }
}