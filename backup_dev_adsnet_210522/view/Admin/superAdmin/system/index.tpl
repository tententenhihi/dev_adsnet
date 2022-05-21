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
    background-color: #fff;
    border-radius: 0.25rem;
    padding: 25px;
    border: none;
    -webkit-box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);
    box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);
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



.title-system-admin {
    flex: 1;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="row is-multiline">
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/task/finnish">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-system-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->finishedTask)?></h2>
                                <p style="color: #626262">Finished tasks</p>
                            </div>
                            <div class="avatar bg-rgba-success p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-file-text-o text-success font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/task/failed">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-system-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->failTask)?></h2>
                                <p style="color: #626262">Failed tasks</p>
                            </div>
                            <div class="avatar bg-rgba-danger p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-file-text-o text-danger font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/system/offline">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-system-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->cron->online)?></h2>
                                <p style="color: #626262">Cron Online</p>
                            </div>
                            <div class="avatar bg-rgba-primary p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-calendar-plus-o text-primary font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/system/offline">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-system-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->cron->offline)?></h2>
                                <p style="color: #626262">Cron Offline</p>
                            </div>
                            <div class="avatar bg-rgba-info p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-calendar-minus-o text-info font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="card flatbox is-100height">
                        <div class="card-header d-flex justify-content-between align-items-end">
                            <div class="d-flex">
                                <h4 class="card-title">Revenue</h4>
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="hero" style="width:100%">
                                    <div class="chart-container" style="position: relative; width:100%;">
                                        <div id="chart-revenue"></div>
                                    </div>
                                </div>
                                <h1 class="text-center" style="margin-top:2rem" id="total_network_revenue">30</h1>
                                <h2 class="text-center mb-1">Total Revenue</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="card flatbox is-100height">
                        <div class="card-header d-flex justify-content-between align-items-end">
                            <div class="d-flex">
                                <h4 class="card-title">Payment</h4>
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="hero" style="width:100%">
                                    <div class="chart-container" style="position: relative; width:100%;">
                                        <div id="chart-payment"></div>
                                    </div>
                                </div>
                                <h1 class="text-center" style="margin-top:2rem" id="total_network_payment">40</h1>
                                <h2 class="text-center">Total Payment</h2>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="card flatbox is-100height">
                        <div class="card-header d-flex justify-content-between align-items-end">
                            <div class="d-flex">
                                <h4 class="card-title">Impression</h4>
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="hero" style="width:100%">
                                    <div class="chart-container" style="position: relative; width:100%;">
                                        <div id="chart-impression"></div>
                                    </div>
                                </div>
                                <h1 class="text-center" style="margin-top:2rem" id="total_network_impression">50</h1>
                                <h1 class="text-center">Total Impression</h1>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="card flatbox is-100height" style=" height: 94%;">
                        <div class="card-header d-flex">
                            <div class="d-flex">
                                <h4 class="card-title">Popular Network</h4>
                            </div>
                            <div class="dropdown chart-dropdown">
                                Filter by:
                                <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                        id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="current-selected">Today</span>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                                     x-placement="bottom-end" id="dropdown-popular-network" role="menu"
                                     style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                                    <a class="dropdown-item select-popular-network" data-type="today">Today</a>
                                    <a class="dropdown-item select-popular-network" data-type="lastWeek">Last Week</a>
                                    <a class="dropdown-item select-popular-network" data-type="lastMonth">Last Month</a>
                                    <a class="dropdown-item select-popular-network" data-type="lastYear">Last Year</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="table-container">
                                    <table class="table is-striped is-fullwidth">
                                        <thead>
                                        <tr>
                                            <th style="width:200px;">Top Network</th>
                                            <th>Ads</th>
                                            <th>Impression</th>
                                        </tr>
                                        </thead>
                                        <tbody id="list-network-by-ad">
                                        <?php foreach($this->data->listNetworkByAd as $item): ?>
                                        <tr>
                                            <td style="width:200px;"><span class="tag is-primary"><?=$item->name?></span></td>
                                            <td><?=$item->total_ad?></td>
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
                <div class="col-lg-3 col-md-6 col-12 text-center">
                    <div class="card flatbox is-100height" style="height: 90%;">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <h5 class="title-1 is-6">Total Networks</h5>
                                        <p class="subtitle is-2"><?=$this->helper->numberFormat($this->data->totalNetwork)?></p>
                                        <p class="text-<?php if($this->data->compareNetwork['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <?php if($this->data->compareNetwork['total'] < 0): ?>
                                        <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                        <?php else: ?>
                                        <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                        <?php endif; ?>
                                    </svg>
                                </span>
                                            <span><?=$this->data->compareNetwork['total']?> (<?=$this->data->compareNetwork['totalPercent']?>%)</span>
                                        </p>
                                        <p><span>Since last week</span></p>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <div class="chart-container" style="position: relative; width:100%;">
                                            <div id="chart-total-network"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 text-center">
                    <div class="card flatbox is-100height" style="height: 90%;">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <h5 class="title-1 is-6">Active Networks</h5>
                                        <p class="subtitle is-2"><?=$this->helper->numberFormat($this->data->activeNetwork)?></p>
                                        <p class="text-<?php if($this->data->compareNetwork['active'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <?php if($this->data->compareNetwork['active'] < 0): ?>
                                        <path fill="currentColor" d="M16,18L18.29,15.71L13.41,10.83L9.41,14.83L2,7.41L3.41,6L9.41,12L13.41,8L19.71,14.29L22,12V18H16Z" />
                                        <?php else: ?>
                                        <path fill="currentColor" d="M16,6L18.29,8.29L13.41,13.17L9.41,9.17L2,16.59L3.41,18L9.41,12L13.41,16L19.71,9.71L22,12V6H16Z" />
                                        <?php endif; ?>
                                    </svg>
                                </span>
                                            <span><?=$this->data->compareNetwork['active']?> (<?=$this->data->compareNetwork['activePercent']?>%)</span>
                                        </p>
                                        <p><span>Since last week</span></p>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <div class="chart-container" style="position: relative; width:100%;">
                                            <div id="chart-active-network"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 text-center">
                    <div class="card flatbox is-100height" style="height: 90%;">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <h5 class="title-1 is-6">Total Ads Exchange</h5>
                                        <p class="subtitle is-2"><?=$this->helper->numberFormat($this->data->totalAd)?></p>
                                        <p class="text-<?php if($this->data->compareAd['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
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
                                        </p>
                                        <p><span>Since last week</span></p>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <div class="chart-container" style="position: relative; width:100%;">
                                            <div id="chart-total-ad-exchange"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 text-center">
                    <div class="card flatbox is-100height" style="height: 90%;">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <h5 class="title-1 is-6">Active Ads Exchange</h5>
                                        <p class="subtitle is-2"><?=$this->helper->numberFormat($this->data->activeAd)?></p>
                                        <p class="text-<?php if($this->data->compareAd['active'] < 0): ?>danger<?php else: ?>success<?php endif?>">
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
                                        </p>
                                        <p><span>Since last week</span></p>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-12">
                                        <div class="chart-container" style="position: relative; width:100%;">
                                            <div id="chart-active-ad-exchange"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page-title-box">
                <div class="row is-mobile">
                    <div class="col-12">
                        <h1 class="title is-6">List Cron Server</h1>
                    </div>
                </div>
            </div>
            <div class="row is-multiline">
                <?php foreach($this->data->cron->data as $item): ?>
                <div class="col-12">
                    <div class="card sumbox">
                        <div class="sumbox-text">
                            <span class="title is-4">IP: <?=$item['ip']?></span>
                            <span class="subtitle is-6">Offset: <?=$item['offset']?></span>
                            </br>
                            <span>Lag: <?=$item['lag']?></span>
                        </div>
                        <div class="sumbox-icon <?php if($item['state']=='online'): ?>has-text-success<?php endif; ?>">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M21,16V4H3V16H21M21,2A2,2 0 0,1 23,4V16A2,2 0 0,1 21,18H14V20H16V22H8V20H10V18H3C1.89,18 1,17.1 1,16V4C1,2.89 1.89,2 3,2H21M5,6H14V11H5V6M15,6H19V8H15V6M19,9V14H15V9H19M5,12H9V14H5V12M10,12H14V14H10V12Z"></path>
                                </svg>
                            </span>
                            <p><?=$item['state']?></p>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */
var network_data = <?=json_encode($this->data->listNetwork)?>;
var network_7day =  <?=json_encode($this->data->last7dayNetwork_stats)?>;
var ad_7day =  <?=json_encode($this->data->last7dayAd_stats)?>;
function ucwords(str) {
    return (str + '').toLowerCase().replace(/^(.)|\s+(.)/g, function (l) {return l.toUpperCase()});
}
function drawChart(id, type, data) {
    window.tacharts = window.tacharts || {};
    window.taoptions = window.taoptions || {};
    if(window.tacharts[id] === undefined) {
        if(type == 'area') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        } else if(type == 'area2') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#00d1b2','#f14668','#ffdd57'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        } else if(type == 'area3') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#f14668','#ffdd57'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        } else if(type == 'area4') {
            window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'top',alignment:'center'},
                height: 130,
                chartArea:{left:0,bottom:0,width:'100%',height:100},
                Axis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition:'none'},
                colors:['#ffdd57'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
            };
        }else if(type == 'pie') {
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
    drawChartWrap('chart-total-network', 'area', function(){
        var data = [];
        data.push(['Time', 'Total Network']);
        for (const i in network_7day) {
          data.push([i, network_7day[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-active-network', 'area2', function(){
        var data = [];
        data.push(['Time', 'Active Network']);
        for (const i in network_7day) {
          data.push([i, network_7day[i].active])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-ad-exchange', 'area3', function(){
        var data = [];
        data.push(['Time', 'Total Ads']);
        for (const i in ad_7day) {
          data.push([i, ad_7day[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-active-ad-exchange', 'area4', function(){
        var data = [];
        data.push(['Time', 'Active Ads']);
        for (const i in ad_7day) {
          data.push([i, ad_7day[i].active])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-revenue', 'pie', function(){
        var total_revenue = 0;
        var data = [];
        data.push(['Network', 'Revenue']);
        for (const i in network_data) {
          data.push([network_data[i]['name'], parseInt(network_data[i]['revenue'])]);
          total_revenue += parseInt(network_data[i]['revenue']);
        }
        $('#total_network_revenue').html(total_revenue);
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-payment', 'pie2', function(){
        var total_payment = 0;
        var data = [];
        data.push(['Network', 'Payment']);
        for (const i in network_data) {
          data.push([network_data[i]['name'], parseInt(network_data[i]['payment'])]);
          total_payment += parseInt(network_data[i]['payment']);
        }
        $('#total_network_payment').html(total_payment);
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-impression', 'pie', function(){
        var total_impression = 0;
        var data = [];
        data.push(['Network', 'Impression']);
        for (const i in network_data) {
          data.push([network_data[i]['name'], parseInt(network_data[i]['impression'])]);
          total_impression += parseInt(network_data[i]['impression']);
        }
        $('#total_network_impression').html(total_impression);
        return google.visualization.arrayToDataTable(data);
    });
});
$(document).ready(function(){
    $('.select-popular-network').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/system/list-data/network/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var listNetwork = res.data;
                var string = '';
                listNetwork.forEach(function(item){
                  string += '<tr>';
                  string += '<td style="width:200px;"><span class="tag is-primary">'+item.name+'</span></td>';
                  string += '<td>'+item.total_ad+'</td>';
                  string += '<td>'+item.impression+'</td>';
                  string += '</tr>';
                })
                $('#list-network-by-ad').html(string);
            }
        });
    });
});
</script>