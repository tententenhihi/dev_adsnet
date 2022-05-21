

<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Sessions</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                                <a class="dropdown-item" href="/session/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
                            <?php endforeach; ?>
                            
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    
                    <div class="card-body card-dashboard">
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="ag-grid-btns d-flex justify-content-between flex-wrap">
                                    
                                    <div class="ag-btns d-flex flex-wrap mb-1">
                                        <fieldset>
                                            <div class="input-group">
                                                <input id="txtfilter" type="text" class="form-control" placeholder="IP Address" aria-label="filter" value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button  class="btn btn-primary waves-effect waves-light" type="button" id="btn-filter"><i class="feather icon-search"></i> Search</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                        
                                    </div>
                                    
                                    <button class="btn btn-danger mb-1" id="logout_all">
                                        <i class="feather icon-power "></i> Logout All
                                    </button>
                                </div>
                            </div>
                        </div>
                                        
                        <?php if($this->data->data): ?>
                        <div class="activity mb-1">
                            <ul class="list-group list-group-flush">
                                <?php foreach($this->data->data as $item): ?>
                                <li class="list-group-item">
                                    <div class="d-flex justify-content-between flex-wrap" style="line-height: 25px;align-items: center;">
                                        <div class="mb-1">
                                            <span style="width: 65px;" class="mr-1 badge badge-<?php if($item->status == 'Active'): ?>success<?php else: ?>danger<?php endif; ?>"><?=$item->status?></span>
                                            <span class="mr-1"><?=$item->browser?></span>
                                            <span class="ip text-info"><a href="/activity?q=<?=$item->ip_address?>"><?=$item->ip_address?></a></span>
                                            (<span><?=$item->country?></span>)
                                            <br>
                                            <span class="mr-1">Loged in at:  <?=$item->created_at?></span>
                                            <span class="date">Remember: <?php if($item->is_remember): ?>Yes<?php else: ?>No<?php endif; ?></span>
                                        </div>
                                        <div class="mb-1">
                                            <?php if($item->session_id == $this->data->currentId): ?>
                                            <a class="btn btn-danger" href="/auth/logout">
                                                <i class="feather icon-power "></i>
                                                <span>Logout</span>
                                            </a>
                                            <?php else: ?>
                                            <button class="btn btn-danger btn-logout" data-id="<?=$item->id?>"<?php if($item->status !== 'Active'): ?> disabled<?php endif; ?>>
                                                <i class="feather icon-power "></i>
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
                        <div class="hero">
                            <div class="hero-body">
                                <div class="has-text-centered">
                                    <p>No Records</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>

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
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('.btn-logout').on('click', function() {
        var $this = $(this), id = $this.attr('data-id');
        __tajs.showConfirm('Please note if that session has RememberMe cookie, it will automatic re-login', function(yes) {
            if (yes) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/session/logout', {id: id, csrf_token: __tajs.csrf}, function(res) {
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
    $('#logout_all').on('click', function() {
        var $this = $(this);
        __tajs.showConfirm('Are you sure? All sessions, include current one, will be logged out', function(yes) {
            if (yes) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/session/mass-logout', {csrf_token: __tajs.csrf}, function(res) {
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
});
</script>