<style>
.header-controls {
    margin-top: -0.55rem;
}
.is-right {
    float: right !important;
}
.is-menu {
    color: #009dff !important;
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
.title .tag {
    margin-left: 0.5rem;
}
.zone-detail {
    font-size: 18px;
}
.zone-detail .text-muted, .zone-detail a, .zone-detail button {
    margin-left: 1rem;
}
.zone-detail li {
    padding: .7rem 0 0 0;
    border-bottom: 1px solid #E6E8EB;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->status == 'Active'): ?>
            <div class="buttons text-center are-medium">
                <a class="btn btn-success mb-1" href="/report?start_date=<?=$this->data->today?>&end_date=<?=$this->data->today?>&website_id=<?=$this->data->id?>&zone_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Today Stats</span>
                </a>
                <a class="btn btn-primary mb-1" href="/report?start_date=<?=$this->data->last7days?>&end_date=<?=$this->data->today?>&website_id=<?=$this->data->id?>&zone_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 7days Stats</span>
                </a>
                <a class="btn btn-info mb-1" href="/report?start_date=<?=$this->data->last30days?>&end_date=<?=$this->data->today?>&website_id=<?=$this->data->id?>&zone_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 30days Stats</span>
                </a>
            </div>
            <?php elseif($this->data->status == 'Pending'): ?>
            <div class="media text-warning mb-2">
                <div class="media-body" style="background-color: rgba(128,128,128,0.1)">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Your website is being reviewed by our staff. You will able to create Ad Zones once this process done.<br>
                            It may takes up to 24hours, we are sorry for any inconvenience this may cause</p>
                    </div>
                </div>
            </div>
            <?php else: ?>
            <div class="media text-danger mb-2">
                <div class="media-body" style="background-color: rgba(128,128,128,0.1)">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Your website is not active, all informations are for convenience only!</p>
                    </div>
                </div>
            </div>
            <?php endif; ?>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-6 col-sm-12 col-12">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="flatbox is-100height">
                            <ul class="zone-detail" style="list-style: none; padding-left: 0px">
                                <li>ID: <span class="text-muted">#<?=$this->data->id?></span></li>
                                <li>Domain: <a href="//<?=$this->data->domain?>" target="_blank"><?=$this->data->domain?></a></li>
                                <li>Category: <span class="text-muted"><?=$this->data->categories[$this->data->category_id]?></span></li>
                                <li>Zones: <a href="/zone?website_id=<?=$this->data->id?>"><?=$this->data->active_zone?> Active - <?=$this->data->total_zone?> Total</a></li>
                                <li>Description: <span class="text-muted"><?=$this->data->description?></span></li>
                                <li>Total Revenue: <span class="text-muted"><?=$this->helper->currencyFormat($this->data->revenue)?></span></li>
                                <li>Total Impression: <span class="text-muted"><?=$this->helper->numberFormat($this->data->impression)?></span></li>
                                <li>Average eCPM: <span class="text-muted"><?=$this->data->impression?$this->helper->currencyFormat($this->data->revenue*1000/$this->data->impression):'No Data'?></span></li>
                                <li>Created: <span class="text-muted"><?=$this->data->created_at?></span></li>
                            </ul>
                            <div class="buttons text-center pt-1">
                                <button class="btn waves-effect waves-light btn-info mb-1" id="btn-edit">
                                    <i class="feather icon-edit"></i>
                                    <span>Edit</span>
                                </button>
                                <a class="btn btn-success waves-effect waves-light mb-1" href="/zone/create?website_id=<?=$this->data->id?>">
                                    <i class="feather icon-plus"></i>
                                    <span>Add new Zone</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-sm-12 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected is-menu">Country</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-type" role="menu">
                            <a class="dropdown-item select-menu is-menu" data-type="Country">Country</a>
                            <a class="dropdown-item select-menu is-menu" data-type="Date">Date</a>
                        </div>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-chart" data-type="impression">Impression</a>
                            <a class="dropdown-item select-chart" data-type="click">Click</a>
                            <a class="dropdown-item select-chart" data-type="conversion">Conversion</a>
                            <a class="dropdown-item select-chart" data-type="revenue">Revenue</a>
                        </div>
                    </div>
                </div>
                <div class="card-content ">
                    <div class="card-body pb-0 pt-0 height-350">
                        <div id="chart-content"></div>
                    </div>

                </div>
                <div class="card-header d-flex align-items-end pb-0" style="justify-content: end;">
                    <p class="help text-muted">Based on last 30 days data</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Tabular Data</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="current-selected">By Country</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <a class="dropdown-item select-table" data-type="Country">By Country</a>
                            <a class="dropdown-item select-table" data-type="Date">By Date</a>

                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="columns">
                            <div class="column">
                                <div class="flatbox">
                                    <div class="table-responsive">
                                        <table class="table table-striped mb-1">
                                            <thead>
                                            <tr>
                                                <th id="table-type">Country</th>
                                                <th>Impression</th>
                                                <th>Click</th>
                                                <th>Conversion</th>
                                                <th>Reach</th>
                                                <th>Revenue</th>
                                                <th>eCPM</th>
                                                <th>CTR</th>
                                                <th>CR</th>
                                            </tr>
                                            </thead>
                                            <tbody id="table-data">
                                            <tr>
                                                <td colspan="9"><p class="text-info text-center">Loading...</p></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade text-left" id="edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Description</label>

                        <textarea class="textarea form-control" id="description" placeholder="Website Description"><?=$this->data->description?></textarea>

                    </div>
                    <div class="form-group">
                        <label class="label is-medium">Category</label>
                        <select id="category_id" class="form-control">
                            <?php foreach($this->data->categories as $id => $name): ?>
                            <option value="<?=$id?>"<?php if($id == $this->data->category_id): ?>selected<?php endif; ?>><?=$name?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success enterAction" id="save_website"><i class="feather icon-check"></i> Save</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="feather icon-x"></i> Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */
var date_data = <?=json_encode($this->data->date)?>;
var country_data = <?=json_encode($this->data->country)?>;
var type_chart = 'Country', type_table = 'Country', current_selected = 'impression', inited = false;
function ucwords(str) {
    return (str + '').toLowerCase().replace(/^(.)|\s+(.)/g, function (l) {return l.toUpperCase()});
}
function drawChart() {
    window.tadrawing = false;
    if(window.tachart) {
        window.tachart.clearChart();
        window.tachart = null;
    }
    if(type_chart == 'Date') {
        window.tachart = new google.visualization.LineChart(document.getElementById('chart-content'));
        window.taoptions = {
            titlePosition: 'none',
            legend:{position:'none'},
            height: 350,
            curveType: 'function',
            chartArea:{left:0,bottom:0,width:'100%',height:350},
            vAxis:{textPosition: 'none', viewWindow:{min: 0}},
            hAxis:{textPosition:'none'},
            colors:['#48c774','#3298dc','#00d1b2','#f14668','#ffdd57'],
            tooltip:{isHtml:true,textStyle:{color:'#fff'}},
            focusTarget:'category',
        };
    } else {
        window.tachart = new google.visualization.GeoChart(document.getElementById('chart-content'));
        window.taoptions = {
            height: 350,
            keepAspectRatio: true,
            colorAxis: {colors: ['#ebcfea', '#8b4b8a']}
        };
    }

    var ms = 10, data = [];
    var source_data = country_data;
    if(type_chart == 'Date') {
        source_data = date_data;
    }
    data.push([type_chart, ucwords(current_selected)]);
    for (const i in source_data) {
        data.push([i, source_data[i][current_selected]])
    }

    data = google.visualization.arrayToDataTable(data);
    window.tachart.draw(data, window.taoptions);

    if(!inited) {
        inited = true;
        if(window.tadrawing) ms = 200;
        $(window).on('resize', function(){window.tadrawing = setTimeout(function(){window.tachart.draw(data, window.taoptions)},ms)});
    }
}
function genTable() {
    var source_data = country_data, html = '';
    if(type_table == 'Date') {
        source_data = date_data;
        $('#table-type').text('Date');
    } else {
        $('#table-type').text('Country');
    }

    for (const i in source_data) {
        html += '<tr>';
        html += '<td>'+i+'</td>';
        html += '<td>'+source_data[i].impression+'</td>';
        html += '<td>'+source_data[i].click+'</td>';
        html += '<td>'+source_data[i].conversion+'</td>';
        html += '<td>'+source_data[i].reach+'</td>';
        html += '<td>$'+source_data[i].revenue+'</td>';
        html += '<td>$'+(source_data[i].revenue?Math.round(source_data[i].revenue*1000000/source_data[i].impression)/1000:'0.000')+'</td>';
        html += '<td>'+(source_data[i].click?Math.round(source_data[i].click*100000/source_data[i].impression)/1000:'0.000')+'%</td>';
        html += '<td>'+(source_data[i].conversion?Math.round(source_data[i].conversion*100000/source_data[i].impression)/1000:'0.000')+'%</td>';
        html += '</tr>';
    }

    $('#table-data').html(html);
}
google.charts.load('current', {'packages':['geochart','corechart'],'mapsApiKey': 'AIzaSyDRDJMzEc-lrhfpOgehmn8Duta9Y8Blius'});
google.charts.setOnLoadCallback(function () {
    drawChart();
});
$(document).ready(function() {
    genTable();
    $('#btn-edit').on('click', function(){
        $('#edit_modal').modal('show');
    });
    $('#save_website').click(function() {
        var $this = $(this), data = {id: <?=$this->data->id?>, domain: 'https://<?=$this->data->domain?>'};
        data.description = $.trim($('#description').val());
        data.category_id = $('#category_id').val();
        if(!data.description || data.description.length < 5) {
            __tajs.showAlert('Description is required minimum 5 characters');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/website', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            if (!res.success) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.reload();
            }
        });
    });
    $('.select-menu').on('click', function(){
        var $this = $(this);
        type_chart = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        drawChart();
    });
    $('.select-chart').on('click', function(){
        var $this = $(this);
        current_selected = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        drawChart();
    });
    $('.select-table').on('click', function(){
        var $this = $(this);
        type_table = $this.attr('data-type');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        genTable();
    });
});
</script>