<style>
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
    background-color: rgba(128, 128, 128, 0.39) !important;
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

ul{
    list-style: none;
}
.media-left .badge i{
    font-size: 40px;
}
</style>
<section class="wrapper">
    <div class="content-body">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-end">
                        <div class="d-flex">
                            <h4 class="card-title">Networks</h4>
                            <button class="btn btn-icon btn-outline-primary btn-header btn-add" tabindex="0">
                                <span><i class="feather icon-plus"></i> New Network</span></button>
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
                                   href="/openrtb/network/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                            <form-groupset>
                                                <div class="input-group">
                                                    <input id="search" type="text" class="form-control"
                                                           placeholder="Network Name" aria-label="filter"
                                                           value="<?=$this->data->key?>">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary waves-effect waves-light"
                                                                type="button" id="enterAction"><i
                                                                    class="feather icon-search"></i> Search
                                                        </button>
                                                    </div>
                                                </div>
                                            </form-groupset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <?php if($this->data->total): ?>
                <div class="row is-multiline">
                    <?php foreach($this->data->data as $item): ?>
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="flatbox card">
                            <div class="card-content">
                                <div class="card-body card-dashboard">
                                    <div class="media">
                                        <div class="media-left">
                                            <?php if($item->status=='Active'): ?>
                                            <span class="badge badge-success">
                                            <i class="fa fa-check-circle"></i>
                                        </span>
                                            <?php else: ?>
                                            <span class="badge badge-warning">
                                            <i class="fa fa-minus-circle"></i>
                                        </span>
                                            <?php endif; ?>
                                        </div>
                                        <div class="media-content" data-value="<?=$item->module?>">
                                            <h2 class="title is-5" style="font-size: 1.5rem;">
                                                <a href="/openrtb/network?id=<?=$item->id?>">#<?=$item->id?> - <span class="item-name"><?=$item->name?></span></a>
                                            </h2>
                                            <div class="buttons are-transparent" style="margin-top: 5px">
                                                <a class="btn btn-default" href="<?=$item->url?>" target="_blank">
                                                    <i class="feather icon-link"></i>
                                                    <span class="item-url"><?=$item->url?></span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="media-right" style="display:flex; justify-content: center">
                                            <div class="content-header-right col-md-3 col-12">
                                                <div class="form-group breadcrum-right">
                                                    <div class="dropdown">
                                                        <button class="button is-more btn-icon btn btn-default btn-round btn-sm dropdown-toggle waves-effect waves-light"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-controls="dropdown-item-<?=$item->id?>">
                                                            <span class="icon">
                                                                <svg viewBox="0 0 24 24">
                                                                    <path fill="currentColor"
                                                                          d="M12,16A2,2 0 0,1 14,18A2,2 0 0,1 12,20A2,2 0 0,1 10,18A2,2 0 0,1 12,16M12,10A2,2 0 0,1 14,12A2,2 0 0,1 12,14A2,2 0 0,1 10,12A2,2 0 0,1 12,10M12,4A2,2 0 0,1 14,6A2,2 0 0,1 12,8A2,2 0 0,1 10,6A2,2 0 0,1 12,4Z"></path>
                                                                </svg>
                                                            </span>
                                                        </button>

                                                        <div class="dropdown-menu dropdown-menu-right"
                                                             id="dropdown-item-<?=$item->id?>" role="menu">
                                                            <div class="dropdown-content">
                                                                <a class="dropdown-item text-primary btn-edit">
                                                                    <i class="feather icon-edit"></i>
                                                                    <span>Edit</span>
                                                                </a>
                                                                <?php if($item->status=='Active'): ?>
                                                                <a class="dropdown-item text-info" href="/openrtb/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&network_id=<?=$item->id?>&ad_id=&country=&group_by=Date&order_by=Date">
                                                                    <i class="feather icon-bar-chart-2"></i>
                                                                    <span>Report</span>
                                                                </a>
                                                                <?php endif; ?>
                                                                <a class="dropdown-item text-success" href="/openrtb/ad/create?network_id=<?=$item->id?>">
                                                                    <i class="feather icon-airplay"></i>
                                                                    <span>Create Ad</span>
                                                                </a>
                                                                <?php if($item->status=='Active'): ?>
                                                                <a class="dropdown-item text-dark btn-deactivate">
                                                                    <i class="fa fa-pause-circle-o"></i>
                                                                    <span>Disable</span>
                                                                </a>
                                                                <?php else: ?>
                                                                <a class="dropdown-item text-success btn-activate">
                                                                    <i class="fa fa-play-circle-o"></i>
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
                                        <p class="item-description"><?=$item->description?></p>
                                    </div>

                                    <div class="mt-4">
                                        <div class="buttons are-transparent">
                                            <a href="/openrtb/ad/active?network_id=<?=$item->id?>" class="btn btn-success mb-1">
                                                <i class="feather icon-airplay"></i>
                                                <span><?=$item->active_ad?> Active Ads</span>
                                            </a>
                                            <a href="/openrtb/ad/all?network_id=<?=$item->id?>" class="btn btn-primary mb-1">
                                                <i class="feather icon-airplay"></i>
                                                <span><?=$item->total_ad?> Total Ads</span>
                                            </a>
                                            <button class="btn btn-danger mb-1">
                                                <i class="feather icon-briefcase"></i>
                                                <span>eCPM <?php if($item->impression): ?><?=$this->helper->currencyFormat($item->revenue*1000/$item->impression)?><?php else: ?>$0.00<?php endif; ?></span>
                                            </button>
                                            <button class="btn btn-danger mb-1">
                                                <i class="fa fa-mouse-pointer"></i>
                                                <span>CTR <?php if($item->impression): ?><?=round($item->click/$item->impression,4)*100?>%<?php else: ?>0.00%<?php endif; ?></span>
                                            </button>
                                        </div>
                                        <hr>
                                        <div class="buttons are-transparent">
                                            <a href="/openrtb/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&network_id=<?=$item->id?>" class="btn btn-info mb-1">
                                                <i class="feather icon-eye"></i>
                                                <span>Impression: <?=$this->helper->numberFormat($item->impression)?></span>
                                            </a>
                                            <a href="/openrtb/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&network_id=<?=$item->id?>" class="btn btn-info mb-1">
                                                <i class="fa fa-mouse-pointer"></i>
                                                <span>Click: <?=$this->helper->numberFormat($item->click)?></span>
                                            </a>
                                            <a href="/openrtb/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&network_id=<?=$item->id?>" class="btn btn-success mb-1">
                                                <i class="fa fa-money"></i>
                                                <span>Estimated: <?=$this->helper->currencyFormat($item->revenue)?></span>
                                            </a>
                                            <button class="btn btn-success mb-1">
                                                <i class="fa fa-money"></i>
                                                <span>Recorded: <?=$this->helper->currencyFormat($item->net_revenue)?></span>
                                            </button>
                                            <a href="/openrtb/payment?network_id=<?=$item->id?>" class="btn btn-primary mb-1">
                                                <i class="fa fa-credit-card-alt"></i>
                                                <span>Paid: <?=$this->helper->currencyFormat($item->payment)?></span>
                                            </a>
                                        </div>
                                        <hr>
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
                            <button class="btn btn-success btn-add">
                                <i class="feather icon-plus"></i>
                                <span>Add First Network</span>
                            </button>
                        </div>
                    </div>
                </div>
                <?php endif; ?>
                <?=$this->data->pagination?>
            </div>
        </div>
    </div>
</section>
<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <section class="modal-body">
                    <input class="hidden" id="id" type="hidden" value="">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" id="name" type="text" placeholder="Network Name">

                    </div>
                    <div class="form-group">
                        <label class="label">Url</label>
                        <input class="input form-control" id="url" type="text"  placeholder="Network Url" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Module</label>
                        <select id="module" class="form-control">
                            <option value=""></option>
                            <?php foreach($this->data->module_list as $module): ?>
                            <option value="<?=$module?>"><?=$module?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="textarea form-control" id="description" placeholder="Some descriptions about this ad network"></textarea>
                    </div>
                </section>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="btn-save">
                        <i class="feather icon-check"></i> Submit</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="actionModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <section class="modal-card-body">
            <p class="has-text-centered has-text-danger title is-5">Do not close or leave this page</p>
            <div id="ad_list"></div>
            <div class="buttons is-centered pt-4">
                <button class="button is-danger enterAction" id="btn-abort">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                        </svg>
                    </span>
                    <span>Abort</span>
                </button>
                <button class="button is-light btn-close is-hidden" id="btn-close">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                        </svg>
                    </span>
                    <span>Close</span>
                </button>
            </div>
            
        </section>
    </div>
    <button class="modal-close is-large"></button>
</div>
<script>
/* global $, __tajs */
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
    $.post('/openrtb/ad/'+action, {csrf_token: __tajs.csrf, id: id}, function(res){
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
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('.btn-edit').on('click', function(e){
        e.preventDefault();
        
        var $this = $(this), id = $this.closest('.dropdown-menu').attr('id').replace('dropdown-item-', ''),
            name = $this.closest('.media').find('.item-name').text(),
            url = $this.closest('.media').find('.item-url').text(),
            module = $this.closest('.media').find('.media-content').attr("data-value"),
            description = $(this).closest('.flatbox').find('.item-description').html();
        $('#id').val(id);
        $('#name').val(name);
        $('#url').val(url);
        $('#module').val(module);
        $('#description').val(description);
        $('#editModal').modal('show');
    });
    $('.btn-add').on('click', function(e){
        $('#id').val('');
        $('#name').val('');
        $('#url').val('');
        $('#description').val('');
        $('#editModal').modal('show');
    });
    $('#btn-save').on('click', function() {
        var $this = $(this), data = {}, id = $('#id').val();
        if(id) data.id = id;
        data.name = $.trim($('#name').val());
        data.url = $.trim($('#url').val());
        data.module = $.trim($('#module').val());
        data.description = $.trim($('#description').val());
        if(data.name.length < 3) {
            __tajs.showAlert('Network name is required');
            return false;
        }
        if(data.url.length < 11) {
            __tajs.showAlert('Network Url is required');
            return false;
        }
        if(data.description.length < 10) {
            __tajs.showAlert('Network description is required min 10 characters');
            return false;
        }
        if(!data.module.length) {
            __tajs.showAlert('Network Module is required');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/openrtb/network', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            if(!id) {
                __tajs.showAlert('Created Successfully!', 'success');
                window.location.reload();
                return false;
            }
            var $item = $('.dropdown-menu[id="dropdown-item-'+id+'"]');
            $item.closest('.media').find('.item-name').html(data.name);
            $item.closest('.media').find('.item-url').html(data.url);
            $item.closest('.media').find('.media-content').attr("data-value",data.module);
            $item.closest('.flatbox').find('.item-description').html(data.description);
            $('#editModal').removeClass('is-active');
        });
    });
    $('.btn-deactivate').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showConfirm('Deactivate Ad Network mean all it\'s ads will be paused', function(yes) {
            if (yes) {
                $('#ad_list').html('<p class="has-text-centered text-muted">loading, please wait...</p>');
                $('#btn-close').addClass('is-hidden');
                $('#btn-abort').removeClass('is-hidden');
                $('#btn-abort').prop('disabled', false);
                $('#actionModal').modal('show');
                is_aborted = false;
                success = 0;
                $.post('/openrtb/ads', {csrf_token: __tajs.csrf, network_id: id, status: ['Active']}, function(res) {
                    if (!res.success) {
                        $('#actionModal').modal('show');
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    if(!res.data.length) {
                        $('#actionModal').modal('show');
                        __tajs.showAlert('Could not find suitable ads for pausing from this network!!!');
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
                    processAdAction('disable');
                });
            }
        });
    });
    $('.btn-activate').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        $('#ad_list').html('<p class="has-text-centered text-muted">loading, please wait...</p>');
        $('#btn-close').addClass('is-hidden');
        $('#btn-abort').removeClass('is-hidden');
        $('#btn-abort').prop('disabled', false);
        $('#actionModal').modal('show');
        is_aborted = false;
        success = 0;
        $.post('/openrtb/ads', {csrf_token: __tajs.csrf, network_id: id, status: ['Inactive']}, function(res) {
            if (!res.success) {
                $('#actionModal').modal('show');
                __tajs.showAlert(res.data);
                return false;
            }
            if(!res.data.length) {
                $('#actionModal').modal('show');
                __tajs.showAlert('Could not find suitable ads for resuming from this network!!!');
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
            processAdAction('enable');
        });
    });
    $('#btn-abort').on('click', function(e) {
        var $this = $(this);
        $this.html('Aborting...');
        $this.prop('disabled', true);
        is_aborted = true;
    });
});
</script>