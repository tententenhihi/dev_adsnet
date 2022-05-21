<?php

namespace Model\Advertiser;

class Report extends \System\Db
{
    public function listCountry()
    {
        $stmt = $this->pdo->prepare('SELECT code, name FROM system_country LIMIT 9999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listPlatform()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_platform LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listOs()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_os LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listBrowser()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_browser LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listMapPlatformOs()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_os_platform LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listMapOsBrowser()
    {
        $stmt = $this->pdo->prepare('SELECT * FROM system_browser_os LIMIT 999');
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAdFormat()
    {
        $stmt = $this->pdo->prepare('SELECT name, id FROM system_ad_format LIMIT 999');
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    public function listActiveCampaign($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, status FROM advertiser_campaign WHERE user_id = :user_id AND status != "Pending" AND status != "Rejected" LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAudience($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_audience WHERE user_id = :user_id LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function listAd($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, campaign_id, ad_format FROM advertiser_ad WHERE user_id = :user_id LIMIT 9999');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function verifyUserAds($user_id, $array)
    {
        $stmt = $this->pdo->prepare('SELECT id, campaign_id FROM advertiser_ad WHERE user_id = :user_id AND id IN ('.implode(',', $array).')');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function verifyUserCampaigns($user_id, $array)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_campaign WHERE user_id = :user_id AND id IN ('.implode(',', $array).')');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    public function getTaskByNameAndId($task_name, $task_id)
    {
        $stmt = $this->pdo->prepare('SELECT id, task_data, message, status FROM system_task WHERE task_name = :task_name AND task_id = :task_id');
        $stmt->bindValue(':task_name', $task_name);
        $stmt->bindValue(':task_id', $task_id);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function deleteTask($id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM system_task WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function createTask($task_name, $task_id, $task_data)
    {
        $stmt = $this->pdo->prepare('INSERT INTO system_task (task_name, task_id, task_data) VALUES (:task_name, :task_id, :task_data)');
        $stmt->bindValue(':task_name', $task_name);
        $stmt->bindValue(':task_id', $task_id);
        $stmt->bindValue(':task_data', $task_data);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function countScheduleReport($user_id)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_report WHERE user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listScheduleReport($user_id, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, status, total_sent, created_at, reported_at, date_range FROM advertiser_report WHERE user_id = :user_id ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function countScheduleReportSearch($user_id, $key)
    {
        $stmt = $this->pdo->prepare('SELECT count(id) AS cnt FROM advertiser_report WHERE user_id = :user_id AND name LIKE :key');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch()->cnt ?? 0;
    }
    
    public function listScheduleReportSearch($user_id, $key, $init, $limit)
    {
        $stmt = $this->pdo->prepare('SELECT id, name, status, total_sent, created_at, reported_at, date_range FROM advertiser_report WHERE user_id = :user_id AND name LIKE :key ORDER BY id DESC LIMIT :init, :limit');
        $stmt->bindValue(':key', $key.'%');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':init', (int) $init, \PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int) $limit, \PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
    
    public function createScheduleReport($user_id, $name, $filter, $date_range, $month_date, $week_day, $hour)
    {
        $stmt = $this->pdo->prepare('INSERT INTO advertiser_report (user_id, name, filter, date_range, month_date, week_day, hour) VALUES (:user_id, :name, :filter, :date_range, :month_date, :week_day, :hour)');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':month_date', $month_date);
        $stmt->bindValue(':week_day', $week_day);
        $stmt->bindValue(':hour', (int) $hour, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':filter', $filter);
        $stmt->bindValue(':date_range', $date_range);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function deleteScheduleReport($user_id, $id)
    {
        $stmt = $this->pdo->prepare('DELETE FROM advertiser_report WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->rowCount();
    }
    
    public function getScheduleReport($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM advertiser_report WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function checkOwnerScheduleReport($user_id, $id)
    {
        $stmt = $this->pdo->prepare('SELECT id FROM advertiser_report WHERE id = :id AND user_id = :user_id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch();
    }
    
    public function updateScheduleReport($id, $name, $filter, $date_range, $month_date, $week_day, $hour)
    {
        $stmt = $this->pdo->prepare('UPDATE advertiser_report SET name = :name, filter = :filter, date_range = :date_range, month_date = :month_date, week_day = :week_day, hour = :hour WHERE id = :id');
        $stmt->bindValue(':id', (int) $id, \PDO::PARAM_INT);
        $stmt->bindValue(':month_date', (int) $month_date, \PDO::PARAM_INT);
        $stmt->bindValue(':week_day', (int) $week_day, \PDO::PARAM_INT);
        $stmt->bindValue(':hour', (int) $hour, \PDO::PARAM_INT);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':filter', $filter);
        $stmt->bindValue(':date_range', $date_range);
        $stmt->execute();
        
        return $this->pdo->lastInsertId();
    }
    
    public function getAdvertiserStatistic($user_id, $created_at)
    {
        $stmt = $this->pdo->prepare('SELECT SUM(impression) AS impression, SUM(click) AS click, SUM(conversion) AS conversion, SUM(cost) AS cost, SUM(reach) AS reach, country FROM advertiser_statistic WHERE user_id = :user_id AND created_at  = :created_at GROUP BY country LIMIT 400');
        $stmt->bindValue(':user_id', (int) $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':created_at', $created_at);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
