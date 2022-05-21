<?php

namespace Module;

class NotificationTemplate
{
    public function stopAdTitle($id)
    {
        return 'Your Ad #'.$id.' has been stopped!';
    }
    
    public function stopAdDescription($pricing_model)
    {
        switch($pricing_model) {
            case 'cpc':
                return 'It will take maximum 1 hour more to verify all metrics, we will create receipt once done. Thank you';
                break;
            case 'cpa':
                return 'It will take '.$this->secondToTime(CONVERSION_DURATION).' more to register all conversions, we will create receipt once done. Thank you';
                break;
            default:
                return 'It will take maximum 1 hour more to verify all metrics, we will create receipt once done. Thank you';
                break;
        }
    }
    
    public function lowPerformanceCpcAdTitle($id)
    {
        return 'AD #'.$id.' low performance!!!';
    }
    
    public function lowPerformanceCpcAdDescription()
    {
        return 'Your Ad has very low CTR, please adjust your creative and/or targeting to optimize it\'s performance. Thank you';
    }
    
    public function lowPerformanceCpaAdTitle($id)
    {
        return 'AD #'.$id.' low performance!!!';
    }
    
    public function lowPerformanceCpaAdDescription()
    {
        return 'Your Ad has very low Conversion Rate, please adjust your creative and/or targeting to optimize it\'s performance. Thank you';
    }
    
    public function lowQualityTraffic($id)
    {
        return 'Zone #'.$id.' low quality traffic!!!';
    }
    
    public function lowQualityTrafficDescription()
    {
        return 'Dear Publisher, this zone has very low traffic quality, our system detected and warned about how it reacts to our advertising. Please check and take care on your end, otherwise we will have to take action soon. Thank you';
    }
    
    public function rejectZone($id)
    {
        return 'Zone #'.$id.' has been rejected!!!';
    }
    
    public function rejectZoneDescription()
    {
        return 'Unfortunately we have to reject this zone due to bad traffic quality, it\'s last 30days revenue will be removed from your balance to refund to our advertisers. Thank you';
    }
    
    public function pausedLowPerformanceAd($id)
    {
        return 'Ad #'.$id.' has been paused!!!';
    }
    
    public function pausedLowPerformanceAdDescription()
    {
        return 'Unfortunately the system has to pause this ad automatically due to low performance, please check/adjust your creative/targeting before resume it to make sure it will have better performance. Thank you';
    }
    
    public function rejectWebsite($id, $domain)
    {
        return 'Your website #'.$id.' ('.$domain.') has been rejected!';
    }
    
    public function rejectWebsiteDescription($reason)
    {
        return 'Unfortunately we had to reject your website because: '.$reason;
    }
    
    private function secondToTime($sec)
    {
        $dtF = new \DateTime('@0');
        $dtT = new \DateTime("@$sec");
        return $dtF->diff($dtT)->format('%a days %h hours');
    }
}