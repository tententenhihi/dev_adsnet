<?php

namespace Module;

class BiddingAlgorithm
{
    protected $bidDecimalDigit = 5;
    protected $minImpressionToCalculateBid = 1000;
    protected $minActionToCalculateCTR = 2;
    protected $minActionToCalculateICR = 1;
    protected $minRevenueToCalculateBid = 0.5;
    protected $minImpressionToCheckCTR = 30000;
    protected $minImpressionToCheckICR = 60000;
    protected $minCTR = 0.00033;
    protected $minICR = 0.000033;
    protected $model = null;
    protected $cache = [];
    
    public function initRate($format_id = null, $country = null)
    {
        if(!$format_id) return false;
        
        if(!isset($this->cache[$format_id])) {
            $this->initModel();
            $rateByFormat = $this->model->getRateByFormat($format_id);
            $this->cache[$format_id] = $rateByFormat ? ['minCTR' => $rateByFormat->admin_ctr ?: null, 'minICR' => $rateByFormat->admin_icr ?: null, 'minImpressionToCheckCTR' => $rateByFormat->min_impression_ctr ?: null, 'minImpressionToCheckICR' => $rateByFormat->min_impression_icr ?: null] : false;
        }
        if($this->cache[$format_id] && $country && !isset($this->cache[$format_id][$country])) {
            $this->initModel();
            $rateByCountry = $this->model->getRateByCountry($format_id, $country);
            $ctrByCountry = $rateByCountry->admin_ctr ?? false;
            $icrByCountry = $rateByCountry->admin_icr ?? false;
            $this->cache[$format_id][$country] = $rateByCountry ? ['minCTR' => $ctrByCountry ?: null, 'minICR' => $icrByCountry ?: null] : false;
        }
        
        if(!$this->cache[$format_id]) return false;
        if(!isset($this->_minImpressionToCheckCTR)) $this->_minImpressionToCheckCTR = $this->minImpressionToCheckCTR;
        if(!isset($this->_minImpressionToCheckICR)) $this->_minImpressionToCheckICR = $this->minImpressionToCheckICR;
        if(!isset($this->_minCTR)) $this->_minCTR = $this->minCTR;
        if(!isset($this->_minICR)) $this->_minICR = $this->minICR;
        
        $this->minImpressionToCheckCTR = $this->cache[$format_id]['minImpressionToCheckCTR'] ?: $this->_minImpressionToCheckCTR;
        $this->minImpressionToCheckICR = $this->cache[$format_id]['minImpressionToCheckICR'] ?: $this->_minImpressionToCheckICR;
        if(isset($this->cache[$format_id][$country]['minCTR'])) {
            $this->minCTR = $this->cache[$format_id][$country]['minCTR'] ?: $this->cache[$format_id]['minCTR'] ?: $this->_minCTR;
        } else {
            $this->minCTR = $this->cache[$format_id]['minCTR'] ?: $this->_minCTR;
        }
        if(isset($this->cache[$format_id][$country]['minICR'])) {
            $this->minICR = $this->cache[$format_id][$country]['minICR'] ?: $this->cache[$format_id]['minICR'] ?: $this->_minICR;
        } else {
            $this->minICR = $this->cache[$format_id]['minICR'] ?: $this->_minICR;
        }

        return true;
    }
    
    public function zoneInitBid($floor_cpm)
    {
        $floor_cpm = $floor_cpm ? (float) $floor_cpm : 0;
        if(!$floor_cpm) return 0;
        
        return $this->bidFormat($floor_cpm/2000);
    }
    
    public function zoneMaintainBid($floor_cpm, $total_impression, $total_revenue, $recent_impression, $recent_revenue)
    {
        if(!$floor_cpm) return null;
        if($total_impression < $this->minImpressionToCalculateBid) return null;
        if($total_revenue < $this->minRevenueToCalculateBid) return null;
        
        if($recent_impression > $this->minImpressionToCalculateBid && $recent_revenue > $this->minRevenueToCalculateBid) {
            $impression =  $recent_impression;
            $revenue = $recent_revenue;
        } else {
            $impression =  $total_impression;
            $revenue = $total_revenue;
        }

        $factor = 2;
        if($impression > 100000) $factor = 3;
        if($impression > 1000000) $factor = 4;
        
        $currentBid = $revenue / $impression;
        $wantedBid = $floor_cpm / 1000;
        
        $controlBid = $wantedBid * $factor - ($factor - 1) * $currentBid;
        if($controlBid < 0) $controlBid = 0;
        
        return $this->bidFormat($controlBid);
    }
    
    public function adInitBid($pricing, $bidding, $format_id = null, $country = null)
    {
        if($format_id) $this->initRate($format_id, $country);
        
        if($pricing == 'cpm') {
            $bid = $bidding/1000;
        } elseif($pricing == 'cpc') {
            $bid = $bidding * $this->minCTR;
        } else {
            $bid = $bidding * $this->minICR;
        }
        
        return $this->bidFormat($bid);
    }
    
    public function adMaintainBid($pricing, $avgRate, $data)
    {
        $action = $pricing == 'cpc' ? $data->click : $data->conversion;
        $minAction = $pricing == 'cpc' ? $this->minActionToCalculateCTR : $this->minActionToCalculateICR;
        if($data->impression < $this->minImpressionToCalculateBid || $action < $minAction) {
            $rate = $avgRate;
        } else {
            $rate = $action / $data->impression;
        }
        
        $usedBid = $data->userBid * $rate;
        $expectedBid = ($data->internalBid + $usedBid) / 2;
        
        return $this->bidFormat($expectedBid);
    }
    
    public function getMinCTR($format_id = null, $country = null)
    {
        if($format_id) $this->initRate($format_id, $country);
        
        return $this->minCTR;
    }
    
    public function getMinICR($format_id = null, $country = null)
    {
        if($format_id) $this->initRate($format_id, $country);
        
        return $this->minICR;
    }
    
    public function getMinImpressionToCheckCTR($format_id = null)
    {
        if($format_id) $this->initRate($format_id);
        
        return $this->minImpressionToCheckCTR;
    }
    
    public function getMinImpressionToCheckICR($format_id = null)
    {
        if($format_id) $this->initRate($format_id);
        
        return $this->minImpressionToCheckICR;
    }
    
    public function getMinActionToCalculateCTR()
    {
        return $this->minActionToCalculateCTR;
    }
    
    public function getMinActionToCalculateICR()
    {
        return $this->minActionToCalculateICR;
    }
    
    public function performanceCTR($impression, $click, $format_id = null, $country = null)
    {
        if($format_id) $this->initRate($format_id, $country);
        
        if($impression < $this->minImpressionToCheckCTR) return null;
        
        $ctr = $click / $impression;
        if($ctr < $this->minCTR) return false;
        
        return true;
    }
    
    public function performanceICR($start_date, $impression, $conversion, $format_id = null, $country = null)
    {
        $start = strtotime($start_date);
        $now = strtotime(date('Y-m-d'));
        if($now - $start <= CONVERSION_DURATION) return null;
        
        if($format_id) $this->initRate($format_id, $country);
        
        if($impression < $this->minImpressionToCheckICR) return null;
        
        $icr = $conversion / $impression;
        if($icr < $this->minICR) return false;

        return true;
    }
    
    private function bidFormat($num)
    {
        return round($num, $this->bidDecimalDigit);
    }
    
    private function initModel()
    {
        if(!$this->model) $this->model = new \Model\BiddingAlgorithm;
    }
}