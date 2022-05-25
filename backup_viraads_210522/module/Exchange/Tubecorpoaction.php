<?php

namespace Module\Exchange;

class Tubecorpoaction
{
    protected $baseUrl = 'http://tubecorporate.com/api/videos/';
    protected $apiToken = 'tWsUlfdlDseQSZ5CafdOi3cvy4AwLuAceNNOlbD0PsPKqJp2lUd9XGsm64im';
    protected $timezone = '+2';
    protected $lastRevenue = 0;
    protected $client;
    protected $zone_id;
    protected $duration;
    protected $lastFromDate;
    protected $twoDaysAgoData = [];

    public function __construct($moduleData)
    {
        $this->site_id = $moduleData->zone_id??null;
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
            $cc = strtoupper($item->group_by);
            $revenue[$cc] = $item->revenue;
            $lastRevenue = $lastRevenue + $item->revenue;
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
                $cc = strtoupper($item->group_by);
                $this->twoDaysAgoData[$cc] = $item->revenue;
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
            file_put_contents('/home/Exchange.log',"START CALL DATA TUBE CORP".PHP_EOL, FILE_APPEND);
            $res = $this->client->request('GET', 'statistics', [
                'query' => [
                    'token'             => $this->apiToken,
                    'date_from'         => $date1,
                    'date_to'           => $date2,
                    'limit'             => 500,
                    'group'             => 'country',
                    'campaign'          => $this->zone_id
                ],
                'headers' => [
                    'Accept'         => 'application/json',
                    'Content-Type'   => 'application/json'
                ]
            ]);
            file_put_contents('/home/Exchange.log',$res->getBody().PHP_EOL, FILE_APPEND);
            $res = json_decode((string) $res->getBody());
            //
            if(!isset($res->response->rows)) return null;
            return $res->response->rows;
        } catch(\Exception $e) {
            file_put_contents('/home/Exchange.log', $e.getMessage().PHP_EOL.PHP_EOL.PHP_EOL, FILE_APPEND);
            return null;

        }
    }

}