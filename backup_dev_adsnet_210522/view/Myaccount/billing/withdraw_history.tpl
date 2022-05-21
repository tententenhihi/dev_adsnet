<style>
    @media only screen and (max-width: 576px) {
        #logout_all{
            margin-top: 20px;
        }
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Withdrawal history</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                                <a class="dropdown-item" href="/billing/balance/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                <input id="txtfilter" type="text" class="form-control" placeholder="Transaction ID" aria-label="filter" value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button  class="btn btn-primary waves-effect waves-light" type="button" id="btn-filter"><i class="feather icon-search"></i> Search</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                        
                                    </div>

                                    <a href="/billing/withdraw" class="btn btn-outline-success" id="logout_all">
                                        <i class="feather icon-credit-card "></i> Withdraw Now
                                    </a>
                                </div>
                            </div>
                        </div>
                                        
                        <?php if($this->data->data): ?>
                        <div class="table-responsive mb-1">
                            <table class="table table-striped mb-0">
                                <thead>
                                    <tr>
                                        <th style="width:100px">Status</th>
                                        <th>ID</th>
                                        <th>Method</th>
                                        <th>Amount</th>
                                        <th>Transaction ID</th>
                                        <th>Description</th>
                                        <th><span>Created Date</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($this->data->data as $item): ?>
                                    <tr>
                                        <td>
                                            <?php if($item->status == 'Paid'): ?>
                                            <span class="badge badge-success">Paid</span>
                                            <?php elseif($item->status == 'Pending'): ?>
                                            <span class="badge badge-warning">Pending</span>
                                            <?php else: ?>
                                            <span class="badge badge-danger">Cancelled</span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?=$item->id?></td>
                                        <td><span class="badge badge-info"><?=$item->paygate_name?></span></td>
                                        <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                        <td><?=$item->transaction?:'Not Available'?></td>
                                        <td><?=$item->description?:'Not Available'?></td>
                                        <td><span><?=$item->created_at?></span></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?=$this->data->pagination?>
                        <?php else: ?>
                        <div class="hero mt-1">
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
    $('#btn-filter').on('click', function() {
        var val = $.trim($('#txtfilter').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
});
</script>