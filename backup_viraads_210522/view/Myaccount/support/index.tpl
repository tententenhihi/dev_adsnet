

<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Support Tickets</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                                <a class="dropdown-item" href="/support/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                <input id="txtfilter" type="text" class="form-control" placeholder="Search" aria-label="filter" value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light" type="button" id="btn-filter"><i class="feather icon-search"></i> Search</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <a href="/support/create" class="btn btn-outline-success mb-1">
                                        <i class="fa fa-ticket "></i> New ticket
                                    </a>
                                </div>
                            </div>
                        </div>
                                        
                        <?php if($this->data->data): ?>
                        <div class="activity">
                            <ul class="list-group list-group-flush">
                                <?php foreach($this->data->data as $item): ?>
                                <li class="list-group-item">
                                    <span class="date"><?=$item->created_at?></span> 
                                    <span style="width: 70px" class="mr-1 badge status badge-<?php if($item->status == 'Opening'): ?>info<?php elseif($item->status == 'Replied'): ?>success<?php else: ?>warning<?php endif; ?>"><?=ucwords($item->status)?></span>
                                    
                                    <a class="text-info subject" href="/support/ticket/<?=$item->id?>"><?=ucwords($item->service)?>: <?=$item->subject?></a>
                                    <span class="updated_at pull-right"><?=$item->updated_at?:'Never'?></span>
                                </li>
                                <?php endforeach; ?>
                            </ul>
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
/* global $ */
$(document).ready(function() {
    $('#btn-filter').on('click', function() {
        var val = $.trim($('#txtfilter').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
});
</script>