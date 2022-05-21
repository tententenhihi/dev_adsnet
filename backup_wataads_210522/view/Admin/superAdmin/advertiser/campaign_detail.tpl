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
.media-content .title {
    margin-bottom: 0 !important;
}
.media-left .tag {
    width: 3rem;
    height: 3rem;
}
.media-left svg {
    width: 40px;
    height: 40px;
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
hr.is-current {
    background-color: #ae6dac40;
}
@media screen and (max-width: 768px) {
    .media-content {
        overflow-x: unset;
    }
}



.media {
    align-items: flex-start;
    display: flex;
    text-align: inherit;
}

.media-left {
    margin-right: 1rem;
}

.media-left, .media-right {
    flex-basis: auto;
    flex-grow: 0;
    flex-shrink: 0;
}

.media-content {
    flex-basis: auto;
    flex-grow: 1;
    flex-shrink: 1;
    text-align: inherit;
}

.media-left > span {
    /*padding: 10px 20px 10px 20px;*/padding: 8px 17px 8px 17px;
}

.media-content > div.are-transparent > button {
    padding: 0.5rem 1rem;
}

.media-content > div.are-transparent > button:hover {
    background-color: rgba(128, 128, 128, 0.1) !important;
}

.mt-4 {
    margin-top: 2.9rem !important;
}

.mt-4 > div.are-transparent > a:hover {
    /*background-color: rgba(128, 128, 128, 0.1) !important;*/
}

.media-left .badge i{
    font-size: 40px;
}
</style>
<div class="content-body">
    <?php if($this->data->status=='Active'||$this->data->status=='Paused'||$this->data->status=='Stopped'): ?>
    <div class="row">
        <div class="col-12">
            <div class="buttons text-center are-medium">
                <a class="btn btn-success mb-1" href="/report?start_date=<?=$this->data->today?>&end_date=<?=$this->data->today?>&campaign_id=<?=$this->data->id?>&ad_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Today Stats</span>
                </a>
                <a class="btn btn-primary mb-1" href="/report?start_date=<?=$this->data->last7days?>&end_date=<?=$this->data->today?>&campaign_id=<?=$this->data->id?>&ad_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 7days Stats</span>
                </a>
                <a class="btn btn-info mb-1" href="/report?start_date=<?=$this->data->last30days?>&end_date=<?=$this->data->today?>&campaign_id=<?=$this->data->id?>&ad_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 30days Stats</span>
                </a>
            </div>
        </div>
    </div>
    <?php endif; ?>
    <div class="row is-multiline" style="flex-wrap: wrap">
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="media">
                            <div class="media-left">
                                <?php if($this->data->status=='Active'): ?>
                                <span class="badge badge-success">
                                    <i class="fa fa-check-circle"></i>
                                </span>
                                <?php elseif($this->data->status=='Stopped'): ?>
                                <span class="badge badge-info">
                                    <i class="fa fa-times-circle"></i>
                                </span>
                                <?php elseif($this->data->status=='Paused'): ?>
                                <span class="badge badge-light">
                                    <i class="fa fa-pause-circle-o"></i>
                                </span>
                                <?php elseif($this->data->status=='Rejected'): ?>
                                <span class="badge badge-danger">
                                    <i class="fa fa-ban"></i>
                                </span>
                                <?php else: ?>
                                <span class="badge badge-warning">
                                    <i class="fa fa-minus-circle"></i>
                                </span>
                                <?php endif; ?>
                            </div>
                            <div class="media-content">
                                <h2 class="title is-5" style="font-size: 1.5rem;">
                                    <span id="camp-name"><?=$this->data->name?></span>
                                </h2>
                                <div class="buttons are-transparent">
                                    <button class="btn btn-default mb-1">
                                        <i class="fa fa-calendar"></i>
                                        <span><?=$this->data->abstract->start_date?> - <?=$this->data->abstract->end_date?></span>
                                    </button>
                                    <button class="btn btn-default mb-1">
                                        <i class="fa fa-usd"></i>
                                        <span><?=$this->helper->currencyFormat($this->data->cost)?> / <?=$this->helper->currencyFormat($this->data->abstract->budget)?></span>
                                    </button>
                                    <button class="btn btn-default mb-1">
                                        <i class="feather icon-briefcase"></i>
                                        <span>Pricing: <?=strtoupper($this->data->abstract->pricing_model)?></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <p><span style="margin-right:.5rem;font-style:italic;font-weight:300;font-size:14px;"><?=$this->data->created_at?></span> <span id="camp-desc"><?=$this->data->description?></span></p>
                        </div>
                        <div class="mt-4">
                            <div class="buttons are-transparent">
                                <a class="btn btn-success mb-1" href="/advertiser/ad/active?campaign_id=<?=$this->data->id?>">
                                    <i class="feather icon-airplay"></i>
                                    <span><?=$this->data->active_ad?> Active Ads</span>
                                </a>
                                <a class="btn btn-primary mb-1" href="/advertiser/ad?campaign_id=<?=$this->data->id?>">
                                    <i class="feather icon-airplay"></i>
                                    <span><?=$this->data->total_ad?> Total Ads</span>
                                </a>
                                <?php if(strpos($this->data->abstract->pricing_model, 'cpm') !== false): ?>
                                <button class="btn btn-danger mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span><?php if(strpos($this->data->abstract->pricing_model, 'cpc') !== false || strpos($this->data->abstract->pricing_model, 'cpa') !== false): ?>e<?php endif; ?>CPM
                                        <?php if($this->data->impression): ?><?=$this->helper->currencyFormat($this->data->cost*1000/$this->data->impression)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <?php endif; ?>
                                <?php if(strpos($this->data->abstract->pricing_model, 'cpc') !== false): ?>
                                <button class="btn btn-info mb-1">
                                    <i class="fa fa-mouse-pointer"></i>
                                    <span>CTR <?php if($this->data->cpc_impression): ?><?=round($this->data->click/$this->data->cpc_impression,4)*100?>%<?php else: ?>0.00%<?php endif; ?></span>
                                </button>
                                <button class="btn btn-info mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span>CPC <?php if($this->data->click): ?><?=$this->helper->currencyFormat($this->data->cost/$this->data->click)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <?php endif; ?>
                                <?php if(strpos($this->data->abstract->pricing_model, 'cpc') !== false): ?>
                                <button class="btn btn-success mb-1">
                                    <i class="feather icon-shopping-cart"></i>
                                    <span>CR <?php if($this->data->cpa_impression): ?><?=round($this->data->conversion/$this->data->cpa_impression,4)*100?>%<?php else: ?>0.00%<?php endif; ?></span>
                                </button>
                                <button class="btn btn-success mb-1">
                                    <i class="fa fa-usd"></i>
                                    <span>CPA <?php if($this->data->conversion): ?><?=$this->helper->currencyFormat($this->data->cost/$this->data->conversion)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <?php endif; ?>
                            </div>
                        </div>
                        <hr>
                        <div class="buttons are-transparent">
                            <button class="btn btn-primary mb-1">
                                <i class="feather icon-eye"></i>
                                <span><?=$this->helper->numberFormat($this->data->impression)?></span>
                            </button>
                            <button class="btn btn-success mb-1">
                                <i class="feather icon-users"></i>
                                <span><?=$this->helper->numberFormat($this->data->reach)?></span>
                            </button>
                            <button class="btn btn-warning mb-1">
                                <i class="fa fa-mouse-pointer"></i>
                                <span><?=$this->helper->numberFormat($this->data->click)?></span>
                            </button>
                            <button class="btn btn-danger mb-1">
                                <i class="feather icon-shopping-cart"></i>
                                <span><?=$this->helper->numberFormat($this->data->conversion)?></span>
                            </button>
                        </div>
                        <hr>
                        <div class="buttons are-transparent" style="margin-bottom: 60px">
                            <a class="btn btn-default pull-right" href="/user?id=<?=$this->data->user_id?>">
                                <i class="fa fa-user-circle"></i>
                                <span>#<?=$this->data->user_id?> - <?=$this->data->user_name?></span>
                            </a>
                        </div>
                        <div class="buttons text-center mt-4">
                            <button class="btn btn-primary mb-1" id="edit">
                                <i class="feather icon-edit"></i>
                                <span>Edit</span>
                            </button>
                            <?php if($this->data->status=='Active'): ?>
                            <button class="btnwaves-effect waves-light mb-1" id="pause">
                                <i class="feather icon-pause-circle"></i>
                                <span>Pause</span>
                            </button>
                            <?php endif; ?>
                            <?php if($this->data->status=='Paused'): ?>
                            <button class="btn btn-success mb-1" id="resume">
                                <i class="feather icon-play-circle"></i>
                                <span>Resume</span>
                            </button>
                            <?php endif; ?>
                            <?php if($this->data->status=='Active'||$this->data->status=='Paused'): ?>
                            <button class="btn btn-danger mb-1" id="stop">
                                <i class="feather icon-stop-circle"></i>
                                <span>Stop</span>
                            </button>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50" type="button" id="dropdown-ct" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected is-menu">Country</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-type" role="menu">
                            <a class="dropdown-item select-menu is-menu" data-type="Country">Country</a>
                            <a class="dropdown-item select-menu is-menu" data-type="Date">Date</a>
                        </div>
                    </div>

                    <div class="dropdown chart-dropdown">
                        <button class="btn border-0 dropdown-toggle px-50" type="button" id="dropdown-ct-1" data-toggle="dropdown" aria-haspopup="true" aria-controls="dropdown-type">
                            <span class="current-selected">Impression</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-ct-1" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);" id="dropdown-chart" role="menu">
                            <a class="dropdown-item select-chart" data-type="impression">Impression</a>
                            <a class="dropdown-item select-chart" data-type="click">Click</a>
                            <a class="dropdown-item select-chart" data-type="conversion">Conversion</a>
                            <a class="dropdown-item select-chart" data-type="cost">Cost</a>
                        </div>
                    </div>
                </div>

                <div class="card-content ">
                    <div class="card-body pb-0 pt-0 height-350">
                        <div id="chart-content"></div>
                    </div>

                </div>
                <div class="card-header d-flex align-items-end pb-0" style="justify-content: end; padding-top: 1rem">
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
                        <button class="btn border-0 dropdown-toggle px-50" type="button"
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
                                                <th>Cost</th>
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
<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-body">
                    <input class="hidden" id="id" type="hidden" value="">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" id="name" type="text" placeholder="Campaign Name" value="<?=$this->data->name?>">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="textarea form-control" id="description" placeholder="Some descriptions about this campaign"><?=$this->data->description?></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success enterAction" id="update" disabled>
                        <i class="feather icon-check"></i> Submit
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="actionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <section class="modal-body">
                    <p class="text-center text-danger title is-5">Do not close or leave this page</p>
                    <div id="ad_list"></div>
                </section>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-danger enterAction" id="btn-abort">
                        <i class="feather icon-x"></i> Abort
                    </button>
                    <button type="button" class="btn btn-secondary hidden"  id="btn-close" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close
                    </button>
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
        html += '<td>$'+(source_data[i].cost?Math.round(source_data[i].cost*1000)/1000:'0.000')+'</td>';
        html += '<td>$'+(source_data[i].impression?Math.round(source_data[i].cost*1000000/source_data[i].impression)/1000:'0.000')+'</td>';
        html += '<td>'+(source_data[i].cpc_impression?Math.round(source_data[i].click*100000/source_data[i].cpc_impression)/1000:'0.000')+'%</td>';
        html += '<td>'+(source_data[i].cpa_impression?Math.round(source_data[i].conversion*100000/source_data[i].cpa_impression)/1000:'0.000')+'%</td>';
        html += '</tr>';
    }
    
    $('#table-data').html(html);
}
google.charts.load('current', {'packages':['geochart','corechart'],'mapsApiKey': 'AIzaSyDRDJMzEc-lrhfpOgehmn8Duta9Y8Blius'});
google.charts.setOnLoadCallback(function () {
    drawChart();
});

var id = '<?=$this->data->id?>';
var is_aborted = false, success = 0;
function processAdAction(action) {
    $('.focus-line').removeClass('is-current');
    if(!$('.action-ads').length) {
        $('#btn-close').removeClass('is-hidden');
        $('#btn-abort').addClass('is-hidden');
        if(success) window.location.reload();
        return false;
    }
    if(is_aborted) {
        window.location.reload();
        return false;
    }
    var $this = $('.action-ads').first(), id = $this.attr('id');
    $this.removeClass('action-ads').addClass('is-loading').closest('li').find('.focus-line').addClass('is-current');
    $.post('/advertiser/ad/'+action+'/'+id, {csrf_token: __tajs.csrf}, function(res){
        if(!res.success) {
            $this.removeClass('is-loading is-warning').addClass('is-danger').html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M13 14H11V9H13M13 18H11V16H13M1 21H23L12 2L1 21Z" /></svg></span>');
        } else {
            $this.removeClass('is-loading is-warning').addClass('is-success').html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg></span>');
            success = success + 1;
        }
        processAdAction(action);
    });
}
$(document).ready(function() {
    genTable();
    $('#name, #description').on('input', function() {
        $('#update').prop('disabled', false);
    });
    $('#edit').on('click', function(){
        $('#editModal').modal('show');
    });
    $('#update').on('click', function() {
        var $this = $(this), data = {};
        data.id = id;
        data.name = $.trim($('#name').val());
        data.description = $.trim($('#description').val());
        if(data.name.length < 3) {
            __tajs.showAlert('Campaign name is required');
            return false;
        }
        if(data.description.length < 10) {
            __tajs.showAlert('Campaign description is required min 10 characters');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/advertiser/campaign', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
                return false;
            }
            $('#camp-desc').html(data.description);
            $('#camp-name').html(data.name);
            document.title = data.name + ' - <?=SITE_NAME?>';
            $('#editModal').modal('hide');
        });
    });
    $('#pause').on('click', function(){
        __tajs.showConfirm('Pause campaign may breaks the optimization, still want to do that?', function(yes) {
            if (yes) {
                $('#ad_list').html('<p class="text-center text-muted">loading, please wait...</p>');
                $('#btn-close').addClass('is-hidden');
                $('#btn-abort').removeClass('is-hidden');
                $('#btn-abort').prop('disabled', false);
                $('#actionModal').modal('show');
                is_aborted = false;
                success = 0;
                $.post('/advertiser/ads', {csrf_token: __tajs.csrf, campaign_id: id, status: ['Active']}, function(res) {
                    if (!res.success) {
                        $('#actionModal').modal('show');
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    if(!res.data.length) {
                        $('#actionModal').modal('show');
                        __tajs.showAlert('Could not find suitable ads for pausing from this campaign!!!');
                        return false;
                    }
                    var html = '<ul>';
                    $.each(res.data, function(k,v){
                        html += '<li class="mb-1">';
                        html += '<div class="buttons are-transparent">';
                        html += '<button class="button is-light is-warning action-ads" id="'+v.id+'">';
                        html += '<span class="icon"><svg viewBox="0 0 24 24">';
                        html += '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" /></svg></span>';
                        html += '</button>';
                        html += '<button class="button is-light is-info" style="width:170px">'+v.ad_format+'</button>';
                        html += '<button class="button is-light is-success">'+v.id+' - '+v.name+'</button>';
                        html += '</div>';
                        html += '<hr class="focus-line">';
                        html += '</li>';
                    });
                    html += '</ul>';
                    $('#ad_list').html(html);
                    processAdAction('pause');
                });
            }
        });
    });
    $('#stop').on('click', function(){
        __tajs.showConfirm('Are you sure? stopped campaign can not undo!', function(yes) {
            if (yes) {
                $('#ad_list').html('<p class="text-center text-muted">loading, please wait...</p>');
                $('#btn-close').addClass('is-hidden');
                $('#btn-abort').removeClass('is-hidden');
                $('#btn-abort').prop('disabled', false);
                $('#actionModal').modal('show');
                is_aborted = false;
                success = 0;
                $.post('/advertiser/ads', {csrf_token: __tajs.csrf, campaign_id: id, status: ['Active', 'Paused']}, function(res) {
                    if (!res.success) {
                        $('#actionModal').modal('show');
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    if(!res.data.length) {
                        $('#actionModal').modal('show');
                        __tajs.showAlert('Could not find suitable ads for stopping from this campaign!!!');
                        return false;
                    }
                    var html = '<ul>';
                    $.each(res.data, function(k,v){
                        html += '<li class="mb-1">';
                        html += '<div class="buttons are-transparent">';
                        html += '<button class="button is-light is-warning action-ads" id="'+v.id+'">';
                        html += '<span class="icon"><svg viewBox="0 0 24 24">';
                        html += '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" /></svg></span>';
                        html += '</button>';
                        html += '<button class="button is-light is-info" style="width:170px">'+v.ad_format+'</button>';
                        html += '<button class="button is-light is-success">'+v.id+' - '+v.name+'</button>';
                        html += '</div>';
                        html += '<hr class="focus-line">';
                        html += '</li>';
                    });
                    html += '</ul>';
                    $('#ad_list').html(html);
                    processAdAction('stop');
                });
            }
        });
    });
    $('#resume').on('click', function(){
        $('#ad_list').html('<p class="text-center text-muted">loading, please wait...</p>');
        $('#btn-close').addClass('is-hidden');
        $('#btn-abort').removeClass('is-hidden');
        $('#btn-abort').prop('disabled', false);
        $('#actionModal').modal('show');
        is_aborted = false;
        success = 0;
        $.post('/advertiser/ads', {csrf_token: __tajs.csrf, campaign_id: id, status: ['Paused']}, function(res) {
            if (!res.success) {
                $('#actionModal').modal('show');
                __tajs.showAlert(res.data);
                return false;
            }
            if(!res.data.length) {
                $('#actionModal').modal('show');
                __tajs.showAlert('Could not find suitable ads for resuming from this campaign!!!');
                return false;
            }
            var html = '<ul>';
            $.each(res.data, function(k,v){
                html += '<li class="mb-1">';
                html += '<div class="buttons are-transparent">';
                html += '<button class="button is-light is-warning action-ads" id="'+v.id+'">';
                html += '<span class="icon"><svg viewBox="0 0 24 24">';
                html += '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" /></svg></span>';
                html += '</button>';
                html += '<button class="button is-light is-info" style="width:170px">'+v.ad_format+'</button>';
                html += '<button class="button is-light is-success">'+v.id+' - '+v.name+'</button>';
                html += '</div>';
                html += '<hr class="focus-line">';
                html += '</li>';
            });
            html += '</ul>';
            $('#ad_list').html(html);
            processAdAction('resume');
        });
    });
    $('#btn-abort').on('click', function(e) {
        var $this = $(this);
        $this.html('Aborting...');
        $this.prop('disabled', true);
        is_aborted = true;
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