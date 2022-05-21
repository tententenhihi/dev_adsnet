<style>
#mark_all_read:hover{
    background-color: rgba(128, 128, 128, 0.4);
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only notifications from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>

            <div class="card">
                <div class="card-header d-flex ">
                    <div class="d-flex">
                        <h4 class="card-title">User Notifications</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->service?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->services as $service): ?>
                            <a class="dropdown-item"
                               href="/user/notification/<?=strtolower($service)?><?=$this->arg?>"><?=$service?></a>
                            <?php endforeach; ?>

                        </div>
                    </div>
                </div>

                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="ag-grid-btns d-flex justify-content-between flex-wrap mb-1">

                                    <div class="ag-btns d-flex flex-wrap mb-1">
                                        <fieldset>
                                            <div class="input-group">
                                                <input id="search" type="text" class="form-control"
                                                       placeholder="Search" aria-label="filter"
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
                                    <?php if($this->data->data): ?>
                                        <button class="btn btn-outline-success waves-effect waves-light mb-1" id="mark_all_read" <?php if(!$this->data->total): ?>disabled<?php endif; ?>>
                                            <i class="feather icon-check "></i> Mark all as Read
                                        </button>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <?php if($this->data->data): ?>
                                    <?php foreach($this->data->data as $item): ?>
                                    <div class="alert alert-<?=$item->type?>">
                                        <a href="javascript:__tajs.readAdminNotification(<?=$item->id?>);">
                                            <span class="pull-right d-none d-md-block"><?=$item->created_at?></span>
                                            <?php if(!$item->is_read): ?><strong><?php endif; ?>
                                                <?=$item->title?>
                                                <?php if(!$item->is_read): ?></strong><?php endif; ?>
                                        </a>
                                    </div>

                                    <?php endforeach; ?>
                                    <?php else: ?>
                                    <div class="hero mt-2">
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
/* global $, __tajs */
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
    $('#mark_all_read').click(function() {
        var $this = $(this);
        __tajs.showConfirm('All your unread notifications will be marked as read, Are you sure?', function(yes){
           if(yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/user/notification-read-all', {csrf_token: __tajs.csrf}, function(res) {
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                    }
                    else {
                        window.location.reload();
                    }
                });
           } 
        });
    });
});
</script>