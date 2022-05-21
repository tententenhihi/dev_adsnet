
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Receipts history</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->type?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->types as $type): ?>
                                <a class="dropdown-item" href="/billing/receipt/<?=strtolower($type)?><?=$this->arg?>"><?=$type?></a>
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
                                                <input id="txtfilter" type="text" class="form-control" placeholder="campaign id, ad id" aria-label="filter" value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button  class="btn btn-primary waves-effect waves-light" type="button" id="btn-filter"><i class="feather icon-search"></i> Search</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                        
                                    </div>
                                    
                                    
                                </div>
                            </div>
                        </div>
                                        
                        <?php if($this->data->data): ?>
                        <div class="table-responsive mb-1">
                            <table class="table table-striped mb-0">
                                <thead>
                                    <tr>
                                        <th style="width:100px"><span  class="is-pulled-left">ID</span></th>
                                        <th>Type</th>
                                        <th>Amount</th>
                                        <th>Description</th>
                                        <th><span class="is-pulled-right">Created Date</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($this->data->data as $item): ?>
                                    <tr>
                                        <td><span class="is-pulled-left"><?=$item->id?></span></td>
                                        <td>
                                            <?php if($item->type == 'Automatic'): ?>
                                            <span class="badge badge-success">Automatic</span>
                                            <?php else: ?>
                                            <span class="badge badge-warning">Manual</span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                        <td><?=$item->description?:'Not Available'?></td>
                                        <td><span class="is-pulled-right"><?=$item->created_at?></span></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?=$this->data->pagination?>
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
            
        </div>
    </div>

    
</div>

<script>
/* global $ */
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 1) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
});
</script>