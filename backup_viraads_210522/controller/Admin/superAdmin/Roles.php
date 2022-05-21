<?php

namespace Controller\Admin\superAdmin;

class Roles
{
    public static function canApproveAd()
    {
        return true;
    }
    
    public static function canAssignGlobalTicket()
    {
        return true;
    }
    
    public static function canAssignAdvertiserTicket()
    {
        return true;
    }
    
    public static function canAssignPublisherTicket()
    {
        return true;
    }
    
    public static function canPayWithrawInvoice()
    {
        return true;
    }
    
    public static function __callStatic($name, $arguments)
    {
        return false;
    }
}