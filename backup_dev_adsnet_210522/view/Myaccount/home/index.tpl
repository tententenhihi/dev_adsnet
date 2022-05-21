<style>
    .table-container .badge{
        width: 70px;
    }
</style>
<div class="content-body">
    <!-- Dashboard Ecommerce Starts -->
    <section id="dashboard-ecommerce">
        <div class="row">
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="card">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div>
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->balance->pub_balance + $this->data->balance->pub_pending*$this->data->revshare)?></h2>
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
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->balance->adv_balance)?></h2>
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
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->balance->receipt_value)?></h2>
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
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->balance->withdraw_value)?></h2>
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
            <div class="col-lg-12 col-md-12 col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-end">
                        <h4 class="card-title">Latest Announcements</h4>
                        <p class="font-medium-5 mb-0">
                            <a href="/announcement"><i class="feather icon-chevrons-right "></i></a>
                        </p>
                    </div>
                    <div class="card-content">
                        <div class="card-body pb-0" style="position: relative;">
                            <?php if($this->data->announcement): ?>
                            <?php foreach($this->data->announcement as $item): ?>
                            <div class="message is-<?=$item->type?>">
                                <div class="message-body">
                                    <strong><?=ucwords($item->service)?>: <?=$item->subject?></strong><br>
                                    <p><i><?=$item->created_at?></i></p>
                                    <p><?=nl2br($item->description)?></p>
                                    <?php if($item->is_long): ?>
                                    <p class="read_full pt-1">
                                        <button class="btn btn-<?=$item->type?> read_more" data-id="<?=$item->id?>">
                                            <span>Read more</span>
                                            <i class="feather icon-chevrons-right "></i>
                                        </button>
                                    </p>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <?php endforeach; ?>
                            <?php else: ?>
                            <div class="hero">
                                <div class="hero-body">
                                    <div class="text-center">
                                        <p class="title is-6">You're All Caught Up</p>
                                        <p class="subtitle is-6">You have seen all new announcements from us</p>
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
            <div class="col-lg-12 col-md-12 col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-end">
                        <h4 class="mb-0">Latest Support</h4>
                        <p class="font-medium-5 mb-0"><a href="/support"><i class="feather icon-chevrons-right "></i></a></p>
                    </div>
                    <div class="card-content">
                        <div class="card-body px-0 pb-0" style="position: relative;">
                            <?php if($this->data->support): ?>
                            <div class="table-container">
                                <table class="table is-striped is-fullwidth">
                                    <thead>
                                        <tr>
                                            <th style="width:70px"><span>Status</span></th>
                                            <th>Subject</th>
                                            <th><span>Last Update</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach($this->data->support as $item): ?>
                                        <tr>
                                            <td style="width:70px">
                                                <?php if($item->status == 'Opening'): ?>
                                                <span class="badge badge-primary">Opening</span>
                                                <?php elseif($item->status == 'Replied'): ?>
                                                <span class="badge badge-success">Replied</span>
                                                <?php else: ?>
                                                <span class="badge badge-warning">Closed</span>
                                                <?php endif; ?>
                                            </td>
                                            <td><a href="/support/ticket/<?=$item->id?>" class="text-overflow"><?=$item->subject?></a></td>
                                            <td><span><?=$item->updated_at?:'Never'?></span></td>
                                        </tr>
                                    <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                            <?php else: ?>
                            <div class="hero card-content">
                                <div class="hero-body card-body card-dashboard pt-0">
                                    <div class="text-center">
                                        <p class="title is-6">Need help? Have suggestions?</p>
                                        <p class="subtitle is-6">Our support department is right here. <a href="/support/create">Ask now</a></p>
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
            <div class="col-lg-12 col-md-12 col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-end">
                        <h4 class="card-title">Balance History</h4>
                        <p class="font-medium-5 mb-0"><a href="/billing/balance"><i class="feather icon-chevrons-right "></i></a></p>
                    </div>
                    <div class="card-content">
                        <div class="card-body pb-0" style="position: relative;">
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
                                            <td> <span><?=$item->description?></span></td>
                                        </tr>
                                    <?php endforeach; ?>
                                    </tbody>
                                </table>

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

            <div class="col-lg-12 col-md-12 col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-end">
                        <h4 class="card-title">Latest Activities</h4>
                        <p class="font-medium-5 mb-0"><a href="/activity"><i class="feather icon-chevrons-right "></i></a></p>
                    </div>
                    <div class="card-content">
                        <div class="card-body" style="position: relative;">
                         <?php if($this->data->activity): ?>
                            <div class="table-responsive">
                            <ul class="list-group list-group-flush">
                                <?php foreach($this->data->activity as $item): ?>
                                <li class="list-group-item d-list-item" style="display: flex;align-items: center;line-height: 35px;flex-wrap: wrap">
                                    <span class="date"><?=$item->created_at?></span>
                                    <span class="account-type badge badge-primary badge-md mr-1 <?php if($item->type == 'Account'): ?>badge-info<?php else: ?>badge-success<?php endif; ?> atype"><?=$item->type?></span>
                                    <span class="ip text-info aip"><a href="/activity?q=<?=$item->ip_address?>"><?=$item->ip_address?></a></span>
                                    <span><?=$item->message?></span>
                                </li>
                                <?php endforeach; ?>
                            </ul>

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
    </section>
    <!-- Dashboard Ecommerce ends -->
</div>
      
<script>
/* global $, __tajs */
$(document).ready(function() {
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