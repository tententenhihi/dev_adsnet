<style>
.admin-name {
    display: inline-block;
    white-space: nowrap;
    max-width: 360px;
    text-overflow: ellipsis;
    overflow: hidden;
    padding-left: .3rem;
}
.is-menu {
    color: #009dff !important;
}
.header-controls {
    margin-top: -0.55rem;
}
.header-controls .button, .header-controls .button:focus {
    border: none;
    box-shadow: none;
    padding-bottom: 1rem;
}
.dropdown-menu {
    margin-top: -0.5rem;
}
.google-visualization-tooltip {
    background: rgba(74,74,74,0.9);
    border-radius: 2px;
    border: none;
    padding: 0.1rem;
    text-overflow: ellipsis;
    white-space: pre;
    pointer-events:none;
    -webkit-box-shadow: 0 0 24px 0 rgba(0,0,0,.06), 0 1px 0 0 rgba(0,0,0,.02);
    box-shadow: 0 0 24px 0 rgba(0,0,0,.06), 0 1px 0 0 rgba(0,0,0,.02);
}
.media-content .title {
    margin-bottom: 0 !important;
}
.has-text-muted {
    color: #b5b5c3 !important;
}
.media-left .tag {
    width: 3rem;
    height: 3rem;
}
.media-left svg {
    width: 40px;
    height: 40px;
}
.media-right .icon, .button .icon {
    vertical-align: bottom;
}
.is-right {
    float: right !important;
}
.is-more {
    padding-top: 0;
    padding-right: 0;
    margin-top: -.5rem;
    background-color: transparent;
    border: none;
    color: #6c757d;
}
.is-more:focus {
    box-shadow: none !important;
}
.button.is-muted {
    background-color: #ebebf5c2;
    color: #b5b5c3;
    border: none;
    height: 2rem;
}
.button.is-muted:hover {
    background-color: #ebebf5;
    color: #7E8299;
}
.button.is-muted.is-right {
    background-color: transparent;
    width: 100%;
    justify-content: flex-end;
    padding-right: 0;
}
.button.is-muted.is-right:hover {
    background-color: transparent;
}
hr {
    margin: 0.5rem 0px .5rem 0px;
}
@media screen and (max-width: 768px) {
    .media-content {
        overflow-x: unset;
    }
}



.sumbox {
    display: flex;
    /*background-color: #fff;*/
    border-radius: 0.25rem;
    padding: 25px;
    border: none;
    /*-webkit-box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);*/
    /*box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);*/
    flex-flow: row nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
}
span.icon svg {
    width: 50px;
}

.title{
    font-size: 1.5rem;
}
.subtitle{
    font-size: 1rem;
}
.subtitle.is-2 {
    font-size: 2.5rem;
}
.title-1:not(:last-child) {
    margin-bottom: 1.5rem;
}
.subtitle.is-1 {
    font-size: 3rem;
}

.title-publisher-admin {
    flex: 1;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.icon{
    margin-right: 10px;
    font-size: 30px;
}
.percent{
    margin-right: 10px;
}
.trending-up-down{
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
<div class="content-body">

    <div class="row is-multiline" style="flex-wrap: wrap">
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/publisher/website/pending">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-publisher-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->pendingWebsite)?></h2>
                        <p style="color: #626262">Pending Websites</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-globe text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/billing/withdraw/pending">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-publisher-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->pendingWithdraw)?></h2>
                        <p style="color: #626262">Pending Withdraw</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-credit-card text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/support/opening">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-publisher-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->openTicket)?></h2>
                        <p style="color: #626262">Opening Publishers Tickets</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-ticket text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/user/publisher">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-publisher-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->countPublisher)?></h2>
                        <p style="color: #626262">Total Publishers</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
    </div>
    <div class="row" style="flex-wrap: wrap">
        <div class="col-lg-9 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected is-menu">Last Week</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-type" role="menu">
                            <a class="dropdown-item select-sort-publisher" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-sort-publisher" data-type="lastMonth">Last Month</a>
                        </div>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">By Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-publisher-location" data-type="impression">By Impression</a>
                            <a class="dropdown-item select-publisher-location" data-type="click">By Click</a>
                            <a class="dropdown-item select-publisher-location" data-type="conversion">By Conversion</a>
                            <a class="dropdown-item select-publisher-location" data-type="reach">By Reach</a>
                        </div>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <div class="hero">
                            <div class="chart-container" style="position: relative; width:100%; margin-top:1rem;">
                                <div id="chart-publisher-country"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-lg-3 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex" style="align-self: end;">
                        <h5>Most popular websites</h5>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Today</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-sort-website" data-type="today">Today</a>
                            <a class="dropdown-item select-sort-website" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-sort-website" data-type="lastMonth">Last Month</a>
                            <a class="dropdown-item select-sort-website" data-type="lastYear">Last Year</a>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th>Top Websites</th>
                                    <th>Impression</th>
                                </tr>
                                </thead>
                                <tbody id="list-website-by-impression">
                                <?php foreach($this->data->listWebsiteByImpression as $item): ?>
                                <tr>
                                    <td><span class="badge badge-primary"><?=$item->domain?></span></td>
                                    <td><?=$item->impression?></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row is-multiline">
        <div class="col-lg-4 col-md-12 col-12">
            <div class="card flatbox is-100height">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex" style="align-self: end;">
                        <h5>Operating system</h5>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Today</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-sort-os" data-type="today">Today</a>
                            <a class="dropdown-item select-sort-os" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-sort-os" data-type="lastMonth">Last Month</a>
                            <a class="dropdown-item select-sort-os" data-type="lastYear">Last Year</a>
                        </div>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-os"></div>
                            </div>
                        </div>
                        <p class="subtitle is-1 text-center" style="line-height: 2.5rem;" id="total_os_impression">30</p>
                        <h4 class="text-center">Total Os</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12 col-12">
            <div class="card flatbox is-100height">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex" style="align-self: end;">
                        <h5>Platform</h5>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Today</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-sort-platform" data-type="today">Today</a>
                            <a class="dropdown-item select-sort-platform" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-sort-platform" data-type="lastMonth">Last Month</a>
                            <a class="dropdown-item select-sort-platform" data-type="lastYear">Last Year</a>
                        </div>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-platform"></div>
                            </div>
                        </div>
                        <p class="subtitle is-1 text-center" style="margin-top:1.2rem" id="total_platform_impression">40</p>
                        <h4 class="text-center">Total Platform</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12 col-12">
            <div class="card flatbox is-100height">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex" style="align-self: end;">
                        <h5>Browser</h5>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Today</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-sort-browser" data-type="today">Today</a>
                            <a class="dropdown-item select-sort-browser" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-sort-browser" data-type="lastMonth">Last Month</a>
                            <a class="dropdown-item select-sort-browser" data-type="lastYear">Last Year</a>
                        </div>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-browser"></div>
                            </div>
                        </div>
                        <p class="subtitle is-1 text-center" style="margin-top:1.2rem" id="total_browser_impression">50</p>
                        <h4 class="text-center">Total Browser</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row is-multiline" style="flex-wrap: wrap">
        <div class="col-lg-3 col-md-12 col-12 text-center mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <h3>Total Websites</h3>
                        <p class="subtitle is-1" style="line-height: 2.5rem;"><?=$this->helper->numberFormat($this->data->totalWebsite)?></p>
                        <p class="trending-up-down text-<?php if($this->data->compareWebsite['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compareWebsite['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compareWebsite['total']?> (<?=$this->data->compareWebsite['totalPercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-total-website"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-lg-3 col-md-12 col-12 text-center mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <h3>Active Websites</h3>
                        <p class="subtitle is-1" style="line-height: 2.5rem;"><?=$this->helper->numberFormat($this->data->activeWebsite)?></p>
                        <p class="trending-up-down text-<?php if($this->data->compareWebsite['active'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compareWebsite['active'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compareWebsite['active']?> (<?=$this->data->compareWebsite['activePercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-active-website"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-lg-3 col-md-12 col-12 text-center mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <h3>Total Zones</h3>
                        <p class="subtitle is-1" style="line-height: 2.5rem;"><?=$this->helper->numberFormat($this->data->totalZone)?></p>
                        <p class="trending-up-down text-<?php if($this->data->compareZone['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compareZone['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compareZone['total']?> (<?=$this->data->compareWebsite['totalPercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-total-zone"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-12 col-12 text-center mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <h3>Active Zones</h3>
                        <p class="subtitle is-1" style="line-height: 2.5rem;"><?=$this->helper->numberFormat($this->data->activeZone)?></p>
                        <p class="trending-up-down text-<?php if($this->data->compareZone['active'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compareZone['active'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compareZone['active']?> (<?=$this->data->compareWebsite['activePercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-active-zone"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row is-multiline" style="flex-wrap: wrap">
        <div class="col-lg-3 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex" style="align-self: end;">
                        <h5>Most popular Pub</h5>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Today</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-sort-pub" data-type="today">Today</a>
                            <a class="dropdown-item select-sort-pub" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-sort-pub" data-type="lastMonth">Last Month</a>
                            <a class="dropdown-item select-sort-pub" data-type="lastYear">Last Year</a>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th>Top Publishers</th>
                                    <th>Websites</th>
                                </tr>
                                </thead>
                                <tbody id="list-publisher-by-impression">
                                <?php foreach($this->data->listPublisherByImpression as $item): ?>
                                <tr>
                                    <td><span class="badge badge-link"><?=$item->publisher_name?></span></td>
                                    <td><?=$item->impression?></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-12 col-12 mb-2">
            <div class="card flatbox text-center h-100 mb-0">
                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <h3 style="line-height: 2.5rem;">Total Impressions</h3>
                        <p>
                            <span class="subtitle is-2" id="total_publisher_impression"><?=$this->helper->numberFormat($this->data->last7day['impression'])?></span>
                        </p>
                        <p class="trending-up-down text-<?php if($this->data->compare['impression'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare['impression'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare['impression']?> (<?=$this->data->compare['impressionPercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <hr>
                        <h3 style="line-height: 2.5rem;">Total Clicks</h3>
                        <p>
                            <span class="subtitle is-2" id="total_publisher_click"><?=$this->helper->numberFormat($this->data->last7day['click'])?></span>
                        </p>
                        <p class="trending-up-down text-<?php if($this->data->compare['click'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare['click'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare['click']?> (<?=$this->data->compare['clickPercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <hr>
                        <h3 style="line-height: 2.5rem;">Total Reachs</h3>
                        <p>
                            <span class="subtitle is-2" id="total_publisher_reach"><?=$this->helper->numberFormat($this->data->last7day['reach'])?></span>
                        </p>
                        <p class="trending-up-down text-<?php if($this->data->compare['reach'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare['reach'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare['reach']?> (<?=$this->data->compare['reachPercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <hr>
                        <h3 style="line-height: 2.5rem;">Total Conversion</h3>
                        <p>
                            <span class="subtitle is-2" id="total_publisher_conversion"><?=$this->helper->numberFormat($this->data->last7day['conversion'])?></span>
                        </p>
                        <p class="trending-up-down text-<?php if($this->data->compare['conversion'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare['conversion'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare['conversion']?> (<?=$this->data->compare['conversionPercent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex" style="align-self: end;">

                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Last Week</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-chart-publisher" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-chart-publisher" data-type="lastMonth">Last Month</a>
                        </div>
                    </div>
                </div>

                <div class="card-content ">
                    <div class="card-body card-dashboard">
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-publisher"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */
var publisher_country_7day_data = <?=json_encode($this->data->countryLast7day)?>;
var publisher_country_30day_data = <?=json_encode($this->data->countryLast30day)?>;
var website_data =  <?=json_encode($this->data->last7dayWebsite_stats)?>;
var zone_data =  <?=json_encode($this->data->last7dayZone_stats)?>;
var publisher_data_7day = <?=json_encode($this->data->last7day_stats)?>;
var publisher_data_30day = <?=json_encode($this->data->last30day_stats)?>;
var os_data = <?=json_encode($this->data->listOs)?>;
var platform_data = <?=json_encode($this->data->listPlatform)?>;
var browser_data = <?=json_encode($this->data->listBrowser)?>;
var country_select_time = 'lastWeek';
var country_select_dimension = 'impression';
function ucwords(str) {
    return (str + '').toLowerCase().replace(/^(.)|\s+(.)/g, function (l) {return l.toUpperCase()});
}
function drawChart(id, type, data) {
    window.tacharts = window.tacharts || {};
    window.taoptions = window.taoptions || {};
    if(window.tacharts[id] === undefined) {
        if(type == 'area5') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#ffc3a0'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        } else if(type == 'area6') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#b00b69'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        } else if(type == 'area7') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#b4eeb4'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        } else if(type == 'area8') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#008080'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        }else if(type == 'geo') {
            window.tacharts[id] = new google.visualization.GeoChart(document.getElementById(id));
            window.taoptions[id] = {
                height: 350,
                keepAspectRatio: true,
                colorAxis: {colors: ['#ebcfea', '#8b4b8a']}
            };
        } else if(type == 'pie') {
            window.tacharts[id] = new google.visualization.PieChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                pieHole: 0.4,
                // sliceVisibilityThreshold: .05,
                legend:{position:'bottom',alignment:'center'},
                height: 260,
                chartArea:{width:'100%',height:200},
                colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}}
            };
        } else if(type == 'pie2') {
            window.tacharts[id] = new google.visualization.PieChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                pieHole: 0.4,
                // sliceVisibilityThreshold: .05,
                legend:{position:'bottom',alignment:'center'},
                height: 260,
                chartArea:{width:'100%',height:200},
                colors:['#f14668','#ffdd57','#AFB5FC','#66CDAA'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}}
            };
        } else if(type == 'bar') {
            window.tacharts[id] = new google.visualization.ColumnChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'bottom',alignment:'center'},
                height: 400,
                chartArea:{width:'100%',height:350},
            };
        }
    }
    window.tacharts[id].draw(data, window.taoptions[id]);
}
function drawChartWrap(id, type, cb) {
    window.tadrawing = window.tadrawing || {};
    var ms = 10, data = cb();
    if(window.tadrawing[id]) ms = 200;
    drawChart(id, type, data);
    $(window).on('resize', function(){window.tadrawing[id] = setTimeout(function(){drawChart(id, type, data)},ms)});
}
google.charts.load('current', {'packages':['geochart','corechart'],'mapsApiKey': 'AIzaSyDRDJMzEc-lrhfpOgehmn8Duta9Y8Blius'});
google.charts.setOnLoadCallback(function () {
    drawChartWrap('chart-publisher-country', 'geo', function(){
        var data = [];
        data.push(['Country', 'Impression']);
        for (const i in publisher_country_7day_data) {
          data.push([i,publisher_country_7day_data[i].impression]);
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-publisher', 'bar', function(){
        var data = [];
        data.push(['Time', 'Impression', 'Click', 'Conversion', 'Reach']);
        for (const i in publisher_data_7day) {
          data.push([i, publisher_data_7day[i].impression, publisher_data_7day[i].click, publisher_data_7day[i].conversion, publisher_data_7day[i].reach])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-website', 'area5', function(){
        var data = [];
        data.push(['Time', 'Total Websites']);
        for (const i in website_data) {
          data.push([i, website_data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-active-website', 'area6', function(){
        var data = [];
        data.push(['Time', 'Active Websites']);
        for (const i in website_data) {
          data.push([i, website_data[i].active])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-zone', 'area7', function(){
        var data = [];
        data.push(['Time', 'Total Zones']);
        for (const i in zone_data) {
          data.push([i, zone_data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-active-zone', 'area8', function(){
        var data = [];
        data.push(['Time', 'Active Zones']);
        for (const i in zone_data) {
          data.push([i, zone_data[i].active])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-os', 'pie', function(){
        var total_impression = 0;
        var data = [];
        data.push(['Os', 'Impression']);
        for (const i in os_data) {
          data.push([os_data[i]['os'], parseInt(os_data[i]['impression'])]);
          total_impression += parseInt(os_data[i]['impression']);
        }
        $('#total_os_impression').html(total_impression);
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-platform', 'pie2', function(){
        var total_impression = 0;
        var data = [];
        data.push(['Platform', 'Impression']);
        for (const i in platform_data) {
          data.push([platform_data[i]['platform'], parseInt(platform_data[i]['impression'])]);
          total_impression += parseInt(platform_data[i]['impression']);
        }
        $('#total_platform_impression').html(total_impression);
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-browser', 'pie', function(){
        var total_impression = 0;
        var data = [];
        data.push(['Browser', 'Impression']);
        for (const i in browser_data) {
          data.push([browser_data[i]['browser'], parseInt(browser_data[i]['impression'])]);
          total_impression += parseInt(browser_data[i]['impression']);
        }
        $('#total_browser_impression').html(total_impression);
        return google.visualization.arrayToDataTable(data);
    });
});
$(document).ready(function(){
    $('.select-sort-publisher').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        country_select_time = t;
        if( t == 'lastWeek'){
            var dataPublisherCountry = publisher_country_7day_data;
        }else if( t == 'lastMonth'){
            var dataPublisherCountry = publisher_country_30day_data;
        }
        drawChartWrap('chart-publisher-country', 'geo', function(){
            var data = [];
            data.push(['Country', ucwords(country_select_dimension)]);
            for (const i in dataPublisherCountry) {
              data.push([i,dataPublisherCountry[i][country_select_dimension]]);
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-publisher-location').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        country_select_dimension = t;
        if( country_select_time == 'lastWeek'){
            var dataPublisherCountry = publisher_country_7day_data;
        }else if( country_select_time == 'lastMonth'){
            var dataPublisherCountry = publisher_country_30day_data;
        }
        drawChartWrap('chart-publisher-country', 'geo', function(){
            var data = [];
            data.push(['Country', ucwords(country_select_dimension)]);
            for (const i in dataPublisherCountry) {
              data.push([i,dataPublisherCountry[i][country_select_dimension]]);
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-chart-publisher').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        if( t == 'lastWeek'){
            var dataPublisher = publisher_data_7day;
        }else if( t == 'lastMonth'){
            var dataPublisher = publisher_data_30day;
        }
        var total_impression = 0;
        var total_click = 0;
        var total_reach = 0;
        var total_conversion = 0;
        drawChartWrap('chart-publisher', 'bar', function(){
            var data = [];
            data.push(['Time', 'Impression', 'Click', 'Conversion', 'Reach']);
            for (const i in dataPublisher) {
              data.push([i, dataPublisher[i].impression, dataPublisher[i].click, dataPublisher[i].conversion, dataPublisher[i].reach])
              total_impression += dataPublisher[i].impression;
              total_click += dataPublisher[i].click;
              total_reach += dataPublisher[i].conversion;
              total_conversion += dataPublisher[i].reach;
            }
            $('#total_publisher_impression').html(total_impression);
            $('#total_publisher_click').html(total_click);
            $('#total_publisher_reach').html(total_reach);
            $('#total_publisher_conversion').html(total_conversion);
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-sort-website').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/publisher/list-data/website/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var listWebsite = res.data;
                var string = '';
                listWebsite.forEach(function(item){
                  string += '<tr>';
                  string += '<td style="width:200px;"><span class="tag is-primary">'+item.domain+'</span></td>';
                  string += '<td>'+item.impression+'</td>';
                  string += '</tr>';
                })
                $('#list-website-by-impression').html(string);
            }
        });
    });
    $('.select-sort-pub').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/publisher/list-data/publisher/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var listPublisher = res.data;
                var string = '';
                listPublisher.forEach(function(item){
                  string += '<tr>';
                  string += '<td style="width:200px;"><span class="badge badge-link">'+item.publisher_name+'</span></td>';
                  string += '<td>'+item.impression+'</td>';
                  string += '</tr>';
                })
                $('#list-publisher-by-impression').html(string);
            }
        });
    });
    $('.select-sort-os').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/publisher/list-data/os/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var total_impression = 0;
                var listOs = res.data;
                drawChartWrap('chart-os', 'pie', function(){
                    var data = [];
                    data.push(['Os', 'Impression']);
                    for (const i in listOs) {
                      data.push([listOs[i]['os'], parseInt(listOs[i]['impression'])]);
                      total_impression += parseInt(listOs[i]['impression']);
                    }
                    return google.visualization.arrayToDataTable(data);
                });
                $('#total_os_impression').html(total_impression);
            }
        });
    });
    $('.select-sort-platform').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/publisher/list-data/platform/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var total_impression = 0;
                var listPlatform= res.data;
                drawChartWrap('chart-platform', 'pie', function(){
                    var data = [];
                    data.push(['Platform', 'Impression']);
                    for (const i in listPlatform) {
                      data.push([listPlatform[i]['platform'], parseInt(listPlatform[i]['impression'])]);
                      total_impression += parseInt(listPlatform[i]['impression']);
                    }
                    return google.visualization.arrayToDataTable(data);
                });
                $('#total_platform_impression').html(total_impression);
            }
        });
    });
    $('.select-sort-browser').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/publisher/list-data/browser/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var total_impression = 0;
                var listBrowser= res.data;
                drawChartWrap('chart-browser', 'pie', function(){
                    var data = [];
                    data.push(['Browser', 'Impression']);
                    for (const i in listBrowser) {
                      data.push([listBrowser[i]['browser'], parseInt(listBrowser[i]['impression'])]);
                      total_impression += parseInt(listBrowser[i]['impression']);
                    }
                    return google.visualization.arrayToDataTable(data);
                });
                $('#total_browser_impression').html(total_impression);
            }
        });
    });
});
</script>