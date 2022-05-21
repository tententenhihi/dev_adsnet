<?php

namespace Module\OpenRTB;

class Rollerads
{
    protected $baseUrl = 'https://api.rollerads.com/sites/';
    protected $apiToken = '50b4a5a01d37c82cb3c7d1718dcd6886211fad6575eb050eb492fab2bdb52855e9ba52e8b53243818b6d8e9c947bc8c3d9441a22eff5ec79ed679109f2f14020';
    protected $timezone = 'UTC';
    protected $lastRevenue = 0;
    protected $client;
    protected $format_id;
    protected $duration;
    protected $lastFromDate;
    protected $twoDaysAgoData = [];
    
    public function __construct($format_id)
    {
        $this->format_id = $format_id??null;
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
        if(!$this->format_id) return null;
        
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
                    'filters[format_id]'  => 'eq|'.$this->format_id,
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