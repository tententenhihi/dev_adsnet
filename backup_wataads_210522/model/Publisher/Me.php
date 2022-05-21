<?php

namespace Model\Publisher;

class Me extends \System\Db
{
    public function saveNote($user_id, $user_note)
    {
        $stmt = $this->pdo->prepare('UPDATE publisher SET user_note = :user_note WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_note', $user_note);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
}
