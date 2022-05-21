<?php

namespace Module;

class HashIds
{
    private $salt = SYSTEM_TOKEN;
    private $alphabet = 'abcdefghijklmnopqrstuvwxyz0123456789';
    private $length = 8;
    private $hash = null;

    private function getHash()
    {
        if (!$this->hash) {
            $this->hash = new \Hashids\Hashids($this->salt, $this->length, $this->alphabet);
        }
        
        return $this->hash;
    }

    public function setSalt($salt)
    {
        $this->salt = $salt;
    }

    public function setAlphabet($alphabet)
    {
        $this->alphabet = $alphabet;
    }

    public function setLength($length)
    {
        $this->length = $length;
    }

    public function encode($id)
    {
        return $this->getHash()->encode($id);
    }

    public function decode($str)
    {
        $decode = $this->getHash()->decode($str);

        return $decode[0] ?? null;
    }
}
