<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Deposit History</h4> 
                        <a class="btn btn-icon btn-outline-primary btn-header" href="/billing/deposit" tabindex="0"><span><i class="feather icon-plus"></i> Deposit Now</span></a>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                                <a class="dropdown-item" href="/billing/deposit/history/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                <input id="txtfilter" type="text" class="form-control" placeholder="Token" aria-label="filter" value="<?=$this->data->key?>">
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
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Method</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Transaction ID</th>
                                        <th scope="col">Status</th>
                                         <th>Description</th>
                                        <th scope="col">Created Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                    <tr>
                                        <td>
                                            <a class="is-pulled-left" href="/billing/invoice/<?=$item->id?>"><?=$item->id?></a>
                                        </td>
                                        <td><span class="tag is-info"><?=$item->paygate_name?></span></td>
                                        <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                        <td><?=$item->transaction?:'Not Available'?></td>
                                        <td>
                                            <?php if($item->status == 'Paid'): ?>
                                            <span class="badge badge-success">Paid</span>
                                            <?php elseif($item->status == 'Unpaid'): ?>
                                            <span class="badge badge-warning">Unpaid</span>
                                            <?php else: ?>
                                            <span class="badge badge-danger"><?=$item->status?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?=$item->description?:'Not Available'?></td>
                                        <td><span  class="is-pulled-right"><?=$item->created_at?></span></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                            <?=$this->data->pagination?>
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