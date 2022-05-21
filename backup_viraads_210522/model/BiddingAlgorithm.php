<?php

namespace Model;

class BiddingAlgorithm extends \System\Db
{
    public function getRateByFormat($id)
    {
        $stmt = $this->pdo->prepare('SELECT admin_ctr, admin_icr, min_impression_ctr, min_impression_icr FROM system_ad_format WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
    
    public function getRateByCountry($format_id, $country)
    {
        $stmt = $this->pdo->prepare('SELECT admin_ctr, admin_icr FROM system_country_rate WHERE format_id = :format_id AND country = :country');
        $stmt->bindValue(':format_id', (int) $format_id, \PDO::PARAM_INT);
        $stmt->bindValue(':country', $country);
        $stmt->execute();

        return $stmt->fetch();
    }
}