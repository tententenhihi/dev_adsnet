<style>
    table .badge{
        min-width: 70px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-12">
            <div class="alert alert-info">
                <ul>
                    <li>When someone signs up as a publisher and does so using your link, you will earn a <?=REFERRAL_COMMISSION*100?>% commission on all of his future revenue</li>
                    <li>This is a lifetime commission, which means you can keep growing a revenue by simply referring people to our network</li>
                    <li>Our referral cookie valids for 90 days long</li>
                </ul>
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
        <div class="col-lg-3 col-sm-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mt-0"><?= $this->helper->numberFormat($this->data->active_referrals) ?></h2>
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
        <div class="col-lg-3 col-sm-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mt-0"><?= $this->helper->numberFormat($this->data->pending_referrals) ?></h2>
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
        <div class="col-lg-3 col-sm-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mt-0"><?= $this->helper->currencyFormat($this->data->total_earned) ?></h2>
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
                <div class="card-header d-flex justify-content-between align-items-center mb-1">
                    <div class="d-flex justify-content-between flex-wrap">
                        <div class="d-flex flex-wrap">
                            <fieldset>
                                <div class="input-group">
                                    <input id="txtfilter" type="text" class="form-control" placeholder="Search" aria-label="filter" value="<?=$this->data->key?>">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button" id="btn-filter"><i class="feather icon-search"></i> Search</button>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                            <?php else: ?><span class="badge badge-success">Active</span>
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


<script>
/* global $ */
$(document).ready(function() {
    $('#btn-filter').on('click', function() {
        var val = $.trim($('#txtfilter').val());
        if (val.length === 0) {
            window.location.href = window.location.pathname + '?q=';
        }
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
});
</script>