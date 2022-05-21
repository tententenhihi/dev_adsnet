<?php

namespace Module;

class ConfEditor
{
    private $editing = [];
    private $lbEditing = null;
    private $rlEditing = null;
    
    public function lbConfigAddEdge($status, $ip, $id)
    {
        if(!$this->lbEditing) {
            $this->lbEditing = file_get_contents(LB_CONF);
            $this->editing[LB_CONF] = 'lbEditing';
        }
        $prefix = $status == 'Active' ? '        ' : '        #';
        $replace = $prefix.'server '.$ip.'; #EDGE:'.$id.'#';
        $signalLine = '# EDGE list';
        
        $this->lbEditing = str_replace($signalLine.PHP_EOL, $signalLine.PHP_EOL.$replace.PHP_EOL, $this->lbEditing);
    }
    
    public function lbConfigChangeEdgeIP($new, $old, $id)
    {
        if(!$this->lbEditing) {
            $this->lbEditing = file_get_contents(LB_CONF);
            $this->editing[LB_CONF] = 'lbEditing';
        }
        $this->lbEditing = str_replace('server '.$old.'; #EDGE:'.$id.'#', 'server '.$new.'; #EDGE:'.$id.'#', $this->lbEditing);
    }
    
    public function lbConfigChangeEdgeStatus($new, $old, $id)
    {
        if(!$this->lbEditing) {
            $this->lbEditing = file_get_contents(LB_CONF);
            $this->editing[LB_CONF] = 'lbEditing';
        }
        if($old == 'Active') {
            $find = '/server (.+); #EDGE:'.$id.'#/';
            $replace = '#$0';
        } else {
            $find = '/(#+)server (.+); #EDGE:'.$id.'#/';
            $replace = 'server $2; #EDGE:'.$id.'#';
        }
        $this->lbEditing = preg_replace($find, $replace, $this->lbEditing);
    }
    
    public function lbConfigDeleteEdge($ip, $id)
    {
        if(!$this->lbEditing) {
            $this->lbEditing = file_get_contents(LB_CONF);
            $this->editing[LB_CONF] = 'lbEditing';
        }
        $find = '/\h+(#+)?server '.$ip.'; #EDGE:'.$id.'#[\r\n]+/';
        $replace = '';
        $this->lbEditing = preg_replace($find, $replace, $this->lbEditing);
    }
    
    public function rlConfigAddEdge($ip, $id)
    {
        if(!$this->rlEditing) {
            $this->rlEditing = file_get_contents(RL_CONF);
            $this->editing[RL_CONF] = 'rlEditing';
        }
        $prefix = PHP_EOL.'-- edge '.$id.PHP_EOL;
        $sync = 'sync {default.rsync,source="/home/edge",target="'.$ip.':/home/edge",exclude={"lib/run/"},rsync={compress=true,acls=true,verbose=true,owner=true,group=true,perms=true,rsh="/usr/bin/ssh -p 2308 -o StrictHostKeyChecking=no"}}';
        $replace = $prefix.$sync.PHP_EOL;
        $signalLine = '-- EDGE list';
        
        $this->rlEditing = str_replace($signalLine, $signalLine.$replace, $this->rlEditing);
    }
    
    public function rlConfigDeleteEdge($ip, $id)
    {
        if(!$this->rlEditing) {
            $this->rlEditing = file_get_contents(RL_CONF);
            $this->editing[RL_CONF] = 'rlEditing';
        }
        $prefix = PHP_EOL.'-- edge '.$id.PHP_EOL;
        $sync = 'sync {default.rsync,source="/home/edge",target="'.$ip.':/home/edge",exclude={"/home/edge/lib/run/*","/home/edge/cache/*"},rsync={compress=true,acls=true,verbose=true,owner=true,group=true,perms=true,rsh="/usr/bin/ssh -p 2308 -o StrictHostKeyChecking=no"}}';
        $find = $prefix.$sync.PHP_EOL;
        $replace = '';
        
        $this->rlEditing = str_replace($find, $replace, $this->rlEditing);
    }
    
    public function save()
    {
        if(!$this->editing) return false;
        foreach($this->editing as $file => $content) {
            file_put_contents($file, $this->{$content});
            unset($this->{$content});
        }
        
        $this->editing = [];
        
        return true;
    }
}