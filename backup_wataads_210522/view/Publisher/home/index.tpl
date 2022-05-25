<style>
    .dropdown-menu {
        margin-top: -0.5rem;
    }
    .table-container .badge{
        width: 70px;
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
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->today_revenue)?></h2>
                        <p>Today</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-money text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->yesterday_revenue)?></h2>
                        <p>Yesterday</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-money text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->pub_balance + $this->data->balance->pub_pending*$this->data->revshare)?></h2>
                        <p>Available</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-check-square-o text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->withdraw_value)?></h2>
                        <p>Withdrawn</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-credit-card text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Latest Announcements</h4>
                    <p class="font-medium-5 mb-0">
                        <a href="/announcement"><i class="feather icon-chevrons-right "></i></a>
                    </p>
                </div>
                <div class="card-content">
                    <div class="card-body pb-0" style="position: relative;">
                        <?php if($this->data->announcement): ?>
                        <?php foreach($this->data->announcement as $item): ?>
                        <div class="message is-<?=$item->type?>">
                            <div class="message-body">
                                <strong><?=ucwords($item->service)?>: <?=$item->subject?></strong><br>
                                <p><i><?=$item->created_at?></i></p>
                                <p><?=nl2br($item->description)?></p>
                                <?php if($item->is_long): ?>
                                <p class="read_full pt-1">
                                    <button class="btn btn-sm btn-<?=$item->type?> read_more" data-id="<?=$item->id?>">
                                        <span class="icon">
                                            <svg viewBox="0 0 24 24">
                                                <path fill="currentColor" d="M7,10L12,15L17,10H7Z" />
                                            </svg>
                                        </span>
                                        <span>Read more</span>
                                    </button>
                                </p>
                                <?php endif; ?>
                            </div>
                        </div>
                        <?php endforeach; ?>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p class="title is-6">You're All Caught Up</p>
                                    <p class="subtitle is-6">You have seen all new announcements from us</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">30 Days Statistics</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            
                            <a class="dropdown-item select-chart-30day" data-type="impression">Impression</a>
                            <a class="dropdown-item select-chart-30day" data-type="click">Click</a>
                            <a class="dropdown-item select-chart-30day" data-type="conversion">Conversion</a>
                            <a class="dropdown-item select-chart-30day" data-type="revenue">Revenue</a>
                            <a class="dropdown-item select-chart-30day" data-type="metrics">All Metrics</a>
                            
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <div class="height-300">
                            <div id="chart-30day"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <p>7days Revenue</p>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->last7day['revenue'])?></h2>
                        <p class="text-<?php if($this->data->compare['revenue'] < 0): ?>danger<?php else: ?>success<?php endif; ?>">
                            <?php if($this->data->compare['revenue'] < 0): ?>
                                <i class="feather icon-arrow-up text-success"></i>
                            <?php else: ?>
                                <i class="feather icon-arrow-down text-success"></i>
                            <?php endif; ?>
                            <span><?=$this->data->compare['revenue']?>%</span>
                        </p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                        
                            <i class="fa fa-money text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <p>7days Impression</p>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->numberFormat($this->data->last7day['impression'])?></h2>
                        <p class="text-<?php if($this->data->compare['impression'] < 0): ?>danger<?php else: ?>success<?php endif; ?>">
                            <?php if($this->data->compare['impression'] < 0): ?>
                                <i class="feather icon-arrow-up text-success"></i>
                            <?php else: ?>
                                <i class="feather icon-arrow-down text-success"></i>
                            <?php endif; ?>
                            <span><?=$this->data->compare['impression']?>%</span>
                        </p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-eye text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <p>7days Click</p>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->numberFormat($this->data->last7day['click'])?></h2>
                        <p class="text-<?php if($this->data->compare['click'] < 0): ?>danger<?php else: ?>success<?php endif; ?>">
                            <?php if($this->data->compare['click'] < 0): ?>
                                <i class="feather icon-arrow-up text-success"></i>
                            <?php else: ?>
                                <i class="feather icon-arrow-down text-success"></i>
                            <?php endif; ?>
                            <span><?=$this->data->compare['click']?>%</span>
                        </p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-hand-o-up text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <p>7days Reach</p>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->numberFormat($this->data->last7day['reach'])?></h2>
                        <p class="text-<?php if($this->data->compare['reach'] < 0): ?>danger<?php else: ?>success<?php endif; ?>">
                            <?php if($this->data->compare['reach'] < 0): ?>
                                <i class="feather icon-arrow-up text-success"></i>
                            <?php else: ?>
                                <i class="feather icon-arrow-down text-success"></i>
                            <?php endif; ?>
                            <span><?=$this->data->compare['reach']?>%</span>
                        </p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-radio text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">Website ID</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            
                            <a class="dropdown-item select-chart-30day" data-type="impression">Impression</a>
                            <a class="dropdown-item select-chart-30day" data-type="click">Click</a>
                            <a class="dropdown-item select-chart-30day" data-type="conversion">Conversion</a>
                            <a class="dropdown-item select-chart-30day" data-type="revenue">Revenue</a>
                            
                        </div>
                    </div>
                    
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <div class="height-300">
                            <div id="chart-website"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">Zone ID</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            
                            <a class="dropdown-item select-chart-30day" data-type="impression">Impression</a>
                            <a class="dropdown-item select-chart-30day" data-type="click">Click</a>
                            <a class="dropdown-item select-chart-30day" data-type="conversion">Conversion</a>
                            <a class="dropdown-item select-chart-30day" data-type="revenue">Revenue</a>
                            
                        </div>
                    </div>
                    
                </div>
                <div class="card-body">
                    <div class="height-300">
                        <div id="chart-zone"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">Country</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            
                            <a class="dropdown-item select-chart-30day" data-type="impression">Impression</a>
                            <a class="dropdown-item select-chart-30day" data-type="click">Click</a>
                            <a class="dropdown-item select-chart-30day" data-type="conversion">Conversion</a>
                            <a class="dropdown-item select-chart-30day" data-type="revenue">Revenue</a>
                            
                        </div>
                    </div>
                    
                </div>
                <div class="card-body">
                    <div class="height-350">
                        <div id="chart-country"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="mb-0">Latest Support</h4>
                    <p class="font-medium-5 mb-0"><a href="<?=MYACCOUNT_URL?>/support"><i class="feather icon-chevrons-right "></i></a></p>
                </div>
                <div class="card-content">
                    <div class="card-body px-0 pb-0" style="position: relative;">
                        <?php if($this->data->support): ?>
                        <div class="table-container">
                            <table class="table is-striped is-fullwidth">
                                <thead>
                                    <tr>
                                        <th style="width:70px"><span  class="is-pulled-left">Status</span></th>
                                        <th>Subject</th>
                                        <th><span>Last Update</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($this->data->support as $item): ?>
                                    <tr>
                                        <td style="width:70px">
                                            <?php if($item->status == 'Opening'): ?>
                                            <span class="badge badge-primary">Opening</span>
                                            <?php elseif($item->status == 'Replied'): ?>
                                            <span class="badge badge-success">Replied</span>
                                            <?php else: ?>
                                            <span class="badge badge-warning">Closed</span>
                                            <?php endif; ?>
                                        </td>
                                        <td><a href="<?=MYACCOUNT_URL?>/support/ticket/<?=$item->id?>" class="text-overflow"><?=$item->subject?></a></td>
                                        <td><span class="is-pulled-right text-overflow"><?=$item->updated_at?:'Never'?></span></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p class="title is-6">Need help? Have suggestions?</p>
                                    <p class="subtitle is-6">Our support department is right here. <a href="/support/create">Ask now</a></p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<?=$this->asset2('app-assets/vendors/js/charts/chart.min.js')?>"></script>
<script src="<?=$this->asset2('app-assets/js/scripts/charts/chart-chartjs.js')?>"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs */
    var last30day_data = <?=json_encode($this->data->last30day_stats)?>;
    var country_data = <?=json_encode($this->data->country)?>;
    var website_data = <?=json_encode($this->data->website)?>;
    var zone_data = <?=json_encode($this->data->zone)?>;
    function count_note() {
        var max = 9999, current = $.trim($('#user_note').val()).length, count = $('#note_count');
        var left = max - current;
        if (left < 20) {
            count.removeClass('is-info').addClass('is-danger');
        } else {
            count.removeClass('is-danger').addClass('is-info');
        }
        count.html('Max '+max+' characters, used: '+current+', left: '+left);
    }
    function numberFormat(y) {
        y = parseInt(y, 10);
        if(y < 1000) return y;
        var i = Math.floor( Math.log(y) / Math.log(1000) );
        return ( y / Math.pow(1000, i) ).toFixed(2) * 1 + ['', 'K', 'M', 'B'][i];
    }
    function currencyFormat(n) {
        n = parseFloat(n) || 0.00;
        return '$'+n.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    }
    function ucwords(str) {
        return (str + '').toLowerCase().replace(/^(.)|\s+(.)/g, function (l) {return l.toUpperCase()});
    }
    function drawChart(id, type, data) {
        window.tacharts = window.tacharts || {};
        window.taoptions = window.taoptions || {};
        if(window.tacharts[id] === undefined) {
            if(type == 'line') {
                window.tacharts[id] = new google.visualization.LineChart(document.getElementById(id));
                window.taoptions[id] = {
                    titlePosition: 'none',
                    legend:{position:'top',alignment:'center'},
                    height: 300,
                    curveType: 'function',
                    chartArea:{left:0,bottom:0,width:'100%',height:280},
                    vAxis:{textPosition: 'none', viewWindow:{min: 0}},
                    hAxis:{textPosition:'none'},
                    colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
                    tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                    focusTarget:'category',
                };
            } else if(type == 'area') {
                window.tacharts[id] = new google.visualization.AreaChart(document.getElementById(id));
                window.taoptions[id] = {
                    titlePosition: 'none',
                    legend:{position:'top',alignment:'center'},
                    height: 300,
                    chartArea:{left:0,bottom:0,width:'100%',height:280},
                    vAxis:{textPosition: 'none', viewWindow:{min: 0}},
                    hAxis:{textPosition:'none'},
                    colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
                    tooltip:{isHtml:true,textStyle:{color:'#fff'}}
                };
            } else if(type == 'geo') {
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
                    sliceVisibilityThreshold: .05,
                    legend:{position:'right',alignment:'center'},
                    height: 260,
                    chartArea:{left:0,top:0,width:'100%',height:230},
                    colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
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
        drawChartWrap('chart-website', 'pie', function(){
            var data = [];
            data.push(['Website ID', 'Impression']);
            for (const i in website_data) {
            data.push([i,website_data[i].impression])
            }
            return google.visualization.arrayToDataTable(data);
        });
        drawChartWrap('chart-zone', 'pie', function(){
            var data = [];
            data.push(['Zone ID', 'Impression']);
            for (const i in zone_data) {
            data.push([i,zone_data[i].impression])
            }
            return google.visualization.arrayToDataTable(data);
        });
        drawChartWrap('chart-country', 'geo', function(){
            var data = [];
            data.push(['Country', 'Impression']);
            for (const i in country_data) {
            data.push([i,country_data[i].impression])
            }
            return google.visualization.arrayToDataTable(data);
        });
        drawChartWrap('chart-30day', 'area', function(){
            var data = [];
            data.push(['Date', 'Impression']);
            for (const i in last30day_data) {
            data.push([i, last30day_data[i].impression])
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
    $(document).ready(function(){
        count_note();
        $('#user_note').on('input', function(){
            count_note();
            $('#save_note').prop('disabled', false);
        });
        $('#save_note').on('click', function(){
            var $this = $(this);
            $this.prop('disabled', true);
            $this.addClass('is-loading');
            $.post('/me/note', {csrf_token: __tajs.csrf, data: $.trim($('#user_note').val())}, function(res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    __tajs.showAlert(res.data);
                    return false;
                }
                $this.html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" /></svg></span><span>Saved!</span>');
            });
        });
        $(document).on('click', '.read_more', function() {
            var $this = $(this), id = $this.attr('data-id');
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/announcement/content/'+id, {csrf_token: __tajs.csrf}, function(res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                }
                else {
                    $this.parent().html(res.data.replace(/\n/g,"<br>"));
                }
            });
        });
        $('.select-chart-website').on('click', function(){
            var $this = $(this), t = $this.attr('data-type');
            $this.closest('.dropdown').find('.current-selected').html($this.html());
            drawChartWrap('chart-website', 'pie', function(){
                var data = [];
                data.push(['Website ID', ucwords(t)]);
                for (const i in website_data) {
                    data.push([i,website_data[i][t]])
                }
                return google.visualization.arrayToDataTable(data);
            });
        });
        $('.select-chart-zone').on('click', function(){
            var $this = $(this), t = $this.attr('data-type');
            $this.closest('.dropdown').find('.current-selected').html($this.html());
            drawChartWrap('chart-zone', 'pie', function(){
                var data = [];
                data.push(['Zone ID', ucwords(t)]);
                for (const i in zone_data) {
                    data.push([i,zone_data[i][t]])
                }
                return google.visualization.arrayToDataTable(data);
            });
        });
        $('.select-chart-country').on('click', function(){
            var $this = $(this), t = $this.attr('data-type');
            $this.closest('.dropdown').find('.current-selected').html($this.html());
            drawChartWrap('chart-country', 'geo', function(){
                var data = [];
                data.push(['Country', ucwords(t)]);
                for (const i in country_data) {
                    data.push([i,country_data[i][t]])
                }
                return google.visualization.arrayToDataTable(data);
            });
        });
        $('.select-chart-30day').on('click', function(){
            var $this = $(this), t = $this.attr('data-type');
            if(t == "metrics"){
                $this.closest('.dropdown').find('.current-selected').html($this.html());
                drawChartWrap('chart-30day', 'line', function(){
                    var data = [];
                    data.push(['Date', 'Impression', 'Click', 'Conversion', 'Revenue']);
                    for (const i in last30day_data) {
                    data.push([i, last30day_data[i].impression, last30day_data[i].click, last30day_data[i].conversion, last30day_data[i].revenue])
                    }
                    return google.visualization.arrayToDataTable(data);
                });
            }else{
                $this.closest('.dropdown').find('.current-selected').html($this.html());
                drawChartWrap('chart-30day', 'area', function(){
                    var data = [];
                    data.push(['Date', ucwords(t)]);
                    for (const i in last30day_data) {
                    data.push([i, last30day_data[i][t]])
                    }
                    return google.visualization.arrayToDataTable(data);
                });
            }
        });
        var $primary = '#7367F0';
        var $success = '#28C76F';
        var $danger = '#EA5455';
        var $warning = '#FF9F43';
        var $label_color = '#1E1E1E';
        var grid_line_color = '#dae1e7';
        var scatter_grid_color = '#f3f3f3';
        var $scatter_point_light = '#D1D4DB';
        var $scatter_point_dark = '#5175E0';
        var $white = '#fff';
        var $black = '#000';

        // Chart Options
        var linechartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            legend: {
            position: 'top',
            },
            hover: {
            mode: 'label'
            },
            scales: {
            xAxes: [{
                display: true,
                gridLines: {
                color: grid_line_color,
                },
                scaleLabel: {
                display: true,
                }
            }],
            yAxes: [{
                display: true,
                gridLines: {
                color: grid_line_color,
                },
                scaleLabel: {
                display: true,
                }
            }]
            },
            title: {
            display: true,
            text: 'World population per region (in millions)'
            }
        };
        
        // Chart Data
        var linechartData = {
            labels: [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050],
            datasets: [{
            label: "Africa",
            data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478],
            borderColor: $primary,
            fill: false
            }, {
            data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267],
            label: "Asia",
            borderColor: $success,
            fill: false
            }, {
            data: [168, 170, 178, 190, 203, 276, 408, 547, 675, 734],
            label: "Europe",
            borderColor: $danger,
            fill: false
            }, {
            data: [40, 20, 10, 16, 24, 38, 74, 167, 508, 784],
            label: "Latin America",
            borderColor: $warning,
            fill: false
            }, {
            data: [6, 3, 2, 2, 7, 26, 82, 172, 312, 433],
            label: "North America",
            borderColor: $label_color,
            fill: false
            }]
        };

        var lineChartconfig = {
            type: 'line',
            // Chart Options
            options: linechartOptions,
            data: linechartData
        };
        var lineChartctx = $("#chart-30day");
        var lineChart = new Chart(lineChartctx, lineChartconfig);
    });
</script>