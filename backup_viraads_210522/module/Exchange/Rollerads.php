<?php

namespace Module\Exchange;

class Rollerads
{
    protected $baseUrl = 'https://api.rollerads.com/sites/';
    protected $apiToken = 'c297d8b11afa6a08a74951a2ff9d0c7ea9b1f40a29b74bfc06543efa93ae14b73d024a97b358a9aa5e4b9c3c04a2463aa895f7f17d6d832cc0d29f932f7827ba';
    protected $timezone = 'UTC';
    protected $lastRevenue = 0;
    protected $client;
    protected $site_id;
    protected $duration;
    protected $lastFromDate;
    protected $twoDaysAgoData = [];
    
    public function __construct($moduleData)
    {
        $this->site_id = $moduleData->site_id??null;
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
        if(!$this->site_id) return null;
        
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
            $cc = strtoupper($item->country_iso2);
            $revenue[$cc] = $item->amt_omoney;
            $lastRevenue = $lastRevenue + $item->amt_omoney;
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
                $cc = strtoupper($item->country_iso2);
                $this->twoDaysAgoData[$cc] = $item->amt_omoney;
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
            $res = $this->client->request('GET', 'stat', [
                'query' => [
                    'filters[site_id]'  => 'eq|'.$this->site_id,
                    'filters[dt]'       => 'bw|'.$date1.';'.$date2,
                    'page'              => 1,
                    'limit'             => 500,
                    'group'             => 'country'
                ],
                'headers' => [
                    'Accept'         => 'application/json',
                    'Content-Type'   => 'application/json',
                    'X-ACCESS-TOKEN' => $this->apiToken
                ]
            ]);
            $res = json_decode((string) $res->getBody());
            if(!isset($res->response->rows)) return null;
            return $res->response->rows;
        } catch(\Exception $e) {
            return null;
        }
    }
}