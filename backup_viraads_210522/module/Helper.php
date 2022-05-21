<?php

namespace Module;

class Helper
{
    public function currencyFormat($n, $c = '$', $d = 2, $p = '.', $v = ',')
    {
        $n = $n ? (float) $n : 0;
        if($n < 0) {
            $c = '-'.$c;
            $n = $n * -1;
        }
        
        return $c.number_format($n, $d, $p, $v);
    }
    
    public function numberFormat($number, $precision = 2, $suffixes = ['', 'K', 'M', 'B'], $n = 1000)
    {
        
        try{
            $number = (int) $number;
            if ($number < $n) {
                return $number.$suffixes[0];
            }
            $base = log($number, $n);
    
            return round(pow($n, $base - floor($base)), $precision).$suffixes[floor($base)];
        }
        catch(\Exception $e) {
            file_put_contents('/home/Helper.log',$e.getMessage().PHP_EOL."Number=".$number.PHP_EOL, FILE_APPEND);
        }
        
    }
    
    public function randomToken($bytes = 16)
    {
        return bin2hex(random_bytes($bytes));
    }
    
    public function randomNumber($length = 6)
    {
        $min = '1';
        $max = '9';
        for($i = 1; $i < $length; $i++) {
            $min .= '0';
            $max .= '9';
        }
        $min = $min == '1' ? 0 : (int) $min;
        $max = (int) $max;
        
        return mt_rand($min, $max);
    }
    
    public function validEmail($email)
    {
        $email = strtolower($email);
        if(strpos($email, '@gmail.com')) $email = str_replace('@gmailcom','@gmail.com',str_replace('.','',$email));
        
        return filter_var($email, FILTER_VALIDATE_EMAIL) ? $email : false;
    }
    
    public function validDate($date, $format = 'Y-m-d')
    {
        $d = \DateTime::createFromFormat($format, $date);
        
        return $d && $d->format($format) == $date ? $date : null;
    }
    
    public function validPhone($number)
    {
        $number = preg_replace("/[^0-9]/", "", ltrim($number, '0'));
        $length = strlen($number);
        
        return $length <= 10 ? $number : null;
    }
    
    public function validTimezone($tz)
    {
        return in_array($tz, timezone_identifiers_list());
    }
    
    public function validDomain($str)
    {
        if(!$str) return null;
        $str = strtolower($str);
        return parse_url($str, PHP_URL_HOST) ?: parse_url('http://'.$str, PHP_URL_HOST);
    }
    
    public function validCapping($str)
    {
        $arr = explode(':', $str);
        if(!isset($arr[1])) return null;
        if($arr[0] == 0) return null;
        if($arr[1] == '0h') return null;
        if($arr[1] == '0m') return null;
        
        return implode(':', $arr);
    }
    
    public function convertDateByTimezone($datetime, $from, $to, $format = 'Y-m-d')
    {
        $date = new \DateTime($datetime, new \DateTimeZone($from));
        $date->setTimezone(new \DateTimeZone($to));
        return $date->format($format);
    }
}
