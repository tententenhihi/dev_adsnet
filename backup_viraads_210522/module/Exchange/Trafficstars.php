<?php

namespace Module\Exchange;

class Trafficstars
{
    protected $baseUrl = 'https://api.trafficstars.com/';
    protected $apiToken = null;
    protected $timezone = 'CET';
    protected $username = '--email--';
    protected $password = '--pass--';
    protected $clientId = '--clientid--';
    protected $clientSecret = '--client-secrect--';
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
        
        if(!$this->apiToken) $this->login();
        return $this->call($date1, $date2);
        
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
            $res = $this->client->request('POST', 'v1/auth/token', [
                'form_params' => [
                    'grant_type'    => 'password',
                    'client_id'     => $this->clientId,
                    'client_secret' => $this->clientSecret,
                    'username'      => $this->username,
                    'password'      => $this->password
                ]
            ]);
            $res = json_decode((string) $res->getBody());
            if(!isset($res->access_token)) return null;
            $this->apiToken = $res->access_token;
        } catch(\Exception $e) {
            return null;
        }
    }
    
    private function call($date1, $date2)
    {
        if(!$this->apiToken) return null;
        try {
            $res = $this->client->request('GET', 'v1.1/publisher/custom/report/by-country', [
                'query' => [
                    'app_id'        => $this->zone_id,
                    'date_from'     => $date1,
                    'date_to'       => $date2
                ],
                'headers' => [
                    'Authorization'     => 'Bearer '.$this->apiToken,
                    'Content-Type'      => 'application/json'
                ]
            ]);
            $res = json_decode((string) $res->getBody());
            return $res;
            if(!isset($res->response)) return null;
            return $res->response;
        } catch(\Exception $e) {
            return null;
        }
    }
}