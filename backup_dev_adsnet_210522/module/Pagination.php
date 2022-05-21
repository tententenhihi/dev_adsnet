<?php

namespace Module;

class Pagination
{
    private $limit = 20;
    private $total = 20;
    private $page;
    private $url;
    private $arg;

    public function __construct()
    {
        $ruri = $_SERVER['REQUEST_URI'];
        $this->url = rtrim(parse_url($ruri, PHP_URL_PATH), '/');
        $this->arg = parse_url($ruri, PHP_URL_QUERY);
        $this->page = $this->getCurrentPage();
    }

    public function setTotal($num)
    {
        $this->total = $num;
    }

    public function setLimit($num)
    {
        $this->limit = $num;
    }

    public function getInit()
    {
        return ($this->page - 1) * $this->limit;
    }

    public function getLimit()
    {
        return $this->limit;
    }

    public function getPage()
    {
        return $this->page;
    }

    public function getMaxPage()
    {
        return ceil($this->total / $this->limit);
    }

//    public function setup()
//    {
//        $max_page = $this->getMaxPage();
//        $html = '<nav class="pagination is-centered">';
//        if ($this->page == 1) {
//            $html .= '<a class="pagination-previous" disabled>First Page</a>';
//        } else {
//            $html .= '<a class="pagination-previous" href="'.$this->buildUrl(1).'">First Page</a>';
//        }
//        if ($this->page == $max_page || $max_page == 0) {
//            $html .= '<a class="pagination-next" disabled>Last Page</a>';
//        } else {
//            $html .= '<a class="pagination-next" href="'.$this->buildUrl($max_page).'">Last Page</a>';
//        }
//
//        $html .= '<ul class="pagination-list">';
//
//        $before = '';
//        for ($i = $this->page - 1; $i >= $this->page - 4 && $i > 0; --$i) {
//            $tmp = '<li><a class="pagination-link" href="'.$this->buildUrl($i).'">'.$i.'</a></li>';
//            $before = $tmp.$before;
//        }
//
//        $current = '<li><a class="pagination-link is-current" href="'.$this->buildUrl($this->page).'">'.$this->page.'</a></li>';
//
//        $after = '';
//        for ($i = $this->page + 1; $i <= $this->page + 4 && $i <= $max_page; ++$i) {
//            $after .= '<li><a class="pagination-link" href="'.$this->buildUrl($i).'">'.$i.'</a></li>';
//        }
//
//        $end = '</ul></nav>';
//
//        $html .= $before.$current.$after.$end;
//
//        return $html;
//    }

    public function setup()
    {
        $max_page = $this->getMaxPage();
        $html = '<div class="text-center">';



        $html .= '<ul class="pagination justify-content-center firstLast1-links">';
        if ($this->page == 1) {
            $html .= '<li class="page-item first"><a class="page-link" disabled>First</a></li>';
        } else {
            $html .= '<li class="page-item first"><a class="page-link" href="'.$this->buildUrl(1).'">First</a></li>';
        }

        $before = '';
        for ($i = $this->page - 1; $i >= $this->page - 4 && $i > 0; --$i) {
            $tmp = '<li class="page-item"><a class="page-link" href="'.$this->buildUrl($i).'">'.$i.'</a></li>';
            $before = $tmp.$before;
        }

        $current = '<li class="page-item active"><a class="page-link" href="'.$this->buildUrl($this->page).'">'.$this->page.'</a></li>';

        $after = '';
        for ($i = $this->page + 1; $i <= $this->page + 4 && $i <= $max_page; ++$i) {
            $after .= '<li class="page-item"><a class="page-link" href="'.$this->buildUrl($i).'">'.$i.'</a></li>';
        }

        $end='';
        if ($this->page == $max_page || $max_page == 0) {
            $end .= '<li class="page-item last"><a class="page-link" disabled>Last</a></li>';
        } else {
            $end .= '<li class="page-item last"><a class="page-link" href="'.$this->buildUrl($max_page).'">Last</a></li>';
        }
        $end .= '</ul></div>';

        $html .= $before.$current.$after.$end;

        return $html;
    }

    private function buildUrl($page)
    {
        if($this->arg && strpos($this->arg, 'page='.$this->page) !== false) {
            $arg = str_replace('page='.$this->page, 'page='.$page, $this->arg);
        } elseif(!$this->arg) {
            $arg = 'page='.$page;
        } else {
            $arg = $this->arg.'&page='.$page;
        }

        return $this->url.'?'.$arg;
    }

    private function getCurrentPage()
    {
        if ($this->arg && preg_match('@(&)?page=(\d+)@', $this->arg, $page)) {
            return $page[2] > 1 ? $page[2] : 1;
        }

        return 1;
    }
}