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
.zone-detail .tag, .zone-detail .text-muted, .zone-detail a, .zone-detail button {
    margin-left: 1rem;
}
.zone-detail li {
    padding: .7rem 0 0 0;
    border-bottom: 1px solid #E6E8EB;
}
</style>
<div class="content-body">
    
    <div class="row">
        <div class="col-12">
            <?php if($this->data->status == 'Active'): ?>
            <div class="buttons text-center are-medium">
                <a class="btn btn-success mb-1" href="/report?start_date=<?=$this->data->today?>&end_date=<?=$this->data->today?>&website_id=&zone_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Today Stats</span>
                </a>
                <a class="btn btn-primary mb-1" href="/report?start_date=<?=$this->data->last7days?>&end_date=<?=$this->data->today?>&website_id=&zone_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 7days Stats</span>
                </a>
                <a class="btn btn-info mb-1" href="/report?start_date=<?=$this->data->last30days?>&end_date=<?=$this->data->today?>&website_id=&zone_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 30days Stats</span>
                </a>
            </div>
            <?php else: ?>
            <div class="message text-danger" style="background-color: antiquewhite">
                <div class="message-body" style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                    <p>This zone is rejected, all informations are for convenience only!</p>
                </div>
            </div>
            <?php endif; ?>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p>
                            <?=htmlentities($this->data->adFormat->tag_guide)?>.
                            If you want to use your own domain instead of ours to serve ads, apply it to <a class="text-success" href="/domain">Anti-Adblock Domains</a>
                        </p>
                        <div class="form-group">
                            <textarea class="textarea form-control" id="ad_script" placeholder="Ad Tag" readonly><?=$this->data->adFormat->tag_script?></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row is-multiline" style="flex-wrap: wrap">
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <ul class="zone-detail" style="list-style: none; padding-left: 0">
                            <li>ID: <span class="text-muted">#<?=$this->data->id?></span></li>
                            <li>Name: <span class="text-muted"><?=$this->data->name?></span></li>
                            <li>Ad Format: <span class="text-muted"><?=$this->data->adFormat->name?></span></li>
                            <li>Website: <a class="mr-1" href="/website/detail/<?=$this->data->website_id?>"><?=$this->data->domain?></a>
                                <?php if($this->data->website_status=='Pending'): ?>
                                <span class="badge round badge-warning">Pending</span>
                                <?php elseif($this->data->website_status=='Rejected'): ?>
                                <span class="badge round badge-danger">Rejected</span>
                                <?php else: ?>
                                <span class="badge round badge-success">Active</span>
                                <?php endif; ?>
                            </li>
                            <li>Description: <span class="text-muted"><?=$this->data->description?></span></li>
                            <li>Total Revenue: <span class="text-muted"><?=$this->helper->currencyFormat($this->data->revenue)?></span></li>
                            <li>Total Impression: <span class="text-muted"><?=$this->helper->numberFormat($this->data->impression)?></span></li>
                            <li>Average eCPM: <span class="text-muted"><?=$this->data->impression?$this->helper->currencyFormat($this->data->revenue*1000/$this->data->impression):'No Data'?></span></li>
                            <li>Created: <span class="text-muted"><?=$this->data->created_at?></span></li>
                        </ul>
                        <div class="buttons text-center pt-5">
                            <button class="btn btn-light btn-info waves-effect waves-light" id="btn-edit">
                                <i class="feather icon-edit"></i>
                                <span>Edit</span>
                            </button>
                            <a class="btn btn-light btn-danger waves-effect waves-light" href="/publisher/zone/setup?id=<?=$this->data->id?>">
                                <i class="fa fa-cogs"></i>
                                <span>Setup</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="d-flex">
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
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Edit</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" type="text" id="name" placeholder="Zone Name" value="<?=$this->data->name?>">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="textarea form-control" id="description" placeholder="Zone Description"><?=$this->data->description?></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="save_zone">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs */
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
    $('#save_zone').click(function() {
        var $this = $(this), data = {};
        data.name = $('#name').val();
        data.description = $('#description').val();
        if(!data.name || data.name.length < 3) {
            __tajs.showAlert('Zone Name is required minimum 3 characters');
            return false;
        }
        if(!data.description || data.description.length < 5) {
            __tajs.showAlert('Description is required and minimum 5 characters');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post(window.location.pathname, {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                $('#edit_modal').modal('hide');
                window.location.reload();
                $this.html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" /></svg></span><span>Saved</span>');
            }
        });
    });
    $('#ad_script').on('click', function() {
        $(this).focus().select();
        document.execCommand('copy');
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