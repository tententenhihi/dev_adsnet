<style>
    .table-responsive .badge{
        width: 70px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Scheduled Report</h4>
                        <a class="btn btn-icon btn-outline-primary btn-header" href="/report/schedule/create">
                            <span><i class="feather icon-plus"></i> Create Report</span></a>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            All
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">

                            <a class="dropdown-item"
                               href="#">All</a>
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
                                                       placeholder="Report Name" aria-label="filter"
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


                        <?php if($this->data->data): ?>
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th>Status</th>
                                    <th>Name</th>
                                    <th>Date Range</th>
                                    <th>Latest Report</th>
                                    <th>Total Report</th>
                                    <th>Actions</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <?php if($item->status=='Pending'): ?>
                                        <span class="badge badge-warning">Pending</span>
                                        <?php elseif($item->status=='Rejected'): ?>
                                        <span class="badge badge-danger">Rejected</span>
                                        <?php else: ?>
                                        <span class="badge badge-success">Active</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><a href="/report/schedule/<?=$item->id?>"><?=$item->name?></a></td>
                                    <td>
                                        <?php if($item->date_range == 'yesterday'):?>
                                        Yesterday
                                        <?php elseif($item->date_range == 'lastweek'):?>
                                        Last Week
                                        <?php elseif($item->date_range == 'lastmonth'):?>
                                        Last Month
                                        <?php elseif($item->date_range == 'last7days'):?>
                                        Last 7 Days
                                        <?php elseif($item->date_range == 'last30days'):?>
                                        Last 30 Days
                                        <?php endif; ?>
                                    </td>
                                    <td><?=$item->reported_at?:'Not Yet'?></td>
                                    <td><?=$item->total_sent?></td>
                                    <td>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light delete-report" data-id="<?=$item->id?>">
                                            <i class="feather icon-trash"></i>
                                        </button>
                                    </td>
                                    <td><?=$item->created_at?></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>You do not have any scheduled reports!</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        </br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $, __tajs */
    $(document).ready(function() {
        $('#enterAction').on('click', function() {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        });
        $('.delete-report').on('click', function(){
            var $this = $(this), id = $this.attr('data-id');
            __tajs.showConfirm('Are you sure? This action can not undo', function(yes) {
                if (yes) {
                    $this.addClass('is-loading');
                    $this.prop('disabled', true);
                    $.post('/report/delete/'+id, {csrf_token: __tajs.csrf}, function(res) {
                        if (!res.success) {
                            $this.removeClass('is-loading');
                            $this.prop('disabled', false);
                            __tajs.showAlert(res.data);
                        }
                        else {
                            window.location.replace(res.data);
                        }
                    });
                }
            });
        });
    });
</script>