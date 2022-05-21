<style>
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
.buttons.are-transparent {
    margin-bottom: 0 !important;
}
.buttons.are-transparent .button {
    background-color: transparent;
    margin-bottom: 0;
}
.buttons.are-transparent .button:focus {
    box-shadow: none;
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

.media-content > div.are-transparent > a {
    padding: 0.5rem 1rem;
}

.media-content > div.are-transparent > a:hover {
    background-color: rgba(128, 128, 128, 0.39) !important;
}

.mt-4 {
    margin-top: 2.5rem !important;
}

.mt-4 > div.are-transparent > a:hover {
    background-color: rgba(128, 128, 128, 0.39) !important;
}
.media-left .badge i{
    font-size: 40px;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Ads</h4>
                        <?php if($this->data->data && isset($this->data->network->id)): ?>
                        <a class="btn btn-icon btn-outline-primary btn-header btn-add" tabindex="0" href="/exchange/ad/create?network_id=<?=$this->data->network->id?>">
                            <span><i class="feather icon-plus"></i> New Ad</span></a>
                        <?php endif; ?>
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
                               href="/exchange/ad/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Ad Name" aria-label="filter"
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

            <?php if($this->data->data): ?>
            <div class="row is-multiline">
                <?php foreach($this->data->data AS $item): ?>
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="media" data-id="<?=$item->id?>">
                                    <div class="media-left">
                                        <?php if($item->status == 'Active'): ?>
                                        <span class="badge badge-success">
                                            <i class="fa fa-check-circle"></i>
                                        </span>
                                        <?php else: ?>
                                        <span class="badge badge-warning">
                                            <i class="fa fa-minus-circle"></i>
                                        </span>
                                        <?php endif; ?>
                                    </div>
                                    <div class="media-content">
                                        <h2 class="title is-5" style="font-size: 1.5rem;">
                                            <a href="/exchange/ad/detail?id=<?=$item->id?>"><span class="item-name"><?=$item->name?></span></a>
                                        </h2>
                                        <div class="buttons are-transparent" style="margin-top: 5px">
                                            <a type="button" class="btn btn-default mb-1 waves-effect waves-light" href="/exchange/network?id=<?=$item->network_id?>">
                                                <i class="feather icon-target"></i>
                                                <span class="item-url"><?=$item->network_name?></span>
                                            </a>
                                            <a type="button" class="btn btn-default mb-1 waves-effect waves-light" href="<?=$item->url?>" target="_blank">
                                                <i class="feather icon-link"></i>
                                                <span>Open Ad Link</span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="media-right" style="display:flex; justify-content: center">
                                        <div class="content-header-right col-md-3 col-12">
                                            <div class="form-group breadcrum-right">
                                                <div class="dropdown">
                                                    <button class="button is-more btn-icon btn btn-default btn-round btn-sm dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true"
                                                            aria-controls="dropdown-item-<?=$item->id?>">
                                                    <span class="icon">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor"
                                                                  d="M12,16A2,2 0 0,1 14,18A2,2 0 0,1 12,20A2,2 0 0,1 10,18A2,2 0 0,1 12,16M12,10A2,2 0 0,1 14,12A2,2 0 0,1 12,14A2,2 0 0,1 10,12A2,2 0 0,1 12,10M12,4A2,2 0 0,1 14,6A2,2 0 0,1 12,8A2,2 0 0,1 10,6A2,2 0 0,1 12,4Z"></path>
                                                        </svg>
                                                    </span>
                                                    </button>

                                                    <div class="dropdown-menu dropdown-menu-right" id="dropdown-item-<?=$item->id?>" role="menu">
                                                        <div class="dropdown-content">
                                                            <a class="dropdown-item text-info btn-rename">
                                                                <span class="icon">
                                                                    <svg viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18,2.9 17.35,2.9 16.96,3.29L15.12,5.12L18.87,8.87M3,17.25V21H6.75L17.81,9.93L14.06,6.18L3,17.25Z"></path>
                                                                    </svg>
                                                                </span>
                                                                <span>Rename</span>
                                                            </a>
                                                            <a class="dropdown-item text-primary " href="/exchange/ad/setup?id=<?=$item->id?>">
                                                                <span class="icon">
                                                                    <svg viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M13.78 15.3L19.78 21.3L21.89 19.14L15.89 13.14L13.78 15.3M17.5 10.1C17.11 10.1 16.69 10.05 16.36 9.91L4.97 21.25L2.86 19.14L10.27 11.74L8.5 9.96L7.78 10.66L6.33 9.25V12.11L5.63 12.81L2.11 9.25L2.81 8.55H5.62L4.22 7.14L7.78 3.58C8.95 2.41 10.83 2.41 12 3.58L9.89 5.74L11.3 7.14L10.59 7.85L12.38 9.63L14.2 7.75C14.06 7.42 14 7 14 6.63C14 4.66 15.56 3.11 17.5 3.11C18.09 3.11 18.61 3.25 19.08 3.53L16.41 6.2L17.91 7.7L20.58 5.03C20.86 5.5 21 6 21 6.63C21 8.55 19.45 10.1 17.5 10.1Z"></path>
                                                                    </svg>
                                                                </span>
                                                                <span>Setup</span>
                                                            </a>
                                                            <a href="/exchange/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&ad=<?=$item->id?>" class="dropdown-item text-info">
                                                                <span class="icon">
                                                                    <svg viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M15.86 4.39V19.39C15.86 21.06 17 22 18.25 22C19.39 22 20.64 21.21 20.64 19.39V4.5C20.64 2.96 19.5 2 18.25 2S15.86 3.06 15.86 4.39M9.61 12V19.39C9.61 21.07 10.77 22 12 22C13.14 22 14.39 21.21 14.39 19.39V12.11C14.39 10.57 13.25 9.61 12 9.61S9.61 10.67 9.61 12M5.75 17.23C7.07 17.23 8.14 18.3 8.14 19.61C8.14 20.93 7.07 22 5.75 22S3.36 20.93 3.36 19.61C3.36 18.3 4.43 17.23 5.75 17.23Z"></path>
                                                                    </svg>
                                                                </span>
                                                                <span>Report</span>
                                                            </a>
                                                            <?php if($item->status == 'Active'): ?>
                                                            <a class="dropdown-item text-danger btn-disable">
                                                                <span class="icon">
                                                                    <svg viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M15,16H13V8H15M11,16H9V8H11M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z"></path>
                                                                    </svg>
                                                                </span>
                                                                <span>Disable</span>
                                                            </a>
                                                            <?php else: ?>
                                                            <a class="dropdown-item text-success btn-enable">
                                                                <span class="icon">
                                                                    <svg viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M10,16.5V7.5L16,12M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z"></path>
                                                                    </svg>
                                                                </span>
                                                                <span>Enable</span>
                                                            </a>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="buttons are-transparent">
                                        <a href="/exchange/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&ad_id=<?=$item->id?>" class="btn btn-info mb-1 waves-effect waves-light">
                                            <i class="feather icon-eye"></i>
                                            <span>Impression: <?=$this->helper->numberFormat($item->impression)?></span>
                                        </a>
                                        <a href="/exchange/bidding?ad_id=<?=$item->id?>" class="btn btn-danger mb-1 waves-effect waves-light">
                                            <i class="feather icon-briefcase"></i>
                                            <span>eCPM: <?php if($item->impression): ?><?=$this->helper->currencyFormat($item->revenue*1000/$item->impression)?><?php else: ?>$0.00<?php endif; ?></span>
                                        </a>
                                        <a href="/exchange/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&ad_id=<?=$item->id?>" class="btn btn-success mb-1 waves-effect waves-light">
                                            <i class="fa fa-money"></i>
                                            <span>Estimated: <?=$this->helper->currencyFormat($item->revenue)?></span>
                                        </a>
                                        <button class="btn btn-primary mb-1 waves-effect waves-light">
                                            <i class="fa fa-credit-card-alt"></i>
                                            <span>Recorded: <?=$this->helper->currencyFormat($item->net_revenue)?></span>
                                        </button>
                                    </div>
                                    <div style="display: flex; justify-content: end">
                                        <button class="btn btn-default"><?=$item->created_at?></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
            <?php else: ?>
            <div class="hero">
                <div class="hero-body">
                    <div class="buttons text-center">
                        <a class="btn btn-success" href="<?=$this->data->network->id?'/exchange/create?network_id='.$this->data->network->id: '/exchange/network' ?>">
                            <i class="feather icon-airplay"></i>
                            <span>Create First Ad</span>
                        </a>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <?=$this->data->pagination?>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="renameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
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

                        <input id="ad-id" type="hidden" value="">
                        <input class="input form-control" id="ad-name" type="text" placeholder="Ad Name" value="">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="rename">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $, __tajs */
$(document).ready(function(){
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('#rename').on('click', function() {
        var $this = $(this), data = {};
        data.id = parseInt($('#ad-id').val(), 10);
        data.name = $.trim($('#ad-name').val());
        if(data.name.length < 3) {
            __tajs.showAlert('Ad name is required');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/exchange/ad/rename', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            $('.media[data-id="'+data.id+'"]').find('.item-name').html(data.name);
            $('#renameModal').modal('hide');
        });
    });
    $('.btn-rename').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        var name = $('.media[data-id="'+id+'"]').find('.item-name').html();
        $('#ad-id').val(id);
        $('#ad-name').val(name);
        $('#renameModal').modal('show');
    });
    $('.btn-disable').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showConfirm('Are you sure?', function(yes) {
            if (yes) {
                __tajs.showLoading();
                $.post('/exchange/ad/disable', {csrf_token: __tajs.csrf, id: id}, function(res) {
                    __tajs.showLoading(false);
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    __tajs.showAlert('Disabled Successfully! Please wait a second...', 'success');
                    setTimeout(function(){window.location.reload()},200);
                });
            }
        });
    });
    $('.btn-enable').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showLoading();
        $.post('/exchange/ad/enable', {csrf_token: __tajs.csrf, id: id}, function(res) {
            __tajs.showLoading(false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            __tajs.showAlert('Resumed Successfully! Please wait a second...', 'success');
            setTimeout(function(){window.location.reload()},200);
        });
    });
});
</script>