<style>
.tickets li{padding:.5rem 0}
.tickets li:not(:last-child){border-bottom:1px solid #E6E8EB}
.tickets .status{width:75px;margin-right:.5rem;margin-bottom:.4rem}
.tickets .updated_at{margin-left:1rem;float:right}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only Ticket from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Support</h4>
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
                            <?php foreach(['All', 'Opening', 'Replied', 'Closed'] as $status): ?>
                            <a class="dropdown-item"
                               href="/support/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="UserID or Subject" aria-label="filter"
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

                        <div class="row mb-1" id="results">
                            <div class="col-12">
                                <div class="flatbox">
                                    <?php if($this->data->data): ?>
                                    <div class="tickets">
                                        <ul class="list-group list-group-flush">
                                            <?php foreach($this->data->data as $item): ?>
                                            <li class="list-group-item">
                                                <?php if($item->is_escalated): ?>
                                                <span class="badge status badge-danger">Escalated</span>
                                                <?php endif; ?>
                                                <a class="badge status badge-info" href="/user/<?=$item->user_id?>" target="_blank"><?=$item->user_id?></a>
                                                <span class="badge status badge-<?php if($item->status == 'Opening'): ?>info<?php elseif($item->status == 'Replied'): ?>success<?php else: ?>warning<?php endif; ?>"><?=ucwords($item->status)?></span>
                                                <span class="d-none d-md-block updated_at is-hidden-touch"><?=$item->updated_at?$item->updated_at:$item->created_at?></span>
                                                <a class="badge badge-primary" href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->user_name?></a>
                                                <a class="text-info subject" href="/support/ticket/<?=$item->id?>"><?=ucwords($item->service)?>: <?=$item->subject?></a>
                                            </li>
                                            <?php endforeach; ?>
                                        </ul>
                                    </div>
                                    <?php else: ?>
                                    <div class="hero mt-2">
                                        <div class="hero-body">
                                            <div class="text-center">
                                                <p>No support ticket found</p>
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
    $(document).keypress(function(e) {
        if(e.which == 13) {
            $('#search-btn').click();
        }
    });
    $('#search-btn').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
});
</script>