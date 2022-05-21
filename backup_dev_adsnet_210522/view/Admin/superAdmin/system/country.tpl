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
.item-name {
    transition: 0.5s ease-in-out;
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
    padding: 10px 20px 10px 20px;
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
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Country</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="add_dimension">
                            <span><i class="feather icon-plus"></i> Add Country</span></button>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->ad_formats[$this->data->format_id]?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->ad_formats as $id => $name): ?>
                                <a class="dropdown-item select-format" data-id="<?=$id?>"><?=$name?></a>
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
                                                       placeholder="name or code" aria-label="filter"
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

            <div class="row is-multiline">
                <?php foreach($this->data->data as $item): ?>
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="card" id="<?=$item->id?>" data-name="<?=$item->name?>" data-code="<?=$item->code?>" data-phone="<?=$item->phone?>" data-tzoffset="<?=$item->timezone_offset?>" data-ctr_admin="<?=$item->ctr_admin?>" data-icr_admin="<?=$item->icr_admin?>">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="media">
                                    <div class="media-left"></div>
                                    <div class="media-content">
                                        <h2 class="title is-5" style="font-size: 1.5rem;">
                                            <a href="/system/bidding/<?=strtolower($item->code)?>?format=<?=$this->data->format_id?>"><span class="is-success"><?=$item->code?> - <?=$item->name?></span></a>
                                        </h2>
                                        <div class="buttons are-transparent" style="margin-top: 5px">
                                            <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                                <i class="feather icon-phone"></i>
                                                <span class="item-phone"><?=$item->phone?></span>
                                            </button>

                                            <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                                <i class="feather icon-airplay"></i>
                                                <span class="meta-total">Ads: <?=$item->total_ad?></span>
                                            </button>

                                            <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                                <i class="feather icon-briefcase"></i>
                                                <span class="meta-min">Min: $<?=$item->min_bid?></span>
                                            </button>

                                            <button type="button" class="btn btn-default mb-1 waves-effect waves-light">
                                                <i class="feather icon-briefcase"></i>
                                                <span class="meta-max">Max: $<?=$item->max_bid?></span>
                                            </button>

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
                                                            <a class="dropdown-item text-danger btn-delete">
                                                                <i class="feather icon-trash-2"></i>
                                                                <span>Delete</span>
                                                            </a>
                                                            <a class="dropdown-item text-info btn-bidding">
                                                                <i class="feather icon-briefcase"></i>
                                                                <span>Bidding</span>
                                                            </a>
                                                            <a class="dropdown-item text-warning btn-retry hidden">
                                                                <span class="icon">
                                                                    <svg viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M17.65,6.35C16.2,4.9 14.21,4 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20C15.73,20 18.84,17.45 19.73,14H17.65C16.83,16.33 14.61,18 12,18A6,6 0 0,1 6,12A6,6 0 0,1 12,6C13.66,6 15.14,6.69 16.22,7.78L13,11H20V4L17.65,6.35Z"></path>
                                                                    </svg>
                                                                </span>
                                                                <span>Retry</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="buttons are-transparent">
                                        <?php if($item->cpm_max): ?>
                                        <button type="button" class="btn btn-success mb-1 waves-effect waves-light">
                                            <i class="feather icon-eye"></i>
                                            <span>CPM: min $<?=$item->cpm_min?> - avg $<?=$item->cpm_avg?> - max $<?=$item->cpm_max?></span>
                                        </button>
                                        <?php else: ?>
                                        <button type="button" class="btn btn-danger mb-1 waves-effect waves-light">
                                            <i class="feather icon-eye"></i>
                                            <span>CPM: None</span>
                                        </button>
                                        <?php endif; ?>
                                        <?php if($item->cpc_max): ?>
                                        <button type="button" class="btn btn-success mb-1 waves-effect waves-light">
                                            <i class="fa fa-mouse-pointer"></i>
                                            <span>CPC: $<?=$item->cpc_bid?></span>
                                        </button>
                                        <?php else: ?>
                                        <button type="button" class="btn btn-danger mb-1 waves-effect waves-light">
                                            <i class="fa fa-mouse-pointer"></i>
                                            <span>CPC: None</span>
                                        </button>
                                        <?php endif; ?>
                                        <?php if($item->cpa_max): ?>
                                        <button type="button" class="btn btn-success mb-1 waves-effect waves-light">
                                            <i class="feather icon-shopping-cart"></i>
                                            <span>CPA: $<?=$item->cpa_bid?></span>
                                        </button>
                                        <?php else: ?>
                                        <button type="button" class="btn btn-danger mb-1 waves-effect waves-light">
                                            <i class="feather icon-shopping-cart"></i>
                                            <span>CPA: None</span>
                                        </button>
                                        <?php endif; ?>
                                    </div>
                                    <hr>
                                    <div class="buttons are-transparent">
                                        <button type="button" class="btn btn-light mb-1 waves-effect waves-light">
                                            <i class="fa fa-mouse-pointer"></i>
                                            <span>CTR: <?php if($item->ctr_max): ?>min <?=$item->ctr_min*100?>% - avg <?=$item->ctr_avg*100?>% - max <?=$item->ctr_max*100?>%<?php else: ?>N/A<?php endif; ?></span>
                                        </button>

                                        <button type="button" class="btn btn-info mb-1 waves-effect waves-light">
                                            <i class="feather icon-shopping-cart"></i>
                                            <span>ICR: <?php if($item->icr_max): ?>min <?=$item->icr_min*100?>% - avg <?=$item->icr_avg*100?>% - max <?=$item->icr_max*100?>%<?php else: ?>N/A<?php endif; ?></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
            <?=$this->data->pagination?>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="modalInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Edit</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id" value="">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="form-control" type="text" id="name" value="" placeholder="Country Full Name">
                    </div>
                    <div class="form-group">
                        <label class="label">Code</label>
                        <input class="form-control" type="text" id="code" value="" placeholder="Country 2-letters Code">
                    </div>
                    <div class="form-group">
                        <label class="label">Phone</label>
                        <input class="form-control" type="text" id="phone" value="" placeholder="Country phone number prefix (with +)">
                    </div>
                    <div class="form-group">
                        <label class="label">Timezone Offset</label>
                        <input class="form-control" type="text" id="timezone_offset" value="" placeholder="Comma separated list of timezone offsets">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="submit_dimension">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="modalBidding" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Bidding</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">

                    <input type="hidden" id="bid_id" value="">
                    <div class="form-group">
                        <label class="label">CPM</label>
                        <input class="form-control" type="number" id="bid_cpm" value="" placeholder="Default CPM">
                        <p class="help has-text-info">Cost per 1000 impressions</p>
                    </div>
                    <div class="form-group">
                        <label class="label">CPC</label>
                        <input class="form-control" type="number" id="bid_cpc" value="" placeholder="Default CPC">
                        <p class="help has-text-info">Cost per 1 click</p>
                    </div>
                    <div class="form-group">
                        <label class="label">CPA</label>
                        <input class="form-control" type="number" id="bid_cpa" value="" placeholder="Default CPA">
                        <p class="help has-text-info">Cost per 1 conversion</p>
                    </div>
                    <div class="form-group">
                        <label class="label">CTR</label>
                        <input class="form-control" type="number" id="bid_ctr" value="" placeholder="Current CTR">
                        <p class="help has-text-info">Click Throught Rate, %</p>
                    </div>
                    <div class="form-group">
                        <label class="label">CR</label>
                        <input class="form-control" type="number" id="bid_cr" value="" placeholder="Current CR">
                        <p class="help has-text-info">Conversion Rate, %</p>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="submit_bidding">Submit</button>
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
        window.location.href = window.location.pathname+'?format=<?=$this->data->format_id?>&q='+encodeURIComponent(val);
    });
    $('.select-format').on('click', function(){
        var $this = $(this), id = $this.attr('data-id');
        $this.closest('.dropdown').find('.current-selected').html($this.html());
        __tajs.showLoading();
        var url = window.location.href;
        if(url.indexOf('format=') > -1) {
            url = url.split('format=')[0] + 'format='+id;
        } else {
            url = url.indexOf('?') > -1 ? url + '&format='+id : url + '?format='+id;
        }
        window.location.replace(url);
    });
    $('#add_dimension').on('click', function() {
        $('#id').val('');
        $('#name').val('');
        $('#code').val('');
        $('#phone').val('');
        $('#timezone_offset').val('');
        $('#code').prop('disabled', false);
        $('#modalInfo').modal('show');
    });
    $('.btn-edit').on('click', function(e) {
        e.preventDefault();
        var $item = $(this).closest('.card'), id = $item.attr('id');
        $('#id').val(id);
        $('#name').val($item.attr('data-name'));
        $('#code').val($item.attr('data-code'));
        $('#phone').val($item.attr('data-phone'));
        $('#timezone_offset').val($item.attr('data-tzoffset'));
        $('#code').prop('disabled', true);
        $('#modalInfo').modal('show');
    });
    $('.btn-delete').on('click', function(e) {
        e.preventDefault();
        console.log($(this))
        var $item = $(this).closest('.card'), id = $item.attr('id'), name = $item.attr('data-name');
        __tajs.showConfirm('Are you sure to delete '+name+' ?', function(yes) {
            if (yes) {
                __tajs.showLoading();
                $.post('/system/country/remove', {csrf_token: __tajs.csrf, data: id}, function(res) {
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                        __tajs.showLoading(false);
                    }
                    else {
                        window.location.reload();
                    }
                });
            }
        });
    });
    $('.btn-bidding').on('click', function(e) {
        e.preventDefault();
        var $item = $(this).closest('.card'), id = $item.attr('id'),
            cpm_bid = $item.attr('data-cpm_bid'),
            cpc_bid = $item.attr('data-cpc_bid'),
            cpa_bid = $item.attr('data-cpa_bid');
            cpc_rate = $item.attr('data-cpc_rate'),
            cpa_rate = $item.attr('data-cpa_rate');
        $('#bid_id').val(id);
        $('#bid_cpm').val(cpm_bid*1000);
        $('#bid_cpc').val(cpc_bid);
        $('#bid_cpa').val(cpa_bid);
        $('#bid_ctr').val(cpc_rate*100);
        $('#bid_cr').val(cpa_rate*100);
        $('#modalBidding').modal('show');
    });
    $('#submit_dimension').click(function() {
        var $this = $(this), data = {};
        data.id = $('#id').val() || null;
        data.name = $.trim($('#name').val()) || null;
        data.code = $.trim($('#code').val()) || null;
        data.phone = $.trim($('#phone').val()) || null;
        data.timezone_offset = $.trim($('#timezone_offset').val()) || null;
        var url = '/system/country/add';
        if(data.id) url = '/system/country/update';
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post(url, {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                if(!data.id) {
                    window.location.reload();
                    return false;
                }
                $item = $('#'+data.id);
                $item.attr('data-name', data.name).attr('data-code', data.code).attr('data-phone', data.phone).attr('data-tzoffset', data.timezone_offset);
                $item.find('.item-name').html(data.code+' - '+data.name);
                $item.find('.item-phone').html(data.phone);
                $('#modalInfo').modal('hide');
                $this.prop('disabled', false);
                window.location.reload();
            }
        });
    });
    $('#submit_bidding').click(function() {
        var $this = $(this), data = {format: <?=$this->data->format_id?>};
        data.id = $('#bid_id').val();
        data.cpm = parseFloat($('#bid_cpm').val());
        data.cpc = parseFloat($('#bid_cpc').val());
        data.cpa = parseFloat($('#bid_cpa').val());
        data.ctr = parseFloat($('#bid_ctr').val());
        data.cr = parseFloat($('#bid_cr').val());
        
        if(!data.cpm) {
            __tajs.showAlert('Default CPM is required!');
            return false;
        }
        if(!data.cpc) {
            __tajs.showAlert('Default CPC is required!');
            return false;
        }
        if(!data.cpa) {
            __tajs.showAlert('Default CPA is required!');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/system/country/bidding', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.reload();
            }
        });
    });
});
</script>