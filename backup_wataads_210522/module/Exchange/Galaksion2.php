<?php

namespace Module\Exchange;

class Galaksion2
{
    protected $baseUrl = 'https://noelsdoc.cam/pub_api/XbP81KMsL2JcjJXvNrVf/';
    protected $timezone = 'UTC';
    protected $lastRevenue = 0;
    protected $client;
    protected $zone_id;
    protected $duration;
    protected $lastFromDate;
    protected $twoDaysAgoData = [];
    
    public function __construct($moduleData)
    {
        $this->zone_id = $moduleData->zone_id??null;
        $this->client = new \GuzzleHttp\Client([
            'base_uri' => $this->baseUrl,
            'http_errors' => false,
            'timeout' => 60
        ]);
    }
    
    public function setLastFromDate($lastFromDate)
    {
        $this->lastFromDate = $lastFromDate;
    }
    
    public function getData()
    {
        if(!$this->zone_id) return null;
        
        /* from date and to date */
        $date = new \DateTime('now', new \DateTimeZone($this->timezone));
        $date2 = $date->format('Y-m-d');
        $hour = (int) $date->format('H');
        $date->sub(new \DateInterval('P1D'));
        $date1 = $date->format('Y-m-d');
        
        $retry = 0;
        while($retry <= 3) {
            $data1 = $this->call($date1);
            if($data1 === null) {
                $retry++;
                sleep($retry);
                continue;
            }
            break;
        }
        while($retry <= 3) {
            $data2 = $this->call($date2);
            if($data2 === null) {
                $retry++;
                sleep($retry);
                continue;
            }
            break;
        }
        if($data1 === null || $data2 === null) return false;
        
        $revenue = [];
        $lastRevenue = 0;
        foreach($data1 as $geo => $item) {
            $cc = strtoupper($geo);
            $revenue[$cc] = $item->money;
            $lastRevenue = $lastRevenue + $item->money;
        }
        foreach($data2 as $geo => $item) {
            $cc = strtoupper($geo);
            $revenue[$cc] = $revenue[$cc] ?? 0;
            $revenue[$cc] += $item->money;
            $lastRevenue = $lastRevenue + $item->money;
        }

        $this->lastRevenue = (int) round($lastRevenue);
        $this->duration = $hour + 24;
        
        if($this->lastFromDate != $date1) {
            $date->sub(new \DateInterval('P1D'));
            $date0 = $date->format('Y-m-d');
            $this->lastFromDate = $date1;
            
            $retry = 0;
            while($retry <= 3) {
                $data = $this->call($date0);
                if($data === null) {
                    $retry++;
                    sleep($retry);
                    continue;
                }
                break;
            }
            if($data === null) return false;
            
            foreach($data as $geo => $item) {
                $cc = strtoupper($geo);
                $this->twoDaysAgoData[$cc] = $item->money;
            }
        }
        
        return $revenue;
    }
    
    public function getDuration()
    {
        return $this->duration;
    }
    
    public function lastRevenue()
    {
        return $this->lastRevenue;
    }
    
    public function getTimeZone()
    {
        return $this->timezone;
    }
    
    public function lastFromDate()
    {
        return $this->lastFromDate;
    }
    
    public function twoDaysAgoData()
    {
        return $this->twoDaysAgoData;
    }
    
    private function call($date)
    {
        try {
            $res = $this->client->request('GET', $date);
            $res = json_decode((string) $res->getBody());
            return $res->{$this->zone_id} ?? [];
        } catch(\Exception $e) {
            return null;
        }
    }
}