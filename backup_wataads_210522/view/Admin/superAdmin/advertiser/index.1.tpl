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
    color: #ae6dac !important;
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
</style>
<section class="wrapper">
    <div class="container">
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-4-tablet is-12-mobile">
                    <h1 class="title is-5">Advertiser Overview</h1>
                </div>
                <div class="column is-8-tablet is-hidden-mobile">
                    <nav class="breadcrumb has-succeeds-separator is-right" aria-label="breadcrumbs">
                        <ul>
                            <li><a href="/">Admin</a></li>
                            <li class="is-active"><a href="#" aria-current="page">Advertiser</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="columns is-multiline">
            <div class="column is-6-tablet is-3-desktop">
                <a class="sumbox" href="/ad/pending">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->pendingAd)?></p>
                        <p class="subtitle is-6 text-muted">Pending Ads</p>
                    </div>
                    <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                    </div>
                </a>
            </div>
            <div class="column is-6-tablet is-3-desktop">
                <a class="sumbox" href="/withdraw/pending">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->pendingDeposite)?></p>
                        <p class="subtitle is-6 text-muted">Pending Deposit</p>
                    </div>
                    <div class="sumbox-icon has-text-warning">
                        <span class="icon">
                            <svg viewBox="0 0 24 24" style="width:85%">
                                <path fill="currentColor" d="M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z" />
                            </svg>
                        </span>
                    </div>
                </a>
            </div>
            <div class="column is-6-tablet is-3-desktop">
                <a class="sumbox" href="/support/opening">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->openTicket)?></p>
                        <p class="subtitle is-6 text-muted">Opening Advertiser Tickets</p>
                    </div>
                    <div class="sumbox-icon has-text-danger">
                        <span class="icon">
                            <svg viewBox="0 0 24 24" style="width:85%">
                                <path fill="currentColor" d="M19.79,15.41C20.74,13.24 20.74,10.75 19.79,8.59L17.05,9.83C17.65,11.21 17.65,12.78 17.06,14.17L19.79,15.41M15.42,4.21C13.25,3.26 10.76,3.26 8.59,4.21L9.83,6.94C11.22,6.35 12.79,6.35 14.18,6.95L15.42,4.21M4.21,8.58C3.26,10.76 3.26,13.24 4.21,15.42L6.95,14.17C6.35,12.79 6.35,11.21 6.95,9.82L4.21,8.58M8.59,19.79C10.76,20.74 13.25,20.74 15.42,19.78L14.18,17.05C12.8,17.65 11.22,17.65 9.84,17.06L8.59,19.79M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2M12,8A4,4 0 0,0 8,12A4,4 0 0,0 12,16A4,4 0 0,0 16,12A4,4 0 0,0 12,8Z" />
                            </svg>
                        </span>
                    </div>
                </a>
            </div>
            <div class="column is-6-tablet is-3-desktop">
                <a class="sumbox" href="/user/advertiser">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->countAdvertiser)?></p>
                        <p class="subtitle is-6 text-muted">Total Advertiser</p>
                    </div>
                    <div class="sumbox-icon has-text-link">
                        <span class="icon">
                            <svg viewBox="0 0 24 24" style="width:85%">
                                <path fill="currentColor" d="M4,2H14V4H4V14H2V4C2,2.89 2.89,2 4,2M8,6H18V8H8V18H6V8C6,6.89 6.89,6 8,6M12,10H20C21.11,10 22,10.89 22,12V20C22,21.11 21.11,22 20,22H12C10.89,22 10,21.11 10,20V12C10,10.89 10.89,10 12,10M14,12V20L20,16L14,12Z" />
                            </svg>
                        </span>
                    </div>
                </a>
            </div>
        </div>
        <div class="columns">
            <div class="column is-9-widescreen is-6-tablet">
                <div class="flatbox is-100height">
                    <h3>
                        <div class="dropdown is-hoverable header-controls">
                            <div class="dropdown-trigger">
                                <button class="button" aria-haspopup="true" aria-controls="dropdown-adv-country-date">
                                    <span class="icon is-small text-orange">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                        </svg>
                                    </span>
                                    <span class="current-selected is-menu">Last Week</span>
                                </button>
                            </div>
                            <div class="dropdown-menu" id="dropdown-adv-country-date" role="menu">
                                <div class="dropdown-content">
                                    <a class="dropdown-item select-adv-country-date" data-type="lastWeek">Last Week</a>
                                    <a class="dropdown-item select-adv-country-date" data-type="lastMonth">Last Month</a>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown is-hoverable header-controls is-right">
                            <div class="dropdown-trigger">
                                <button class="button" aria-haspopup="true" aria-controls="dropdown-adv-country-by-type">
                                    <span class="current-selected">By Impression</span>
                                    <span class="icon is-small">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                            <div class="dropdown-menu" id="dropdown-adv-country-by-type" role="menu">
                                <div class="dropdown-content">
                                    <a class="dropdown-item select-adv-country-by-type" data-type="impression">By Impression</a>
                                    <a class="dropdown-item select-adv-country-by-type" data-type="click">By Click</a>
                                    <a class="dropdown-item select-adv-country-by-type" data-type="conversion">By Conversion</a>
                                    <a class="dropdown-item select-adv-country-by-type" data-type="reach">By Reach</a>
                                </div>
                            </div>
                        </div>
                    </h3>
                    <div class="hero" style="margin-top:-1rem;width:100%">
                        <div class="chart-container" style="position: relative; width:100%; margin-top:1rem;">
                            <div id="chart-adv-country"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-3-widescreen is-6-tablet">
                <div class="flatbox is-100height">
                    <h3 class="title is-6 text-muted">Popular Campaign
                        <div class="dropdown is-hoverable header-controls is-pulled-right">
                            <div class="dropdown-trigger">
                                <button class="button" aria-haspopup="true" aria-controls="dropdown-popular-campaign">
                                    <span class="current-selected">Today</span>
                                    <span class="icon is-small">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                            <div class="dropdown-menu" id="dropdown-popular-campaign" role="menu">
                                <div class="dropdown-content">
                                    <a class="dropdown-item select-popular-campaign" data-type="today">Today</a>
                                    <a class="dropdown-item select-popular-campaign" data-type="lastWeek">Last Week</a>
                                    <a class="dropdown-item select-popular-campaign" data-type="lastMonth">Last Month</a>
                                    <a class="dropdown-item select-popular-campaign" data-type="lastYear">Last Year</a>
                                </div>
                            </div>
                        </div>
                    </h3>
                    <div class="table-container">
                        <table class="table is-striped is-fullwidth">
                            <thead>
                                <tr>
                                    <th style="width:200px;">Top Campaign</th>
                                    <th>Impression</th>
                                </tr>
                            </thead>
                            <tbody id="list-campaign-by-impression">
                                <?php foreach($this->data->listCampaignByImpression as $item): ?>
                                <tr>
                                    <td style="width:200px;"><span class="tag is-primary"><?=$item->name?></span></td>
                                    <td><?=$item->impression?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns">
            <div class="column is-6-widescreen is-6-tablet">
                <div class="flatbox is-100height">
                    <h3 class="title is-6 text-muted">Ad Overview
                        <div class="dropdown is-hoverable header-controls is-pulled-right">
                            <div class="dropdown-trigger">
                                <button class="button" aria-haspopup="true" aria-controls="dropdown-overview-ad">
                                    <span class="current-selected">Today</span>
                                    <span class="icon is-small">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                            <div class="dropdown-menu" id="dropdown-overview-ad" role="menu">
                                <div class="dropdown-content">
                                    <a class="dropdown-item select-overview-ad" data-type="today">Today</a>
                                    <a class="dropdown-item select-overview-ad" data-type="lastWeek">Last Week</a>
                                    <a class="dropdown-item select-overview-ad" data-type="lastMonth">Last Month</a>
                                    <a class="dropdown-item select-overview-ad" data-type="lastYear">Last Year</a>
                                </div>
                            </div>
                        </div>
                    </h3>
                    
                    <div class="hero" style="width:100%">
                        <div class="chart-container" style="position: relative; width:100%;">
                            <div id="chart-overview-ad"></div>
                        </div>
                    </div>
                    <p class="subtitle is-1 has-text-centered" style="margin-bottom:0;margin-top:0.2rem" id="total_ad">50</p>
                    <p class="text-muted has-text-centered">Total Ad</p>
                </div>
            </div>
            <div class="column is-6-widescreen is-6-tablet">
                <div class="flatbox is-100height">
                    <h3 class="title is-6 text-muted">Platform Targeting
                        <div class="dropdown is-hoverable header-controls is-pulled-right">
                            <div class="dropdown-trigger">
                                <button class="button" aria-haspopup="true" aria-controls="dropdown-target">
                                    <span class="current-selected">Today</span>
                                    <span class="icon is-small">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                            <div class="dropdown-menu" id="dropdown-target" role="menu">
                                <div class="dropdown-content">
                                    <a class="dropdown-item select-sort-platform" data-type="today">Today</a>
                                    <a class="dropdown-item select-sort-platform" data-type="lastWeek">Last Week</a>
                                    <a class="dropdown-item select-sort-platform" data-type="lastMonth">Last Month</a>
                                    <a class="dropdown-item select-sort-platform" data-type="lastYear">Last Year</a>
                                </div>
                            </div>
                        </div>
                    </h3>
                    <div class="hero" style="width:100%">
                        <div class="chart-container" style="position: relative; width:100%;">
                            <div id="chart-target-platform"></div>
                        </div>
                    </div>
                    <p class="subtitle is-1 has-text-centered" style="margin-bottom:0;margin-top:0.2rem" id="total_platform_impression">30</p>
                    <p class="text-muted has-text-centered">Total Platform</p>
                    </p>
                </div>
            </div>
        </div>
        <div class="columns is-multiline">
            <div class="column is-6-tablet is-3-desktop has-text-centered">
                <div class="flatbox">
                    <h3 class="title is-6 text-muted">Total Campaign</h3>
                    <p class="subtitle is-1" style="margin-bottom:0;margin-top:-0.8rem"><?=$this->helper->numberFormat($this->data->totalCampaign)?></p>
                    <p class="has-text-<?php if($this->data->compareCampaign['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compareCampaign['total'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span><?=$this->data->compareCampaign['total']?> (<?=$this->data->compareCampaign['totalPercent']?>%)</span>
                        <span class="text-muted">Since last week</span>
                    </p>
                    <div class="hero" style="width:100%">
                        <div class="chart-container" style="position: relative; width:100%;">
                            <div id="chart-total-campaign"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-6-tablet is-3-desktop has-text-centered">
                <div class="flatbox">
                    <h3 class="title is-6 text-muted">Active Campaign</h3>
                    <p class="subtitle is-1" style="margin-bottom:0;margin-top:-0.8rem"><?=$this->helper->numberFormat($this->data->activeCampaign)?></p>
                    <p class="has-text-<?php if($this->data->compareCampaign['active'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compareCampaign['active'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span><?=$this->data->compareCampaign['active']?> (<?=$this->data->compareCampaign['activePercent']?>%)</span>
                        <span class="text-muted">Since last week</span>
                    </p>
                    <div class="hero" style="width:100%">
                        <div class="chart-container" style="position: relative; width:100%;">
                            <div id="chart-active-campaign"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-6-tablet is-3-desktop has-text-centered">
                <div class="flatbox">
                    <h3 class="title is-6 text-muted">Total Ads</h3>
                    <p class="subtitle is-1" style="margin-bottom:0;margin-top:-0.8rem"><?=$this->helper->numberFormat($this->data->totalAd)?></p>
                    <p class="has-text-<?php if($this->data->compareAd['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compareAd['total'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span><?=$this->data->compareAd['total']?> (<?=$this->data->compareAd['totalPercent']?>%)</span>
                        <span class="text-muted">Since last week</span>
                    </p>
                    <div class="hero" style="width:100%">
                        <div class="chart-container" style="position: relative; width:100%;">
                            <div id="chart-total-ad"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-6-tablet is-3-desktop has-text-centered">
                <div class="flatbox">
                    <h3 class="title is-6 text-muted">Active Ads</h3>
                    <p class="subtitle is-1" style="margin-bottom:0;margin-top:-0.8rem"><?=$this->helper->numberFormat($this->data->activeAd)?></p>
                    <p class="has-text-<?php if($this->data->compareAd['active'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compareAd['active'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span><?=$this->data->compareAd['active']?> (<?=$this->data->compareAd['activePercent']?>%)</span>
                        <span class="text-muted">Since last week</span>
                    </p>
                    <div class="hero" style="width:100%">
                        <div class="chart-container" style="position: relative; width:100%;">
                            <div id="chart-active-ad"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns is-multiline">
            <div class="column is-3-widescreen is-6-tablet">
                <div class="flatbox is-100height">
                    <h3 class="title is-6 text-muted">Popular Advertiser
                        <div class="dropdown is-hoverable header-controls is-pulled-right">
                            <div class="dropdown-trigger">
                                <button class="button" aria-haspopup="true" aria-controls="dropdown-popular-ad">
                                    <span class="current-selected">Today</span>
                                    <span class="icon is-small">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                            <div class="dropdown-menu" id="dropdown-popular-ad" role="menu">
                                <div class="dropdown-content">
                                    <a class="dropdown-item select-popular-ad" data-type="today">Today</a>
                                    <a class="dropdown-item select-popular-ad" data-type="lastWeek">Last Week</a>
                                    <a class="dropdown-item select-popular-ad" data-type="lastMonth">Last Month</a>
                                    <a class="dropdown-item select-popular-ad" data-type="lastYear">Last Year</a>
                                </div>
                            </div>
                        </div>
                    </h3>
                    <div class="table-container">
                        <table class="table is-striped is-fullwidth">
                            <thead>
                                <tr>
                                    <th style="width:200px;">Top Advertiser</th>
                                    <th>Ads</th>
                                </tr>
                            </thead>
                            <tbody id="list-advertiser-by-impression">
                                <?php foreach($this->data->listAdvertiserByImpression as $item): ?>
                                <tr>
                                    <td style="width:200px;"><span class="tag is-link"><?=$item->advertiser_name?></span></td>
                                    <td><?=$item->impression?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="column is-3-widescreen is-6-tablet">
                <div class="flatbox is-100height has-text-centered">
                    <h3 class="title is-6 text-muted has-text-centered" style="margin-bottom:0.2rem">Total Impressions</h3>
                    <p>
                        <span class="subtitle is-2" id="total_advertiser_impression"><?=$this->helper->numberFormat($this->data->last7day['impression'])?></span>
                    </p>
                    <p>
                        <span class="icon has-text-<?php if($this->data->compare['impression'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compare['impression'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span class="subtitle is-6 has-text-<?php if($this->data->compare['impression'] < 0): ?>danger<?php else: ?>success<?php endif?>"><?=$this->data->compare['impression']?> (<?=$this->data->compare['impressionPercent']?>%)</span>
                        <span>Since last week</span>
                    </p>
                    <hr>
                    <h3 class="title is-6 text-muted has-text-centered" style="margin-bottom:0.2rem">Total Clicks</h3>
                    <p>
                        <span class="subtitle is-2" id="total_advertiser_click"><?=$this->helper->numberFormat($this->data->last7day['click'])?></span>
                    </p>
                    <p>
                        <span class="icon has-text-<?php if($this->data->compare['click'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compare['click'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span class="subtitle is-6 has-text-<?php if($this->data->compare['impression'] < 0): ?>danger<?php else: ?>success<?php endif?>"><?=$this->data->compare['click']?> (<?=$this->data->compare['clickPercent']?>%)</span>
                        <span>Since last week</span>
                    </p>
                    <hr>
                    <h3 class="title is-6 text-muted has-text-centered" style="margin-bottom:0.2rem">Total Reachs</h3>
                    <p>
                        <span class="subtitle is-2" id="total_advertiser_reach"><?=$this->helper->numberFormat($this->data->last7day['reach'])?></span>
                    </p>
                    <p>
                        <span class="icon has-text-<?php if($this->data->compare['reach'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compare['reach'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span class="subtitle is-6 has-text-<?php if($this->data->compare['impression'] < 0): ?>danger<?php else: ?>success<?php endif?>"><?=$this->data->compare['reach']?> (<?=$this->data->compare['reachPercent']?>%)</span>
                        <span>Since last week</span>
                    </p>
                    <hr>
                    <h3 class="title is-6 text-muted has-text-centered" style="margin-bottom:0.2rem">Total Conversion</h3>
                    <p>
                        <span class="subtitle is-2" id="total_advertiser_conversion"><?=$this->helper->numberFormat($this->data->last7day['conversion'])?></span>
                    </p>
                    <p>
                        <span class="icon has-text-<?php if($this->data->compare['conversion'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <svg viewBox="0 0 24 24">
                                <?php if($this->data->compare['conversion'] < 0): ?>
                                <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                <?php else: ?>
                                <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                <?php endif; ?>
                            </svg>
                        </span>
                        <span class="subtitle is-6 has-text-<?php if($this->data->compare['impression'] < 0): ?>danger<?php else: ?>success<?php endif?>"><?=$this->data->compare['conversion']?> (<?=$this->data->compare['conversionPercent']?>%)</span>
                        <span>Since last week</span>
                    </p>
                </div>
            </div>
            <div class="column is-6-widescreen is-12-tablet">
                <div class="flatbox is-100height">
                    <h3 class="title is-6 text-muted">
                        <div class="dropdown is-hoverable header-controls is-pulled-right">
                            <div class="dropdown-trigger">
                                <button class="button" aria-haspopup="true" aria-controls="dropdown-advertiser">
                                    <span class="current-selected">Last Week</span>
                                    <span class="icon is-small">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                            <div class="dropdown-menu" id="dropdown-advertiser" role="menu">
                                <div class="dropdown-content">
                                    <a class="dropdown-item select-chart-advertiser" data-type="lastWeek">Last Week</a>
                                    <a class="dropdown-item select-chart-advertiser" data-type="lastMonth">Last Month</a>
                                </div>
                            </div>
                        </div>
                    </h3>
                    
                    <div class="hero" style="width:100%">
                        <div class="chart-container" style="position: relative; width:100%;">
                            <div id="chart-advertiser"></div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */
var advertiser_country_7day_data = <?=json_encode($this->data->countryLast7day)?>;
var advertiser_country_30day_data = <?=json_encode($this->data->countryLast30day)?>;
var campaign_data =  <?=json_encode($this->data->last7dayCampaign_stats)?>;
var ad_data =  <?=json_encode($this->data->last7dayAd_stats)?>;
var advertiser_data_7day = <?=json_encode($this->data->last7day_stats)?>;
var advertiser_data_30day = <?=json_encode($this->data->last30day_stats)?>;

var list_ad_data = <?=json_encode($this->data->listAd)?>;
var platform_data = <?=json_encode($this->data->listPlatform)?>;
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
                chartArea:{left:0,bottom:0,width:'100%',height:120},
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
                colorAxis: {colors: ['#8b4b8a', '#ebcfea']}
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
                colors:['#f14668','#ffdd57','#AFB5FC'],
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
    drawChartWrap('chart-adv-country', 'geo', function(){
        var data = [];
        data.push(['Country', 'Impression']);
        for (const i in advertiser_country_7day_data) {
          data.push([i,advertiser_country_7day_data[i].impression]);
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-advertiser', 'bar', function(){
        var data = [];
        data.push(['Time', 'Impression', 'Click', 'Conversion', 'Reach']);
        for (const i in advertiser_data_7day) {
          data.push([i, advertiser_data_7day[i].impression, advertiser_data_7day[i].click, advertiser_data_7day[i].conversion, advertiser_data_7day[i].reach])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-campaign', 'area5', function(){
        var data = [];
        data.push(['Time', 'Total Campaign']);
        for (const i in campaign_data) {
          data.push([i, campaign_data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-active-campaign', 'area6', function(){
        var data = [];
        data.push(['Time', 'Active Campaign']);
        for (const i in campaign_data) {
          data.push([i, campaign_data[i].active])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-ad', 'area7', function(){
        var data = [];
        data.push(['Time', 'Total Ad']);
        for (const i in ad_data) {
          data.push([i, ad_data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-active-ad', 'area8', function(){
        var data = [];
        data.push(['Time', 'Active Ad']);
        for (const i in ad_data) {
          data.push([i, ad_data[i].active]);
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-overview-ad', 'pie', function(){
        var data = [];
        var total_ad = 0;
        data.push(['Ad Type', 'Total']);
        for (const i in list_ad_data) {
          data.push([list_ad_data[i]['status'],parseInt(list_ad_data[i]['id'])]);
          total_ad += parseInt(list_ad_data[i]['id']);
        }
        $('#total_ad').html(total_ad);
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-target-platform', 'pie2', function(){
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
});
$(document).ready(function(){
    $('.select-popular-campaign').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/advertiser/list-data/campaign/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var listCampaign = res.data;
                var string = '';
                listCampaign.forEach(function(item){
                  string += '<tr>';
                  string += '<td style="width:200px;"><span class="tag is-primary">'+item.name+'</span></td>';
                  string += '<td>'+item.impression+'</td>';
                  string += '</tr>';
                })
                $('#list-campaign-by-impression').html(string);
            }
        });
    });
    $('.select-popular-ad').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/advertiser/list-data/advertiser/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var listAdvertiser= res.data;
                var string = '';
                listAdvertiser.forEach(function(item){
                  string += '<tr>';
                  string += '<td style="width:200px;"><span class="tag is-link">'+item.advertiser_name+'</span></td>';
                  string += '<td>'+item.impression+'</td>';
                  string += '</tr>';
                })
                $('#list-advertiser-by-impression').html(string);
            }
        });
    });
    $('.select-overview-ad').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/advertiser/list-data/ad/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var total_ad = 0;
                var listAd = res.data;
                drawChartWrap('chart-overview-ad', 'pie', function(){
                    var data = [];
                    var total_ad = 0;
                    data.push(['Ad Type', 'Total']);
                    for (const i in listAd) {
                      data.push([listAd[i]['status'],parseInt(listAd[i]['id'])]);
                      total_ad += parseInt(listAd[i]['id']);
                    }
                    $('#total_ad').html(total_ad);
                    return google.visualization.arrayToDataTable(data);
                });
            }
        });
    });
    $('.select-sort-platform').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/advertiser/list-data/platform/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var listPlatform= res.data;
                drawChartWrap('chart-target-platform', 'pie2', function(){
                    var total_impression = 0;
                    var data = [];
                    data.push(['Platform', 'Impression']);
                    for (const i in listPlatform) {
                      data.push([listPlatform[i]['platform'], parseInt(listPlatform[i]['impression'])]);
                      total_impression += parseInt(listPlatform[i]['impression']);
                    }
                    $('#total_platform_impression').html(total_impression);
                    return google.visualization.arrayToDataTable(data);
                });
            }
        });
    });
    $('.select-chart-advertiser').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        if( t == 'lastWeek'){
            var dataAdvertiser = advertiser_data_7day;
        }else if( t == 'lastMonth'){
            var dataAdvertiser = advertiser_data_30day;
        }
        var total_impression = 0;
        var total_click = 0;
        var total_reach = 0;
        var total_conversion = 0;
        drawChartWrap('chart-advertiser', 'bar', function(){
            var data = [];
            data.push(['Time', 'Impression', 'Click', 'Conversion', 'Reach']);
            for (const i in dataAdvertiser) {
              data.push([i, dataAdvertiser[i].impression, dataAdvertiser[i].click, dataAdvertiser[i].conversion, dataAdvertiser[i].reach])
              total_impression += dataAdvertiser[i].impression;
              total_click += dataAdvertiser[i].click;
              total_reach += dataAdvertiser[i].conversion;
              total_conversion += dataAdvertiser[i].reach;
            }
            $('#total_advertiser_impression').html(total_impression);
            $('#total_advertiser_click').html(total_click);
            $('#total_advertiser_reach').html(total_reach);
            $('#total_advertiser_conversion').html(total_conversion);
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-adv-country-date').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        country_select_time = t;
        if( t == 'lastWeek'){
            var dataAdvertiserCountry = advertiser_country_7day_data;
        }else if( t == 'lastMonth'){
            var dataAdvertiserCountry = advertiser_country_30day_data;
        }
        drawChartWrap('chart-adv-country', 'geo', function(){
            var data = [];
            data.push(['Country', ucwords(country_select_dimension)]);
            for (const i in dataAdvertiserCountry) {
              data.push([i,dataAdvertiserCountry[i][country_select_dimension]]);
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-adv-country-by-type').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        country_select_dimension = t;
        if( country_select_time == 'lastWeek'){
            var dataAdvertiserCountry = advertiser_country_7day_data;
        }else if( country_select_time == 'lastMonth'){
            var dataAdvertiserCountry = advertiser_country_30day_data;
        }
        drawChartWrap('chart-adv-country', 'geo', function(){
            var data = [];
            data.push(['Country', ucwords(country_select_dimension)]);
            for (const i in dataAdvertiserCountry) {
              data.push([i,dataAdvertiserCountry[i][country_select_dimension]]);
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
});
</script>