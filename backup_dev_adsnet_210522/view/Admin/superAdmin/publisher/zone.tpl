<style>
.item-name {
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    display: block;
    max-width: 20ch;
}
.buttons.is-gapless .button {
    margin-right: 0 !important;
}
.table-responsive .badge{
    min-width: 70px;
}
.btn-tag{
    cursor: pointer;
    min-width: 150px !important;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only Ad Zones from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>

                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title"><?=$this->data->page_title?></h4>
                        <a class="btn btn-icon btn-outline-primary btn-header" href="/system/adformat">
                            <span><i class="feather icon-plus"></i> Manage Ad Format</span></a>
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
                               href="/publisher/zone/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Zone Name" aria-label="filter"
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
                                    <th>Zone</th>
                                    <th>Website</th>
                                    <th>User</th>
                                    <th>Ad Tag</th>
                                    <th>Summary</th>
                                    <th>Min eCPM</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <?php if($item->status=='Active'): ?>
                                        <span class="badge badge-success">Active</span>
                                        <?php else: ?>
                                        <span class="badge badge-danger">Rejected</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><a class="item-name" href="/publisher/zone/detail?id=<?=$item->id?>"><?=$item->id?> - <?=$item->name?></a></td>
                                    <td><a href="/publisher/website/detail?id=<?=$item->website_id?>"><?=$item->domain?></a></td>
                                    <td><a href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->user_name?></a></td>
                                    <td>
                                         <span class="badge badge-warning btn-tag mb-1" data-id="<?=$item->id?>" data-guide="<?=$this->data->adformats[$item->ad_format]->tag_guide?>">
                                            <span><?=$this->data->adformats[$item->ad_format]->name  ?></span>
                                        </span>
                                    </td>
                                    <td>
                                        <?php if($item->status=='Active'): ?>
                                        <a class="btn btn-sm is-gapless" href="/publisher/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&website_id=<?=$item->website_id?>&zone_id=<?=$item->id?>&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                                            <button type="button" class="btn btn-success mb-1 waves-effect waves-light">
                                                <i class="fa fa-money"></i>
                                                <span><?=$this->helper->currencyFormat($item->revenue)?></span>
                                            </button>
                                            <button type="button" class="btn btn-info mb-1 waves-effect waves-light">
                                                <i class="feather icon-eye"></i>
                                                <span><?=$this->helper->numberFormat($item->impression)?></span>
                                            </button>
                                            <button type="button" class="btn btn-danger mb-1 waves-effect waves-light">
                                                <i class="feather icon-briefcase"></i>
                                                <span><?=$item->impression?$this->helper->currencyFormat($item->revenue*1000/$item->impression):'$0.00'?></span>
                                            </button>
                                        </a>
                                        <?php else: ?>
                                        <span>No data available</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><span><?=$item->floor_cpm?$this->helper->currencyFormat($item->floor_cpm):'Auto'?></span></td>
                                    <td><span><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p class="text-muted">You do not have any zones!</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        </br>

                        <?=$this->data->pagination?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $ */
    function renderTag(id, guide, script) {
        $('#guide').html(guide.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;'));
        $('#ad_script').val(script.replace('{{id}}', id));
    }
    $(document).ready(function() {
        $('#enterAction').on('click', function() {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        });
        $('.btn-tag').on('click', function() {
            var $this = $(this), id = $this.attr('data-id'), guide = $this.attr('data-guide'), script = $this.attr('data-script');
            $('#tag-content').html(renderTag(id, guide, script));
            $('#showTag').modal('show');
        });
        
    });
</script>