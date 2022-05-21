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
    padding: 8px 17px 8px 17px;
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
    background-color: rgba(128, 128, 128, 0.6) !important;
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
                <a class="btn btn-success mb-1" href="/report?start_date=<?=$this->data->today?>&end_date=<?=$this->data->today?>&campaign_id=<?=$this->data->campaign_id?>&ad_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Today Stats</span>
                </a>
                <a class="btn btn-primary mb-1" href="/report?start_date=<?=$this->data->last7days?>&end_date=<?=$this->data->today?>&campaign_id=<?=$this->data->campaign_id?>&ad_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 7days Stats</span>
                </a>
                <a class="btn btn-info mb-1" href="/report?start_date=<?=$this->data->last30days?>&end_date=<?=$this->data->today?>&campaign_id=<?=$this->data->campaign_id?>&ad_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
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
                                <div class="buttons are-transparent" style="margin-top: 5px">
                                    <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                        <i class="fa fa-calendar"></i>
                                        <span><?=$this->data->start_date?> - <?=$this->data->end_date?></span>
                                    </button>
                                    <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                        <i class="fa fa-usd"></i>
                                        <span><?=$this->helper->currencyFormat($this->data->cost)?> / <?=$this->helper->currencyFormat($this->data->budget)?></span>
                                    </button>
                                    <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                        <i class="feather icon-briefcase"></i>
                                        <span>Pricing: <?=strtoupper($this->data->pricing_model)?></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="buttons are-transparent">
                                <a class="btn btn-primary waves-effect waves-light mb-1" href="/campaign/detail/<?=$this->data->campaign_id?>">
                                    <i class="fa fa-bullhorn"></i>
                                    <span>Campaign #<?=$this->data->campaign_id?></span>
                                </a>
                                <button class="btn btn-light waves-effect waves-light mb-1">
                                    <i class="fa fa-file-o"></i>
                                    <span><?=$this->data->format_name?></span>
                                </button>
                                <?php if($this->data->pricing_model == 'cpm'): ?>
                                <button class="btn btn-danger waves-effect waves-light mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span>CPM <?php if($this->data->impression): ?><?=$this->helper->currencyFormat($this->data->cost*1000/$this->data->impression)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <?php elseif($this->data->pricing_model == 'cpc'): ?>
                                <button class="btn btn-danger waves-effect waves-light mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span>eCPM <?php if($this->data->impression): ?><?=$this->helper->currencyFormat($this->data->cost*1000/$this->data->impression)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <button class="btn btn-info waves-effect waves-light mb-1">
                                    <i class="fa fa-mouse-pointer"></i>
                                    <span>CTR <?php if($this->data->impression): ?><?=round($this->data->click/$this->data->impression,4)*100?>%<?php else: ?>0.00%<?php endif; ?></span>
                                </button>
                                <button class="btn btn-info waves-effect waves-light mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span>CPC <?php if($this->data->click): ?><?=$this->helper->currencyFormat($this->data->cost/$this->data->click)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <?php else: ?>
                                <button class="btn btn-danger waves-effect waves-light mb-1">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M12,13A5,5 0 0,1 7,8H9A3,3 0 0,0 12,11A3,3 0 0,0 15,8H17A5,5 0 0,1 12,13M12,3A3,3 0 0,1 15,6H9A3,3 0 0,1 12,3M19,6H17A5,5 0 0,0 12,1A5,5 0 0,0 7,6H5C3.89,6 3,6.89 3,8V20A2,2 0 0,0 5,22H19A2,2 0 0,0 21,20V8C21,6.89 20.1,6 19,6Z"></path>
                                        </svg>
                                    </span>
                                    <span>eCPM <?php if($this->data->impression): ?><?=$this->helper->currencyFormat($this->data->cost*1000/$this->data->impression)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <button class="btn btn-success waves-effect waves-light mb-1">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M17,18A2,2 0 0,1 19,20A2,2 0 0,1 17,22C15.89,22 15,21.1 15,20C15,18.89 15.89,18 17,18M1,2H4.27L5.21,4H20A1,1 0 0,1 21,5C21,5.17 20.95,5.34 20.88,5.5L17.3,11.97C16.96,12.58 16.3,13 15.55,13H8.1L7.2,14.63L7.17,14.75A0.25,0.25 0 0,0 7.42,15H19V17H7C5.89,17 5,16.1 5,15C5,14.65 5.09,14.32 5.24,14.04L6.6,11.59L3,4H1V2M7,18A2,2 0 0,1 9,20A2,2 0 0,1 7,22C5.89,22 5,21.1 5,20C5,18.89 5.89,18 7,18M16,11L18.78,6H6.14L8.5,11H16Z"></path>
                                        </svg>
                                    </span>
                                    <span>CR <?php if($this->data->impression): ?><?=round($this->data->conversion/$this->data->impression,4)*100?>%<?php else: ?>0.00%<?php endif; ?></span>
                                </button>
                                <button class="btn btn-success waves-effect waves-light mb-1">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,18H4V6H20M20,4H4C2.89,4 2,4.89 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6C22,4.89 21.1,4 20,4M11,17H13V16H14A1,1 0 0,0 15,15V12A1,1 0 0,0 14,11H11V10H15V8H13V7H11V8H10A1,1 0 0,0 9,9V12A1,1 0 0,0 10,13H13V14H9V16H11V17Z"></path>
                                        </svg>
                                    </span>
                                    <span>CPA <?php if($this->data->conversion): ?><?=$this->helper->currencyFormat($this->data->cost/$this->data->conversion)?><?php else: ?><?=$this->helper->currencyFormat($this->data->cost)?><?php endif; ?></span>
                                </button>
                                <?php endif; ?>
                            </div>
                        </div>
                        <hr>
                        <div class="buttons are-transparent">
                            <button class="btn btn-primary waves-effect waves-light mb-1">
                                <i class="feather icon-eye"></i>
                                <span><?=$this->helper->numberFormat($this->data->impression)?></span>
                            </button>
                            <button class="btn btn-success waves-effect waves-light mb-1">
                                <i class="feather icon-users"></i>
                                <span><?=$this->helper->numberFormat($this->data->reach)?></span>
                            </button>
                            <button class="btn btn-warning waves-effect waves-light mb-1">
                                <i class="fa fa-mouse-pointer"></i>
                                <span><?=$this->helper->numberFormat($this->data->click)?></span>
                            </button>
                            <button class="btn btn-danger waves-effect waves-light mb-1">
                                <i class="feather icon-shopping-cart"></i>
                                <span><?=$this->helper->numberFormat($this->data->conversion)?></span>
                            </button>
                        </div>
                        <hr>
                        <div class="buttons are-transparent">
                            <?php if($this->data->data->budget_daily || $this->data->data->budget_capping): ?>
                            <button class="btn btn-warning waves-effect waves-light mb-1">
                                <i class="fa fa-usd"></i>
                                <span>
                                    <?php $text = ''; ?>
                                    <?php if($this->data->data->budget_capping): ?>
                                    <?php $e = explode(':', $this->data->data->budget_capping); $text .= $this->helper->currencyFormat($e[0]).' per '.$e[1]; ?>
                                    <?php endif; ?>
                                    <?php if($this->data->data->budget_daily): ?>
                                    <?php $text .= ', '.$this->helper->currencyFormat($this->data->data->budget_daily).' per day'; ?>
                                    <?php endif; ?>
                                    <?='Cap: '.trim($text, ', ')?>
                                </span>
                            </button>
                            <?php endif; ?>
                            <?php if($this->data->data->goal_total || $this->data->data->goal_daily || $this->data->data->goal_capping): ?>
                            <button class="btn btn-warning waves-effect waves-light mb-1">
                                <?php if($this->data->pricing_model=='cpc'): ?>
                                <i class="fa fa-mouse-pointer"></i>
                                <?php else: ?>
                                <i class="feather icon-eye"></i>
                                <?php endif; ?>

                                <span>
                                    <?php $text = '' ?>
                                    <?php if($this->data->data->goal_capping): ?>
                                    <?php $e = explode(':', $this->data->data->goal_capping); $text .= $this->helper->numberFormat($e[0]).' per '.$e[1]; ?>
                                    <?php endif; ?>
                                    <?php if($this->data->data->goal_daily): ?>
                                    <?php $text .= ', '.$this->helper->numberFormat($this->data->data->goal_daily).' per day'; ?>
                                    <?php endif; ?>
                                    <?php if($this->data->data->goal_total): ?>
                                    <?php $text .= ', '.$this->helper->numberFormat($this->data->data->goal_total).' total'; ?>
                                    <?php endif; ?>
                                    <?='Cap: '.trim($text, ', ')?>
                                </span>
                            </button>
                            <?php endif; ?>
                        </div>
                        <div class="buttons text-center mt-4">
                            <button class="btn btn-success waves-effect waves-light mb-1" id="btn-edit">
                                <i class="feather icon-edit"></i>
                                <span>Rename</span>
                            </button>
                            <?php if($this->data->status=='Active'): ?>
                            <button class="btn btn-light waves-effect waves-light mb-1" id="btn-pause">
                                <i class="feather icon-pause-circle"></i>
                                <span>Pause</span>
                            </button>
                            <?php endif; ?>
                            <?php if($this->data->status=='Paused'): ?>
                            <button class="btn btn-success waves-effect waves-light mb-1" id="btn-resume">
                                <i class="feather icon-play-circle"></i>
                                <span>Resume</span>
                            </button>
                            <?php endif; ?>
                            <?php if($this->data->status=='Active'||$this->data->status=='Paused'): ?>
                            <button class="btn btn-danger waves-effect waves-light mb-1" id="btn-stop">
                                <i class="feather icon-stop-circle"></i>
                                <span>Stop</span>
                            </button>
                            <?php endif; ?>
                            <?php if($this->data->status=='Active'||$this->data->status=='Paused'||$this->data->status=='Pending'): ?>
                            <a class="btn btn-primary waves-effect waves-light mb-1" href="/ad/setup/<?=$this->data->id?>">
                                <i class="fa fa-cogs"></i>
                                <span>reSetup</span>
                            </a>
                            <?php endif; ?>
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
                            <a class="dropdown-item select-chart" data-type="cost">Cost</a>
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

<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Rename</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" id="name" type="text" placeholder="Ad Name" value="<?=$this->data->name?>">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="update" disabled>Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
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
        html += '<td>'+(source_data[i].impression?Math.round(source_data[i].click*100000/source_data[i].impression)/1000:'0.000')+'%</td>';
        html += '<td>'+(source_data[i].impression?Math.round(source_data[i].conversion*100000/source_data[i].impression)/1000:'0.000')+'%</td>';
        html += '</tr>';
    }
    
    $('#table-data').html(html);
}
google.charts.load('current', {'packages':['geochart','corechart'],'mapsApiKey': 'AIzaSyDRDJMzEc-lrhfpOgehmn8Duta9Y8Blius'});
google.charts.setOnLoadCallback(function () {
    drawChart();
});

var id = '<?=$this->data->id?>';
$(document).ready(function() {
    genTable();
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
    $('#btn-edit').on('click', function(){
        $('#name').val('<?=$this->data->name?>');
        $('#editModal').modal('show');
        $('#update').prop('disabled', false);
    });
    $('#update').on('click', function() {
        var $this = $(this), name = $.trim($('#name').val());
        if(name.length < 3) {
            __tajs.showAlert('Ad name is required');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/ad/rename/'+id, {csrf_token: __tajs.csrf, name: name}, function(res) {
            if (!res.success) {
                __tajs.showAlert(res.data);
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                return false;
            }
            window.location.reload();
        });
    });
    $('#btn-pause').on('click', function(){
        var $this = $(this);
        __tajs.showConfirm('Pause Ad may break the optimization, still want to do that?', function(yes) {
            if (yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/ad/pause/'+id, {csrf_token: __tajs.csrf}, function(res) {
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                        $this.prop('disabled', false);
                        $this.removeClass('is-loading');
                        return false;
                    }
                    window.location.reload();
                });
            }
        });
    });
    $('#btn-stop').on('click', function(){
        var $this = $(this);
        __tajs.showConfirm('Are you sure? this action could not undo', function(yes) {
            if (yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/ad/stop/'+id, {csrf_token: __tajs.csrf}, function(res) {
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                        $this.prop('disabled', false);
                        $this.removeClass('is-loading');
                        return false;
                    }
                    window.location.reload();
                });
            }
        });
    });
    $('#btn-resume').on('click', function(){
        var $this = $(this);
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/ad/resume/'+id, {csrf_token: __tajs.csrf}, function(res) {
            if (!res.success) {
                __tajs.showAlert(res.data);
                $this.prop('disabled', false);
                $this.removeClass('is-loading');
                return false;
            }
            window.location.reload();
        });
    });
    $('#btn-reject').on('click', function(){
        var $this = $(this);
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/ad/reject/'+id, {csrf_token: __tajs.csrf}, function(res) {
            if (!res.success) {
                __tajs.showAlert(res.data);
                $this.prop('disabled', false);
                $this.removeClass('is-loading');
                return false;
            }
            window.location.reload();
        });
    });
});
</script>