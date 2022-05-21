<style>
    .media-content .title {
        margin-bottom: 0 !important;
    }

    .media-left .tag {
        width: 3rem;
        height: 3rem;
    }

    .media-left .badge i{
        font-size: 40px;
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
        margin-top: 2.5rem !important;
    }

    .mt-4 > div.are-transparent > a:hover {
        /*background-color: rgba(128, 128, 128, 0.1) !important;*/
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Campaigns</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header btn-add" tabindex="0">
                            <span><i class="feather icon-plus"></i> Add Campaign</span></button>
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
                               href="/campaign/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Campaign Name" aria-label="filter"
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

            <?php if($this->data->total): ?>
            <div class="row">
                <?php foreach($this->data->data as $item): ?>
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="media">
                                    <div class="media-left">
                                        <?php if($item->status=='Active'): ?>
                                        <span class="badge badge-success">
                                            <i class="fa fa-check-circle"></i>
                                        </span>
                                        <?php elseif($item->status=='Stopped'): ?>
                                        <span class="badge badge-info">
                                            <i class="fa fa-times-circle"></i>
                                        </span>
                                        <?php elseif($item->status=='Paused'): ?>
                                        <span class="badge badge-light">
                                            <i class="fa fa-pause-circle-o"></i>
                                        </span>
                                        <?php elseif($item->status=='Rejected'): ?>
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
                                            <a href="/campaign/detail/<?=$item->id?>">#<?=$item->id?> - <span
                                                        class="item-name"><?=$item->name?></span></a>
                                        </h2>
                                        <div class="buttons are-transparent" style="margin-top: 5px">
                                            <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                                <i class="fa fa-calendar"></i>
                                                <span><?=$item->start_date?> - <?=$item->end_date?></span>
                                            </button>
                                            <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                                <i class="fa fa-usd"></i>
                                                <span><?=$this->helper->currencyFormat($item->cost)?> / <?=$this->helper->currencyFormat($item->budget)?></span>
                                            </button>
                                            <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                                <i class="feather icon-briefcase"></i>
                                                <span>Pricing: <?=strtoupper($item->pricing_model)?></span>
                                            </button>
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
                                                            <a class="dropdown-item text-primary btn-edit">
                                                                <i class="feather icon-edit"></i>
                                                                <span>Edit Campaign</span>
                                                            </a>
                                                            <?php if($item->status=='Active'||$item->status=='Paused'||$item->status=='Stopped'): ?>
                                                            <a class="dropdown-item text-info"
                                                               href="/report?start_date=<?=$item->start_date?>&end_date=<?=$item->end_date?>&campaign_id=<?=$item->id?>&ad_id=&audience_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                                                                <i class="feather icon-bar-chart"></i>
                                                                <span>View Report</span>
                                                            </a>
                                                            <?php endif; ?>
                                                            <a class="dropdown-item text-success"
                                                               href="/ad/create?campaign_id=<?=$item->id?>">
                                                                <i class="feather icon-airplay"></i>
                                                                <span>Create Ad</span>
                                                            </a>
                                                            <?php if($item->status=='Active'): ?>
                                                            <a class="dropdown-item text-dark btn-pause">
                                                                <i class="feather icon-pause-circle"></i>
                                                                <span>Pause</span>
                                                            </a>
                                                            <?php endif; ?>
                                                            <?php if($item->status=='Paused'): ?>
                                                            <a class="dropdown-item text-success btn-resume">
                                                                <i class="feather icon-play-circle"></i>
                                                                <span>Resume</span>
                                                            </a>
                                                            <?php endif; ?>
                                                            <?php if($item->status=='Active'||$item->status=='Paused'): ?>
                                                            <a class="dropdown-item text-danger btn-stop">
                                                                <i class="feather icon-stop-circle"></i>
                                                                <span>Stop</span>
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
                                        <a type="button" href="/ad/active?campaign_id=<?=$item->id?>" class="btn btn-success mb-1">
                                            <i class="feather icon-airplay"></i>
                                            <span><?=$item->active_ad?> Active Ads</span>
                                        </a>
                                        <a type="button" href="/ad?campaign_id=<?=$item->id?>" class="btn btn-primary mb-1">
                                            <i class="feather icon-airplay"></i>
                                            <span><?=$item->total_ad?> Total Ads</span>
                                        </a>

                                        <?php if(strpos($item->pricing_model, 'cpm') !== false): ?>
                                        <button class="btn btn-danger mb-1">
                                            <i class="feather icon-briefcase"></i>
                                            <span><?php if(strpos($item->pricing_model, 'cpc') !== false || strpos($item->pricing_model, 'cpa') !== false): ?>e<?php endif; ?>
                                                CPM
                                                <?php if($item->impression): ?><?=$this->
                                                helper->currencyFormat($item->cost*1000/$item->impression)?><?php else: ?><?=$this->
                                                helper->currencyFormat($item->cost)?><?php endif; ?></span>
                                        </button>
                                        <?php endif; ?>
                                        <?php if(strpos($item->pricing_model, 'cpc') !== false): ?>
                                        <button class="btn btn-info mb-1">
                                            <i class="fa fa-mouse-pointer"></i>
                                            <span>CTR <?php if($item->cpc_impression): ?><?=round($item->
                                                click/$item->cpc_impression,4)*100?>%<?php else: ?>
                                                0.00%<?php endif; ?></span>
                                        </button>
                                        <button class="btn btn-info mb-1">
                                            <i class="feather icon-briefcase"></i>
                                            <span>CPC <?php if($item->click): ?><?=$this->
                                                helper->currencyFormat($item->cost/$item->click)?><?php else: ?><?=$this->
                                                helper->currencyFormat($item->cost)?><?php endif; ?></span>
                                        </button>
                                        <?php endif; ?>
                                        <?php if(strpos($item->pricing_model, 'cpc') !== false): ?>
                                        <button class="btn btn-success mb-1">
                                            <i class="feather icon-shopping-cart"></i>
                                            <span>CR <?php if($item->cpa_impression): ?><?=round($item->
                                                conversion/$item->cpa_impression,4)*100?>%<?php else: ?>
                                                0.00%<?php endif; ?></span>
                                        </button>
                                        <button class="btn btn-success mb-1">
                                            <i class="fa fa-money"></i>
                                            <span>CPA <?php if($item->conversion): ?><?=$this->
                                                helper->currencyFormat($item->cost/$item->conversion)?><?php else: ?><?=$this->
                                                helper->currencyFormat($item->cost)?><?php endif; ?></span>
                                        </button>
                                        <?php endif; ?>
                                    </div>
                                    <hr>

                                    <div class="buttons are-transparent">
                                        <button type="button" class="btn btn-primary waves-effect waves-light mb-1">
                                            <i class="feather icon-eye"></i>
                                            <span><?=$this->helper->numberFormat($item->impression)?></span>
                                        </button>
                                        <button type="button" class="btn btn-success waves-effect waves-light mb-1">
                                            <i class="feather icon-users"></i>
                                            <span><?=$this->helper->numberFormat($item->reach)?></span>
                                        </button>
                                        <button type="button" class="btn btn-warning waves-effect waves-light mb-1">
                                            <i class="fa fa-mouse-pointer"></i>
                                            <span><?=$this->helper->numberFormat($item->click)?></span>
                                        </button>
                                        <button type="button" class="btn btn-danger waves-effect waves-light mb-1">
                                            <i class="feather icon-shopping-cart"></i>
                                            <span><?=$this->helper->numberFormat($item->conversion)?></span>
                                        </button>
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
            <div class="row">
                <div class="col-12">
                    <div class="card flatbox">
                        <div class=" card-content hero">
                            <div class="card-body card-dashboard hero-body">
                                <div class="text-center">
                                    <p>No results</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <?=$this->data->pagination?>


        </div>
    </div>
</div>

<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <input id="id" type="hidden" value="">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Edit Campaign</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Campaign Name</label>
                        <input class="form-control" id="name" type="text" placeholder="Campaign Name">
                    </div>
                    <div class="form-group">
                        <label class="label">Campaign Description</label>
                        <textarea class="form-control" id="description"
                          placeholder="Some descriptions about this campaign"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="btn-save">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="actionModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <section class="modal-card-body">
            <p class="text-centered text-danger title is-5">Do not close or leave this page</p>
            <div id="ad_list"></div>
            <div class="buttons is-centered pt-4">
                <button class="button is-danger enterAction" id="btn-abort">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor"
                                  d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"/>
                        </svg>
                    </span>
                    <span>Abort</span>
                </button>
                <button class="button is-light btn-close is-hidden" id="btn-close">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor"
                                  d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"/>
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
        if (!$('.action-ads').length) {
            $('#btn-close').removeClass('is-hidden');
            $('#btn-abort').addClass('is-hidden');
            if (success) window.location.reload();
            return false;
        }
        if (is_aborted) {
            window.location.reload();
            return false;
        }
        var $this = $('.action-ads').first(), id = $this.attr('id');
        $this.removeClass('action-ads').addClass('is-loading').closest('li').find('.focus-line').addClass('is-current');
        $.post('/ad/' + action + '/' + id, {csrf_token: __tajs.csrf}, function (res) {
            if (!res.success) {
                $this.removeClass('is-loading is-warning').addClass('is-danger').html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M13 14H11V9H13M13 18H11V16H13M1 21H23L12 2L1 21Z" /></svg></span>');
            } else {
                $this.removeClass('is-loading is-warning').addClass('is-success').html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg></span>');
                success = success + 1;
            }
            processAdAction(action);
        });
    }

    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('.btn-edit').on('click', function (e) {
            e.preventDefault();
            var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', ''),
                name = $(this).closest('.media').find('.item-name').text(),
                description = $(this).closest('.card-dashboard').find('.item-description').html();

            $('#id').val(id);
            $('#name').val(name);
            $('#description').val(description);
            $('#editModal').modal('show');
        });
        $('.btn-add').on('click', function (e) {
            $('#id').val('');
            $('#name').val('');
            $('#description').val('');
            $('#editModal').modal('show');
        });
        $('#btn-save').on('click', function () {
            var $this = $(this), data = {}, id = $('#id').val();
            if (id) data.id = id;
            data.name = $.trim($('#name').val());
            data.description = $.trim($('#description').val());
            if (data.name.length < 3) {
                __tajs.showAlert('Campaign name is required');
                return false;
            }
            if (data.description.length < 10) {
                __tajs.showAlert('Campaign description is required min 10 characters');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/campaign', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                if (!res.success) {
                    __tajs.showAlert(res.data);
                    return false;
                }
                if (!id) {
                    __tajs.showAlert('Created Successfully! now redirecting you to Ad creator..', 'success');
                    setTimeout(function (){window.location.replace(res.data)}, 500);
                    return false;
                }
                var $item = $('.dropdown-menu[id="dropdown-item-' + id + '"]');
                $item.closest('.media').find('.item-name').html(data.name);
                $item.closest('.flatbox').find('.item-description').html(data.description);
                $('#editModal').modal('hide');
            });
        });
        $('.btn-pause').on('click', function (e) {
            e.preventDefault();
            var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
            __tajs.showConfirm('Pause campaign may breaks the optimization, still want to do that?', function (yes) {
                if (yes) {
                    $('#ad_list').html('<p class="text-centered text-muted">loading, please wait...</p>');
                    $('#btn-close').addClass('is-hidden');
                    $('#btn-abort').removeClass('is-hidden');
                    $('#btn-abort').prop('disabled', false);
                    $('#actionModal').toggleClass('is-active');
                    is_aborted = false;
                    success = 0;
                    $.post('/campaign/ads', {csrf_token: __tajs.csrf, campaign_id: id, status: ['Active']}, function (res) {
                        if (!res.success) {
                            $('#actionModal').toggleClass('is-active');
                            __tajs.showAlert(res.data);
                            return false;
                        }
                        if (!res.data.length) {
                            $('#actionModal').toggleClass('is-active');
                            __tajs.showAlert('Could not find suitable ads for pausing from this campaign!!!');
                            return false;
                        }
                        var html = '<ul>';
                        $.each(res.data, function (k, v) {
                            html += '<li class="mb-1">';
                            html += '<div class="buttons are-transparent">';
                            html += '<button class="button is-light is-warning action-ads" id="' + v.id + '">';
                            html += '<span class="icon"><svg viewBox="0 0 24 24">';
                            html += '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" /></svg></span>';
                            html += '</button>';
                            html += '<button class="button is-light is-info" style="width:170px">' + v.ad_format + '</button>';
                            html += '<button class="button is-light is-success">' + v.id + ' - ' + v.name + '</button>';
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
        $('.btn-stop').on('click', function (e) {
            e.preventDefault();
            var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
            __tajs.showConfirm('Are you sure? stopped campaign can not undo!', function (yes) {
                if (yes) {
                    $('#ad_list').html('<p class="text-centered text-muted">loading, please wait...</p>');
                    $('#btn-close').addClass('is-hidden');
                    $('#btn-abort').removeClass('is-hidden');
                    $('#btn-abort').prop('disabled', false);
                    $('#actionModal').toggleClass('is-active');
                    is_aborted = false;
                    success = 0;
                    $.post('/campaign/ads', {csrf_token: __tajs.csrf, campaign_id: id, status: ['Active', 'Paused']}, function (res) {
                        if (!res.success) {
                            $('#actionModal').toggleClass('is-active');
                            __tajs.showAlert(res.data);
                            return false;
                        }
                        if (!res.data.length) {
                            $('#actionModal').toggleClass('is-active');
                            __tajs.showAlert('Could not find suitable ads for stopping from this campaign!!!');
                            return false;
                        }
                        var html = '<ul>';
                        $.each(res.data, function (k, v) {
                            html += '<li class="mb-1">';
                            html += '<div class="buttons are-transparent">';
                            html += '<button class="button is-light is-warning action-ads" id="' + v.id + '">';
                            html += '<span class="icon"><svg viewBox="0 0 24 24">';
                            html += '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" /></svg></span>';
                            html += '</button>';
                            html += '<button class="button is-light is-info" style="width:170px">' + v.ad_format + '</button>';
                            html += '<button class="button is-light is-success">' + v.id + ' - ' + v.name + '</button>';
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
        $('.btn-resume').on('click', function (e) {
            e.preventDefault();
            var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
            $('#ad_list').html('<p class="text-centered text-muted">loading, please wait...</p>');
            $('#btn-close').addClass('is-hidden');
            $('#btn-abort').removeClass('is-hidden');
            $('#btn-abort').prop('disabled', false);
            $('#actionModal').toggleClass('is-active');
            is_aborted = false;
            success = 0;
            $.post('/campaign/ads', {csrf_token: __tajs.csrf, campaign_id: id, status: ['Paused']}, function (res) {
                if (!res.success) {
                    $('#actionModal').toggleClass('is-active');
                    __tajs.showAlert(res.data);
                    return false;
                }
                if (!res.data.length) {
                    $('#actionModal').toggleClass('is-active');
                    __tajs.showAlert('Could not find suitable ads for resuming from this campaign!!!');
                    return false;
                }
                var html = '<ul>';
                $.each(res.data, function (k, v) {
                    html += '<li class="mb-1">';
                    html += '<div class="buttons are-transparent">';
                    html += '<button class="button is-light is-warning action-ads" id="' + v.id + '">';
                    html += '<span class="icon"><svg viewBox="0 0 24 24">';
                    html += '<path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" /></svg></span>';
                    html += '</button>';
                    html += '<button class="button is-light is-info" style="width:170px">' + v.ad_format + '</button>';
                    html += '<button class="button is-light is-success">' + v.id + ' - ' + v.name + '</button>';
                    html += '</div>';
                    html += '<hr class="focus-line">';
                    html += '</li>';
                });
                html += '</ul>';
                $('#ad_list').html(html);
                processAdAction('resume');
            });
        });
        $('#btn-abort').on('click', function (e) {
            var $this = $(this);
            $this.html('Aborting...');
            $this.prop('disabled', true);
            is_aborted = true;
        });
        if (window.location.hash == '#create') {
            $('.btn-add').click();
        }
    });
</script>