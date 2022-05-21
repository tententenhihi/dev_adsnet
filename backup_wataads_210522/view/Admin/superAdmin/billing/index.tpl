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

.title-billing-admin {
    flex: 1;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<div class="content-body">

    <div class="row is-multiline">
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/website/pending">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-billing-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->pendingDeposite)?></h2>
                        <p style="color: #626262">Deposit UnPaid</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-money text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>
            <!--<div class="card h-100 mb-0">
                <a class="sumbox" href="/website/pending">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->pendingDeposite)?></p>
                        <p class="subtitle is-6 text-muted">Deposit UnPaid</p>
                    </div>
                    <div class="sumbox-icon text-info">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M5.5,0H18.5A5.5,5.5 0 0,1 24,5.5V18.5A5.5,5.5 0 0,1 18.5,24H5.5A5.5,5.5 0 0,1 0,18.5V5.5A5.5,5.5 0 0,1 5.5,0M15.39,15.18C15.39,16.76 14.5,17.81 12.85,17.95V12.61C14.55,13.13 15.39,13.66 15.39,15.18M11.65,6V10.88C10.34,10.5 9.03,9.93 9.03,8.43C9.03,6.94 10.18,6.12 11.65,6M15.5,7.6L16.5,6.8C15.62,5.66 14.4,4.92 12.85,4.77V3.8H11.65V3.8L11.65,4.75C9.5,4.89 7.68,6.17 7.68,8.5C7.68,11 9.74,11.78 11.65,12.29V17.96C10.54,17.84 9.29,17.31 8.43,16.03L7.3,16.78C8.2,18.12 9.76,19 11.65,19.14V20.2H12.07L12.85,20.2V19.16C15.35,19 16.7,17.34 16.7,15.14C16.7,12.58 14.81,11.76 12.85,11.19V6.05C14,6.22 14.85,6.76 15.5,7.6Z"></path>
                        </svg>
                    </span>
                    </div>
                </a>
            </div>-->
        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/withdraw/pending">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-billing-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->pendingWithdraw)?></h2>
                        <p style="color: #626262">Pending Withdraw</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-credit-card text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>
            <!--<div class="card h-100 mb-0">
                <a class="sumbox" href="/withdraw/pending">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->pendingWithdraw)?></p>
                        <p class="subtitle is-6 text-muted">Pending Withdraw</p>
                    </div>
                    <div class="sumbox-icon text-warning">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z" />
                        </svg>
                    </span>
                    </div>
                </a>
            </div>-->
        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/user/advertiser">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-billing-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->countAdvertiser)?></h2>
                        <p style="color: #626262">Total Advertiser</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>
            <!--<div class="card h-100 mb-0">
                <a class="sumbox" href="/user/advertiser">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->countAdvertiser)?></p>
                        <p class="subtitle is-6 text-muted">Total Advertiser</p>
                    </div>
                    <div class="sumbox-icon text-link">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M4,2H14V4H4V14H2V4C2,2.89 2.89,2 4,2M8,6H18V8H8V18H6V8C6,6.89 6.89,6 8,6M12,10H20C21.11,10 22,10.89 22,12V20C22,21.11 21.11,22 20,22H12C10.89,22 10,21.11 10,20V12C10,10.89 10.89,10 12,10M14,12V20L20,16L14,12Z" />
                        </svg>
                    </span>
                    </div>
                </a>
            </div>-->
        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/user/publisher">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-billing-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->countPublisher)?></h2>
                        <p style="color: #626262">Total Publishers</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>
            <!--<div class="card h-100 mb-0">
                <a class="sumbox" href="/user/publisher">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->countPublisher)?></p>
                        <p class="subtitle is-6 text-muted">Total Publishers</p>
                    </div>
                    <div class="sumbox-icon text-link">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M23,11H18A1,1 0 0,0 17,12V21A1,1 0 0,0 18,22H23A1,1 0 0,0 24,21V12A1,1 0 0,0 23,11M23,20H18V13H23V20M20,2H2C0.89,2 0,2.89 0,4V16A2,2 0 0,0 2,18H9V20H7V22H15V20H13V18H15V16H2V4H20V9H22V4C22,2.89 21.1,2 20,2M11.97,9L11,6L10.03,9H7L9.47,10.76L8.53,13.67L11,11.87L13.47,13.67L12.53,10.76L15,9H11.97Z" />
                        </svg>
                    </span>
                    </div>
                </a>
            </div>-->
        </div>
    </div>
    <div class="row" style="flex-wrap: wrap">
        <div class="col-lg-8 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex">

                    </div>
                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">By Deposit</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">

                            <a class="dropdown-item select-billing-location" data-type="deposit">By Deposit</a>
                            <a class="dropdown-item select-billing-location" data-type="spent">By Spent</a>
                            <a class="dropdown-item select-billing-location" data-type="earn">By Earn</a>
                            <a class="dropdown-item select-billing-location" data-type="withdraw">By Withdraw</a>

                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="hero">
                            <div class="chart-container" style="position: relative; width:100%; margin-top:1rem;">
                                <div id="chart-billing-country"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex">
                        <h3 class="title is-6 text-muted">Most popular Advertiser</h3>

                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th style="width:200px;">Top Advertiser</th>
                                    <th>Deposit</th>
                                    <th>Spent</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->listAdvertiserByBalance as $item): ?>
                                <tr>
                                    <td style="width:200px;"><span class="badge badge-primary"><?=$item->advertiser_name?></span></td>
                                    <td><?=$this->helper->currencyFormat($item->deposit_value)?></td>
                                    <td><?=$this->helper->currencyFormat($item->spent)?></td>
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

    

</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */
var billing_country_data = <?=json_encode($this->data->country)?>;
var billing_data_7day =  <?=json_encode($this->data->last7day_stats)?>;
var billing_data_30day =  <?=json_encode($this->data->last30day_stats)?>;
var cost_data =  {'2021-06-06 11:00:00':{'advertiser': 10,'ad_network': 10}};
var earn_data =  {'2021-06-06 11:00:00':{'publisher': 10,'ad_network': 10}};
var spent_Data = <?=json_encode($this->data->last7dayReceiptStats)?>;
var deposit_Data = <?=json_encode($this->data->last7dayDepositStats)?>;
var withdraw_Data = <?=json_encode($this->data->last7dayWithdrawStats)?>;
var paymentExchange_Data = <?=json_encode($this->data->last7dayExchangePaymentStats)?>;
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
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},

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
                colors:['#f14668','#ffdd57','#AFB5FC','#66CDAA'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}}
            };
        } else if(type == 'bar') {
            window.tacharts[id] = new google.visualization.ComboChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend:{position:'bottom',alignment:'center'},
                height: 320,
                chartArea:{width:'100%',height:270},
                seriesType: 'bars',
                series: {4: {type: 'line'},5: {type: 'line'}},
                colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57','#FF9900'],
            };
        } else if(type == 'bar1') {
            window.tacharts[id] = new google.visualization.ColumnChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend: {position: 'none'},
                height: 100,
                chartArea:{bottom:0,width:'100%',height:'50%'},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    },
                },
                hAxis: { format:'#,###%'},
                colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
            };
        } else if(type == 'bar2') {
            window.tacharts[id] = new google.visualization.ColumnChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend: {position: 'none'},
                height: 100,
                chartArea:{bottom:0,width:'100%',height:'50%'},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
                colors:['#3298dc'],
            };
        } else if(type == 'bar3') {
            window.tacharts[id] = new google.visualization.ColumnChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend: {position: 'none'},
                height: 100,
                chartArea:{bottom:0,width:'100%',height:'50%'},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
                colors:['#00d1b2'],
            };
        } else if(type == 'bar4') {
            window.tacharts[id] = new google.visualization.ColumnChart(document.getElementById(id));
            window.taoptions[id] = {
                titlePosition: 'none',
                legend: {position: 'none'},
                height: 100,
                chartArea:{bottom:0,width:'100%',height:'50%'},
                vAxis: {
                    gridlines: {
                        color: 'transparent'
                    }
                },
                colors:['#f14668'],
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
    drawChartWrap('chart-billing-country', 'geo', function(){
        var data = [];
        data.push(['Country', 'Deposit']);
        for (const i in billing_country_data) {
          data.push([i,billing_country_data[i].deposit]);
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-billing', 'bar', function(){
        var data = [];
        data.push(['Time', 'Total Deposit', 'Paid Deposit', 'Total Withdraw', 'Paid Withdraw', 'Receipt', 'Exchange Payment']);
        for (const i in billing_data_7day) {
          data.push([i, billing_data_7day[i].depositTotal, billing_data_7day[i].depositPaid, billing_data_7day[i].WithdrawTotal, billing_data_7day[i].WithdrawPaid, billing_data_7day[i].receipt, billing_data_7day[i].exchangePayment])
        }
        return google.visualization.arrayToDataTable(data);
    });
    // drawChartWrap('chart-cost', 'pie', function(){
    //     var data = [];
    //     data.push(['Total cost', 'Date']);
    //     for (const i in cost_data) {
    //         data.push(['Ad Network', cost_data[i].ad_network]);
    //         data.push(['Advertiser', cost_data[i].advertiser]);
    //     }
    //     return google.visualization.arrayToDataTable(data);
    // });
    // drawChartWrap('chart-earn', 'pie2', function(){
    //     var data = [];
    //     data.push(['Total earn', 'Date']);
    //     for (const i in earn_data) {
    //       data.push(['Ad Network', earn_data[i].ad_network]);
    //       data.push(['Publisher', earn_data[i].publisher]);
    //     }
    //     return google.visualization.arrayToDataTable(data);
    // });
    drawChartWrap('chart-total-deposit', 'bar2', function(){
        var data = [];
        data.push(['Time', 'Total Deposit']);
        for (const i in deposit_Data) {
          data.push([i, deposit_Data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-paid-deposit', 'bar3', function(){
        var data = [];
        data.push(['Time', 'Paid Deposit']);
        for (const i in deposit_Data) {
          data.push([i, deposit_Data[i].paid])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-withdraw', 'bar3', function(){
        var data = [];
        data.push(['Time', 'Total Withdraw']);
        for (const i in withdraw_Data) {
          data.push([i, withdraw_Data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-paid-withdraw', 'bar1', function(){
        var data = [];
        data.push(['Time', 'Paid Withdraw']);
        for (const i in withdraw_Data) {
          data.push([i, withdraw_Data[i].paid])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-receipt', 'bar4', function(){
        var data = [];
        data.push(['Time', 'Total Spent']);
        for (const i in spent_Data) {
          data.push([i, spent_Data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
    drawChartWrap('chart-total-exchange-payment', 'bar2', function(){
        var data = [];
        data.push(['Time', 'Total Exchange Payment']);
        for (const i in paymentExchange_Data) {
          data.push([i, paymentExchange_Data[i].total])
        }
        return google.visualization.arrayToDataTable(data);
    });
});
$(document).ready(function(){
    $('.select-billing-location').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        drawChartWrap('chart-billing-country', 'geo', function(){
            var data = [];
            data.push(['Country', ucwords(t)]);
            for (const i in billing_country_data) {
              data.push([i,billing_country_data[i][t]]);
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
    $('.select-chart-billing').on('click', function(){
        var $this = $(this), t = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        country_select_time = t;
        if( t == 'lastWeek'){
            var dataBilling = billing_data_7day;
        }else if( t == 'lastMonth'){
            var dataBilling = billing_data_30day;
        }
        drawChartWrap('chart-billing', 'bar', function(){
            var data = [];
            data.push(['Time', 'Total Deposit', 'Paid Deposit', 'Total Withdraw', 'Paid Withdraw', 'Receipt', 'Exchange Payment']);
            for (const i in dataBilling) {
              data.push([i, dataBilling[i].depositTotal, dataBilling[i].depositPaid, dataBilling[i].WithdrawTotal, dataBilling[i].WithdrawPaid, dataBilling[i].receipt, dataBilling[i].exchangePayment])
            }
            return google.visualization.arrayToDataTable(data);
        });
    });
});
</script>