<?php

namespace Module\Exchange;

class Adcash
{
    protected $baseUrl = 'https://api.myadcash.com/api/v1/';
    protected $apiToken = null;
    protected $timezone = 'CET';
    protected $username = 'payment@gome.io';
    protected $password = 'Beba@9089';
    protected $publisherId = 858406;
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
            if(!$this->apiToken) $this->login();
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
            $cc = strtoupper($item->country);
            $revenue[$cc] = $item->earnings;
            $lastRevenue = $lastRevenue + $item->earnings;
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
                $cc = strtoupper($item->country);
                $this->twoDaysAgoData[$cc] = $item->earnings;
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
    
    private function login()
    {
        try {
            $res = $this->client->request('POST', 'auth', [
                'form_params' => [
                    'username'      => $this->username,
                    'password'      => $this->password
                ]
            ]);
            $res = json_decode((string) $res->getBody());
            if(!isset($res->token)) return null;
            $this->apiToken = $res->token;
        } catch(\Exception $e) {
            return null;
        }
    }
    
    private function call($date1, $date2)
    {
        if(!$this->apiToken) return null;
        try {
            $res = $this->client->request('GET', 'publishers/'.$this->publisherId.'/statistics/publisher-report', [
                'query' => [
                    'filters[zone]'     => $this->zone_id,
                    'start_date'        => $date1,
                    'end_date'          => $date2,
                    'group_by'          => 'country'
                ],
                'headers' => [
                    'Authorization'     => 'Bearer '.$this->apiToken,
                    'Content-Type'      => 'application/json'
                ]
            ]);
            $res = json_decode((string) $res->getBody());
            if(isset($res->message)) return null;
            return $res;
        } catch(\Exception $e) {
            return null;
        }
    }
}