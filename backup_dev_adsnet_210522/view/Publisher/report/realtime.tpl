<style>
.header-controls {
    margin-top: -0.55rem;
    float: right !important;
}
.header-controls .button, .header-controls .button:focus {
    border: none;
    box-shadow: none;
}
#realtime-impression {
    font-weight: 300;
}
.is-up {
	-webkit-animation: increase 3s;
	animation: increase 3s;
}
.is-down {
	-webkit-animation: decrease 3s;
	animation: decrease 3s;
}
#realtime-impression b {
    font-size: 80px;
    display: block;
    color: #627181;
}
@-webkit-keyframes increase {
    10% {
        background-color: #eaffea;
        border-color: #E6E8EB;
        color: hsla(120, 100%, 25%, 1)
    }
}
@keyframes  increase {
    10% {
        background-color: #eaffea;
        border-color: #E6E8EB;
        color: hsla(120, 100%, 25%, 1)
    }
}
@-webkit-keyframes decrease {
    10% {
        background-color: #ffeaea;
        border-color: #E6E8EB;
        color: red
    }
}
@keyframes  decrease {
    10% {
        background-color: #ffeaea;
        border-color: #E6E8EB;
        color: red
    }
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
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-4 col-sm-12 col-12">
            <div class="card">
                <div class="card-header d-flex">
                    <div class="mb-1">
                        <h4 class="text-bold-700 mb-0">Impressions</h4>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body pb-0 pt-0 height-350 d-flex justify-content-center align-items-center">
                        <div id="realtime-impression" class="text-centered hero-body">
                            Active Now: <b>_</b>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-8 col-sm-12 col-12">
            <div class="card">
                <div class="card-header d-flex">
                    <div>
                        <h4 class="text-bold-700 mb-0">Country (today)</h4>
                    </div>
                   <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">By Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">

                            <a class="dropdown-item select-graph-ct" data-type="impression">By Impression</a>
                            <a class="dropdown-item select-graph-ct" data-type="click">By Click</a>
                            <a class="dropdown-item select-graph-ct" data-type="conversion">By Conversion</a>
                            <a class="dropdown-item select-graph-ct" data-type="revenue">By Revenue</a>
                            <a class="dropdown-item select-graph-ct" data-type="reach">By Reach</a>

                        </div>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body pb-0 pt-0 height-350">
                        <div id="graph-ct"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex">
                    <div>
                        <h4 class="text-bold-700 mb-0">Realtime Statistics</h4>
                        
                    </div>
                   <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">By Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">

                            <a class="dropdown-item select-graph-ct" data-type="impression">By Impression</a>
                            <a class="dropdown-item select-graph-ct" data-type="click">By Click</a>
                            <a class="dropdown-item select-graph-ct" data-type="conversion">By Conversion</a>
                            <a class="dropdown-item select-graph-ct" data-type="revenue">By Revenue</a>
                            <a class="dropdown-item select-graph-ct" data-type="reach">By Reach</a>
                            
                        </div>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body pb-0 pt-0 height-350">
                        <div id="graph-rt"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */
var current_impression = 0, selected_ct = 'impression', selected_rt = 'impression', last_data = false;
var country_data = {
    XX: {
        impression: 0,
        click: 0,
        conversion: 0,
        revenue: 0,
        reach: 0
    }
};
var minute_data = {};
function initMinuteData() {
    var d = new Date(), h = d.getHours(), m = d.getMinutes();
    for(var i=14;i>=0;i--) {
        var min = m - i;
        var hr = h;
        if(min < 0) {
            min = 60 + min;
            hr = hr - 1;
            if(hr < 0) hr = 23 + hr;
        }
        var text = ('0'+hr).slice(-2)+':'+('0'+min).slice(-2);
        minute_data[text] = {
            impression: 0,
            click: 0,
            conversion: 0,
            revenue: 0,
            reach: 0
        }
    }
}
function ucwords(str) {
    return (str + '').toLowerCase().replace(/^(.)|\s+(.)/g, function (l) {return l.toUpperCase()});
}
function summaryData() {
    var data = {};
    for (const cc in country_data) {
        for (const i in country_data[cc]) {
            data[i] = data[i] || 0;
            data[i] = data[i] + parseInt(country_data[cc][i],10);
        }
    }
    
    return data;
}
function drawChart(id, type, data) {
    window.tacharts = window.tacharts || {};
    window.taoptions = window.taoptions || {};
    if(window.tacharts[id] === undefined) {
        if(type == 'bar') {
            window.tacharts[id] = new google.charts.Bar(document.getElementById(id));
            window.taoptions[id] = google.charts.Bar.convertOptions({
                titlePosition: 'none',
                legend:{position:'none',alignment:'center'},
                height: 300,
                curveType: 'function',
                chartArea:{left:0,bottom:0,width:'100%',height:'100%'},
                vAxis:{textPosition: 'none', viewWindow:{min: 0}},
                hAxis:{textPosition: 'none'},
                colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
                tooltip:{isHtml:true,textStyle:{color:'#fff'}},
                focusTarget:'category',
                axes: {
                    x: {
                      0: { label: ''} // Top x-axis.
                    }
                },
            });
        } else if(type == 'geo') {
            window.tacharts[id] = new google.visualization.GeoChart(document.getElementById(id));
            window.taoptions[id] = {
                height: 350,
                keepAspectRatio: true,
                colorAxis: {colors: ['#ebcfea', '#8b4b8a']}
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
function drawCountry() {
    drawChartWrap('graph-ct', 'geo', function(){
        var data = [];
        data.push(['Country', ucwords(selected_ct)]);
        for (const i in country_data) {
            data.push([i, country_data[i][selected_ct]])
        }
        return google.visualization.arrayToDataTable(data);
    });
}
function drawBar() {
    drawChartWrap('graph-rt', 'bar', function(){
        var data = [];
        data.push(['Time', ucwords(selected_rt)]);
        for (const i in minute_data) {
            data.push([i, minute_data[i][selected_rt]]);
        }
        return google.visualization.arrayToDataTable(data);
    });
}
function updateMinuteData(data) {
    var d = new Date(), h = d.getHours(), m = d.getMinutes();
    var current = ('0'+h).slice(-2)+':'+('0'+m).slice(-2);
    if(minute_data[current] === undefined) {
        minute_data[current] = {
            impression: 0,
            click: 0,
            conversion: 0,
            revenue: 0,
            reach: 0
        }
        for (const t in minute_data) {
            delete minute_data[t];
            break;
        }
    }
    for (const i in minute_data[current]) {
        var change = 0;
        if(last_data) {
            if(last_data[i] <= data[i]) {
                change = data[i] - last_data[i];
            } else {
                change = data[i];
            }
        }
        minute_data[current][i] = minute_data[current][i] + change;
    }
    last_data = data;
}
function realtime() {
    var rtbox = $('#realtime-impression').closest('.flatbox');
    rtbox.removeClass('is-up').removeClass('is-down');
    $.post('/report/realtime', {csrf_token: __tajs.csrf}, function(res) {
        if (res.success) {
            country_data = res.data;
            var data = summaryData();
            var impression = 0;
            if(last_data) {
                if(last_data.impression <= data.impression) {
                    impression = data.impression - last_data.impression;
                } else {
                    impression = data.impression;
                }
            }
            $('#realtime-impression').find('b').html(impression);
            if(impression > current_impression) {
                rtbox.addClass('is-up');
            } else if(impression < current_impression) {
                rtbox.addClass('is-down');
            }
            current_impression = impression;
            
            updateMinuteData(data);
            drawCountry();
            drawBar();
            setTimeout(realtime, 10000);
        }
    });
}
google.charts.load('current', {'packages':['geochart','bar'],'mapsApiKey': 'AIzaSyDRDJMzEc-lrhfpOgehmn8Duta9Y8Blius'});
google.charts.setOnLoadCallback(function () {
    initMinuteData();
    drawCountry();
    drawBar();
    realtime();
});
$(document).ready(function(){
    $('.select-graph-ct').on('click', function(){
        var $this = $(this);
        selected_ct = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        drawCountry();
    });
    $('.select-graph-rt').on('click', function(){
        var $this = $(this);
        selected_rt = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        drawBar();
    });
});
</script>