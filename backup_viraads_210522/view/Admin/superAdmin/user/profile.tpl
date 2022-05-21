<style>
@-webkit-keyframes spinAround{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes spinAround{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}.timeline{display:flex;flex-direction:column}.timeline .timeline-header{width:4em;min-width:4em;max-width:8em;word-wrap:normal;text-align:center;display:flex;justify-content:center}.timeline .timeline-item{display:flex;display:-webkit-flex;position:relative;margin-left:2em;padding-bottom:2em}.timeline .timeline-item::before{content:"";background-color:#dbdbdb;display:block;width:1px;height:100%;position:absolute;left:-.5px;top:0}.timeline .timeline-item .timeline-marker{position:absolute;background:#dbdbdb;border:1px solid #dbdbdb;border-radius:100%;content:"";display:block;height:12px;-webkit-transform:translateX(-50%);transform:translateX(-50%);top:1.2rem;width:12px}.timeline .timeline-item .timeline-marker.is-image{background:#dbdbdb;border:1px solid #dbdbdb;border-radius:100%;display:block;overflow:hidden}.timeline .timeline-item .timeline-marker.is-image.is-16x16{height:16px;width:16px}.timeline .timeline-item .timeline-marker.is-image.is-24x24{height:24px;width:24px}.timeline .timeline-item .timeline-marker.is-image.is-32x32{height:32px;width:32px}.timeline .timeline-item .timeline-marker.is-image.is-48x48{height:48px;width:48px}.timeline .timeline-item .timeline-marker.is-image.is-64x64{height:64px;width:64px}.timeline .timeline-item .timeline-marker.is-image.is-96x96{height:96px;width:96px}.timeline .timeline-item .timeline-marker.is-image.is-128x128{height:128px;width:128px}.timeline .timeline-item .timeline-marker.is-icon{display:flex;align-items:center;justify-content:center;height:24px;width:24px;background:#dbdbdb;border:1px solid #dbdbdb;border-radius:100%;padding:.5rem}.timeline .timeline-item .timeline-marker.is-icon>*{font-size:.75rem!important}.timeline .timeline-item .timeline-marker.is-outlined .image{background:#fff}.timeline .timeline-item .timeline-marker.is-outlined.is-icon{background:#fff}.timeline .timeline-item .timeline-marker.is-outlined.is-icon>*{color:#dbdbdb}.timeline .timeline-item .timeline-marker.is-white{background-color:#fff!important;border-color:#fff!important}.timeline .timeline-item .timeline-marker.is-white .image{border-color:#fff!important}.timeline .timeline-item .timeline-marker.is-white.is-icon{background-color:#fff!important;border-color:#fff!important}.timeline .timeline-item .timeline-marker.is-white.is-icon>*{color:#0a0a0a!important}.timeline .timeline-item .timeline-marker.is-white.is-outlined{background-color:#fff!important;border-color:#fff!important}.timeline .timeline-item .timeline-marker.is-white.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-white.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-white.is-outlined.is-icon>*{color:#fff!important}.timeline .timeline-item .timeline-marker.is-black{background-color:#0a0a0a!important;border-color:#0a0a0a!important}.timeline .timeline-item .timeline-marker.is-black .image{border-color:#0a0a0a!important}.timeline .timeline-item .timeline-marker.is-black.is-icon{background-color:#0a0a0a!important;border-color:#0a0a0a!important}.timeline .timeline-item .timeline-marker.is-black.is-icon>*{color:#fff!important}.timeline .timeline-item .timeline-marker.is-black.is-outlined{background-color:#fff!important;border-color:#0a0a0a!important}.timeline .timeline-item .timeline-marker.is-black.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-black.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-black.is-outlined.is-icon>*{color:#0a0a0a!important}.timeline .timeline-item .timeline-marker.is-light{background-color:#f5f5f5!important;border-color:#f5f5f5!important}.timeline .timeline-item .timeline-marker.is-light .image{border-color:#f5f5f5!important}.timeline .timeline-item .timeline-marker.is-light.is-icon{background-color:#f5f5f5!important;border-color:#f5f5f5!important}.timeline .timeline-item .timeline-marker.is-light.is-icon>*{color:#363636!important}.timeline .timeline-item .timeline-marker.is-light.is-outlined{background-color:#fff!important;border-color:#f5f5f5!important}.timeline .timeline-item .timeline-marker.is-light.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-light.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-light.is-outlined.is-icon>*{color:#f5f5f5!important}.timeline .timeline-item .timeline-marker.is-dark{background-color:#363636!important;border-color:#363636!important}.timeline .timeline-item .timeline-marker.is-dark .image{border-color:#363636!important}.timeline .timeline-item .timeline-marker.is-dark.is-icon{background-color:#363636!important;border-color:#363636!important}.timeline .timeline-item .timeline-marker.is-dark.is-icon>*{color:#f5f5f5!important}.timeline .timeline-item .timeline-marker.is-dark.is-outlined{background-color:#fff!important;border-color:#363636!important}.timeline .timeline-item .timeline-marker.is-dark.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-dark.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-dark.is-outlined.is-icon>*{color:#363636!important}.timeline .timeline-item .timeline-marker.is-primary{background-color:#00d1b2!important;border-color:#00d1b2!important}.timeline .timeline-item .timeline-marker.is-primary .image{border-color:#00d1b2!important}.timeline .timeline-item .timeline-marker.is-primary.is-icon{background-color:#00d1b2!important;border-color:#00d1b2!important}.timeline .timeline-item .timeline-marker.is-primary.is-icon>*{color:#fff!important}.timeline .timeline-item .timeline-marker.is-primary.is-outlined{background-color:#fff!important;border-color:#00d1b2!important}.timeline .timeline-item .timeline-marker.is-primary.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-primary.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-primary.is-outlined.is-icon>*{color:#00d1b2!important}.timeline .timeline-item .timeline-marker.is-link{background-color:#3273dc!important;border-color:#3273dc!important}.timeline .timeline-item .timeline-marker.is-link .image{border-color:#3273dc!important}.timeline .timeline-item .timeline-marker.is-link.is-icon{background-color:#3273dc!important;border-color:#3273dc!important}.timeline .timeline-item .timeline-marker.is-link.is-icon>*{color:#fff!important}.timeline .timeline-item .timeline-marker.is-link.is-outlined{background-color:#fff!important;border-color:#3273dc!important}.timeline .timeline-item .timeline-marker.is-link.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-link.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-link.is-outlined.is-icon>*{color:#3273dc!important}.timeline .timeline-item .timeline-marker.is-info{background-color:#209cee!important;border-color:#209cee!important}.timeline .timeline-item .timeline-marker.is-info .image{border-color:#209cee!important}.timeline .timeline-item .timeline-marker.is-info.is-icon{background-color:#209cee!important;border-color:#209cee!important}.timeline .timeline-item .timeline-marker.is-info.is-icon>*{color:#fff!important}.timeline .timeline-item .timeline-marker.is-info.is-outlined{background-color:#fff!important;border-color:#209cee!important}.timeline .timeline-item .timeline-marker.is-info.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-info.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-info.is-outlined.is-icon>*{color:#209cee!important}.timeline .timeline-item .timeline-marker.is-success{background-color:#23d160!important;border-color:#23d160!important}.timeline .timeline-item .timeline-marker.is-success .image{border-color:#23d160!important}.timeline .timeline-item .timeline-marker.is-success.is-icon{background-color:#23d160!important;border-color:#23d160!important}.timeline .timeline-item .timeline-marker.is-success.is-icon>*{color:#fff!important}.timeline .timeline-item .timeline-marker.is-success.is-outlined{background-color:#fff!important;border-color:#23d160!important}.timeline .timeline-item .timeline-marker.is-success.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-success.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-success.is-outlined.is-icon>*{color:#23d160!important}.timeline .timeline-item .timeline-marker.is-warning{background-color:#ffdd57!important;border-color:#ffdd57!important}.timeline .timeline-item .timeline-marker.is-warning .image{border-color:#ffdd57!important}.timeline .timeline-item .timeline-marker.is-warning.is-icon{background-color:#ffdd57!important;border-color:#ffdd57!important}.timeline .timeline-item .timeline-marker.is-warning.is-icon>*{color:rgba(0,0,0,.7)!important}.timeline .timeline-item .timeline-marker.is-warning.is-outlined{background-color:#fff!important;border-color:#ffdd57!important}.timeline .timeline-item .timeline-marker.is-warning.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-warning.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-warning.is-outlined.is-icon>*{color:#ffdd57!important}.timeline .timeline-item .timeline-marker.is-danger{background-color:#ff3860!important;border-color:#ff3860!important}.timeline .timeline-item .timeline-marker.is-danger .image{border-color:#ff3860!important}.timeline .timeline-item .timeline-marker.is-danger.is-icon{background-color:#ff3860!important;border-color:#ff3860!important}.timeline .timeline-item .timeline-marker.is-danger.is-icon>*{color:#fff!important}.timeline .timeline-item .timeline-marker.is-danger.is-outlined{background-color:#fff!important;border-color:#ff3860!important}.timeline .timeline-item .timeline-marker.is-danger.is-outlined .image{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-danger.is-outlined.is-icon{background-color:#fff!important}.timeline .timeline-item .timeline-marker.is-danger.is-outlined.is-icon>*{color:#ff3860!important}.timeline .timeline-item .timeline-content{padding:1em 0 0 2em}.timeline .timeline-item .timeline-content .heading{font-weight:600}.timeline .timeline-item.is-white::before{background-color:#fff}.timeline .timeline-item.is-black::before{background-color:#0a0a0a}.timeline .timeline-item.is-light::before{background-color:#f5f5f5}.timeline .timeline-item.is-dark::before{background-color:#363636}.timeline .timeline-item.is-primary::before{background-color:#00d1b2}.timeline .timeline-item.is-link::before{background-color:#3273dc}.timeline .timeline-item.is-info::before{background-color:#209cee}.timeline .timeline-item.is-success::before{background-color:#23d160}.timeline .timeline-item.is-warning::before{background-color:#ffdd57}.timeline .timeline-item.is-danger::before{background-color:#ff3860}.timeline.is-centered .timeline-header{display:flex;width:100%;align-self:center}.timeline.is-centered .timeline-item{width:50%;align-self:flex-end;flex-direction:row}.timeline.is-centered .timeline-item:nth-of-type(2n){align-self:flex-start;flex-direction:row-reverse;margin-left:0;margin-right:2em}.timeline.is-centered .timeline-item:nth-of-type(2n)::before{right:-.5px;left:auto}.timeline.is-centered .timeline-item:nth-of-type(2n) .timeline-marker{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-centered .timeline-item:nth-of-type(2n) .timeline-content{padding:1em 2em 0 0;text-align:right;display:flex;flex-direction:column;align-items:flex-end;flex-basis:100%}.timeline.is-centered .timeline-item:nth-of-type(2n+1)::before{content:"";background-color:#dbdbdb;display:block;width:1px;height:100%;position:absolute;top:0}.timeline.is-centered .timeline-item.is-white::before{background-color:#fff}.timeline.is-centered .timeline-item.is-black::before{background-color:#0a0a0a}.timeline.is-centered .timeline-item.is-light::before{background-color:#f5f5f5}.timeline.is-centered .timeline-item.is-dark::before{background-color:#363636}.timeline.is-centered .timeline-item.is-primary::before{background-color:#00d1b2}.timeline.is-centered .timeline-item.is-link::before{background-color:#3273dc}.timeline.is-centered .timeline-item.is-info::before{background-color:#209cee}.timeline.is-centered .timeline-item.is-success::before{background-color:#23d160}.timeline.is-centered .timeline-item.is-warning::before{background-color:#ffdd57}.timeline.is-centered .timeline-item.is-danger::before{background-color:#ff3860}.timeline.is-rtl{justify-content:flex-end;align-items:flex-end}.timeline.is-rtl .timeline-item{justify-content:flex-end;flex-direction:row;border-left:none;margin-left:0;margin-right:2em}.timeline.is-rtl .timeline-item::before{right:0;left:auto}.timeline.is-rtl .timeline-item .timeline-marker{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-marker.is-image.is-16x16{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-marker.is-image.is-24x24{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-marker.is-image.is-32x32{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-marker.is-image.is-48x48{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-marker.is-image.is-64x64{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-marker.is-image.is-96x96{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-marker.is-image.is-128x128{-webkit-transform:translateX(50%);transform:translateX(50%)}.timeline.is-rtl .timeline-item .timeline-content{padding:1em 2em 0 0;text-align:right}.timeline.no-headers .timeline-item.is-first::before{height:calc(100% - 1.2rem);top:1.2rem}.timeline.no-headers .timeline-item.is-last::before{height:1.2rem}
.timeline {
    padding-top: 3rem;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="page-title-box">
                <div class="row is-mobile">
                    <div class="col-12">
                        <h3 class="title is-6">Quick Access</h3>
                    </div>
                </div>
            </div>
            <div class="row is-multiline" id="access">
                <div class="col-12">
                    <div class="card flatbox">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="buttons are-transparent">
                                    <a class="btn btn-warning btn-light mb-1" href="/user/api?user_id=<?=$this->data->id?>">
                                        <i class="fa fa fa-usb"></i>
                                        <span>APIs</span>
                                    </a>
                                    <a class="btn btn-success btn-light mb-1" href="/user/referral?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-user-circle-o"></i>
                                        <span>Referrals</span>
                                    </a>
                                    <a class="btn btn-info btn-light mb-1" href="/user/notification?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-bell-o"></i>
                                        <span>Notifications</span>
                                    </a>
                                    <a class="btn btn-info btn-light mb-1" href="/user/activity?user_id=<?=$this->data->id?>">
                                        <i class="feather icon-activity"></i>
                                        <span>Activities</span>
                                    </a>
                                    <a class="btn btn-danger btn-light mb-1" href="/user/session?user_id=<?=$this->data->id?>">
                                        <i class="feather icon-lock"></i>
                                        <span>Login Sessions</span>
                                    </a>
                                    <a class="btn btn-danger btn-light mb-1" href="/user/authentication?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-shield"></i>
                                        <span>Authentications</span>
                                    </a>
                                    <a class="btn btn-warning btn-light mb-1" href="/support?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-ticket"></i>
                                        <span>Support Tickets</span>
                                    </a>
                                    <a class="btn btn-link btn-light mb-1" href="/user/balance?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-credit-card-alt"></i>
                                        <span>Bill Balance</span>
                                    </a>
                                    <a class="btn btn-info btn-light mb-1" href="/billing/deposit?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-money"></i>
                                        <span>Deposit Invoices</span>
                                    </a>
                                    <a class="btn btn-info btn-light mb-1" href="/billing/withdraw?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-usd"></i>
                                        <span>Withdraw Invoices</span>
                                    </a>
                                    <a class="btn btn-info btn-light mb-1" href="/billing/receipt?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-file-text-o"></i>
                                        <span>Ad Receipts</span>
                                    </a>
                                    <a class="btn btn-danger btn-light mb-1" href="/publisher/domain?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-globe"></i>
                                        <span>Anti-Adblock Domains</span>
                                    </a>
                                    <a class="btn btn-info btn-light mb-1" href="/advertiser/creative?user_id=<?=$this->data->id?>">
                                        <i class="fa fa-lightbulb-o"></i>
                                        <span>Ad Creatives</span>
                                    </a>
                                    <a class="btn btn-info btn-light mb-1" href="/advertiser/audience?user_id=<?=$this->data->id?>">
                                        <i class="feather icon-users"></i>
                                        <span>Ad Audiences</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row is-multiline is-100height">
        <div class="col-lg-3 col-md-12 col-12">
            <div class="timeline mb-3">
                <header class="timeline-header">
                    <span class="badge badge-medium badge-success">Start</span>
                </header>
                <?php foreach($this->data->timeline as $time => $content): ?>
                <div class="timeline-item is-success">
                    <div class="timeline-marker is-icon <?=$content['color']?> is-image is-32x32">
                        <span class="icon">
                            <svg viewBox="0 0 24 24" style="width: 20px;">
                                <?=$content['icon']?>
                            </svg>
                        </span>
                    </div>
                    <div class="timeline-content">
                        <p class="heading text-muted"><?=$time?></p>
                        <p><?=$content['content']?></p>
                    </div>
                </div>
                <?php endforeach; ?>
                <header class="timeline-header">
                    <span class="badge badge-medium badge-success">Now</span>
                </header>
            </div>
        </div>
        <div class="col-lg-9 col-md-12 col-12 is-100height">
            <div class="page-title-box">
                <div class="row is-mobile">
                    <div class="col-12">
                        <h3 class="title is-6">Account Details</h3>
                    </div>
                </div>
            </div>
            <div class="row is-multiline" id="details" style="flex-wrap: wrap">
                <div class="col-lg-6 col-md-12 col-12 mb-2">
                    <div class="card flatbox h-100 mb-2">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="form-group">
                                    <label class="label">Full Name</label>
                                    <input class="input form-control" type="text" id="name" placeholder="Your Full Name" value="<?=$this->data->name?>">
                                </div>
                                <div class="form-group">
                                    <label class="label">Email</label>
                                    <input class="input form-control" type="email" id="email" placeholder="Email Address" value="<?=$this->data->email?>">
                                </div>
                                <div class="form-group">
                                    <label class="label">Timezone</label>

                                    <select id="timezone" class="form-control">
                                        <?php foreach($this->data->timezones as $timezone): ?>
                                        <option value="<?=$timezone?>"<?php if($timezone == $this->data->timezone): ?> selected<?php endif; ?>><?=$timezone?></option>
                                        <?php endforeach; ?>
                                    </select>

                                </div>
                                <div class="form-group">
                                    <label class="label">Language</label>

                                    <select id="language" class="form-control">
                                        <?php foreach($this->data->languages as $code => $name): ?>
                                        <option value="<?=$code?>"<?php if($code == $this->data->language): ?> selected<?php endif; ?>><?=$name?></option>
                                        <?php endforeach; ?>
                                    </select>

                                </div>
                                <div class="form-group">
                                    <label class="label">Subscribe</label>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" name="customCheck" id="is_subscribed" <?php if($this->data->is_subscribed): ?>checked="checked"<?php endif; ?>>
                                        <label class="custom-control-label" for="is_subscribed">Subscribe to Newsletters and Notifications</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12 mb-2">
                    <div class="card flatbox h-100">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="form-group">
                                    <label class="label">Your Country</label>
                                    <select id="country" class="form-control">
                                        <?php foreach($this->data->countries as $country): ?>
                                        <option value="<?=$country->id?>" phone="<?=$country->phone?>"<?php if($country->id == $this->data->country_id): ?> selected<?php endif; ?>><?=$country->code?> - <?=$country->name?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="label">Full Address</label>
                                    <textarea class="textarea form-control" id="address" placeholder="Your Address"><?=$this->data->address?></textarea>
                                </div>
                                <div class="form-group">
                                    <label class="label">Phone Number</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1" style="max-width:120px;">+000</span>
                                        </div>
                                        <input type="text" class="form-control input" placeholder="Your phone number" id="phone" value="<?=$this->data->phone?>" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="label">Chatting Account</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <select id="chat_prefix" class="form-control" style="width: 120px">
                                                <?php foreach($this->data->chats as $m): ?>
                                                <option value="<?=$m?>"<?php if($m == $this->data->chat_prefix): ?> selected<?php endif; ?>><?=$m?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <input class="input form-control" type="text" placeholder="Your chat account" id="chat_account" value="<?=$this->data->chat_account?>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="label">Birthday</label>
                                    <input class="input form-control" type="text" id="birthday" value="<?=$this->data->birthday?>">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <article class="card flatbox">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="buttons text-center">
                                    <button class="btn btn-success mb-1" id="save_profile">
                                        <i class="feather icon-check"></i>
                                        <span>Save</span>
                                    </button>
                                    <a class="btn btn-light mb-1" href="javascript:history.back();">
                                        <i class="feather icon-arrow-left"></i>
                                        <span>Back</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="<?=$this->asset('js/litepicker.js')?>"></script>
<script>
/* global $, Litepicker, __tajs */
var picker = new Litepicker({
    element: document.getElementById('birthday'),
    singleMode: true,
    numberOfMonths: 2,
    numberOfColumns: 2,
    format: 'YYYY-MM-DD',
    dropdowns: {minYear: 1930, maxYear: null, months: false, years: 'asc',},
    startDate: '<?=$this->data->birthday?>'
});
function formatDate(d) {
    var month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
$(document).ready(function() {
    $('#country').on('change', function() {
        $('#phone_prefix').val($("#country option:selected").attr('phone'));
    });
    $('#save_profile').click(function() {
        var $this = $(this), data = {};
        data.address = $('#address').val(),
        data.country_id = parseInt($('#country').val(),10),
        data.email = $.trim($('#email').val()),
        data.phone = $.trim($('#phone').val()),
        data.chat_account = $('#chat_prefix').val() + ':' + $('#chat_account').val(),
        data.birthday = formatDate(picker.getStartDate()),
        data.timezone = $('#timezone').val(),
        data.language = $('#language').val(),
        data.is_subscribed = $('#is_subscribed').is(':checked') ? 1 : 0,
        data.name = $.trim($('#name').val());
        
        if(!data.name || data.name.length < 3) {
            __tajs.showAlert('Name is required minimum 3 characters');
            return false;
        }
        if (data.phone.length < 9) data.phone = null;
        if (data.chat_account.length < 8) data.chat_account = null;
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/user/profile/<?=$this->data->id?>', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                $this.html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" /></svg></span><span>Saved</span>');
            }
        });
    });
});
</script>