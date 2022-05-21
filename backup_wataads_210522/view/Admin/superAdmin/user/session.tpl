
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only sessions from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>

            <div class="card">
                <div class="card-header d-flex ">
                    <div class="d-flex">
                        <h4 class="card-title">User Sessions</h4>
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
                               href="/user/session/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Country code or IP" aria-label="filter"
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

                        <div class="page-title-box mb-2">
                            <div class="row is-mobile">
                                <div class="col-12">
                                    <?php if($this->data->user): ?>
                                    <div class="buttons pull-right">
                                        <button class="btn btn-danger btn-light btn-transparent" id="logout_all">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M19,3H5C3.89,3 3,3.89 3,5V9H5V5H19V19H5V15H3V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M10.08,15.58L11.5,17L16.5,12L11.5,7L10.08,8.41L12.67,11H3V13H12.67L10.08,15.58Z" />
                                                </svg>
                                            </span>
                                            <span>Logout All</span>
                                        </button>
                                    </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                        <div class="columns is-multiline mb-1">
                            <?php if($this->data->data): ?>
                            <div class="activity">
                                <ul class="list-group list-group-flush">
                                    <?php foreach($this->data->data as $item): ?>
                                    <li class="list-group-item">
                                        <div class="d-flex justify-content-between flex-wrap mb-1">
                                            <div>
                                                <span style="width: 70px;" class="mr-1 badge badge-<?php if($item->status == 'Active'): ?>success<?php else: ?>danger<?php endif; ?>"><?=$item->status?></span>
                                                <span class="mr-1"><a href="/user/session?q=<?=strtolower($item->country)?>"><?=$item->country?></a></span>
                                                <span class="mr-1"><?=$item->browser?></span>
                                                <span class="text-info mr-1"><a href="/user/session?q=<?=$item->ip_address?>"><?=$item->ip_address?></a></span>
                                                <span class="mr-1"><a href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->name?></a></span>

                                                <br>

                                                <span class="mr-1">Start:  <?=$item->created_at?></span>
                                                <span class="mr-1">End:  <?=$item->logged_out??'Not Available'?></span>
                                                <span class="mr-1">Lastest:  <?=$item->updated_at??'Not Available'?></span>
                                                <span class="date">Remember: <?php if($item->is_remember): ?>Yes<?php else: ?>No<?php endif; ?></span>
                                            </div>
                                            <div>
                                                <?php if($item->session_id == $this->data->currentId): ?>
                                                <a class="btn btn-danger btn-light" href="/auth/logout">
                                                    <i class="feather icon-power "></i>
                                                    <span>Logout</span>
                                                </a>
                                                <?php else: ?>
                                                    <button class="btn btn-danger waves-effect waves-light btn-logout" data-id="<?=$item->id?>"<?php if($item->status !== 'Active'): ?> disabled<?php endif; ?>>
                                                        <i class="feather icon-power"></i>
                                                        <span>Logout</span>
                                                    </button>
                                                <?php endif; ?>
                                            </div>
                                        </div>


                                    </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                            <?php else: ?>
                            <div class="column">
                                <article class="flatbox">
                                    <div class="hero">
                                        <div class="hero-body">
                                            <div class="has-text-centered">
                                                <p class="text-muted">You do not have any sessions</p>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <?php endif; ?>
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
    $('.btn-logout').on('click', function() {
        var $this = $(this), id = $this.attr('data-id');
        __tajs.showConfirm('Please note if that session has RememberMe cookie, it will automatic re-login', function(yes) {
            if (yes) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/user/session-logout', {id: id, csrf_token: __tajs.csrf}, function(res) {
                    $this.removeClass('is-loading');
                    if (res.success) {
                        $this.closest('tr').remove();
                    }
                    else {
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                    }
                });
            }
        }, 'info');
    });
    <?php if($this->data->user): ?>
    $('#logout_all').on('click', function() {
        var $this = $(this);
        __tajs.showConfirm('Are you sure? All sessions, include current one, will be logged out', function(yes) {
            if (yes) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/user/session-mass-logout?user_id=<?=$this->data->user->id?>', {csrf_token: __tajs.csrf}, function(res) {
                    $this.removeClass('is-loading');
                    if (res.success) {
                        window.location.replace('/auth/logout');
                    }
                    else {
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                    }
                });
            }
        });
    });
    <?php endif; ?>
});
</script>