<style>
.card-content {
    padding-top: 1rem;
}
.user-btn {
    position: absolute;
    /*right: 20px;*/
    top: 20px;
    right: -10px;
}
.is-more {
    padding-top: 0;
    padding-right: 0;
    margin-top: -.5rem;
}
.user-permission {
    position: absolute;
    width: 140px;
    height: 140px;
    overflow: hidden;
    top: -5px;
    left: -5px;
}
.user-permission::before,
.user-permission::after {
    position: absolute;
    z-index: -1;
    content: '';
    display: block;
    border: 5px solid #009dff;
    border-top-color: transparent;
    border-left-color: transparent;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
}
.user-permission span {
    width: 210px;
    transform: rotate(-45deg);
    position: absolute;
    display: block;
    padding: 5px 0;
    background-color: #009dff;
    color: #fff;
    box-shadow: 0 5px 10px rgba(0,0,0,.1);
    text-align: center;
    cursor: pointer;
    right: -26px;
    top: 43px;
}
.user-wrap {
    display: flex;
    flex-direction: column;
    text-align: center;
    padding: .5rem;
}
.user-avatar {
    position: relative;
    width: 80px;
    height: 80px;
    margin: 0 auto;
    margin-bottom: 1rem;
}
.user-status-admin {
    border-radius: 10px;
    border-color: transparent;
    background-color: #586e75;
    height: 14px;
    width: 14px;
    transition: background-color .5s linear;
    position: absolute;
    top: -5px;
    right: -5px;
    box-shadow: 0 0 24px 0 rgba(0,0,0,.06), 0 1px 0 0 rgba(0,0,0,.02);
}
.user-status-admin.is-warning {
    background-color: #ffdd57;
}
.user-status-admin.is-danger {
    background-color: #f14668;
}
.user-status-admin.is-success {
    background-color: #48c774;
}
.user-status-admin.is-info {
    background-color: #3298dc;
}
.user-title {
    font-size: 1rem;
    font-weight: 600;
    line-height: 1.2;
    color: #364a63;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.user-email {
    color: #8094ae;
    font-size: 14px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.tabs-switch {
    color: #3273dc !important;
}
.tabs-disabled {
    cursor: not-allowed;
    color: #d0d8e2 !important;
}
.user-detail li {
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: .9375rem;
    line-height: 1.75rem;
    border-bottom: 1px dashed #c5ceda42;
    color: #526484;
}
.user-detail li span:first-child {
    color: #8094ae;
}
.stars:hover > .star {
    color: #ffdd57;
}
.stars > .star:hover ~ .star {
    color: #8094ae;
}
.stars .star {
    cursor: pointer;
}
.star {
    color: #8094ae;
    margin-right: -.3rem;
}
.star.is-active {
    color: #ffdd57 !important;
}
.tabs {
    /*-webkit-overflow-scrolling: touch;*/
    align-items: stretch;
    display: flex;
    font-size: 1rem;
    justify-content: space-between;
    overflow: hidden;
    white-space: nowrap;
}

.tabs ul {
    align-items: center;
    /*border-bottom-color: #dbdbdb;*/
    /*border-bottom-style: solid;*/
    /*border-bottom-width: 1px;*/
    display: flex;
    flex-grow: 1;
    flex-shrink: 0;
    justify-content: flex-start;
}
ul {
    list-style: none;
}
.tabs.is-fullwidth li {
    flex-grow: 1;
    flex-shrink: 0;
}
.tabs li {
    display: block;
}
.tabs li.is-active a {
    border-bottom-color: #3273dc;
    color: #3273dc;
    border-bottom-style: solid;
}
.tabs a {
    align-items: center;
    border-bottom-color: #dbdbdb;
    border-bottom-style: solid;
    border-bottom-width: 1px;
    color: #4a4a4a;
    display: flex;
    justify-content: center;
    margin-bottom: -1px;
    padding: 0.5em 1em;
    vertical-align: top;
}
.tabs-switch {
    color: #3273dc !important;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">All User</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->statuses as $status): ?>
                            <a class="dropdown-item"
                               href="/user/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                <input id="search" type="text" class="form-control"
                                                       placeholder="Search" aria-label="filter"
                                                       value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light"
                                                            type="button" id="enterAction"><i
                                                                class="feather icon-search"></i> Search
                                                    </button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row is-multiline mb-1" id="results">
                <?php if($this->data->data): ?>
                <?php foreach($this->data->data as $item): ?>
                <div class="col-lg-3 col-sm-6 col-md-4 col-12">
                    <div class="card is-100height">
                        <div class="card-body" data-id="<?=$item->id?>" data-name="<?=htmlspecialchars($item->name, ENT_QUOTES, 'UTF-8')?>">
                            <div class="user-btn">

                                <div class="content-header-right col-md-3 col-12 ">
                                    <div class="form-group breadcrum-right">
                                        <div class="dropdown">
                                            <button class="button is-more btn-icon btn btn-default btn-round btn-sm dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-controls="dropdown-item-<?=$item->id?>">
                                                    <span class="icon">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor"
                                                                  d="M12,16A2,2 0 0,1 14,18A2,2 0 0,1 12,20A2,2 0 0,1 10,18A2,2 0 0,1 12,16M12,10A2,2 0 0,1 14,12A2,2 0 0,1 12,14A2,2 0 0,1 10,12A2,2 0 0,1 12,10M12,4A2,2 0 0,1 14,6A2,2 0 0,1 12,8A2,2 0 0,1 10,6A2,2 0 0,1 12,4Z"></path>
                                                        </svg>
                                                    </span>
                                            </button>

                                            <div class="dropdown-menu dropdown-menu-right" id="dropdown-item-<?=$item->id?>" role="menu">
                                                <div class="dropdown-content">
                                                    <a class="dropdown-item text-info btn-support">
                                                        <i class="fa fa-ticket"></i>
                                                        <span>Open Ticket</span>
                                                    </a>
                                                    <?php if($item->phone): ?>
                                                    <a class="dropdown-item text-info btn-sms">
                                                        <i class="fa fa-comments-o"></i>
                                                        <span>Send SMS</span>
                                                    </a>
                                                    <?php endif; ?>
                                                    <a class="dropdown-item text-info btn-email">
                                                        <i class="feather icon-mail"></i>
                                                        <span>Send Email</span>
                                                    </a>
                                                    <a class="dropdown-item text-info btn-notification">
                                                        <i class="fa fa-bell-o"></i>
                                                        <span>New Notification</span>
                                                    </a>
                                                    <a class="dropdown-item text-danger btn-login">
                                                        <i class="feather icon-log-in"></i>
                                                        <span>Login as User</span>
                                                    </a>
                                                    <?php if($item->status == 'Active'): ?>
                                                    <a class="dropdown-item text-danger btn-ban">
                                                        <i class="feather icon-user-x"></i>
                                                        <span>Ban User</span>
                                                    </a>
                                                    <?php elseif($item->status == 'Inactive'): ?>
                                                    <a class="dropdown-item text-success btn-active">
                                                        <i class="feather icon-user-check"></i>
                                                        <span>Activate User</span>
                                                    </a>
                                                    <a class="dropdown-item text-danger btn-ban">
                                                        <i class="feather icon-user-x"></i>
                                                        <span>Ban User</span>
                                                    </a>
                                                    <?php else: ?>
                                                    <a class="dropdown-item text-success btn-active">
                                                        <i class="feather icon-user-check"></i>
                                                        <span>Activate User</span>
                                                    </a>
                                                    <?php endif; ?>
                                                    <a class="dropdown-item text-danger btn-permission">
                                                        <i class="feather icon-user-plus"></i>
                                                        <span>Update Permission</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if($item->permission): ?>
                            <div class="user-permission">
                                <span><?=$item->permission?></span>
                            </div>
                            <?php endif; ?>
                            <a class="user-wrap" href="/user/profile?user_id=<?=$item->id?>" target="_blank">
                                <div class="user-avatar">
                                    <img src="https://www.gravatar.com/avatar/<?=md5($item->email)?>" class="rounded-circle">
                                    <?php if($item->status == 'Active'): ?>
                                    <div class="user-status-admin is-success"></div>
                                    <?php elseif($item->status == 'Inactive'): ?>
                                    <div class="user-status-admin is-warning"></div>
                                    <?php else: ?>
                                    <div class="user-status-admin is-danger"></div>
                                    <?php endif; ?>
                                </div>
                                <div class="user-title"><?=$item->id?> - <?=$item->name?></div>
                                <div class="user-email"><?=$item->email?></div>
                            </a>
                            <div class="tabs is-fullwidth" >
                                <ul style="padding-left: 0px;">
                                    <li class="is-active"><a class="tabs-switch" data-id="<?=$item->id?>" data-tab="general">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24" style="width: 18px">
                                            <path fill="currentColor" d="M2,3H22C23.05,3 24,3.95 24,5V19C24,20.05 23.05,21 22,21H2C0.95,21 0,20.05 0,19V5C0,3.95 0.95,3 2,3M14,6V7H22V6H14M14,8V9H21.5L22,9V8H14M14,10V11H21V10H14M8,13.91C6,13.91 2,15 2,17V18H14V17C14,15 10,13.91 8,13.91M8,6A3,3 0 0,0 5,9A3,3 0 0,0 8,12A3,3 0 0,0 11,9A3,3 0 0,0 8,6Z" />
                                        </svg>
                                    </span>
                                        </a></li>
                                    <?php if($item->first_zone): ?>
                                    <li><a class="tabs-switch" data-id="<?=$item->id?>" data-tab="pub">Publisher</a></li>
                                    <?php else: ?>
                                    <li><a class="tabs-disabled">Publisher</a></li>
                                    <?php endif; ?>
                                    <?php if($item->first_ad): ?>
                                    <li><a class="tabs-switch" data-id="<?=$item->id?>" data-tab="adv">Advertiser</a></li>
                                    <?php else: ?>
                                    <li><a class="tabs-disabled">Advertiser</a></li>
                                    <?php endif; ?>
                                </ul>
                            </div>
                            <ul class="user-detail user-detail-<?=$item->id?>" id="general-<?=$item->id?>" style="padding-left: 0px;">
                                <li>
                                    <span>Join</span>
                                    <span><?=$item->created_at?></span>
                                </li>
                                <li>
                                    <span>Phone</span>
                                    <?php if($item->phone): ?>
                                    <a href="tel:<?=str_replace(' ', '', $item->phone)?>"><?=$item->phone?></a>
                                    <?php else: ?>
                                    <span>Not available</span>
                                    <?php endif; ?>
                                </li>
                                <li>
                                    <span>Birthday</span>
                                    <span><?=$item->birthday?:'Not available'?></span>
                                </li>
                                <li>
                                    <?php if($item->chat_account): ?>
                                    <?php $chat_prefix = explode(':', $item->chat_account)[0]; ?>
                                    <?php $chat_account = trim(str_replace($chat_prefix.':', '', $item->chat_account)); ?>
                                    <span><?=$chat_prefix?></span>
                                    <span class="text-success"><?=$chat_account?></span>
                                    <?php else: ?>
                                    <span>Chat Account</span>
                                    <span class="text-danger">Not Available</span>
                                    <?php endif; ?>
                                </li>
                                <li>
                                    <span>Timezone</span>
                                    <span><?=$item->timezone?></span>
                                </li>
                                <li>
                                    <span>Status</span>
                                    <?php if($item->status == 'Banned'): ?>
                                    <a class="text-danger btn-ban_reason" data-content="<?=htmlspecialchars($item->ban_reason, ENT_QUOTES, 'UTF-8')?>">Banned</a>
                                    <?php elseif($item->status == 'Inactive'): ?>
                                    <span class="text-warning">Incompleted</span>
                                    <?php else: ?>
                                    <span class="text-success">OK</span>
                                    <?php endif; ?>
                                </li>
                                <li>
                                    <span>2FA</span>
                                    <?php if($item->two_factor == 'email'): ?>
                                    <a class="text-success" href="/user/authentication?user_id=<?=$item->id?>" target="_blank">Email</a>
                                    <?php elseif($item->two_factor == 'sms'): ?>
                                    <a class="text-success" href="/user/authentication?user_id=<?=$item->id?>" target="_blank">SMS</a>
                                    <?php elseif($item->two_factor): ?>
                                    <a class="text-success" href="/user/authentication?user_id=<?=$item->id?>" target="_blank">App</a>
                                    <?php else: ?>
                                    <a class="text-danger" href="/user/authentication?user_id=<?=$item->id?>" target="_blank">Disabled</a>
                                    <?php endif; ?>
                                </li>
                                <li>
                                    <span>Subscribed</span>
                                    <?php if($item->is_subscribed): ?>
                                    <span class="text-success">Yes</span>
                                    <?php else: ?>
                                    <span class="text-danger">No</span>
                                    <?php endif; ?>
                                </li>
                                <li>
                                    <span>Features</span>
                                    <a class="text-primary btn-feature" data-id="<?=$item->id?>">Detail</a>
                                </li>
                            </ul>
                            <?php if($item->first_zone): ?>
                            <ul class="user-detail user-detail-<?=$item->id?> hidden" id="pub-<?=$item->id?>" style="padding-left: 0px;">
                                <li>
                                    <span>Join</span>
                                    <span><?=$item->first_zone?></span>
                                </li>
                                <li>
                                    <span>Available</span>
                                    <span><?=$this->helper->currencyFormat($item->pub_balance)?></span>
                                </li>
                                <li>
                                    <span>Pending</span>
                                    <span><?=$this->helper->currencyFormat($item->pub_pending)?></span>
                                </li>
                                <li>
                                    <span>Paid</span>
                                    <span><?=$this->helper->currencyFormat($item->withdraw_value)?></span>
                                </li>
                                <li>
                                    <span>Revshare</span>
                                    <?php if($item->revshare): ?>
                                    <?php if(DEFAULT_REVSHARE <= $item->revshare): ?>
                                    <a class="text-success btn-revshare" data-content="<?=$item->revshare?>"><?=$item->revshare*100?>%</a>
                                    <?php else: ?>
                                    <a class="text-danger btn-revshare" data-content="<?=$item->revshare?>"><?=$item->revshare*100?>%</a>
                                    <?php endif; ?>
                                    <?php else: ?>
                                    <a class="text-primary btn-revshare" data-content=""><?=DEFAULT_REVSHARE*100?>%</a>
                                    <?php endif; ?>
                                </li>
                                <li>
                                    <span>Websites</span>
                                    <a class="text-primary" href="/publisher/website?user_id=<?=$item->id?>" target="_blank"><?=$this->helper->numberFormat($item->abs_website)?></a>
                                </li>
                                <li>
                                    <span>Zones</span>
                                    <a class="text-primary" href="/publisher/zone?user_id=<?=$item->id?>" target="_blank"><?=$this->helper->numberFormat($item->abs_zone)?></a>
                                </li>
                                <li>
                                    <span>Star Rating</span>
                                    <span class="stars pub" data-id="<?=$item->id?>">
                        <span class="icon star<?php if($item->pub_rank > 0): ?> is-active<?php endif;?>" data-rank="1">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->pub_rank > 1): ?> is-active<?php endif;?>" data-rank="2">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->pub_rank > 2): ?> is-active<?php endif;?>" data-rank="3">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->pub_rank > 3): ?> is-active<?php endif;?>" data-rank="4">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->pub_rank > 4): ?> is-active<?php endif;?>" data-rank="5">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                    </span>
                                </li>
                                <li>
                                    <span>Comment</span>
                                    <?php if($item->pub_note): ?>
                                    <a class="text-success btn-pub_note" data-content="<?=htmlspecialchars($item->pub_note, ENT_QUOTES, 'UTF-8')?>">View</a>
                                    <?php else: ?>
                                    <a class="text-primary btn-pub_note" data-content="">Add</a>
                                    <?php endif; ?>
                                </li>
                            </ul>
                            <?php endif; ?>
                            <?php if($item->first_ad): ?>
                            <ul class="user-detail user-detail-<?=$item->id?> hidden" id="adv-<?=$item->id?>" style="padding-left: 0px;">
                                <li>
                                    <span>Join</span>
                                    <span><?=$item->first_ad?></span>
                                </li>
                                <li>
                                    <span>Balance</span>
                                    <span><?=$this->helper->currencyFormat($item->adv_balance)?></span>
                                </li>
                                <li>
                                    <span>Deposited</span>
                                    <span><?=$this->helper->currencyFormat($item->deposit_value)?></span>
                                </li>
                                <li>
                                    <span>Latest</span>
                                    <span><?=$item->last_ad?></span>
                                </li>
                                <li>
                                    <span>Running</span>
                                    <span><?=$this->helper->currencyFormat($item->deposit_value - $item->receipt_value - $item->adv_balance)?></span>
                                </li>
                                <li>
                                    <span>Campaigns</span>
                                    <a class="text-primary" href="/advertiser/campaign?user_id=<?=$item->id?>" target="_blank"><?=$this->helper->numberFormat($item->abs_campaign)?></a>
                                </li>
                                <li>
                                    <span>Ads</span>
                                    <a class="text-primary" href="/advertiser/ad?user_id=<?=$item->id?>" target="_blank"><?=$this->helper->numberFormat($item->abs_ad)?></a>
                                </li>
                                <li>
                                    <span>Star Rating</span>
                                    <span class="stars adv" data-id="<?=$item->id?>">
                        <span class="icon star<?php if($item->adv_rank > 0): ?> is-active<?php endif;?>" data-rank="1">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->adv_rank > 1): ?> is-active<?php endif;?>" data-rank="2">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->adv_rank > 2): ?> is-active<?php endif;?>" data-rank="3">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->adv_rank > 3): ?> is-active<?php endif;?>" data-rank="4">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                        <span class="icon star<?php if($item->adv_rank > 4): ?> is-active<?php endif;?>" data-rank="5">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                            </svg>
                        </span>
                    </span>
                                </li>
                                <li>
                                    <span>Comment</span>
                                    <?php if($item->adv_note): ?>
                                    <a class="text-success btn-adv_note" data-content="<?=htmlspecialchars($item->adv_note, ENT_QUOTES, 'UTF-8')?>">View</a>
                                    <?php else: ?>
                                    <a class="text-primary btn-adv_note" data-content="">Add</a>
                                    <?php endif; ?>
                                </li>
                            </ul>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
                <?php else: ?>
                <div class="col-12">
                    <div class="flatbox">
                        <div class="hero">
                            <div class="hero-body">
                                <div class="has-text-centered">
                                    <p>No Records</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endif; ?>
            </div>
            <?=$this->data->pagination?>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="supportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Open ticket for <strong id="support_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Related Service</label>
                        <select id="support-service" class="form-control">
                            <?php foreach($this->services as $item): ?>
                            <option value="<?=$item?>"><?=$item?></option>
                            <<?php endforeach; ?>
                        </select>

                    </div>
                    <div class="form-group">
                        <label class="label">Subject</label>
                        <input class="form-control" id="support-subject" placeholder="support title">

                    </div>
                    <div class="form-group">
                        <label class="label">Message</label>
                        <textarea class="form-control" id="support-message" placeholder="support message..." rows="5"></textarea>

                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" checked="" id="send_email">
                        <label class="custom-control-label" for="send_email">Also send email to user</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="support_save" data-id="">Create</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade text-left" id="smsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title">Send sms to <strong id="sms_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Message</label>
                        <textarea class="form-control" id="sms-message" placeholder="sms message..." rows="5"></textarea>
                        <p class="help" id="sms_count"></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="sms_save" data-id="">Send</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade text-left" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Send an email to <strong id="email_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Subject</label>
                        <input class="form-control" id="email-subject" placeholder="email subject">
                    </div>
                    <div class="form-group">
                        <label class="label">Message</label>
                        <textarea class="form-control" id="email-message" placeholder="email message..." rows="5"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="email_save" data-id="">Send</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="notificationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Send notification to <strong id="noti_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Notification type</label>
                        <select id="noti-type" class="form-control">
                            <?php foreach($this->notificationTypes as $item): ?>
                            <option value="<?=$item?>"><?=$item?></option>
                            <<?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Notification service</label>
                        <select id="noti-service" class="form-control">
                            <?php foreach($this->services as $item): ?>
                            <option value="<?=$item?>"><?=$item?></option>
                            <<?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Title</label>
                        <input class="form-control" id="noti-title" placeholder="Notification Title">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="form-control" id="noti-description" placeholder="Notification Description" rows="5"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="noti_save" data-id="">Send</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="roleUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">New Permission for <strong id="user_role_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Permission Name</label>
                        <input class="form-control" id="permission_name" placeholder="Permission name, case sensitive, should match your system controller">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="permission_save" data-id="">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="banModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Reason for banning <strong id="ban_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <textarea class="textarea form-control" id="ban_reason" placeholder="Reason" rows="5"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="ban_save" data-id="">Update</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="revshareModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Revenue Share for <strong id="revshare_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <input class="input form-control" type="number" min="0.30" max="0.95" id="revshare" placeholder="Leave empty to use system revenue share">

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="revshare_save" data-id="">Set</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="pubNoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Comment for publisher <strong id="pub_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <textarea class="textarea form-control" id="pub_note" placeholder="Note for this publisher account" rows="5"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="pub_saveNote" data-id="">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade text-left" id="advNoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Comment for advertiser <strong id="adv_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <textarea class="textarea form-control" id="adv_note" placeholder="Note for this advertiser account" rows="5"></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="adv_saveNote" data-id="">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="featureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
         style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">More details for <strong id="feature_name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="buttons are-transparent">
                        <a class="btn btn-warning btn-light mb-1" href="/user/api?user_id=">
                            <i class="fa fa-usb"></i>
                            <span>APIs</span>
                        </a>
                        <a class="btn btn-success btn-light mb-1" href="/user/referral?user_id=">
                            <i class="feather icon-users"></i>
                            <span>Referrals</span>
                        </a>
                        <a class="btn btn-info btn-light mb-1" href="/user/notification?user_id=">
                            <i class="fa fa-bell-o"></i>
                            <span>Notifications</span>
                        </a>
                        <a class="btn btn-info btn-light mb-1" href="/user/activity?user_id=">
                            <i class="feather icon-activity"></i>
                            <span>Activities</span>
                        </a>
                        <a class="btn btn-danger btn-light mb-1" href="/user/session?user_id=">
                            <i class="feather icon-lock"></i>
                            <span>Login Sessions</span>
                        </a>
                        <a class="btn btn-warning btn-light mb-1" href="/support?user_id=">
                            <i class="feather icon-help-circle"></i>
                            <span>Support Tickets</span>
                        </a>
                        <a class="btn btn-link btn-light mb-1" href="/user/balance?user_id=">
                            <i class="fa fa-credit-card"></i>
                            <span>Bill Balance</span>
                        </a>
                        <a class="btn btn-info btn-light mb-1" href="/billing/deposit?user_id=">
                            <i class="fa fa-money"></i>
                            <span>Deposit Invoices</span>
                        </a>
                        <a class="btn btn-info btn-light mb-1" href="/billing/withdraw?user_id=">
                            <i class="fa fa-usd"></i>
                            <span>Withdraw Invoices</span>
                        </a>
                        <a class="btn btn-info btn-light mb-1" href="/billing/receipt?user_id=">
                            <i class="fa fa-file-text-o"></i>
                            <span>Ad Receipts</span>
                        </a>
                        <a class="btn btn-danger btn-light mb-1" href="/publisher/domain?user_id=">
                            <i class="fa fa-globe"></i>
                            <span>Anti-Adblock Domains</span>
                        </a>
                        <a class="btn btn-info btn-light mb-1" href="/advertiser/creative?user_id=">
                            <i class="fa fa-lightbulb-o"></i>
                            <span>Ad Creatives</span>
                        </a>
                        <a class="btn btn-info btn-light mb-1" href="/advertiser/audience?user_id=">
                            <i class="feather icon-users"></i>
                            <span>Ad Audiences</span>
                        </a>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction btn-close">OK</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="banModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Reason for banning user <strong id="ban_id"></strong> - <strong id="ban-name"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <textarea class="textarea form-control" id="ban_note" placeholder="Reason for banning" rows="5"></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="ban-save" data-id="">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $, __tajs */
$(document).ready(function(){
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        if(isNaN(val)) {
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        } else {
            window.location.href = '/user?id='+val;
        }
    });
    $('.tabs-switch').on('click', function(e) {
        e.preventDefault();
        var $this = $(this), id = $this.attr('data-id'), tab = $this.attr('data-tab');
        $this.closest('ul').find('li').removeClass('is-active');
        $this.closest('li').addClass('is-active');
        $('.user-detail-'+id).addClass('hidden');
        $('#'+tab+'-'+id).removeClass('hidden');
    });
    $('.btn-support').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        $('#support_save').attr('data-id', id);
        $('#support_name').html(name);
        $('#supportModal').modal('show');
    });
    $('#support_save').on('click', function() {
        var $this = $(this), data = {};
        data.user_id = $this.attr('data-id');
        data.service = $('#support-service').val();
        data.subject = $.trim($('#support-subject').val());
        data.message = $.trim($('#support-message').val());
        data.send_email = $('#send_email').is('checked') ? 1 : 0;
        if(!data.subject || !data.message || data.subject.length < 5 || data.message.length < 5) {
            __tajs.showAlert('subject and/or message are too short, min 5 chars');
            return false;
        }
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/user/ticket', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                __tajs.showAlert(res.data);
            } else {
                __tajs.showAlert('Ticket created!', 'success', 2000);
                $('#supportModal').removeClass('is-active');
            }
        });
    });
    $('.btn-sms').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        $('#sms_save').attr('data-id', id);
        $('#sms_name').html(name);
        $('#smsModal').modal('show');
    });
    $('#sms-message').on('input', function(){
        var max = 160, current = $.trim($(this).val()).length, count = $('#sms_count');
        var left = max - current;
        if (left < 20) {
            count.removeClass('is-info').addClass('is-danger');
        } else {
            count.removeClass('is-danger').addClass('is-info');
        }
        count.html('Max '+max+' characters, used: '+current+', left: '+left);
    });
    $('#sms_save').on('click', function() {
        var $this = $(this), user_id = $this.attr('data-id'), message = $.trim($('#sms-message').val());
        if(!message || message.length < 10) {
            __tajs.showAlert('message is too short, min 10 chars');
            return false;
        }
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/user/sms', {csrf_token: __tajs.csrf, user_id: user_id, message: message}, function(res) {
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                __tajs.showAlert(res.data);
            } else {
                __tajs.showAlert('sms sent!', 'success', 2000);
                $('#smsModal').removeClass('is-active');
            }
        });
    });
    $('.btn-email').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        $('#email_save').attr('data-id', id);
        $('#email_name').html(name);
        $('#emailModal').modal('show');
    });
    $('#email_save').on('click', function() {
        var $this = $(this), data = {};
        data.user_id = $this.attr('data-id');
        data.subject = $.trim($('#email-subject').val());
        data.message = $.trim($('#email-message').val());
        if(!data.subject || !data.message || data.subject.length < 5 || data.message.length < 5) {
            __tajs.showAlert('subject and/or message are too short, min 5 chars');
            return false;
        }
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/user/email', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                __tajs.showAlert(res.data);
            } else {
                __tajs.showAlert('Email sent!', 'success', 2000);
                $('#emailModal').removeClass('is-active');
            }
        });
    });
    $('.btn-notification').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        $('#noti_save').attr('data-id', id);
        $('#noti_name').html(name);
        $('#notificationModal').modal('show');
    });
    $('#noti_save').on('click', function() {
        var $this = $(this), data = {};
        data.user_id = $this.attr('data-id');
        data.type = $('#noti-type').val();
        data.service = $('#noti-service').val();
        data.title = $.trim($('#noti-title').val());
        data.description = $.trim($('#noti-description').val());
        if(!data.title || !data.description || data.title.length < 10 || data.description.length < 10) {
            __tajs.showAlert('Title and/or Description are too short, min 10 chars');
            return false;
        }
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/user/notification', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                __tajs.showAlert(res.data);
            } else {
                __tajs.showAlert('Notification sent!', 'success', 2000);
                $('#notificationModal').removeClass('is-active');
            }
        });
    });
    $('.btn-login').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        __tajs.showConfirm('Login as user <strong>'+id+'</strong> - <strong>'+name+'</strong> ?', function(yes){
            if(yes) {
                __tajs.showLoading();
                $.post('/user/login', {csrf_token: __tajs.csrf, id: id, return_url: window.location.href}, function(res){
                    if(!res.success) {
                        __tajs.showLoading(false);
                        __tajs.showAlert(res.data);
                    } else {
                        window.location.replace(res.data);
                    }
                });
            }
        }, 'info');
    });
    $('.btn-ban').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        $('#ban_id').html(id);
        $('#ban-name').html(name);
        $('#ban-save').attr('data-id', id);
        $('#banModal1').modal('show');


        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        __tajs.showPrompt('Reason for banning user <strong>'+id+'</strong> - <strong>'+name+'</strong>', 'Ban reason', function(reason){
            if(reason) {
                __tajs.showLoading();
                $.post('/user/ban', {csrf_token: __tajs.csrf, id: id, reason: reason}, function(res){
                    if(!res.success) {
                        __tajs.showLoading(false);
                        __tajs.showAlert(res.data);
                    } else {
                        __tajs.showAlert('Ban user '+ name +' successfully!', 'success', 2000);
                        window.location.reload();
                    }
                });
            }
        });
    });

    $('#ban-save').on('click', function (e) {
        var $this = $(this), data = {};
        var id = $this.attr('data-id');
        var reason = $('#ban-name').text();
        console.log(id, reason)
        $.post('/user/ban', {csrf_token: __tajs.csrf, id: id, reason: reason}, function(res){
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                // __tajs.showLoading(false);
                __tajs.showAlert(res.data);
            } else {
                __tajs.showAlert('Ban user '+ name +' successfully!', 'success', 2000);
                $('#banModal1').modal('hide');
                window.location.reload();
            }
        });
    });

    $('.btn-active').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        __tajs.showConfirm('(re)Activate user <strong>'+id+'</strong> - <strong>'+name+'</strong> ?', function(yes){
            if(yes) {
                __tajs.showLoading();
                $.post('/user/activate', {csrf_token: __tajs.csrf, id: id}, function(res){
                    if(!res.success) {
                        __tajs.showLoading(false);
                        __tajs.showAlert(res.data);
                    } else {
                        __tajs.showAlert('Re-activate user '+ name +' successfully!', 'success', 2000);
                        window.location.reload();
                    }
                });
            }
        }, 'success');
    });
    $('.btn-permission').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        $("#permission_name").val('');
        $('#permission_save').attr('data-id', id);
        $('#user_role_name').html(name);
        $('#roleUserModal').modal('show');
    });
    $('#permission_save').on('click', function() {
        var $this = $(this), id = $this.attr('data-id'), permission = $('#permission_name').val(), text;
        if(permission) {
            text = 'Set permission <strong>'+permission+'</strong> for <strong>#'+id+'</strong> - <strong>'+$('#user_role_name').text()+'</strong> ?';
        } else {
            text = 'Clear permission from <strong>#'+id+'</strong> - <strong>'+$('#user_role_name').text()+'</strong> ?';
        }
        __tajs.showConfirm(text, function(yes){
            if(yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/user/permission', {csrf_token: __tajs.csrf, id: id, permission: permission}, function(res) {
                    $this.prop('disabled', false);
                    $this.removeClass('is-loading');
                    if(!res.success) {
                        __tajs.showAlert(res.data);
                    } else {
                        __tajs.showAlert('Changed Permission successfully!', 'success', 2000);
                        $('#roleUserModal').removeClass('is-active');
                    }
                });
            }
        });
    });
    $('.btn-ban_reason').on('click', function(e) {
        e.preventDefault();
        var $this = $(this), $item = $this.closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        var content = $this.attr('data-content');
        $('#ban_name').html(name);
        $('#ban_reason').val(content);
        $('#ban_save').attr('data-id', id);
        $('#banModal').modal('show');
    });
    $('#ban_save').on('click', function() {
        var $this = $(this), id = $this.attr('data-id'), reason = $('#ban_reason').val();
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/user/reason', {csrf_token: __tajs.csrf, id: id, reason: reason}, function(res) {
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                __tajs.showAlert(res.data);
            } else {
                __tajs.showAlert('Changed Ban Reason successfully!', 'success', 2000);
                $('#banModal').removeClass('is-active');
                $('.card-content[data-id="'+id+'"]').find('.btn-ban_reason').attr('data-content', reason);
            }
        });
    });
    $('.btn-feature').on('click', function(e){
        e.preventDefault();
        var $item = $(this).closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        $('#feature_name').html(name);
        $('#featureModal').find('a').each(function() {
            var href = this.href.split('user_id=')[0];
            this.href = href + 'user_id=' + id;
        });
        $('#featureModal').modal('show');
    });
    $('.btn-revshare').on('click', function(e) {
        e.preventDefault();
        var $this = $(this), $item = $this.closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        var content = $this.attr('data-content');
        $('#revshare_name').html(name);
        $('#revshare').val(content);
        $('#revshare_save').attr('data-id', id);
        $('#revshareModal').modal('show');
    });
    $('#revshare_save').on('click', function() {
        var $this = $(this), id = $this.attr('data-id'), revshare = parseFloat($('#revshare').val()), revshare_text, revshare_desc;
        if(revshare) {
            if(1 <= revshare) {
                __tajs.showAlert('Could not set more than 100% revenue share');
                return false;
            }
            revshare_text = (revshare*100).toFixed(2).replace('.00', '')+'%';
            revshare_desc = 'Set revenue share <strong>'+revshare+' ('+revshare_text+')</strong>';
        } else {
            revshare = '';
            revshare_text = '<?=DEFAULT_REVSHARE*100?>%';
            revshare_desc = 'Clear custom revenue share and use default one';
        }
        __tajs.showConfirm(revshare_desc+' for <strong>#'+id+'</strong> - <strong>'+$('#revshare_name').text()+'</strong> ?', function(yes){
            if(yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/user/revshare', {csrf_token: __tajs.csrf, id: id, revshare: revshare}, function(res) {
                    $this.prop('disabled', false);
                    $this.removeClass('is-loading');
                    if(!res.success) {
                        __tajs.showAlert(res.data);
                    } else {
                        __tajs.showAlert('Changed revenue share successfully!', 'success', 2000);
                        $('#revshareModal').removeClass('is-active');
                        var elm = $('.card-content[data-id="'+id+'"]').find('.btn-revshare');
                        elm.attr('data-content', revshare).html(revshare_text);
                        if(!revshare) {
                            elm.removeClass('has-text-success, has-text-danger').addClass('has-text-link');
                        } else if(revshare < <?=DEFAULT_REVSHARE?>) {
                            elm.removeClass('has-text-success, has-text-link').addClass('has-text-danger');
                        } else {
                            elm.removeClass('has-text-danger, has-text-link').addClass('has-text-success');
                        }
                    }
                });
            }
        });
    });
    $('.btn-pub_note').on('click', function(e) {
        e.preventDefault();
        var $this = $(this), $item = $this.closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        var content = $this.attr('data-content');
        $('#pub_name').html(name);
        $('#pub_note').val(content);
        $('#pub_saveNote').attr('data-id', id).prop('disabled', true);
        $('#pubNoteModal').modal('show');
    });
    $('#pub_note').on('input', function() {
        $('#pub_saveNote').prop('disabled', false);
    });
    $('#pub_saveNote').on('click', function() {
        var $this = $(this), id = $this.attr('data-id'), content = $.trim($('#pub_note').val());
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/user/note', {csrf_token: __tajs.csrf, id: id, pub: content}, function(res) {
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                __tajs.showAlert(res.data);
            } else {
                $('#pubNoteModal').modal('hide');
                var elm = $('.card-body[data-id="'+id+'"]').find('.btn-pub_note');
                console.log(elm, content)
                if(content.length) {
                    elm.attr('data-content', content).addClass('text-success').removeClass('text-link').html('View');
                } else {
                    elm.attr('data-content', content).addClass('text-link').removeClass('text-success').html('Add');
                }
            }
        });
    });
    $('.btn-adv_note').on('click', function(e) {
        e.preventDefault();
        var $this = $(this), $item = $this.closest('.card-body'), id = $item.attr('data-id'), name = $item.attr('data-name');
        var content = $this.attr('data-content');
        $('#adv_name').html(name);
        $('#adv_note').val(content);
        $('#adv_saveNote').attr('data-id', id).prop('disabled', true);
        $('#advNoteModal').modal('show');
    });
    $('#adv_note').on('input', function() {
        $('#adv_saveNote').prop('disabled', false);
    });
    $('#adv_saveNote').on('click', function() {
        var $this = $(this), id = $this.attr('data-id'), content = $.trim($('#adv_note').val());
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/user/note', {csrf_token: __tajs.csrf, id: id, adv: content}, function(res) {
            $this.prop('disabled', false);
            $this.removeClass('is-loading');
            if(!res.success) {
                __tajs.showAlert(res.data);
            } else {
                $('#advNoteModal').modal('hide');
                var elm = $('.card-body[data-id="'+id+'"]').find('.btn-adv_note');
                if(content.length) {
                    elm.attr('data-content', content).addClass('text-success').removeClass('text-link').html('View');
                } else {
                    elm.attr('data-content', content).addClass('text-link').removeClass('text-success').html('Add');
                }
            }
        });
    });
    $('.star').on('click', function() {
        var $this = $(this), $stars = $this.closest('.stars'), id = $stars.attr('data-id'), rank = $this.attr('data-rank'), post = {csrf_token: __tajs.csrf, id: id};
        if($stars.hasClass('pub')) {
            post.pub = rank;
        } else {
            post.adv = rank;
        }
        __tajs.showLoading();
        $.post('/user/rank', post, function(res){
            if(!res.success) {
                __tajs.showLoading(false);
                __tajs.showAlert(res.data);
            } else {
                if(post.pub) {
                    $('.stars.pub[data-id="'+id+'"]').find('.star').each(function(){
                        var $star = $(this);
                        if($star.attr('data-rank') <= rank) {
                            $star.addClass('is-active');
                        } else {
                            $star.removeClass('is-active');
                        }
                    });
                } else {
                    $('.stars.adv[data-id="'+id+'"]').find('.star').each(function(){
                        var $star = $(this);
                        if($star.attr('data-rank') <= rank) {
                            $star.addClass('is-active');
                        } else {
                            $star.removeClass('is-active');
                        }
                    });
                }
                __tajs.showLoading(false);
            }
        });
    })
});
</script>