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
                <a class="btn btn-success mb-1" href="/publisher/report?start_date=<?=$this->data->today?>&end_date=<?=$this->data->today?>&user_id=<?=$this->data->user_id?>&website_id=<?=$this->data->website_id?>&zone_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Today Stats</span>
                </a>
                <a class="btn btn-primary mb-1" href="/publisher/report?start_date=<?=$this->data->last7days?>&end_date=<?=$this->data->today?>&user_id=<?=$this->data->user_id?>&website_id=<?=$this->data->website_id?>&zone_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 7days Stats</span>
                </a>
                <a class="btn btn-info mb-1" href="/publisher/report?start_date=<?=$this->data->last30days?>&end_date=<?=$this->data->today?>&user_id=<?=$this->data->user_id?>&website_id=<?=$this->data->website_id?>&zone_id=<?=$this->data->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                    <i class="feather icon-bar-chart-2"></i>
                    <span>Last 30days Stats</span>
                </a>
            </div>
            <?php else: ?>
            <div class="alert alert-danger">
                <p>This zone is rejected, all informations are for convenience only!</p>
            </div>
            <?php endif; ?>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p>Zone Tag</p>
                        <div class="form-group">
                            <textarea class="textarea form-control" id="ad_script" rows="5" placeholder="Ad Tag" readonly><?=$this->data->adFormat->tag_script?></textarea>
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
                            <li>Website: <a class="mr-1" href="/publisher/website/detail?id<?=$this->data->website_id?>"><?=$this->data->domain?></a>
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
                        <div class="text-center pt-2">
                            <button class="btn btn-info mb-1" id="btn-edit">
                                <i class="feather icon-edit"></i>
                                <span>Edit</span>
                            </button>
                            <?php if($this->data->status == 'Active'): ?>
                            <button class="btn btn-success mb-1" id="btn-deal">
                                <i class="fa fa-handshake-o"></i>
                                <span class="dlb">Deal<?php if($this->data->deal): ?>ed<?php endif; ?></span>
                            </button>
                            <a class="btn btn-secondary mb-1" href="/publisher/zone/setup?id=<?=$this->data->id?>">
                                <i class="fa fa-cogs"></i>
                                <span>Setup</span>
                            </a>
                            <button class="btn btn-warning mb-1 btn-purge">
                                <i class="feather icon-trash-2"></i>
                                <span>Purge</span>
                            </button>
                            <?php endif; ?>
                            <?php if($this->data->status != 'Rejected'): ?>
                            <button class="btn btn-danger mb-1 btn-reject">
                                <i class="feather icon-slash"></i>
                                <span>Reject</span>
                            </button>
                            <?php endif; ?>
                            <a class="btn btn-primary mb-1" href="/publisher/referrer?zone_id=<?=$this->data->id?>">
                                <i class="feather icon-users"></i>
                                <span>Referrers</span>
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
                <div class="d-flex align-items-end justify-content-end" style="padding: 1.5rem 1.5rem 0;">
                    <p class="help text-muted">Based on last 30 days data</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <div class="d-flex">
                        <h4 class="card-title">Tabular Data <small id="sort_table">(sort)</small></h4>
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
                                                <th>ICR</th>
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

<div class="modal fade text-left" id="sortModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header justify-content-center">
                    <h4 class="card-title mb-0">
                        Sort By
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="buttons text-center pt-1">
                        <button class="btn btn-light mb-1 btn-sort" data-sort="0" data-direction="desc">
                            <i class="feather icon-arrow-up"></i>
                            <span>Country/Date</span>
                        </button>
                        <button class="btn btn-info mb-1 btn-sort" data-sort="1" data-direction="desc">
                            <i class="feather icon-arrow-up"></i>
                            <span>Impression</span>
                        </button>
                        <button class="btn btn-success mb-1 btn-sort" data-sort="2" data-direction="desc">
                            <i class="feather icon-arrow-up"></i>
                            <span>Click</span>
                        </button>
                        <button class="btn btn-primary mb-1 btn-sort" data-sort="3" data-direction="desc">
                            <i class="feather icon-arrow-up"></i>
                            <span>Conversion</span>
                        </button>
                        <button class="btn btn-warning mb-1 btn-sort" data-sort="6" data-direction="desc">
                            <i class="feather icon-arrow-up"></i>
                            <span>eCPM</span>
                        </button>
                        <button class="btn btn-danger mb-1 btn-sort" data-sort="5" data-direction="desc">
                            <i class="feather icon-arrow-up"></i>
                            <span>Revenue</span>
                        </button>
                        <button class="btn btn-light mb-1 btn-sort" data-sort="0" data-direction="asc">
                            <i class="feather icon-arrow-down"></i>
                            <span>Country/Date</span>
                        </button>
                        <button class="btn btn-info mb-1 btn-sort" data-sort="1" data-direction="asc">
                            <i class="feather icon-arrow-down"></i>
                            <span>Impression</span>
                        </button>
                        <button class="btn btn-success mb-1 btn-sort" data-sort="2" data-direction="asc">
                            <i class="feather icon-arrow-down"></i>
                            <span>Click</span>
                        </button>
                        <button class="btn btn-primary mb-1 btn-sort" data-sort="3" data-direction="asc">
                            <i class="feather icon-arrow-down"></i>
                            <span>Conversion</span>
                        </button>
                        <button class="btn btn-warning mb-1 btn-sort" data-sort="6" data-direction="asc">
                            <i class="feather icon-arrow-down"></i>
                            <span>eCPM</span>
                        </button>
                        <button class="btn btn-danger mb-1 btn-sort" data-sort="5" data-direction="asc">
                            <i class="feather icon-arrow-down"></i>
                            <span>Revenue</span>
                        </button>
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
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" type="text" id="name" placeholder="Zone Name" value="<?=$this->data->name?>">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="textarea form-control" id="description" placeholder="Zone Description"><?=$this->data->description?></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="save_zone">
                        <i class="feather icon-check"></i> Save
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade text-left" id="dealModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <section class="modal-body">
                    <input class="hidden" id="deal_id" type="hidden" value="<?=$this->data->deal->id??''?>">
                    <input class="hidden" id="deal_user_id" type="hidden" value="<?=$this->data->user_id?>">
                    <input class="hidden" id="deal_zone_id" type="hidden" value="<?=$this->data->id?>">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" id="deal_name" type="text" placeholder="Deal Name" value="<?=$this->data->deal->name??$this->data->name.' deal'?>">
                    </div>
                    <div class="form-group">
                        <label class="label">Deal Type</label>
                        <select id="deal_type" class="form-control">
                            <?php foreach($this->data->types AS $type => $text): ?>
                            <option value="<?=$type?>"<?php if(isset($this->data->deal->type) && $this->data->deal->type == $type): ?> selected<?php endif; ?>><?=$text?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label" id="amount_label">Amount</label>
                        <input class="input form-control" id="deal_amount" type="number" placeholder="Amount/eCPM" value="<?=$this->data->deal->amount??''?>">
                    </div>
                    <div class="form-group">
                        <label class="label">Status</label>
                        <select id="deal_status" class="form-control">
                            <option value="Active"<?php if(isset($this->data->deal->status) && $this->data->deal->status == 'Active'): ?> selected<?php endif; ?>>Active</option>
                            <option value="Archived"<?php if(isset($this->data->deal->status) && $this->data->deal->status == 'Archived'): ?> selected<?php endif; ?>>Archived</option>
                        </select>
                    </div>
                </section>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="save-deal">
                        <i class="feather icon-check"></i> Submit
                    </button>
                    <?php if($this->data->deal): ?>
                    <button class="btn btn-danger" id="remove-deal">
                        <i class="feather icon-trash-2"></i>
                        <span>Remove</span>
                    </button>
                    <?php endif; ?>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close
                    </button>
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
            html += '<td>$'+(Math.round(source_data[i].revenue*100000)/100000)+'</td>';
            html += '<td>$'+(source_data[i].revenue?Math.round(source_data[i].revenue*1000000/source_data[i].impression)/1000:'0.000')+'</td>';
            html += '<td>'+(source_data[i].click?Math.round(source_data[i].click*100000/source_data[i].impression)/1000:'0.000')+'%</td>';
            html += '<td>'+(source_data[i].conversion?Math.round(source_data[i].conversion*100000/source_data[i].impression)/1000:'0.000')+'%</td>';
            html += '</tr>';
        }

        $('#table-data').html(html);
    }
    function sortTable(id, dr) {
        let table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("table-data");
        switching = true;

        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 0; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[id].innerHTML.toLowerCase();
                y = rows[i + 1].getElementsByTagName("TD")[id].innerHTML.toLowerCase();

                if(id > 0) {
                    x = parseFloat(x.replace('$', '').replace('%', ''));
                    y = parseFloat(y.replace('$', '').replace('%', ''));
                }

                if (dr == "asc" && x > y || dr == "desc" && x < y) {
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }
    google.charts.load('current', {'packages':['geochart','corechart'],'mapsApiKey': 'AIzaSyDRDJMzEc-lrhfpOgehmn8Duta9Y8Blius'});
    google.charts.setOnLoadCallback(function () {
        drawChart();
    });
    $(document).ready(function() {
        genTable();
        $('#btn-edit').on('click', function(){
            $('#editModal').modal('show');
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
        $('.btn-reject').click(function() {
            var $this = $(this), id = <?=$this->data->id?>;
            __tajs.showConfirm('Are you sure want to reject this zone?', function(yes){
                if(!yes) return false;
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/publisher/zone/reject', {csrf_token: __tajs.csrf, id: id}, function(res) {
                    if (!res.success) {
                        $this.removeClass('is-loading');
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                    }
                    else {
                        window.location.replace(res.data);
                    }
                });
            });
        });
        $('.btn-purge').click(function() {
            var $this = $(this), id = <?=$this->data->id?>;
            __tajs.showConfirm('Are you sure want to purge cache this zone?', function(yes){
                if(!yes) return false;
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/publisher/zone/purge', {csrf_token: __tajs.csrf, id: id}, function(res) {
                    if (!res.success) {
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                    }
                    else {
                        $this.removeClass('is-loading');
                        $this.html('Purged!');
                        setTimeout(function(){$this.remove()},1500);
                    }
                });
            }, 'warning');
        });
        $('#deal_type').on('change', function(){
            const v = $(this).val();
            if(v == 'ecpm') {
                $('#amount_label').html('eCPM');
            } else {
                $('#amount_label').html('amount');
            }
        });
        $('#btn-deal').click(function() {
            $('#dealModal').modal('show');
        });
        $('#save-deal').click(function() {
            const $this = $(this), data = {};
            data.id = parseInt($('#deal_id').val(),10);
            data.name = $.trim($('#deal_name').val());
            data.type = $('#deal_type').val();
            data.status = $('#deal_status').val();
            data.user_id = parseInt($('#deal_user_id').val(),10);
            data.zone_id = parseInt($('#deal_zone_id').val(),10);
            data.amount = parseFloat($('#deal_amount').val());

            if(!data.name) {
                __tajs.showAlert('Deal Name is required');
                return false;
            }
            if(!data.amount) {
                __tajs.showAlert('Deal amount is required');
                return false;
            }

            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/publisher/deal/update', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
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
        $('#remove-deal').click(function() {
            const $this = $(this), id = parseInt($('#deal_id').val(),10);
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/publisher/deal/remove', {csrf_token: __tajs.csrf, id: id}, function(res) {
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
        $('#sort_table').on('click', function(){
            $('#sortModal').modal('show');
        });
        $('.btn-sort').on('click', function() {
            const $this = $(this);
            sortTable(parseInt($this.attr('data-sort'),10), $this.attr('data-direction'));
            $('#sortModal').modal('hide');
        });
    });
</script>
