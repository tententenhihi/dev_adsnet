<?php

namespace Module\Exchange;

class Mobidea
{
    protected $baseUrl = 'http://tubecorporate.com/api/videos/statistics';
    protected $apiToken = '';
    protected $timezone = '+2';
    protected $lastRevenue = 0;
    protected $client;
    protected $zone_id;
    protected $duration;
    protected $lastFromDate;
    protected $twoDaysAgoData = [];
}