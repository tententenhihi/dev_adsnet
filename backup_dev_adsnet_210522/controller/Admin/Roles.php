<?php

namespace Controller\Admin;

class Roles
{
    public static function listPermissions()
    {
        return ['superAdmin'];
    }
    
    public static function __callStatic($name, $arguments)
    {
        $permissions = self::listPermissions();
        
        $selected = [];
        foreach($permissions as $permission) {
            $class = '\\Controller\\Admin\\'.$permission.'\\Roles';
            $pick = $class::$name();
            if($pick) $selected[] = $permission;
        }
        
        return $selected;
    }
}