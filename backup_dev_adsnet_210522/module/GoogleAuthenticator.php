<?php

namespace Module;

class GoogleAuthenticator
{
    public $_codeLength = 6;

    public function createSecret()
    {
        $validChars = $this->_getBase32LookupTable();
        $secret = '';
        $rnd = random_bytes(16);
        for ($i = 0; $i < 16; ++$i) {
            $secret .= $validChars[ord($rnd[$i]) & 31];
        }

        return $secret;
    }

    public function getCode($secret, $timeSlice = null)
    {
        if ($timeSlice === null) {
            $timeSlice = floor(time() / 30);
        }

        $secretkey = $this->_base32Decode($secret);

        // Pack time into binary string
        $time = chr(0).chr(0).chr(0).chr(0).pack('N*', $timeSlice);
        // Hash it with users secret key
        $hm = hash_hmac('SHA1', $time, $secretkey, true);
        // Use last nipple of result as index/offset
        $offset = ord(substr($hm, -1)) & 0x0F;
        // grab 4 bytes of the result
        $hashpart = substr($hm, $offset, 4);

        // Unpak binary value
        $value = unpack('N', $hashpart);
        $value = $value[1];
        // Only 32 bits
        $value = $value & 0x7FFFFFFF;

        $modulo = pow(10, $this->_codeLength);

        return str_pad($value % $modulo, $this->_codeLength, '0', STR_PAD_LEFT);
    }

    public function getQRCode($name, $secret)
    {
        return "https://chart.apis.google.com/chart?chs=200x200&chld=M|0&cht=qr&chl=otpauth://totp/".urlencode($name.'?secret='.$secret);
    }

    public function verifyCode($secret, $code, $discrepancy = 2, $currentTimeSlice = null)
    {
        if (strlen($code) != 6) {
            return false;
        }
        
        if ($currentTimeSlice === null) {
            $currentTimeSlice = floor(time() / 30);
        }
        
        for ($i = -$discrepancy; $i <= $discrepancy; ++$i) {
            $calculatedCode = $this->getCode($secret, $currentTimeSlice + $i);
            if (hash_equals($calculatedCode, $code)) {
                return true;
            }
        }

        return false;
    }

    protected function _base32Decode($secret)
    {
        if (empty($secret)) {
            return '';
        }

        $base32chars = $this->_getBase32LookupTable();
        $base32charsFlipped = array_flip($base32chars);

        $paddingCharCount = substr_count($secret, $base32chars[32]);
        $allowedValues = array(6, 4, 3, 1, 0);
        if (!in_array($paddingCharCount, $allowedValues)) {
            return false;
        }
        for ($i = 0; $i < 4; ++$i) {
            if ($paddingCharCount == $allowedValues[$i] &&
                substr($secret, -($allowedValues[$i])) != str_repeat($base32chars[32], $allowedValues[$i])) {
                return false;
            }
        }
        $secret = str_replace('=', '', $secret);
        $secret = str_split($secret);
        $binaryString = '';
        for ($i = 0; $i < count($secret); $i = $i + 8) {
            $x = '';
            if (!in_array($secret[$i], $base32chars)) {
                return false;
            }
            for ($j = 0; $j < 8; ++$j) {
                $x .= str_pad(base_convert(@$base32charsFlipped[@$secret[$i + $j]], 10, 2), 5, '0', STR_PAD_LEFT);
            }
            $eightBits = str_split($x, 8);
            for ($z = 0; $z < count($eightBits); ++$z) {
                $binaryString .= (($y = chr(base_convert($eightBits[$z], 2, 10))) || ord($y) == 48) ? $y : '';
            }
        }

        return $binaryString;
    }

    protected function _getBase32LookupTable()
    {
        return array(
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', //  7
            'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', // 15
            'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', // 23
            'Y', 'Z', '2', '3', '4', '5', '6', '7', // 31
            '=',  // padding char
        );
    }
}