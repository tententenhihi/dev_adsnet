
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between ">
                    <h4 class="card-title">Announcements</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->service?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->services as $service): ?>
                                <a class="dropdown-item" href="/announcement/<?=strtolower($service)?><?=$this->arg?>"><?=$service?></a>
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
                        <div class="media-list border rounded mb-1">
                            <?php foreach($this->data->data as $item): ?>
                                <div class="media">
                                   <div class="media-body">
                                        <div class="d-flex justify-content-between">
                                        <h5>
                                            <span class="badge badge-info"><?=ucwords($item->service)?></span>
                                            <span class="media-heading"><?=$item->subject?></span>
                                        </h5>
                                        <p class="mb-0">
                                            <i class="feather icon-clock"></i>
                                            <span class="mt-1 text-italic"><?=$item->created_at?></span>
                                        </p>
                                        </div>
                                        <p class="mb-1">
                                            <?=nl2br($item->description)?>
                                        </p>
                                        <?php if($item->is_long): ?>
                                        <p class="mb-0 read_full">
                                            <button class="btn btn-outline-<?=$item->type?> read_more" data-id="<?=$item->id?>">
                                                <span>Read more</span>
                                                <i class="feather icon-chevron-right"></i>
                                            </button>
                                        </p>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                            </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>No Record Found</p>
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
    $('.read_more').on('click', function() {
        var $this = $(this), id = $this.attr('data-id');
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/announcement/content/'+id, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                $this.parent().html(res.data.replace(/\n/g,"<br>"));
            }
        });
    });
});
</script>