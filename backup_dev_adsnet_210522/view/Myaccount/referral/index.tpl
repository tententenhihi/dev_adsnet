<div class="content-body">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div>
                        <ul>
                            <li>When someone signs up as a publisher and does so using your link, you will earn a <?=REFERRAL_COMMISSION*100?>% commission on all of his future revenue</li>
                            <li>This is a lifetime commission, which means you can keep growing a revenue by simply referring people to our network</li>
                            <li>Our referral cookie valids for 90 days long</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="flex-wrap: wrap">
        <div class="col-lg-3 col-sm-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <div class="card-body">
                    <div>
                        Referral Code: <strong><?=$this->data->referral_code?></strong>
                    </div>
                    <div>
                        Link: <strong><?=$this->data->referral_url?></strong>
                    </div>
                    <div>
                        <span>Copy this link and send to your referral to signup</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12 mb-2 hidden">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0" style="padding-top: 33px;">
                    <div>
                        <h2 class="text-bold-700 mt-0"></h2>
                        <p>Active Referrals</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12 mb-2 hidden">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0" style="padding-top: 33px;">
                    <div>
                        <h2 class="text-bold-700 mt-0"></h2>
                        <p>Pending Referrals</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12 mb-2 hidden">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0" style="padding-top: 33px;">
                    <div>
                        <h2 class="text-bold-700 mt-0"></h2>
                        <p> Total Earned</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-usd text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="card-title">Referrals</h4>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            
                            <?php foreach($this->data->statuses as $status): ?>
                                <a class="dropdown-item" href="/referral/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Joined At</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Earned</th>
                                        <th scope="col">Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                    <tr data-id="<?=$item->id?>">
                                        <td>
                                            <span><?=$item->name?></span>
                                        </td>
                                        <td><?=$item->email?></td>
                                        <td><?=$item->created_at?></td>
                                        <td class="api_status">
                                            <?php if($item->status == 'Pending'): ?><span class="badge badge-warning">Pending</span>
                                            <?php elseif($item->status == 'Cancelled'): ?><span class="badge badge-danger">Cancelled</span>
                                            <?php else: ?><span class="badge badge-success">Earning</span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <?php if($item->amount): ?>
                                            <a href="/referral/<?=$item->id?>"><?=$this->helper->currencyFormat($item->amount)?> - <?=$item->payment?> Payments</a>
                                            <?php else: ?>
                                            $0.00
                                            <?php endif; ?>
                                        </td>
                                        <td><?=$item->description?:'Not Available'?></td>
                                        
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                            <?=$this->data->pagination?>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>Become our partner and receive profit for each active attracted client</p>
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

<div class="modal" id="howtoModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <section class="modal-card-body">
            <div class="field has-addons">
                <div class="control">
                    <button class="button is-light is-info is-transparent is-hidden-mobile" id="referral_btn">Your referral url</button>
                </div>
                <div class="control is-expanded">
                    <input id="referral_url" class="input is-static" type="text" value="<?=$this->data->referral_url?>" readonly>
                </div>
            </div>
            <div class="content">
                <ul>
                    <li class="text-muted">When someone signs up as a publisher and does so using your link, you will earn a <?=REFERRAL_COMMISSION*100?>% commission on all of his future revenue</li>
                    <li class="text-muted">This is a lifetime commission, which means you can keep growing a revenue by simply referring people to our network</li>
                    <li class="text-muted">Our referral cookie valids for 90 days long</li>
                </ul>
            </div>
            <div class="buttons is-centered pt-1">
                <button class="button is-success btn-close enterAction">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                        </svg>
                    </span>
                    <span>Got it</span>
                </button>
                <button class="button is-light btn-close">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                        </svg>
                    </span>
                    <span>Close</span>
                </button>
            </div>
        </section>
    </div>
    <button class="modal-close is-large"></button>
</div>
<script>
/* global $ */
$(document).ready(function() {
    $('#btn-filter').on('click', function() {
        var val = $.trim($('#txtfilter').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('#howto').on('click', function() {
        $('#howtoModal').toggleClass('is-active');
    });
    $('#referral_url, #referral_btn').on('click', function() {
        $('#referral_url').focus().select();
    })
});
</script>