<style>
    .edge {
        cursor: pointer;
    }

    .system-status {
        border-radius: 20px;
        border-color: transparent;
        background-color: #586e75;
        height: 20px;
        width: 20px;
        transition: background-color .5s linear;
        font-weight: bold;
        color: white !important;
    }

    .system-status.Inactive {
        background-color: #ffdd57;
    }

    .system-status.Down {
        background-color: #e88f9d;
    }

    .system-status.Active {
        background-color: #48c774;
    }

    .system-item {
        margin-left: 20px;
    }

    .system-title {
        display: flex;
        font-size: 1rem;
        font-weight: 600;
        line-height: 1.6;
        color: #364a63;
        padding-left: 1rem;
        flex-direction: column;
        justify-content: space-between;
    }

    .system-title span {
        padding-right: 1rem;
    }

    .system-meta {
        width: 100%;
        line-height: 1.2;
        color: #8094ae;
        font-size: 14px;
    }

    .meta-status .progress-1 {
        width: 100%;
        margin-bottom: 0.3rem !important;
    }

    .level-item {
        min-width: 25%;
    }

    .edge_ram_text, .edge_cpu_text, .edge_disk_text, .edge_net_text, .edge_bw_text {
        display: flex;
        align-items: center;
        height: 24px;
        margin-top: -4px;
    }

    @media screen and (max-width: 1410px) {
        .level-item {
            min-width: 22%;
        }
    }

    @media screen and (max-width: 1220px) {
        .level-item {
            min-width: 15%;
        }
    }

    @media screen and (max-width: 870px) {
        .level-item {
            min-width: 14%;
        }
    }

    .edge {
        cursor: pointer;
    }
    .level {
        display: flex;
    }

    .level {
        align-items: center;
        justify-content: space-between;
    }
    .level-left {
        /*display: flex;*/
    }
    .level-left {
        align-items: center;
        justify-content: flex-start;
    }
    .level-left, .level-right {
        flex-basis: auto;
        flex-grow: 0;
        flex-shrink: 0;
    }
    .level-item {
        min-width: 25%;
    }
    .level-item {
        align-items: center;
        display: flex;
        flex-basis: auto;
        flex-grow: 0;
        flex-shrink: 0;
        justify-content: center;
    }
    .system-status.Active {
        background-color: #48c774;
    }
    .tag:not(body) {
        align-items: center;
        background-color: #f5f5f5;
        border-radius: 4px;
        color: #4a4a4a;
        display: inline-flex;
        font-size: .75rem;
        height: 2em;
        justify-content: center;
        line-height: 1.5;
        padding-left: 0.75em;
        padding-right: 0.75em;
        white-space: nowrap;
    }
    .system-status {
        border-radius: 20px;
        border-color: transparent;
        background-color: #586e75;
        height: 20px;
        width: 20px;
        transition: background-color .5s linear;
        font-weight: bold;
        color: white !important;
    }
    .system-title {
        display: flex;
        font-size: 1rem;
        font-weight: 600;
        line-height: 1.6;
        color: #364a63;
        padding-left: 1rem;
        flex-direction: column;
        justify-content: space-between;
    }
    .system-title span {
        padding-right: 1rem;
    }
    .level-right {
        /*display: flex;*/
    }
    .level-right {
        align-items: center;
        justify-content: flex-end;
    }
    .level-item {
        min-width: 25%;
    }
    .level-item {
        align-items: center;
        display: flex;
        flex-basis: auto;
        flex-grow: 0;
        flex-shrink: 0;
        justify-content: center;
    }
    .system-meta {
        width: 100%;
        line-height: 1.2;
        color: #8094ae;
        font-size: 14px;
    }
    .meta-status .progress-1 {
        width: 100%;
        margin-bottom: 0.3rem !important;
    }

    .progress-1.is-small {
        height: 1.5rem;
    }
    .progress-1 {
        /*-moz-appearance: none;*/
        /*-webkit-appearance: none;*/
        /*border: none;*/
        /*border-radius: 290486px;*/
        display: block;
        height: 1rem;
        overflow: hidden;
        padding: 0;
        width: 100%;
    }
    .edge_ram_text{
        display: flex;
        align-items: center;
        height: 24px;
        margin-top: -4px;
    }
    .level-left .level-item:not(:last-child), .level-right .level-item:not(:last-child) {
        margin-right: 0.75rem;
    }

    @media screen and (min-width: 769px), print{
        .level {
            display: flex;
        }
    }

    @media screen and (min-width: 769px), print{
        .level-left {
            /*display: flex;*/
        }
    }


    .collapse:not(.show) {
        display: inline;
    }

</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Edge</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                            <a class="dropdown-item"
                               href="/edge/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
                            <?php endforeach; ?>

                        </div>
                    </div>
                </div>


                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="ag-grid-btns d-flex justify-content-between flex-wrap mb-1">
                                    <div class="ag-btns d-flex flex-wrap">
                                        <fieldset>
                                            <div class="input-group">
                                                <input id="search" type="text" class="form-control"
                                                       placeholder="Name or IP" aria-label="filter"
                                                       value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light"
                                                            type="button" id="enterAction"><i
                                                                class="feather icon-search"></i> Search
                                                    </button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-title-box mb-2">
                <div class="row">
                    <div class="col-6">
                        <h3 class="title is-6">Live Graph</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                            <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="live_graph">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                    </svg>
                                </span>
                                <span>Collapse</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="live_graph">
                <div class="col-12">
                    <div class="card flatbox">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="page-title-box">
                <div class="row">
                    <div class="col-6">
                        <h3 class="title is-6">Results</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons pull-right mb-1" style="margin-top: -0.5rem;">
                            <button class="btn btn-success btn-light btn-transparent" id="btn-add">
                                <i class="feather icon-plus"></i>
                                <span>Add Edge</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row is-multiline">
                <div class="col-lg-12 col-md-12 col-12">
                    <?php if($this->data->data): ?>
                    <?php foreach($this->data->data as $item): ?>
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="flatbox">
                                    <div class="level edge" data-id="<?=$item->id?>" style="flex-wrap: wrap">
                                        <div class="level-left col-lg-3 col-md-12 col-12">
                                            <div class="level-item">
                                                <div class="tag system-status <?=$item->status?>"></div>
                                                <div class="system-title">
                                                    <span class="item-name"><?=$item->name?></span>
                                                    <span class="item-ip"><?=$item->ip_address?></span>
                                                    <span class="item-bw hidden"><?=$item->bandwidth_total?></span>
                                                    <span class="item-port hidden"><?=$item->port_total?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="level-right col-lg-9 col-md-12 col-12">
                                            <div class="level-item">
                                                <span class="system-meta">
                                                    <span>Ram: </span>
                                                    <span class="meta-status">
                                                        <progress class="progress-1 is-small is-warning edge_ram"
                                                                  max="100"></progress>
                                                        <span class="edge_ram_text">Waiting...</span>
                                                    </span>
                                                </span>
                                            </div>
                                            <div class="level-item">
                                                <span class="system-meta">
                                                    <span>CPU: </span>
                                                    <span class="meta-status">
                                                        <progress class="progress-1 is-small is-warning edge_cpu"
                                                                  max="100"></progress>
                                                        <span class="edge_cpu_text">Waiting...</span>
                                                    </span>
                                                </span>
                                            </div>
                                            <div class="level-item">
                                                <span class="system-meta">
                                                    <span>Disk: </span>
                                                    <span class="meta-status">
                                                        <progress class="progress-1 is-small is-warning edge_disk"
                                                                  max="100"></progress>
                                                        <span class="edge_disk_text">Waiting...</span>
                                                    </span>
                                                </span>
                                            </div>
                                            <div class="level-item">
                                                <span class="system-meta">
                                                    <span>Net: </span>
                                                    <span class="meta-status">
                                                        <progress class="progress-1 is-small is-warning edge_net"
                                                                  max="100"></progress>
                                                        <span class="edge_net_text">Waiting...</span>
                                                    </span>
                                                </span>
                                            </div>
                                            <div class="level-item">
                                                <span class="system-meta">
                                                    <span>BW: </span>
                                                    <span class="meta-status">
                                                        <progress class="progress-1 is-small is-warning edge_bw"
                                                                  max="100"></progress>
                                                        <span class="edge_bw_text">Waiting...</span>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php endforeach; ?>
                    <?php else: ?>
                    <div class="column">
                        <article class="flatbox">
                            <div class="hero">
                                <div class="hero-body">
                                    <div class="has-text-centered">
                                        <p class="text-muted">You do not have any edges</p>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <?php endif; ?>
                </div>


            </div>
            <?=$this->data->pagination?>

        </div>
    </div>
</div>
<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="features" class="buttons hidden text-center">
                        <a id="btn-monit" class="btn btn-success" href="" target="_blank">Monit</a>
                    </div>
                    <input class="hidden" id="id" type="hidden" value="">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" id="name" type="text" placeholder="Edge Name">
                    </div>
                    <div class="form-group">
                        <label class="label">IP Address</label>
                        <input class="input form-control" id="ip_address" type="text" placeholder="Edge IP" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Internet Speed</label>
                        <input class="input form-control" id="port_total" type="number" placeholder="Public Port Speed (bits/s)" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Monthly Bandwidth</label>
                        <input class="input form-control" id="bandwidth_total" type="number" placeholder="Monthly Bandwidth (bytes)" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Status</label>
                        <select id="status" class="form-control">
                            <?php foreach($this->data->statuses as $item): ?>
                            <?php if($item != 'All'): ?>
                            <option value="<?=$item?>"><?=$item?></option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="btn-save">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $, __tajs */
    var up_icon = '<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M9,16V10H5L12,3L19,10H15V16H9M5,20V18H19V20H5Z"></path></svg></span>',
        down_icon = '<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M5,20H19V18H5M19,9H15V3H9V9H5L12,16L19,9Z"></path></svg></span>';

    function pickClass(percent) {
        if (percent < 30) return 'is-success';
        if (percent < 70) return 'is-info';
        if (percent < 90) return 'is-warning';
        return 'is-danger';
    }

    function numberFormat(y, n, a) {
        if (n === undefined) n = 2;
        if (a === undefined) a = ['B', 'KB', 'MB', 'GB', 'TB'];
        y = parseInt(y, 10);
        if (y < 1000) return y + a[0];
        var i = Math.floor(Math.log(y) / Math.log(1000));
        return (y / Math.pow(1000, i)).toFixed(n) + a[i];
    }

    function updateStats(data) {
        $.each(data, function (k, v) {
            console.log(v);
            var edge = $('.edge[data-id=' + v.id + ']');
            if (edge.length) {
                edge.find('.system-status').html(v.connection);

                var ram_percent = Math.round((v.ram_used / v.ram_total) * 100);
                edge.find('.edge_ram').attr('value', ram_percent).removeClass('is-warning').addClass(pickClass(ram_percent));
                edge.find('.edge_ram_text').html(numberFormat(v.ram_used) + ' / ' + numberFormat(v.ram_total));

                var cpu_percent = v.cpu_user + v.cpu_system + v.cpu_wait;
                edge.find('.edge_cpu').attr('value', cpu_percent).removeClass('is-warning').addClass(pickClass(cpu_percent));
                edge.find('.edge_cpu_text').html(v.cpu_user + '%us ' + v.cpu_system + '%sy ' + v.cpu_wait + '%wa');

                var disk_percent = Math.round((v.disk_used / v.disk_total) * 100);
                edge.find('.edge_disk').attr('value', disk_percent).removeClass('is-warning').addClass(pickClass(disk_percent));
                edge.find('.edge_disk_text').html(numberFormat(v.disk_used) + ' / ' + numberFormat(v.disk_total));

                var net_percent = Math.round((v.port_down / v.port_total) * 100);
                edge.find('.edge_net').attr('value', net_percent).removeClass('is-warning').addClass(pickClass(net_percent));
                edge.find('.edge_net_text').html(up_icon + numberFormat(v.port_up, 0, ['Bps', 'Kbps', 'Mbps', 'Gbps']) + ' - ' + down_icon + numberFormat(v.port_down, 0, ['Bps', 'KBps', 'MBps', 'Gbps']) + ' / ' + numberFormat(v.port_total, 0, ['Bps', 'Kbps', 'Mbps', 'Gbps']));

                var bw_percent = Math.round((v.bandwidth_used / v.bandwidth_total) * 100);
                edge.find('.edge_bw').attr('value', bw_percent).removeClass('is-warning').addClass(pickClass(bw_percent));
                edge.find('.edge_bw_text').html(numberFormat(v.bandwidth_used) + ' / ' + numberFormat(v.bandwidth_total));
            }
        });
    }

    function fetchStats() {
        $.post('/edge/stats', {csrf_token: __tajs.csrf}, function (res) {
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            updateStats(res.data);
            setTimeout(fetchStats, 5000);
        });
    }

    $(document).ready(function () {
        fetchStats();
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            if (isNaN(val)) {
                window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
            } else {
                window.location.href = window.location.pathname + '?user_id=' + val;
            }
        });
        $('.edge').on('click', function () {
            var $this = $(this), id = $this.attr('data-id'),
                name = $this.find('.item-name').text(),
                ip_address = $this.find('.item-ip').text(),
                bandwidth_total = $this.find('.item-bw').text() || 0,
                port_total = $this.find('.item-port').text(),
                status = $.trim($this.find('.system-status').attr('class').replace('tag system-status', ''));
            console.log(status);
            $('#id').val(id);
            $('#name').val(name);
            $('#ip_address').val(ip_address);
            $('#bandwidth_total').val(bandwidth_total);
            $('#port_total').val(port_total);
            $('#status').val(status);
            $('#btn-monit').attr('href', 'http://' + ip_address + ':2309');
            $('#features').removeClass('hidden');
            $('#editModal').modal('show');
        });
        $('#btn-add').on('click', function (e) {
            $('#id').val('');
            $('#name').val('');
            $('#ip_address').val('');
            $('#bandwidth_total').val('');
            $('#port_total').val('');
            $('#features').addClass('hidden');
            $('#editModal').modal('show');
        });
        $('#btn-save').on('click', function () {
            var $this = $(this), data = {}, id = $('#id').val();
            if (id) data.id = id;
            data.name = $.trim($('#name').val());
            data.ip_address = $.trim($('#ip_address').val());
            data.bandwidth_total = $('#bandwidth_total').val();
            data.port_total = $('#port_total').val();
            data.status = $('#status').val();
            if (data.name.length < 3) {
                __tajs.showAlert('Network name is required');
                return false;
            }
            if (data.ip_address.length < 7) {
                __tajs.showAlert('Edge IP is required');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/edge', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                if (!res.success) {
                    __tajs.showAlert(res.data);
                    return false;
                }
                if (!id) {
                    __tajs.showAlert('Created Successfully!', 'success');
                    window.location.reload();
                    return false;
                }
                var level = $('.level[data-id="' + id + '"]');
                level.find('.item-name').html(data.name);
                level.find('.item-ip').html(data.ip_address);
                level.find('.item-bw').html(data.bandwidth_total);
                level.find('.item-port').html(data.port_total);
                level.find('.system-status').html(data.port_total);
                level.find('.system-status').attr('class', 'system-status ' + data.status);
                $('#editModal').modal('hide');
                window.location.reload();
            });
        });
    });
</script>