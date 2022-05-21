<style>
    .table-responsive .badge{
        min-width: 70px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->pub_balance + $this->data->balance->pub_pending*$this->data->revshare)?></h2>
                        <p>Publisher</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->adv_balance)?></h2>
                        <p>Advertiser</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->receipt_value)?></h2>
                        <p>Spent</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-money text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->withdraw_value)?></h2>
                        <p>Withdrawn</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-credit-card text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">Balance</h4>
                    <p class="font-medium-5 mb-0"><a href="/billing/balance"><i class="feather icon-chevrons-right "></i></a></p>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <?php if($this->data->history): ?>
                        <div class="table-responsive mb-1">
                            <table class="table table-striped mb-0">
                                <thead>
                                    <tr>
                                        <th>Ref. Date</th>
                                        <th>Service</th>
                                        <th>Amount</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($this->data->history as $item): ?>
                                    <tr>
                                        <td>
                                            <span class="adate"><?=$item->created_at?></span> 
                                        </td>
                                        <td>
                                        <span class="badge <?php if($item->service == 'Advertiser'): ?>badge-success<?php else: ?>badge-warning<?php endif; ?> atype"><?=$item->service?></span> 
                                        </td>
                                        <td>
                                        <?php if($item->amount < 0): ?>
                                            <?php $item->amount = -1*$item->amount; ?>
                                            <span class="text-danger aip">- <?=$this->helper->currencyFormat($item->amount)?></span>
                                            <?php else: ?>
                                            <span class="text-success aip">+ <?=$this->helper->currencyFormat($item->amount)?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td> <span ><?=$item->description?></span></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                            
                        </div>

                        <?php else: ?>
                        <div class="row">
                            <div class="col-12">
                                <div class="text-center">
                                    <p class="title is-6 ">No data found!</p>
                                    <p class="subtitle is-6 "><a href="/billing/deposit">Deposit</a> some money to start advertising</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">Withdraw</h4>
                    <p class="font-medium-5 mb-0"><a href="/billing/withdraw/history"><i class="feather icon-chevrons-right "></i></a></p>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <?php if($this->data->withdraw): ?>
                        <div class="table-responsive">
                            <table class="table table-striped mb-0">
                                <thead>
                                    <tr>
                                        <th style="width:100px">Status</th>
                                        <th>ID</th>
                                        <th>Method</th>
                                        <th>Amount</th>
                                        <th>Transaction ID</th>
                                        <th>Description</th>
                                        <th><span  class="is-pulled-right">Created Date</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($this->data->withdraw as $item): ?>
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
                                        <td><span  class="is-pulled-right"><?=$item->created_at?></span></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="row">
                            <div class="col-12">
                                <div class="text-center">
                                    <p class="title is-6 ">No data found</p>
                                    <p class="subtitle is-6 ">Want to get some cash? <a href="/billing/withdraw">Withdraw Now</a></p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">Deposit</h4>
                    <p class="font-medium-5 mb-0"><a href="/billing/deposit/history"><i class="feather icon-chevrons-right "></i></a></p>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <?php if($this->data->deposit): ?>
                        <div class="table-responsive">
                            <table class="table table-striped mb-0">
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
                                <?php foreach($this->data->deposit as $item): ?>
                                    <tr>
                                        <td>
                                            <a class="is-pulled-left" href="/billing/invoice/<?=$item->id?>"><?=$item->id?></a>
                                        </td>
                                        <td><span class="badge badge-info"><?=$item->paygate_name?></span></td>
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
                        </div>
                        <?php else: ?>
                        <div class="row">
                            <div class="col-12">
                                <div class="text-center">
                                    <p >No data found</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">Receipts</h4>
                    <p class="font-medium-5 mb-0"><a href="/billing/receipt"><i class="feather icon-chevrons-right "></i></a></p>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <?php if($this->data->receipt): ?>
                    <div class="table-responsive">
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
                                <?php foreach($this->data->receipt as $item): ?>
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
                    <?php else: ?>
                    <div class="row">
                        <div class="col-12">
                            <div class="text-center">
                                <p >No data found</p>
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
