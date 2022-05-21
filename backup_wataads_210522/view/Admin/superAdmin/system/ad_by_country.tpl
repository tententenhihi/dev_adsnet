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
    color: green;
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
    /*margin-right: 1rem;*/
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
</style>
<div class="content-body">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Country</h4>
                    </div>
                    <div class="d-flex">
                        <span style="font-size: 20px">Average Bidding: <strong><?=$this->data->average_bidding?>$</strong></span>
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
                                                       placeholder="Ad Id" aria-label="filter"
                                                       value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light"
                                                            type="button" id="search-btn"><i
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
    <div class="page-title-box">
        <div class="row is-mobile">
            <div class="col-12">
                <h3 class="title is-6">Results</h3>
            </div>
        </div>
    </div>
    <div class="row is-multiline">
        <?php foreach($this->data->data as $item): ?>
        <div class="col-lg-3 col-md-6 col-12">
            <div class="card flatbox is-100height country" id="<?=$item->ad_id?>">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="media">
                            <div class="media-left"></div>
                            <div class="media-content">
                                <h2 class="title is-5">
                                    <a href="http://admin.ads.com/advertiser/ad-detail/<?=$item->ad_id?>" target="_blank"><span class="item-name text-<?php if($item->value > $this->data->average_bidding): ?>success<?php else: ?>danger<?php endif; ?>">Ad - <?=$item->ad_id?></span></a>
                                </h2>
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
                                                    <a class="dropdown-item text-danger btn-stop">
                                                        <i class="fa fa-stop-circle"></i>
                                                        <span>Stop Ad</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="buttons are-transparent">
                                <button class="btn btn-info btn-light">
                                    <i class="fa fa-usd"></i>
                                    <span>Bidding: <?=$item->value?></span>
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
<script>
/* global $, __tajs */
$(document).ready(function() {
$(document).keypress(function(e) {
    if(e.which == 13) {
        $('#search-btn').click();
    }
});
$('#search-btn').on('click', function() {
    var val = $.trim($('#search').val());
    if (val.length < 1) return false;
    window.location.href = window.location.href +'&q='+encodeURIComponent(val);
});
$('.btn-stop').on('click', function(e){
        e.preventDefault();
        var id = $(this).closest('.dropdown-menu').attr('id').replace('dropdown-item-', '');
        __tajs.showConfirm('Stopped Ad could not resume later, still want to do that?', function(yes) {
            if (yes) {
                __tajs.showLoading();
                $.post('/advertiser/ad-stop/'+id, {csrf_token: __tajs.csrf}, function(res) {
                    __tajs.showLoading(false);
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    __tajs.showAlert('Stopped Successfully! Please wait a second...', 'success');
                    setTimeout(function(){window.location.reload()},200);
                });
            }
        });
    });
});
</script>