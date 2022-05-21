<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Balance</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->service?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->services as $service): ?>
                                <a class="dropdown-item" href="/billing/balance/<?=strtolower($service)?><?=$this->arg?>"><?=$service?></a>
                            <?php endforeach; ?>
                            
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    
                    <div class="card-body card-dashboard">
                        
                        
                                        
                        <?php if($this->data->data): ?>
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
                                    <?php foreach($this->data->data as $item): ?>
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
                        <?=$this->data->pagination?>
                        <?php else: ?>
                        <div class="hero">
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
