<?php

namespace Model\Advertiser;

class Inventory extends \System\Db
{
    public function getInventory($created_at)
    {
        $stmt = $this->pdo->prepare('SELECT country, SUM(impression + cpc_impression + cpa_impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(revenue) AS cost, SUM(reach) AS reach FROM publisher_statistic WHERE created_at >= :created_at GROUP BY country ORDER BY impression DESC LIMIT 999');
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}