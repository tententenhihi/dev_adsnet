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
    .subtitle.is-1 {
        font-size: 3rem;
    }



    .title-user-admin {
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

    <div class="row is-multiline">
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/user/all">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-user-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->All)?></h2>
                        <p style="color: #626262">All Users</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/user/active">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-user-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->Active)?></h2>
                        <p style="color: #626262">Active Users</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-user-check text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/user/inactive">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-user-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->Inactive)?></h2>
                        <p style="color: #626262">Inactive Users</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-user-minus text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/user/banned">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-user-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->Banned)?></h2>
                        <p style="color: #626262">Banned Users</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-user-x text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>

        </div>
    </div>

    <div class="row" style="flex-wrap: wrap">
        <div class="col-lg-3 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100  mb-0">
                <div class="card-header d-flex">
                    <div class="d-flex">
                        <h4 class="card-title">Acitve User</h4>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-user"></div>
                            </div>
                        </div>
                        <p class="subtitle is-1 text-center" style="line-height: 2.5rem;"><?=$this->data->last180day['total']?></p>
                        <p class="trending-up-down text-<?php if($this->data->compare7day['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare7day['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare7day['total']?> (<?=$this->data->compare7day['percent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex">
                    <div class="d-flex">

                    </div>
                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">By Total Users</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">

                            <a class="dropdown-item select-chart-user-location" data-type="active">By Active Users</a>
                            <a class="dropdown-item select-chart-user-location" data-type="inactive">By Inactive Users</a>
                            <a class="dropdown-item select-chart-user-location" data-type="total">By Total Users</a>

                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="hero">
                            <div class="chart-container" style="position: relative; width:100%; margin-top:1rem;">
                                <div id="chart-user-country"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row text-center is-multiline">
        <div class="col-lg-4 col-md-12 col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <h4>New User (Last 7Days)</h4>
                        <h1><?=$this->data->compare7day['total']?></h1>
                        <p class="trending-up-down text-<?php if($this->data->compare7day['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare7day['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare7day['total']?> (<?=$this->data->compare7day['percent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12 col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <h4>New User (Last 30Days)</h4>
                        <h1><?=$this->data->compare30day['total']?></h1>
                        <p class="trending-up-down text-<?php if($this->data->compare30day['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare30day['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare30day['total']?> (<?=$this->data->compare30day['percent']?>%)</span>
                            <span class="text-muted">Since last month</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12 col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <h4>New User (Last 90Days)</h4>
                        <h1><?=$this->data->compare90day['total']?></h1>
                        <p class="trending-up-down text-<?php if($this->data->compare90day['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare90day['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare90day['total']?> (<?=$this->data->compare90day['percent']?>%)</span>
                            <span class="text-muted">Since last 90 days</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row is-multiline" style="flex-wrap: wrap">
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0 text-center">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <h3>Total User</h3>
                        <h1><?=$this->data->last180day['total']?></h1>
                        <p class="trending-up-down text-<?php if($this->data->compare7day['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compare7day['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compare7day['total']?> (<?=$this->data->compare7day['percent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-user-new"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex ">
                    <div>
                        <h4 class="text-bold-700 mb-0">Sessions By Region</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">Today</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">

                            <a class="dropdown-item select-chart-user-region" data-type="today">Today</a>
                            <a class="dropdown-item select-chart-user-region" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-chart-user-region" data-type="lastMonth">Last Month</a>
                            <a class="dropdown-item select-chart-user-region" data-type="lastYear">Last Year</a>

                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th style="width:200px;">Top Country</th>
                                    <th>Sessions</th>
                                </tr>
                                </thead>
                                <tbody id='list-session-by-region'>
                                <?php foreach($this->data->listSessionRegion as $item): ?>
                                <tr>
                                    <td style="width:200px;"><span class="badge badge-info"><?=$item->country_name?></span></td>
                                    <td><?=$item->session?></td>
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
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex ">
                    <div>
                        <h4 class="text-bold-700 mb-0">Sessions By Device</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">Today</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">

                            <a class="dropdown-item select-chart-user-device" data-type="today">Today</a>
                            <a class="dropdown-item select-chart-user-device" data-type="lastWeek">Last Week</a>
                            <a class="dropdown-item select-chart-user-device" data-type="lastMonth">Last Month</a>
                            <a class="dropdown-item select-chart-user-device" data-type="lastYear">Last Year</a>

                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="hero" style="width:100%">
                            <div class="chart-container" style="position: relative; width:100%;">
                                <div id="chart-session-device"></div>
                            </div>
                        </div>
                        <p class="subtitle is-1 text-center" style="line-height: 2.5rem;" id="total_session_device"><?=$this->data->sessionDeviceToday['total']?></p>
                        <p class="trending-up-down text-<?php if($this->data->compareSessionDevice7day['total'] < 0): ?>danger<?php else: ?>success<?php endif?>">
                            <span class="icon">
                                <?php if($this->data->compareSessionDevice7day['total'] < 0): ?>
                                <i class="feather icon-trending-down"></i>
                                <?php else: ?>
                                <i class="feather icon-trending-up"></i>
                                <?php endif; ?>
                            </span>
                            <span class="percent"><?=$this->data->compareSessionDevice7day['total']?> (<?=$this->data->compareSessionDevice7day['percent']?>%)</span>
                            <span class="text-muted">Since last week</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs google */
var user_data =  <?=json_encode($this->data->last180day)?>;
var new_user_data =  <?=json_encode($this->data->last7day_stats)?>;
var session_device_data =  <?=json_encode($this->data->sessionDeviceToday)?>;
var user_country_data = <?=json_encode($this->data->country)?>;
function ucwords(str) {
    return (str + '').toLowerCase().replace(/^(.)|\s+(.)/g, function (l) {return l.toUpperCase()});
}
function drawChart(id, type, data) {
    window.tacharts = window.tacharts || {};
    window.taoptions = window.taoptions || {};
    if(window.tacharts[id] === undefined) {
        if(type == 'geo') {
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
                sliceVisibilityThreshold: .05,
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
                sliceVisibilityThreshold: .05,
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
                height: 330,
                chartArea:{width:'100%',height:280},
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
    drawChartWrap('chart-user', 'pie', function(){
        var data = [];
        data.push(['Total User', 'Date']);
        data.push(['Active User', user_data.active]);
        data.push(['Inactive User', user_data.inactive]);
        
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-session-device', 'pie2', function(){
        var data = [];
        data.push(['Total Sessions Device', 'Date']);
        data.push(['Desktop', session_device_data.pc]);
        data.push(['Mobile', session_device_data.mobile]);
        data.push(['Tablets', session_device_data.tablet]);
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-user-country', 'geo', function(){
        var data = [];
        data.push(['Country', 'Users']);
        for (const i in user_country_data) {
          data.push([i,user_country_data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-user-new', 'bar', function(){
        var data = [];
        data.push(['Time', 'Active User', 'Inactive User', 'Total User']);
        for (const i in new_user_data) {
          data.push([i, new_user_data[i].active, new_user_data[i].inactive, new_user_data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
});
$(document).ready(function(){
    $('.select-chart-user-location').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        drawChartWrap('chart-user-country', 'geo', function(){
            var data = [];
            data.push(['Country', ucwords(t)+' User']);
            for (const i in user_country_data) {
              data.push([i,user_country_data[i][t]])
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-chart-user-device').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        if(t == 'today'){
            var dataSessionDevice = <?=json_encode($this->data->sessionDeviceToday)?>;
        }else if( t == 'lastWeek'){
            var dataSessionDevice = <?=json_encode($this->data->sessionDeviceLast7day)?>;
        }else if( t == 'lastMonth'){
            var dataSessionDevice = <?=json_encode($this->data->sessionDeviceLast30day)?>;
        }else if( t == 'lastYear'){
            var dataSessionDevice = <?=json_encode($this->data->sessionDeviceLastyear)?>;
        }
        var total_session = 0;
        total_session = dataSessionDevice.pc + dataSessionDevice.mobile + dataSessionDevice.tablet;
        $('#total_session_device').html(total_session);
        drawChartWrap('chart-session-device', 'pie2', function(){
            var data = [];
            data.push(['Total Sessions Device', 'Date']);
            data.push(['Desktop', dataSessionDevice.pc]);
            data.push(['Mobile', dataSessionDevice.mobile]);
            data.push(['Tablets', dataSessionDevice.tablet]);
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-chart-user-region').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
    
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/user/list-session-by-region/'+t, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                var total_session = 0;
                var listRegion = res.data;
                var string = '<tr>';
                listRegion.forEach(function(item){
                  string += '<td style="width:200px;"><span class="badge badge-info">'+item.country_name+'</span></td>';
                  string += '<td>'+item.session+'</td>';
                })
                string += '<tr>';
                $('#list-session-by-region').html(string);
            }
        });
    });
});
</script>