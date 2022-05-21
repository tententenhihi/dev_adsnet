<?php

namespace Module\Exchange;

class Hilltopads
{
    protected $baseUrl = 'https://hilltopads.com/api/publisher/';
    protected $apiToken = 'NEwJvbkCHVj7wqdman0vnzt2Z12SB6541NGLIQJz6jKSwFC9sXalH3mUXEKiujly';
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
        
        $revenue = [];
        $lastRevenue = 0;
        foreach($this->zone_id as $id) {
            $retry = 0;
            while($retry <= 3) {
                $data = $this->call($id, $date1, $date2);
                if($data === null) {
                    $retry++;
                    sleep($retry);
                    continue;
                }
                break;
            }
            if($data === null) return null;
            foreach($data as $country) {
                foreach($country as $item) {
                    $cc = strtoupper($item->countryCode);
                    if(!isset($revenue[$cc])) $revenue[$cc] = 0;
                    $revenue[$cc] = +$item->revenue;
                    $lastRevenue = $lastRevenue + $item->revenue;
                }
            }
                    
        }

        $this->lastRevenue = (int) round($lastRevenue);
        $this->duration = $hour + 24;
        
        if($this->lastFromDate != $date1) {
            $date->sub(new \DateInterval('P1D'));
            $date0 = $date->format('Y-m-d');
            $this->lastFromDate = $date1;
            
            foreach($this->zone_id as $id) {
                $retry = 0;
                while($retry <= 3) {
                    $data = $this->call($id, $date0, $date0);
                    if($data === null) {
                        $retry++;
                        sleep($retry);
                        continue;
                    }
                    break;
                }
                if($data === null) return null;
                foreach($data as $country) {
                    foreach($country as $item) {
                        $cc = strtoupper($item->countryCode);
                        if(!isset($this->twoDaysAgoData[$cc])) $this->twoDaysAgoData[$cc] = 0;
                        $this->twoDaysAgoData[$cc] = +$item->revenue;
                    }
                }
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
    
    private function call($id, $date1, $date2)
    {
        try {
            $res = $this->client->request('GET', 'listStats', [
                'query' => [
                    'key'           => $this->apiToken,
                    'date'          => $date1,
                    'date2'         => $date2,
                    'zoneId'        => $id,
                    'group'         => 'geo'
                ],
            ]);
            $res = json_decode((string) $res->getBody());
            if(!isset($res->result)) return null;
            return $res->result;
        } catch(\Exception $e) {
            return null;
        }
    }
}