<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Activities</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->service?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            
                            <?php foreach($this->data->services as $service): ?>
                                <a class="dropdown-item" href="/notification/<?=strtolower($service)?><?=$this->arg?>"><?=$service?></a>
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
                                                <input id="txtfilter" type="text" class="form-control" placeholder="Search" aria-label="filter" value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light" type="button" id="btn-filter"><i class="feather icon-search"></i> Search</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                                        
                        <?php if($this->data->data): ?>
                        <div class="activity">
                            <?php foreach($this->data->data as $item): ?>
                            <article class="message mnoti is-<?=$item->type?>">
                                <div class="message-body">
                                    <a href="javascript:__tajs.readNotification(<?=$item->id?>);">
                                        <small class="pull-right is-hidden-mobile"><?=$item->created_at?></small>
                                        <?php if(!$item->is_read): ?><strong><?php endif; ?>
                                        <?=$item->title?>
                                        <?php if(!$item->is_read): ?></strong><?php endif; ?>
                                    </a>
                                </div>
                            </article>
                            <?php endforeach; ?>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
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
    $('#btn-filter').on('click', function() {
        var val = $.trim($('#txtfilter').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('#mark_all_read').click(function() {
        var $this = $(this);
        __tajs.showConfirm('All your unread notifications will be marked as read, Are you sure?', function(yes){
           if(yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/notification/read-all', {csrf_token: __tajs.csrf}, function(res) {
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