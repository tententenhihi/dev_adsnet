<?php

namespace Module\OpenRTB;

class Clickadu
{
    protected $baseUrl = 'http://v2.api.clickadu.com/partner/';
    protected $apiToken = 'aaJbrwYwC7SvrJy8SG-kIRqB3wAeEZiPAnSA-OjywK1pyzWZyoufC5J9TiV1JM-SZx6RX6WxsJXlzr1f-1KzFJ-bSIcr2-phRJhp2_plz1PpntDoXVheva8XIy9oNaQ5';
    protected $timezone = 'EST';
    protected $lastRevenue = 0;
    protected $client;
    protected $zone_id;
    protected $duration;
    protected $lastFromDate;
    protected $twoDaysAgoData = [];
    
    public function __construct($zone_id)
    {
        $this->zone_id = $zone_id??null;
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
            $data = $this->call($date1, $date2);
            if($data === null) {
                $retry++;
                sleep($retry);
                continue;
            }
            break;
        }
        if($data === null) return false;
        
        $revenue = [];
        $lastRevenue = 0;
        foreach($data as $item) {
            $cc = strtoupper($item->geo);
            $revenue[$cc] = $item->money;
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
                $data = $this->call($date0, $date0);
                if($data === null) {
                    $retry++;
                    sleep($retry);
                    continue;
                }
                break;
            }
            if($data === null) return false;
            
            foreach($data as $item) {
                $cc = strtoupper($item->geo);
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
    
    private function call($date1, $date2)
    {
        try {
            $res = $this->client->request('GET', 'stats', [
                'query' => [
                    'zoneId'        => $this->zone_id,
                    'dateFrom'      => $date1,
                    'dateTo'        => $date2,
                    'groupBy'       => 'geo',
                    'format'        => 'json',
                    'timezone'      => $this->timezone,
                    'token'         => $this->apiToken
                ]
            ]);
            $res = json_decode((string) $res->getBody());
            if(!isset($res->stats)) return null;
            return $res->stats;
        } catch(\Exception $e) {
            return null;
        }
    }
}