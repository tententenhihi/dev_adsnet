<?php

namespace Module;

class AdServer
{
    protected $queue = null;
    protected $server = null;
    protected $clickId = null;
    protected $referrer = null;
    protected $reach = null;
    protected $model = null;
    protected $algo = null;

    /* common */
    public function initQueue()
    {
        if($this->queue) return true;
        try {
            $this->queue = new \Redis;
            $this->queue->pconnect(BASE_PATH.'/lib/run/queueserver.sock');
        } catch (\Exception $e) {
            $this->queue = null;
            exit('Could not connect to queue server');
        }
    }
    
    public function initServer()
    {
        if($this->server) return true;
        try {
            $this->server = new \Redis;
            $this->server->pconnect(BASE_PATH.'/lib/run/adserver.sock', 0, 1, NULL, 0, 0, ['auth' => ADSERVER_AUTH]);
        } catch (\Exception $e) {
            $this->server = null;
            exit('Could not connect to adserver');
        }
    }
    
    public function initClickId()
    {
        if($this->clickId) return true;
        try {
            $this->clickId = new \Redis;
            $this->clickId->pconnect(BASE_PATH.'/lib/run/clickid.sock');
        } catch (\Exception $e) {
            $this->clickId = null;
            exit('Could not connect to clickId server');
        }
    }
    
    public function initReferrer()
    {
        if($this->referrer) return true;
        try {
            $this->referrer = new \Redis;
            $this->referrer->pconnect(BASE_PATH.'/lib/run/referrer.sock');
        } catch (\Exception $e) {
            $this->referrer = null;
            exit('Could not connect to Referrer server');
        }
    }
    
    public function initReach()
    {
        if($this->reach) return true;
        try {
            $this->reach = new \Redis;
            $this->reach->pconnect(BASE_PATH.'/lib/run/uniquevisitor.sock');
        } catch (\Exception $e) {
            $this->reach = null;
            exit('Could not connect to UniqueVisitor server');
        }
    }
    
    public function initModel()
    {
        if($this->model) return true;
        $this->model = new \Model\AdServer;
    }
    
    public function initAlgorithm()
    {
        if($this->algo) return true;
        $this->algo = new \Module\BiddingAlgorithm;
    }
    
    public function getInfo()
    {
        $this->initServer();
        $r = $this->server->eval("return redis.call('info')");
        if(!$r) {
            return $this->response(false, 'Could not get data, is server running?');
        }
        
        $r = explode('slave0:', $r);
        $r = isset($r[1]) ? explode('master_replid:', $r[1]) : [];
        $r = $r[0] ?? '';
        $r = explode(PHP_EOL, $r);
        
        $slaves = [];
        foreach($r as $line) {
            if(preg_match('@ip=([\d\.]+),port=\d+,state=([^,]+),offset=(\d+),lag=(\d)@', $line, $m)) {
                $slave = ['ip' => $m[1], 'state' => $m[2], 'offset' => $m[3], 'lag' => $m[4]];
                $slaves[] = $slave;
            }
        }
        
        return $this->response(true, $slaves);
    }
    
    private function response($success = true, $data = null)
    {
        return (object) ['success' => $success, 'data' => $data];
    }
    
    public function encode($data)
    {
        return msgpack_pack($data);
    }
    
    public function decode($str)
    {
        return msgpack_unpack($str);
    }
    
    /* db */
    public function updateTimezoneOffset()
    {
        $this->initModel();
        $this->initServer();
        $data = $this->model->listTimezoneOffset();

        $stmt = $this->server->multi(\Redis::PIPELINE);
        foreach($data as $item) {
            $stmt->set('offset_'.$item->code, $item->timezone_offset ?? "");
        }
        $stmt->exec();
        
        return $this->response();
    }
    
    /* zone */
    public function createZone($id, $data)
    {
        $this->initServer();
        $this->initAlgorithm();

        $data->bid = $this->algo->zoneInitBid($data->floor_cpm);
        unset($data->floor_cpm);
        
        /* treat as feature */
        if(!$data->treat_as) unset($data->treat_as);
        
        if(!$this->server->set('zone:detail:'.$id, $this->encode($data))) {
            return $this->response(false, 'Could not save data, is server running?');
        }
        
        return $this->response();
    }
    
    public function updateZoneBid($id, $floor_cpm, $total_impression, $total_revenue, $recent_impression, $recent_revenue)
    {
        $this->initServer();
        $data = $this->server->get('zone:detail:'.$id);
        if(!$data) return $this->response(false, 'Could not get data, is server running?');
        
        $this->initAlgorithm();
        $bid = $this->algo->zoneMaintainBid($floor_cpm, $total_impression, $total_revenue, $recent_impression, $recent_revenue);
        if(!$bid) return $this->response();
        
        $data = $this->decode($data);
        $data->bid = $bid;
        $this->server->set('zone:detail:'.$id, $this->encode($data));
        
        return $this->response();
    }
    
    public function removeZone($id)
    {
        $this->initServer();
        $this->server->del('zone:detail:'.$id);
        return $this->response();
    }
    
    /* ad */
    public function pauseAd($id)
    {
        $this->initServer();
        $ad = $this->server->get('ad:content:'.$id);
        if(!$ad) return $this->response(false, 'Ad not found on server');
        
        $this->initQueue();
        $key = 'ad:status:paused';
        if($this->queue->sAdd($key, $id)) {
            $array = $this->listAdFromSet($key);
            if(!$this->setTarget($key, $array)) {
                $this->queue->sAdd('queue', $key);
            }
        }

        return $this->response();
    }
    
    public function resumeAd($id)
    {
        $this->initServer();
        $ad = $this->server->get('ad:content:'.$id);
        if(!$ad) return $this->response(false, 'Ad not found on adserver');
        
        $this->initQueue();
        $key = 'ad:status:paused';
        if($this->queue->sRem($key, $id)) {
            $array = $this->listAdFromSet($key);
            if(!$this->setTarget($key, $array)) {
                $this->queue->sAdd('queue', $key);
            }
        }
        
        return $this->response();
    }
    
    public function stopAd($id)
    {
        $this->initServer();
        $ad = $this->server->get('ad:content:'.$id);
        if(!$ad) return $this->response(false, 'Ad not found on server');

        $this->initQueue();
        $key = 'ad:status:done';
        if($this->queue->sAdd($key, $id)) {
            $array = $this->listAdFromSet($key);
            if(!$this->setTarget($key, $array)) {
                $this->queue->sAdd('queue', $key);
            }
        }

        return $this->response();
    }
    
    public function cleanAd($id)
    {
        $this->initModel();
        $data = $this->model->listAdData($id);
        $cleared = [];
        if($data) {
            $this->model->clearAdData($id);
            foreach($data as $item) {
                $cleared[] = $item->format.':'.$item->dimension.':'.$item->name;
            }
        }
        
        $this->initQueue();
        $keys = ['ad:status:capped', 'ad:status:paused', 'ad:status:done'];
        foreach($keys as $key) {
            $this->queue->sRem($key, $id);
            $cleared[] = $key;
        }

        $this->queue->sAdd('queue', ...$cleared);
        return $this->response();
    }
    
    public function createAd($id)
    {
        $this->initModel();
        $is_ex = $this->isExchangeAd($id);
        $ad = $is_ex ? $this->model->getAdEx($this->unPrefixExchangeAd($id)) : $this->model->getAd($id);
        if(!$ad) return $this->response(false, 'Ad ID #'.$id.' not found');
        
        /* treat as feature */
        $ad_format = $ad->treat_as ? $ad->treat_as : $ad->ad_format;
        
        /* ad types */
        $ad_types = $is_ex ? $this->model->listAdExTypeData($ad->id) : $this->model->listAdTypeData($ad->id);
        
        /* ad data */
        $data = json_decode($ad->data);
        if($is_ex) {
            $data->bidding = $data->country_bidding ? $data->country_bidding : new \stdClass;
            $data->bidding->default = $ad->bidding;
        }
        
        /* using queue server */
        $this->initQueue();
        
        /* hard capping - ie remaining */
        $remain_key = 'ad:remain:'.$id;
        if(!$is_ex && !$this->queue->exists($remain_key)) {
            $remain_conversion = $ad->pricing_model == 'cpa' && $data->goal_total ? (int) $data->goal_total : 'none';
            $remain_click = $ad->pricing_model == 'cpc' && $data->goal_total ? (int) $data->goal_total : 'none';
            $remain_impression = $ad->pricing_model == 'cpm' && $data->goal_total ? (int) $data->goal_total : 'none';
            
            $ad_remaining = [];
            $ad_remaining['budget'] = (float) $ad->budget;
            $ad_remaining['impression'] = $remain_impression;
            $ad_remaining['click'] = $remain_click;
            $ad_remaining['conversion'] = $remain_conversion;
        }
        
        /* daily capping */
        $daily_key = 'ad:daily:'.$id;
        if(!$is_ex && ($data->goal_daily || $data->budget_daily)) {
            $reset_at = strtotime('tomorrow');
            $ad_daily = ['reset_at' => $reset_at, 'budget' => 'none', 'impression' => 'none', 'click' => 'none', 'conversion' => 'none'];
            if($data->budget_daily) {
                $ad_daily['budget_daily'] = (float) $data->budget_daily;
                $ad_daily['budget'] = $ad_daily['budget_daily'];
            }
            if($data->goal_daily) {
                $ad_daily['impression_daily'] = $data->pricing_model == 'cpm' ? (int) $data->goal_daily : 'none';
                $ad_daily['click_daily'] = $data->pricing_model == 'cpc' ? (int) $data->goal_daily : 'none';
                $ad_daily['conversion_daily'] = $data->pricing_model == 'cpa' ? (int) $data->goal_daily : 'none';
                $ad_daily['impression'] = $ad_daily['impression_daily'];
                $ad_daily['click'] = $ad_daily['click_daily'];
                $ad_daily['conversion'] = $ad_daily['conversion_daily'];
            }
        }
            
        /* custom & system capping */
        $capping_key = 'ad:capping:'.$id;
        if(!$is_ex && (DEFAULT_CAPPING || $data->budget_capping || $data->goal_capping)) {
            $ad_capping = ['budget' => 'none', 'impression' => 'none', 'click' => 'none', 'conversion' => 'none'];
            $now = time();
            if($data->budget_capping) {
                $cap = $this->parseCapping($data->budget_capping, 'float');
                $ad_capping['budget_value'] = $cap->value;
                $ad_capping['budget'] = $ad_capping['budget_value'];
                $ad_capping['budget_second'] = $cap->second;
                $ad_capping['budget_reset'] = $now + $ad_capping['budget_second'];
            }
            if($data->goal_capping) {
                $cap = $this->parseCapping($data->goal_capping);
                $ad_capping['impression_value'] = $ad->pricing_model == 'cpm' ? $cap->value : 'none';
                $ad_capping['click_value'] = $ad->pricing_model == 'cpc' ? $cap->value : 'none';
                $ad_capping['conversion_value'] = $ad->pricing_model == 'cpa' ? $cap->value : 'none';
                $ad_capping['goal_second'] = $cap->second;
                $ad_capping['goal_reset'] = $now + $ad_capping['goal_second'];
                $ad_capping['impression'] = $ad_capping['impression_value'];
                $ad_capping['click'] = $ad_capping['click_value'];
                $ad_capping['conversion'] = $ad_capping['conversion_value'];
            }
            if(DEFAULT_CAPPING) {
                $cap = $this->parseCapping(DEFAULT_CAPPING, 'float');
                if(!isset($ad_capping['budget_value'])) {
                    $ad_capping['budget_value'] = $cap->value;
                    $ad_capping['budget'] = $ad_capping['budget_value'];
                    $ad_capping['budget_second'] = $cap->second;
                    $ad_capping['budget_reset'] = $now + $ad_capping['budget_second'];
                } else {
                    $cur = $ad_capping['budget_value']/$ad_capping['budget_second'];
                    $new = $cap->value/$cap->second;
                    if($new < $cur) {
                        $ad_capping['budget_value'] = round($new * $ad_capping['budget_second'], 3);
                        $ad_capping['budget'] = $ad_capping['budget_value'];
                    }
                }
            }
        }
            
        /* ad content */
        $content_key = 'ad:content:'.$id;
        if($is_ex) {
            $ad_content = ['url' => $ad->url, 'external_url' => 1];
            $ad_content['campaign_id'] = $this->prefixExchangeAd($ad->network_id);
            $ad_content['user_id'] = 0;
        } else {
            $ad_content = (array) $data->content;
            $ad_content['campaign_id'] = $ad->campaign_id;
            $ad_content['user_id'] = $ad->user_id;
            if($ad->ad_file) $ad_content['ad_file'] = $ad->ad_file;
        }
        $ad_content['ad_format'] = $ad->ad_format;
        $ad_content['pricing_model'] = $ad->pricing_model;
        $ad_content['capping'] = false;
        if(isset($ad_daily) || isset($ad_capping)) $ad_content['capping'] = true;
        if($ad->pricing_model != 'cpm') $ad_content['bidding'] = $data->bidding;
        
        /* ad targeting */
        $ad_targeting = [];
        
        /* type targeting */
        if($ad_types) {
            foreach($ad_types as $k => $v) {
                $ad_targeting[$ad_format.':type:'.$v->type_id] = 1;
            }
        }
        
        /* browser targeting */
        if(isset($data->browser_include[0])) {
            foreach($data->browser_include as $k => $v) {
                $ad_targeting[$ad_format.':browser:'.$v] = 1;
            }
        } else {
            $ad_targeting[$ad_format.':browser:all'] = 1;
            if(isset($data->browser_exclude[0])) {
                foreach($data->browser_exclude as $v) {
                    $ad_targeting[$ad_format.':browser:'.$v] = 0;
                }
            }
        }
        
        /* platform targeting */
        if(isset($data->platform_include[0])) {
            foreach($data->platform_include as $k => $v) {
                $ad_targeting[$ad_format.':platform:'.$v] = 1;
            }
        } else {
            $ad_targeting[$ad_format.':platform:all'] = 1;
            if(isset($data->platform_exclude[0])) {
                foreach($data->platform_exclude as $v) {
                    $ad_targeting[$ad_format.':platform:'.$v] = 0;
                }
            }
        }
        
        /* os targeting */
        if(isset($data->os_include[0])) {
            foreach($data->os_include as $k => $v) {
                $ad_targeting[$ad_format.':os:'.$v] = 1;
            }
        } else {
            $ad_targeting[$ad_format.':os:all'] = 1;
            if(isset($data->os_exclude[0])) {
                foreach($data->os_exclude as $v) {
                    $ad_targeting[$ad_format.':os:'.$v] = 0;
                }
            }
        }
        
        /* hours in days targeting */
        if(isset($data->time_include[0])) {
            foreach($data->time_include as $k => $v) {
                $ad_targeting[$ad_format.':time:'.$v] = 1;
            }
        } else {
            $ad_targeting[$ad_format.':time:all'] = 1;
            if(isset($data->time_exclude[0])) {
                foreach($data->time_exclude as $v) {
                    $ad_targeting[$ad_format.':time:'.$v] = 0;
                }
            }
        }
        
        /* audience retargeting */
        if(isset($data->audience_include[0])) {
            foreach($data->audience_include as $k => $v) {
                $ad_targeting[$ad_format.':audience:'.$v] = 1;
            }
        } else {
            $ad_targeting[$ad_format.':audience:all'] = 1;
            if(isset($data->audience_exclude[0])) {
                foreach($data->audience_exclude as $v) {
                    $ad_targeting[$ad_format.':audience:'.$v] = 0;
                }
            }
        }
        
        /* website retargeting */
        if(isset($data->website_include[0])) {
            foreach($data->website_include as $k => $v) {
                $ad_targeting[$ad_format.':website:'.$v] = 1;
            }
        } else {
            $ad_targeting[$ad_format.':website:all'] = 1;
            if(isset($data->website_exclude[0])) {
                foreach($data->website_exclude as $v) {
                    $ad_targeting[$ad_format.':website:'.$v] = 0;
                }
            }
        }
        
        /* zone retargeting */
        if(isset($data->zone_include[0])) {
            foreach($data->zone_include as $k => $v) {
                $ad_targeting[$ad_format.':zone:'.$v] = 1;
            }
        } else {
            $ad_targeting[$ad_format.':zone:all'] = 1;
            if(isset($data->zone_exclude[0])) {
                foreach($data->zone_exclude as $v) {
                    $ad_targeting[$ad_format.':zone:'.$v] = 0;
                }
            }
        }
        
        /* ad bidding */
        $this->initAlgorithm();
        $ad_bidding = [];
        if(isset($data->country_include[0])) {
            foreach($data->country_include as $country) {
                $ad_bidding[$country] = $this->algo->adInitBid($ad->pricing_model, $data->bidding->{$country} ?? $data->bidding->default, $ad->ad_format, $country);
            }
        } else {
            $countries = $this->model->listCountries();
            if(isset($data->country_exclude[0])) {
                foreach($countries as $item) {
                    if(!in_array($item->code, $data->country_exclude)) {
                        $ad_bidding[$item->code] = $this->algo->adInitBid($ad->pricing_model, $data->bidding->{$item->code} ?? $data->bidding->default, $ad->ad_format, $item->code);
                    }
                }
            } else {
                foreach($countries as $item) {
                    $ad_bidding[$item->code] = $this->algo->adInitBid($ad->pricing_model, $data->bidding->{$item->code} ?? $data->bidding->default, $ad->ad_format, $item->code);
                }
            }
        }
        
        /* create ad */
        $this->initServer();
        $this->server->set($content_key, $this->encode($ad_content));
        if(isset($ad_remaining)) $this->queue->hMSet($remain_key, $ad_remaining);
        if(isset($ad_daily)) $this->queue->hMSet($daily_key, $ad_daily);
        if(isset($ad_capping)) $this->queue->hMSet($capping_key, $ad_capping);
        
        /* existing ad data */
        $data = $this->model->listAdData($id);
        $existing = [];
        if($data) {
            foreach($data as $item) {
                $existing[$item->format.':'.$item->dimension.':'.$item->name] = $item->value;
            }
        }
        
        /* hold queue keys */
        $queues = [];
        
        /* filter by targeting */
        foreach($ad_targeting as $k => $v) {
            if(!isset($existing[$k])) {
                $item = explode(':', $k);
                $this->model->createAdData($id, $item[0], $item[1], $item[2], $v);
                $queues[] = $k;
            } else {
                if($existing[$k] != $v) {
                    $item = explode(':', $k);
                    $this->model->updateAdData($id,  $item[0], $item[1], $item[2], $v);
                    $queues[] = $k;
                }
                unset($existing[$k]);
            }
        }
        
        /* filter by bidding */
        foreach($ad_bidding as $country => $bid) {
            $k = $ad_format.':bidding:'.$country;
            if(!isset($existing[$k])) {
                $this->model->createAdData($id, $ad_format, 'bidding', $country, $bid);
                $queues[] = $k;
            } else {
                if($existing[$k] != $bid) {
                    $this->model->updateAdData($id,  $ad_format, 'bidding', $country, $bid);
                    $queues[] = $k;
                }
                unset($existing[$k]);
            }
        }
        
        /* remove no longer wanted targeting/bidding */
        if($existing) {
            foreach($existing as $item => $val) {
                $item = explode(':', $item);
                $this->model->removeAdData($id, $item[0], $item[1], $item[2]);
                $queues[] = $item;
            }
        }
        
        /* save queues */
        if($queues) $this->queue->sAdd('queue', ...$queues);
        
        return $this->response();
    }
    
    public function createAdRTB($id)
    {
        $this->initModel();
        $ad = $this->model->getAdRTB($id);
        if(!$ad) return $this->response(false, 'Ad ID #'.$id.' not found');
        
        /* treat as feature */
        $ad_format = $ad->treat_as ? $ad->treat_as : $ad->ad_format;

        /* ad data */
        $data = json_decode($ad->data);
        
        /* ad content */
        $ad_content = ['endpoint' => $data->endpoint, 'method' => $data->method, 'param' => $data->param??false, 'version' => $data->version];
        $ad_content['campaign_id'] = $this->prefixRtbAd($ad->network_id);
        $ad_content['ad_format'] = $ad->ad_format;
        $ad_content['pricing_model'] = $ad->pricing_model;
        $ad_content['adjust'] = 1;
        
        /* ad rate */
        if($ad->pricing_model != 'cpm') {
            $this->initAlgorithm();
            $rate = $ad->pricing_model == 'cpc' ? $this->algo->getMinCTR($ad->ad_format) : $this->algo->getMinICR($ad->ad_format);
            $ad_content['rate'] = ['default' => $rate];
        }
        
        /* save data */
        $this->initServer();
        $data = $this->server->get('rtb:'.$ad_format);
        if(!$data) {
            $data = [];
        } else {
            $data = $this->decode($data);
        }
        $data[$this->prefixRtbAd($id)] = $ad_content;
        $this->server->set('rtb:'.$ad_format, $this->encode($data));
        
        return $this->response();
    }
    
    public function removeAd($id)
    {
        /* clean all targetings */
        $this->cleanAd($id);
        
        /* expire data in queue */
        $this->initQueue();
        $this->queue->expire('ad:remain:'.$id, 3600);
        $this->queue->expire('ad:daily:'.$id, 3600);
        $this->queue->expire('ad:capping:'.$id, 3600);
        
        /* expire data in adserver */
        $this->initServer();
        $this->server->expire('ad:content:'.$id, 3600);

        return true;
    }
    
    public function removeAdRTB($id)
    {
        $this->initModel();
        $ad = $this->model->getAdRTB($id);
        if(!$ad) return $this->response(false, 'Ad ID #'.$id.' not found');
        
        /* treat as feature */
        $ad_format = $ad->treat_as ? $ad->treat_as : $ad->ad_format;
        
        /* save data */
        $this->initServer();
        $data = $this->server->get('rtb:'.$ad_format);
        if(!$data) return $this->response();
        
        $data = $this->decode($data);
        $rtb_id = $this->prefixRtbAd($id);
        if(isset($data[$rtb_id])) {
            unset($data[$rtb_id]);
            $this->server->set('rtb:'.$ad_format, $this->encode($data));
        }

        return $this->response();
    }
    
    public function updateRtbAdRate($id, $rate)
    {
        $this->initModel();
        $ad = $this->model->getAdRTB($id);
        if(!$ad) return $this->response(false, 'Ad ID #'.$id.' not found');
        
        /* treat as feature */
        $ad_format = $ad->treat_as ? $ad->treat_as : $ad->ad_format;
        
        /* get data */
        $this->initServer();
        $data = $this->server->get('rtb:'.$ad_format);
        if(!$data) {
            return $this->createAdRTB($id);
        }
        
        $data = $this->decode($data);
        $ad_id = $this->prefixRtbAd($id);
        if(isset($rate['adjust'])) {
            $data[$ad_id]['adjust'] = (float) $rate['adjust'];
        }
        if(isset($rate['rate'])) {
            foreach($rate['rate'] as $k => $v) {
                $data[$ad_id]['rate'][$k] = (float) $v;
            }
        }
            
        $this->server->set('rtb:'.$ad_format, $this->encode($data));
        
        return $this->response();
    }
    
    public function getRtbAd($id)
    {
        $this->initModel();
        $ad = $this->model->getAdRTB($id);
        if(!$ad) return $this->response(false, 'Ad ID #'.$id.' not found');
        
        /* treat as feature */
        $ad_format = $ad->treat_as ? $ad->treat_as : $ad->ad_format;
        
        /* get data */
        $this->initServer();
        $data = $this->server->get('rtb:'.$ad_format);
        if(!$data) {
            $this->createAdRTB($id);
            return $this->getRtbAd($id);
        }
        
        $data = $this->decode($data);
        $ad_id = $this->prefixRtbAd($id);
        if(!isset($data[$ad_id])) {
            $this->createAdRTB($id);
            return $this->getRtbAd($id);
        }

        return $this->response(true, $data[$ad_id]);
    }
    
    public function getDoneAds()
    {
        $key = 'ad:status:done';
        return $this->listAdFromSet($key);
    }
    
    public function checkAdRemaining($id, $cost, $impression, $click, $conversion)
    {
        $remain_key = 'ad:remain:'.$id;
        $this->initQueue();
        $stmt = $this->queue->multi(\Redis::PIPELINE);
        $stmt->hIncrByFloat($remain_key, 'budget', -$cost);
        if($impression) $stmt->hIncrBy($remain_key, 'impression', -$impression);
        if($click) $stmt->hIncrBy($remain_key, 'click', -$click);
        if($conversion) $stmt->hIncrBy($remain_key, 'conversion', -$conversion);
        $check = $stmt->exec();
        
        $done = false;
        foreach($check as $item) {
            if($item === false) continue;
            if($item <= 0) {
                $done = true;
                break;
            }
        }
        
        if($done) $this->stopAd($id);
    }
    
    public function checkAdCapping($id, $cost, $impression, $click, $conversion)
    {
        $daily_key = 'ad:daily:'.$id;
        $capping_key = 'ad:capping:'.$id;
        $capped = false;
        
        $this->initQueue();
        $check_daily = $this->queue->exists($daily_key);
        $check_custom = $this->queue->exists($capping_key);
        if(!$check_daily && !$check_custom) return true;
        
        $stmt = $this->queue->multi(\Redis::PIPELINE);
        if($check_daily) {
            $stmt->hIncrByFloat($daily_key, 'budget', -$cost);
            if($impression) $stmt->hIncrBy($daily_key, 'impression', -$impression);
            if($click) $stmt->hIncrBy($daily_key, 'click', -$click);
            if($conversion) $stmt->hIncrBy($daily_key, 'conversion', -$conversion);
        }
        if($check_custom) {
            $stmt->hIncrByFloat($capping_key, 'budget', -$cost);
            if($impression) $stmt->hIncrBy($capping_key, 'impression', -$impression);
            if($click) $stmt->hIncrBy($capping_key, 'click', -$click);
            if($conversion) $stmt->hIncrBy($capping_key, 'conversion', -$conversion);
        }
        $check = $stmt->exec();

        foreach($check as $item) {
            if($item === false) continue;
            if($item <= 0) {
                $capped = true;
                break;
            }
        }
        
        if($capped) {
            $key = 'ad:status:capped';
            if($this->queue->sAdd($key, $id)) {
                $array = $this->listAdFromSet($key);
                if(!$this->setTarget($key, $array)) {
                    $this->queue->sAdd('queue', $key);
                }
            }
        }
    }
    
    public function releaseAdCapping()
    {
        $key = 'ad:status:capped';
        $data = $this->listAdFromSet($key);
        if(!$data) return true;
        
        $now = time();
        $changed = false;
        foreach($data as $id => $v) {
            $daily_key = 'ad:daily:'.$id;
            $custom_key = 'ad:capping:'.$id;
            $daily = $this->queue->hGetAll($daily_key);
            $custom = $this->queue->hGetAll($custom_key);
            
            /* release daily capped ads */
            $release_daily = false;
            if(isset($daily['reset_at']) && $daily['reset_at'] <= $now) {
                if($daily['budget'] != 'none')  $daily['budget'] = $daily['budget_daily'];
                if($daily['impression'] != 'none') $daily['impression'] = $daily['impression_daily'];
                if($daily['click'] != 'none') $daily['click'] = $daily['click_daily'];
                if($daily['conversion'] != 'none') $daily['conversion'] = $daily['conversion_daily'];
                $daily['reset_at'] = $now + 60*60*24;
                
                $this->queue->hMSet($daily_key, $daily);
                $release_daily = true;
            }
            
            /* release custom capped ads */
            $release_custom = false;
            if(isset($custom['budget_reset']) && $custom['budget_reset'] <= $now) {
                $custom['budget'] = $custom['budget_value'];
                $custom['budget_reset'] = $now + $custom['budget_second'];
                $release_custom = true;
            }
            if(isset($custom['goal_reset']) && $custom['goal_reset'] <= $now) {
                if($custom['impression'] != 'none') $custom['impression'] = $custom['impression_value'];
                if($custom['click'] != 'none') $custom['click'] = $custom['click_value'];
                if($custom['conversion'] != 'none') $custom['conversion'] = $custom['conversion_value'];
                $custom['goal_reset'] = $now + $custom['goal_second'];
                $release_custom = true;
            }
            if($release_custom) {
                $this->queue->hMSet($custom_key, $custom);
            }
            
            if($release_daily || $release_custom) {
                $changed = true;
                $this->queue->sRem($key, $id);
            }
        }
        
        if($changed) {
            $array = $this->listAdFromSet($key);
            if(!$this->setTarget($key, $array)) {
                $this->queue->sAdd('queue', $key);
            }
        }
    }
    
    public function updateAdBid($id, $newData)
    {
        /* existing ad bidding */
        $this->initModel();
        $currentData = $this->model->listAdBidding($id);
        if(!$currentData) return false;
        
        $existing = [];
        $ad_format = null;
        foreach($currentData as $item) {
            $existing[$item->format.':'.$item->dimension.':'.$item->name] = $item->value;
            if(!$ad_format) $ad_format = $item->format;
        }
        
        /* hold queue keys */
        $queues = [];
        foreach($newData as $country => $bid) {
            $key = $ad_format.':bidding:'.$country;
            if(isset($existing[$key]) && $existing[$key] != $bid) {
                $this->model->updateAdData($id, $ad_format, 'bidding', $country, $bid);
                $queues[] = $key;
            }
        }
        
        /* save queues */
        if($queues) {
            $this->initQueue();
            $this->queue->sAdd('queue', ...$queues);
        }
        
        return true;
    }
    
    public function listAdFromSet($key, $value = 1)
    {
        $data = [];
        $it = NULL;
        $this->initQueue();
        $this->queue->setOption(\Redis::OPT_SCAN, \Redis::SCAN_RETRY);
        while($ads = $this->queue->sScan($key, $it)) {
            foreach($ads as $id) {
                $data[$id] = $value;
            }
        }
        
        return $data;
    }
    
    public function setTarget($key, $value)
    {
        $this->initServer();
        return $this->server->set($key, $this->encode($value));
    }
    
    private function parseCapping($str, $type = 'int')
    {
        $arr = explode(':', $str);
        $value = $type == 'int' ? (int) $arr[0] : (float) $arr[0];
        $second = (int) $arr[1];
        if(strpos($arr[1], 'h')) {
            $second = $second * 60 * 60;
        } else {
            $second = $second * 60;
        }
        
        return (object) ['value' => $value, 'second' => $second];
    }
    
    /* queue */
    public function setQueue($data)
    {
        if($data) {
            $this->initQueue();
            $this->queue->sAdd('queue', ...$data);
        }
    }
    
    public function getQueue($cnt = 10)
    {
        $this->initQueue();
        return $this->queue->sPop('queue', $cnt);
    }
    
    /* edge */
    public function getEdgeMetric($ip, $number = 50)
    {
        $client = new \GuzzleHttp\Client(['base_uri' => 'http://'.$ip, 'http_errors' => false, 'timeout' => 10]);
        try {
            $res = $client->request('GET', '/mtdata', ['query' => ['s' => $number], 'headers' => ['TA-Secret-Token' => ADSERVER_AUTH]]);
            $raw = (string) $res->getBody();
            if(!$raw) return null;
            return explode(PHP_EOL, trim($raw));
        } catch(\Exception $e) {
            file_put_contents('/home/AdServer.log', $e->getMessage().PHP_EOL, FILE_APPEND);
            return null;
        }
    }
    
    /* conversion tracking */
    public function registerConversion($clickid, $payout)
    {
        $this->initClickId();
        if(!($data = $this->clickId->get($clickid))) return false;
        $data = $this->decode($data);
        $this->clickId->unlink($clickid);
        $data['payout'] = $payout;
        
        return $data;
    }
    
    public function pendingConversion($clickid, $data)
    {
        $this->initClickId();
        return $this->clickId->set($clickid, $this->encode($data), ['nx', 'ex'=> CONVERSION_DURATION]);
    }
    
    /* referrer collector */
    public function registerReferrer($zone_id, $data)
    {
        $this->initReferrer();
        $stmt = $this->referrer->multi(\Redis::PIPELINE);
        $stmt->sAdd('zone', $zone_id);
        foreach($data as $action => $items) {
            $stmt->sAdd('zone:'.$zone_id.':'.$action, ...$items);
        }
        $stmt->exec();
        return true;
    }
    
    public function zoneReferrerList()
    {
        $data = [];
        $it = NULL;
        $this->initReferrer();
        $this->referrer->setOption(\Redis::OPT_SCAN, \Redis::SCAN_RETRY);
        while($items = $this->referrer->sScan('zone', $it)) {
            foreach($items as $item) {
                $data[$item] = 1;
            }
        }
        
        return $data;
    }
    
    public function zoneReferrerData($zone_id, $action = 'impression')
    {
        $data = [];
        $it = NULL;
        $this->initReferrer();
        $this->referrer->setOption(\Redis::OPT_SCAN, \Redis::SCAN_RETRY);
        while($items = $this->referrer->sScan('zone:'.$zone_id.':'.$action, $it)) {
            foreach($items as $item) {
                $data[$item] = 1;
            }
        }
        
        return $data;
    }
    
    public function zoneReferrerClean($zone_id)
    {
        $this->initReferrer();
        $this->referrer->sRem('zone', $zone_id);
        $this->referrer->del('zone:'.$zone_id.':impression');
        $this->referrer->del('zone:'.$zone_id.':click');
        $this->referrer->del('zone:'.$zone_id.':conversion');

        return true;
    }
    
    public function scanReferrer($zone_id, $action, $cursor)
    {
        $this->initReferrer();
        return $this->referrer->rawCommand('sscan', 'zone:'.$zone_id.':'.$action, $cursor);
    }
    
    /* reach tracking */
    public function storeReach($date, $data)
    {
        $this->initReach();
        $stmt = $this->reach->multi(\Redis::PIPELINE);
        foreach($data as $name => $items) {
            foreach($items as $id => $item) {
                foreach($item as $country => $visitors) {
                    $key = $date.':'.$name.':'.$id.':'.$country;
                    $stmt->pfAdd($key, $visitors);
                }
            }
        }
        $stmt->exec();
        
        return true;
    }
    
    public function countReach($key)
    {
        $this->initReach();
        return $this->reach->pfCount($key);
    }
    
    public function countReachMulti($data)
    {
        $this->initReach();
        $keys = [];
        foreach($data as $item) {
            $key = $item['date'].':'.$item['name'].':'.$item['id'];
            $keys[] = $key;
        }
        
        return $this->reach->pfCount($keys);
    }
    
    public function listReachKey($date)
    {
        $data = [];
        $it = NULL;
        $this->initReach();
        $this->reach->setOption(\Redis::OPT_SCAN, \Redis::SCAN_RETRY);
        
        $match = $date.':*';
        while($items = $this->reach->scan($it, $match)) {
            foreach($items as $id) {
                $data[$id] = 1;
            }
        }
        
        return $data;
    }
    
    public function parseReachKey($key)
    {
        $r = explode(':', $key);
        return (object) ['date' => $r[0], 'name' => $r[1], 'id' => $r[2], 'country' => $r[3]];
    }
    
    public function removeReachKey($key)
    {
        $this->initReach();
        return $this->reach->del($key);
    }
    
    /* helper functions */
    public function isExchangeAd($id)
    {
        return strpos($id, 'e') === 0;
    }
    
    public function prefixExchangeAd($id)
    {
        return 'e'.$id;
    }
    
    public function unPrefixExchangeAd($id)
    {
        return substr($id, 1);
    }
    
    public function isRtbAd($id)
    {
        return strpos($id, 'r') === 0;
    }
    
    public function prefixRtbAd($id)
    {
        return 'r'.$id;
    }
    
    public function unPrefixRtbAd($id)
    {
        return substr($id, 1);
    }
}