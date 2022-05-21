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
.media-left .badge i{
    font-size: 40px;
}
.media-right .icon, .button .icon {
    vertical-align: bottom;
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
@media screen and (max-width: 768px) {
    .media-content {
        overflow-x: unset;
    }
    #createadv{
          font-size: 12px;
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
    background-color: rgba(128, 128, 128, 0.6) !important;
}
</style>

<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">My Ads</h4>
                        <a href="/campaign#create" class="btn btn-icon btn-outline-primary btn-header" tabindex="0" id="createadv">
                            <span><i class="feather icon-plus"></i> Create Your First Advertising</span></a>
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
                               href="/ad/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
        </div>
    </div>
    <?php if($this->data->total): ?>
    <div class="row is-multiline" id="result">
        <?php foreach($this->data->data as $item): ?>
        <?php $item_data = json_decode($item->data); ?>
        <div class="col-12">
            <div class="card flatbox">
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
                                    <a href="/ad/detail/<?=$item->id?>">#<?=$item->id?> - <span class="item-name"><?=$item->name?></span></a>
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
                                        <span>Bid: <?php if(count((array)$item_data->bidding)>1): ?>Advance<?php else: ?><?=$this->helper->currencyFormat($item_data->bidding->default)?><?php endif; ?></span>
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
                                                        <span>Rename</span>
                                                    </a>
                                                    <?php if($item->status=='Pending'): ?>
                                                    <a class="dropdown-item text-danger btn-reject">
                                                        <i class="fa fa-ban"></i>
                                                        <span>Cancel</span>
                                                    </a>
                                                    <?php endif; ?>
                                                    <?php if($item->status=='Active'||$item->status=='Paused'||$item->status=='Stopped'): ?>
                                                    <a class="dropdown-item text-info" href="/report?start_date=<?=$item->start_date?>&end_date=<?=$item->end_date?>&campaign_id=<?=$item->campaign_id?>&ad_id=<?=$item->id?>&audience_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                                                        <i class="feather icon-bar-chart-2"></i>
                                                        <span>View Report</span>
                                                    </a>
                                                    <?php endif; ?>
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
                                                    <?php if($item->status=='Active'||$item->status=='Paused'||$item->status=='Pending'): ?>
                                                    <a class="dropdown-item text-primary" href="/ad/setup/<?=$item->id?>">
                                                        <i class="fa fa-cogs"></i>
                                                        <span>reSetup</span>
                                                    </a>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php if($item->reject_reason): ?>
                        <div class="mt-4">
                            <p class="text-danger"><?=$item->reject_reason?></p>
                        </div>
                        <?php endif; ?>
                        <div class="mt-4">
                            <div class="buttons are-transparent">
                                <a type="button" class="btn btn-primary waves-effect waves-light mb-1" href="/campaign/detail/<?=$item->campaign_id?>">
                                    <i class="fa fa-bullhorn"></i>
                                    <span>Campaign #<?=$item->campaign_id?></span>
                                </a>
                                <button type="button" class="btn btn-light waves-effect waves-light mb-1">
                                    <i class="fa fa-file-o"></i>
                                    <span><?=$this->data->adFormat[$item->ad_format]?></span>
                                </button>

                                <?php if($item->pricing_model == 'cpm'): ?>
                                <button class="btn btn-danger waves-effect waves-light mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span>CPM <?php if($item->impression): ?><?=$this->helper->currencyFormat($item->cost*1000/$item->impression)?><?php else: ?>$0.00<?php endif; ?></span>
                                </button>
                                <?php elseif($item->pricing_model == 'cpc'): ?>
                                <button type="button" class="btn btn-danger waves-effect waves-light mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span>eCPM <?php if($item->impression): ?><?=$this->helper->currencyFormat($item->cost*1000/$item->impression)?><?php else: ?>$0.00<?php endif; ?></span>
                                </button>

                                <button type="button" class="btn btn-info waves-effect waves-light mb-1">
                                    <i class="fa fa-mouse-pointer"></i>
                                    <span>CTR <?php if($item->impression): ?><?=round($item->click/$item->impression,4)*100?>%<?php else: ?>0.00%<?php endif; ?></span>
                                </button>

                                <button type="button" class="btn btn-info waves-effect waves-light mb-1">
                                    <i class="feather icon-briefcase"></i>
                                    <span>CPC <?php if($item->click): ?><?=$this->helper->currencyFormat($item->cost/$item->click)?><?php else: ?>$0.00<?php endif; ?></span>
                                </button>

                                <?php else: ?>
                                <button class="btn btn-danger btn-light mb-1">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M12,13A5,5 0 0,1 7,8H9A3,3 0 0,0 12,11A3,3 0 0,0 15,8H17A5,5 0 0,1 12,13M12,3A3,3 0 0,1 15,6H9A3,3 0 0,1 12,3M19,6H17A5,5 0 0,0 12,1A5,5 0 0,0 7,6H5C3.89,6 3,6.89 3,8V20A2,2 0 0,0 5,22H19A2,2 0 0,0 21,20V8C21,6.89 20.1,6 19,6Z"></path>
                                        </svg>
                                    </span>
                                    <span>eCPM <?php if($item->impression): ?><?=$this->helper->currencyFormat($item->cost*1000/$item->impression)?><?php else: ?>$0.00<?php endif; ?></span>
                                </button>
                                <button class="btn btn-success btn-light mb-1">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M17,18A2,2 0 0,1 19,20A2,2 0 0,1 17,22C15.89,22 15,21.1 15,20C15,18.89 15.89,18 17,18M1,2H4.27L5.21,4H20A1,1 0 0,1 21,5C21,5.17 20.95,5.34 20.88,5.5L17.3,11.97C16.96,12.58 16.3,13 15.55,13H8.1L7.2,14.63L7.17,14.75A0.25,0.25 0 0,0 7.42,15H19V17H7C5.89,17 5,16.1 5,15C5,14.65 5.09,14.32 5.24,14.04L6.6,11.59L3,4H1V2M7,18A2,2 0 0,1 9,20A2,2 0 0,1 7,22C5.89,22 5,21.1 5,20C5,18.89 5.89,18 7,18M16,11L18.78,6H6.14L8.5,11H16Z"></path>
                                        </svg>
                                    </span>
                                    <span>CR <?php if($item->impression): ?><?=round($item->conversion/$item->impression,4)*100?>%<?php else: ?>0.00%<?php endif; ?></span>
                                </button>
                                <button class="btn btn-success btn-light mb-1">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                  d="M20,18H4V6H20M20,4H4C2.89,4 2,4.89 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6C22,4.89 21.1,4 20,4M11,17H13V16H14A1,1 0 0,0 15,15V12A1,1 0 0,0 14,11H11V10H15V8H13V7H11V8H10A1,1 0 0,0 9,9V12A1,1 0 0,0 10,13H13V14H9V16H11V17Z"></path>
                                        </svg>
                                    </span>
                                    <span>CPA <?php if($item->conversion): ?><?=$this->helper->currencyFormat($item->cost/$item->conversion)?><?php else: ?>$0.00<?php endif; ?></span>
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
                            <div class="buttons are-transparent">
                                <?php if($item_data->budget_daily || $item_data->budget_capping): ?>
                                <button class="btn btn-warning waves-effect waves-light mb-1">
                                    <i class="fa fa-usd"></i>
                                    <span>
                                        <?php $text = ''; ?>
                                        <?php if($item_data->budget_capping): ?>
                                        <?php $e = explode(':', $item_data->budget_capping); $text .= $this->helper->currencyFormat($e[0]).' per '.$e[1]; ?>
                                        <?php endif; ?>
                                        <?php if($item_data->budget_daily): ?>
                                        <?php $text .= ', '.$this->helper->currencyFormat($item_data->budget_daily).' per day'; ?>
                                        <?php endif; ?>
                                        <?='Cap: '.trim($text, ', ')?>
                                    </span>
                                </button>
                                <?php endif; ?>
                                <?php if($item_data->goal_total || $item_data->goal_daily || $item_data->goal_capping): ?>
                                <button class="btn btn-warning waves-effect waves-light mb-1">
                                    <?php if($item->pricing_model=='cpc'): ?>
                                    <i class="fa fa-mouse-pointer"></i>
                                    <?php else: ?>
                                    <i class="feather icon-eye"></i>
                                    <?php endif; ?>
                                    <span>
                                        <?php $text = '' ?>
                                        <?php if($item_data->goal_capping): ?>
                                        <?php $e = explode(':', $item_data->goal_capping); $text .= $this->helper->numberFormat($e[0]).' per '.$e[1]; ?>
                                        <?php endif; ?>
                                        <?php if($item_data->goal_daily): ?>
                                        <?php $text .= ', '.$this->helper->numberFormat($item_data->goal_daily).' per day'; ?>
                                        <?php endif; ?>
                                        <?php if($item_data->goal_total): ?>
                                        <?php $text .= ', '.$this->helper->numberFormat($item_data->goal_total).' total'; ?>
                                        <?php endif; ?>
                                        <?='Cap: '.trim($text, ', ')?>
                                    </span>
                                </button>
                                <?php endif; ?>
                                <div style="display: flex; justify-content: end">
                                    <button class="btn btn-default"><?=$item->created_at?></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
    <?php else: ?>
    <div class="card">
        <div class="card-content">
            <div class="card-body card-dashboard">
                <div class="hero">
                    <div class="hero-body">
                        <div class="text-center">
                            <p>No Records</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php endif; ?>
    <?=$this->data->pagination?>
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
                    <input class="hidden" id="id" type="hidden" value="">
                    <div class="form-group">
                        <label class="label">Ad Name</label>
                        <input class="input form-control" id="name" type="text" placeholder="Ad name" value="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="submit">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
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
    $('#submit').on('click', function() {
        var $this = $(this), id = $('#id').val(), name = $.trim($('#name').val());
        if(name.length < 3) {
            __tajs.showAlert('Ad name is required');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/ad/rename/'+id, {csrf_token: __tajs.csrf, name: name}, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            var $item = $('.dropdown-menu[id="dropdown-item-'+id+'"]');
            $item.closest('.media').find('.item-name').html(name);
            $('#editModal').modal('hide');
        });
    });
    $('.btn-edit').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', ''),
            name = $(this).closest('.media').find('.item-name').text();
        $('#id').val(id);
        $('#name').val(name);
        $('#editModal').modal('show');
    });
    $('.btn-pause').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showConfirm('Pause Ad may break the optimization, still want to do that?', function(yes) {
            if (yes) {
                __tajs.showLoading();
                $.post('/ad/pause/'+id, {csrf_token: __tajs.csrf}, function(res) {
                    __tajs.showLoading(false);
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    window.location.reload();
                });
            }
        });
    });
    $('.btn-stop').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showConfirm('Are you sure? this action could not undo', function(yes) {
            if (yes) {
                __tajs.showLoading();
                $.post('/ad/stop/'+id, {csrf_token: __tajs.csrf}, function(res) {
                    __tajs.showLoading(false);
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    window.location.reload();
                });
            }
        });
    });
    $('.btn-resume').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showLoading();
        $.post('/ad/resume/'+id, {csrf_token: __tajs.csrf}, function(res) {
            __tajs.showLoading(false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            window.location.reload();
        });
    });
    $('.btn-reject').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showLoading();
        $.post('/ad/reject/'+id, {csrf_token: __tajs.csrf}, function(res) {
            __tajs.showLoading(false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            window.location.reload();
        });
    });
});
</script>