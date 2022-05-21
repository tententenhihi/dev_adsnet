<style>
.activity li:not(:last-child){
    border-bottom:1px solid #E6E8EB
}
#results .badge{
    width: 70px;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only activities from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex">
                    <div class="d-flex">
                        <h4 class="card-title">User Activities</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->type?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->types as $type): ?>
                            <a class="dropdown-item"
                               href="/user/activity/<?=strtolower($type)?><?=$this->arg?>"><?=$type?></a>
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
                                                       placeholder="User ID, IP" aria-label="filter"
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

                        <div class="row" id="results">
                            <div class="col-12">
                                <div class="flatbox">
                                    <?php if($this->data->data): ?>
                                    <div class="activity mb-1">
                                        <ul class="list-group list-group-flush">
                                            <?php foreach($this->data->data as $item): ?>
                                            <li class="list-group-item" >
                                                <span class="date"><?=$item->created_at?></span>
                                                <span class="badge badge-primary badge-md mr-1 <?php if($item->type == 'Account'): ?>badge-info<?php else: ?>badge-success<?php endif; ?> atype"><?=$item->type?></span>
                                                <span class="text-info aip ip"><?=$item->ip_address?></span>
                                                <span><?=$item->message?></span>
                                            </li>
                                            <?php endforeach; ?>
                                        </ul>
                                    </div>
                                    <?php else: ?>
                                    <div class="hero">
                                        <div class="hero-body">
                                            <div class="text-center">
                                                <p>No Records</p>
                                            </div>
                                        </div>
                                    </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                        <?=$this->data->pagination?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $ */
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        if(isNaN(val)) {
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        } else {
            window.location.href = window.location.pathname+'?user_id='+val;
        }
    });
    $('.aip').click(function(){
        window.location.href = window.location.pathname+'?q='+encodeURIComponent($(this).text());
    });
});
</script>