<?php

namespace Module\Exchange;

class Admaven
{
    protected $baseUrl = 'http://admaven-report.s3.amazonaws.com/';
    protected $apiToken = null;
    protected $timezone = '+2';
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
        $data = $data1 = $data2 = '';
        while($retry <= 3) {
            if(!$data1) $data1 = $this->call($date1);
            if(!$data2) $data2 = $this->call($date2);
            if(!$data1 && !$data2) {
                $retry++;
                sleep($retry);
                continue;
            }
            $data = $data1.PHP_EOL.$data2;
            break;
        }
        if(!$data) return null;
        
        $lines = explode(PHP_EOL, $data);
        $revenue = [];
        $lastRevenue = 0;
        foreach($lines as $item) {
            if(!$item) continue;
            $item = trim(trim($item), ',');
            $d = explode(',', $item);
            $rev = array_pop($d);
            $cc = array_pop($d);
            if(!$cc || strlen($cc) != 2) continue;
            $cc = strtoupper($cc);
            if(!isset($revenue[$cc])) $revenue[$cc] = 0;
            $revenue[$cc] += (float) $rev;
            $lastRevenue = $lastRevenue + (float) $rev;
        }

        $this->lastRevenue = (int) round($lastRevenue);
        $this->duration = $hour + 24;
        
        if($this->lastFromDate != $date1) {
            $date->sub(new \DateInterval('P1D'));
            $date0 = $date->format('Y-m-d');
            $this->lastFromDate = $date1;
            
            $data = $this->call($date0);
            $lines = explode(PHP_EOL, $data);
            foreach($lines as $item) {
                if(!$item) continue;
                $item = trim(trim($item), ',');
                $d = explode(',', $item);
                $rev = array_pop($d);
                $cc = array_pop($d);
                if(!$cc || strlen($cc) != 2) continue;
                $cc = strtoupper($cc);
                if(!isset($this->twoDaysAgoData[$cc])) $this->twoDaysAgoData[$cc] = 0;
                $this->twoDaysAgoData[$cc] += (float) $rev;
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
            $res = $this->client->request('GET', $this->zone_id.'/'.$date.'/data.csv');
            $res = (string) $res->getBody();
            if(strpos($res, 'Error')) return '';
            return $res;
        } catch(\Exception $e) {
            return '';
        }
    }
}