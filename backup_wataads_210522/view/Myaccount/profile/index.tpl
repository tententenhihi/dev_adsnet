<div class="content-body">
    <!-- account setting page start -->
    <section id="page-account-settings">
        <div class="row">
            <!-- left menu section -->
            <div class="col-md-3 mb-2 mb-md-0">
                <ul class="nav nav-pills flex-column mt-md-0 mt-1">
                    <li class="nav-item">
                        <a class="nav-link d-flex py-75 active" id="account-pill-general" data-toggle="pill" href="#account-vertical-general" aria-expanded="true">
                            <i class="feather icon-globe mr-50 font-medium-3"></i>
                            Profile
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link d-flex py-75" id="account-pill-password" data-toggle="pill" href="#account-vertical-password" aria-expanded="false">
                            <i class="feather icon-lock mr-50 font-medium-3"></i>
                            Change Password
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link d-flex py-75" id="account-pill-2fa" data-toggle="pill" href="#account-vertical-2fa" aria-expanded="false">
                            <i class="feather icon-lock mr-50 font-medium-3"></i>
                            Two-factor authentication
                        </a>
                    </li>
                </ul>
            </div>
            <!-- right content section -->
            <div class="col-md-9">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="account-vertical-general" aria-labelledby="account-pill-general" aria-expanded="true">


                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <label for="account-name">Name</label>
                                                    <input type="text" class="form-control" id="account-name" placeholder="Name" value="<?=$this->data->name?>" required="" data-validation-required-message="This name field is required">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <label for="account-e-mail">E-mail</label>
                                                    <input type="email" class="form-control" id="account-e-mail" placeholder="Email" value="<?=$this->data->email?>" disabled>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="account-company">Timezone</label>
                                                <select class="form-control" id="timezone">
                                                    <?php foreach($this->data->timezones as $timezone): ?>
                                                    <option value="<?=$timezone?>"<?php if($timezone == $this->data->timezone): ?> selected<?php endif; ?>><?=$timezone?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="account-company">Language</label>
                                                <select class="form-control" id="language">
                                                    <?php foreach($this->data->languages as $code => $name): ?>
                                                    <option value="<?=$code?>"<?php if($code == $this->data->language): ?> selected<?php endif; ?>><?=$name?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="account-company">Subscribe</label>
                                                <p class="control">
                                                    <label class="checkbox">
                                                        <input type="checkbox" id="is_subscribed" <?php if($this->data->is_subscribed): ?>checked="checked"<?php endif; ?>>
                                                        <span class="checkbox-text text-muted">Subscribe to Newsletters and Notifications</span>
                                                    </label>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <label for="account-name">Profile Created</label>
                                                    <input type="text" class="form-control"  placeholder="Created at" value="<?=$this->data->created_at?>" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="account-company">Country</label>
                                                <select  class="form-control" id="country">
                                                    <?php foreach($this->data->countries as $country): ?>
                                                    <option value="<?=$country->id?>" phone="<?=$country->phone?>"<?php if($country->id == $this->data->country_id): ?> selected<?php endif; ?>><?=$country->code?> - <?=$country->name?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="account-company">Full Address</label>
                                                <textarea class="textarea form-control" id="address" placeholder="Your Address"><?=$this->data->address?></textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <label for="account-name">Phone</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <input class="form-control" type="text" id="phone_prefix" value="<?=$this->data->phone_prefix?>" placeholder="+000" style="max-width:120px;" readonly>

                                                        </div>
                                                        <input class="form-control" type="text" placeholder="Your phone number" id="phone" value="<?=$this->data->phone?>">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <div class="controls">
                                                    <label for="account-name">Chatting Account</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <select class="form-control" id="chat_prefix">
                                                                <?php foreach($this->data->chats as $m): ?>
                                                                <option value="<?=$m?>"<?php if($m == $this->data->chat_prefix): ?> selected<?php endif; ?>><?=$m?></option>
                                                                <?php endforeach; ?>
                                                            </select>
                                                        </div>
                                                        <input class="form-control" type="text" placeholder="Your chat account" id="chat_account" value="<?=$this->data->chat_account?>">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="account-company">Birthday</label>
                                                <input class="form-control pickadate" type="text" id="birthday">
                                            </div>
                                        </div>
                                        <div class="col-12 d-flex flex-sm-row flex-column justify-content-center">
                                            <button id="enterAction" class="btn btn-primary mr-sm-1 mb-1 mb-sm-0">
                                                Save changes</button>
                                            <button type="reset" class="btn btn-secondary">
                                                Cancel
                                            </button>
                                        </div>

                                    </div>

                                </div>
                                <!-- CHANGE PASSWORD -->
                                <div class="tab-pane fade" id="account-vertical-password" role="tabpanel" aria-labelledby="account-pill-password" aria-expanded="false">
                                    <form novalidate="">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <label for="password_current">Old Password</label>
                                                        <input type="password" class="form-control"  id="password_current" required="" placeholder="Old Password" data-validation-required-message="This old password field is required">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <label for="password">New Password</label>
                                                        <input type="password" name="password" id="password" class="form-control" placeholder="New Password" required="" data-validation-required-message="The password field is required" minlength="6">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <label for="password_verify">Retype New
                                                            Password</label>
                                                        <input type="password" name="con-password" class="form-control" required="" id="password_verify" data-validation-match-match="password" placeholder="New Password" data-validation-required-message="The Confirm password field is required" minlength="6">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <div class="controls">
                                                        <label for="logout_all">Logout Option</label>
                                                        <div class="vs-checkbox-con vs-checkbox-primary">
                                                            <input type="checkbox" checked="" value="false" id="logout_all">
                                                            <span class="vs-checkbox">
                                                                <span class="vs-checkbox--check">
                                                                    <i class="vs-icon feather icon-check"></i>
                                                                </span>
                                                            </span>
                                                            <span class="">Logout all logged in devices/browsers</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                                <button id="save_password" class="btn btn-primary mr-sm-1 mb-1 mb-sm-0">Save
                                                    changes</button>
                                                <button type="reset" class="btn btn-outline-warning">Cancel</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- 2FA -->
                                <div class="tab-pane fade" id="account-vertical-2fa" role="tabpanel" aria-labelledby="account-pill-password" aria-expanded="false">
                                    <div class="row content">
                                        <div class="col-12">
                                            <?php if($this->data->twoFactorToken): ?>
                                            <h2>2FA is enabled</h2>
                                            <p>Two-factor authentication (2FA) is the best way to protect yourself online. However you can disable it if you realy want.</p>
                                            <div class="mb-1 d-flex justify-content-center">
                                                <input style="max-width:250px" class="input form-control" type="text" placeholder="Your 2FA code">
                                            </div>
                                            <div class="text-center">
                                                <button id="2fa-disable" class="btn btn-primary 2fa-disable enterAction" data-type="app">
                                                    <span>Disable 2FA</span>
                                                </button>
                                            </div>
                                        <?php else: ?>
                                            <h2>2FA is disabled</h2>
                                            <p>Two-factor authentication (2FA) is the best way to protect yourself online.</p>
                                            <p></p>
                                            <p>Scan this code with <a href="https://apps.apple.com/us/app/google-authenticator/id388497605#?platform=iphone" target="_blank">
                                                    Google Authenticator for IOS
                                                </a>, <a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2" target="_blank">
                                                    Google Authenticator for Android
                                                </a> or any orther app that support 6 digit OTPs. You are curently using TOTP, a time based algorithm</p>
                                            <div class="text-center">
                                                <img id="qrcode" style="margin:auto; margin-top:2em;margin-bottom:2em" src="" />
                                            </div>
                                            <div class="mb-1 d-flex justify-content-center">
                                                <input style="max-width:250px" class="input form-control" type="text" placeholder="Your 2FA code">
                                            </div>
                                            <div class="text-center">
                                                <button class="btn btn-primary 2fa-enable-submit enterAction" data-type="app">
                                                    <span>Enable 2FA</span>
                                                </button>
                                            </div>
                                        <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- account setting page end -->

</div>


<script src="<?=$this->asset('js/litepicker.js')?>"></script>
<script>
/* global $, Litepicker, __tajs, location */
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
    $('#enterAction').click(function() {
        var $this = $(this), data = {};
        data.address = $('#address').val(),
        data.country_id = parseInt($('#country').val(),10),
        data.phone = $.trim($('#phone').val()),
        data.chat_account = $('#chat_prefix').val() + ':' + $('#chat_account').val(),
        data.birthday = formatDate(picker.getStartDate()),
        data.timezone = $('#timezone').val(),
        data.language = $('#language').val(),
        data.is_subscribed = $('#is_subscribed').is(':checked') ? 1 : 0,
        data.name = $.trim($('#account-name').val());

        if(!data.name || data.name.length < 3) {
            __tajs.showAlert('Display Name is required minimum 3 characters');
            return false;
        }
        if (data.phone.length < 9) {
            __tajs.showAlert('Please correct your phone number!');
            return false;
        }
        if (data.chat_account.length < 8) {
            __tajs.showAlert('Please correct your chatting account!');
            return false;
        }
        if (!data.address || data.address.length < 6) {
            __tajs.showAlert('Please correct your address!');
            return false;
        }
        if (!data.birthday || data.birthday.length < 10) {
            __tajs.showAlert('Please correct your birthday!');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/profile', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                location.reload();
                $this.html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" /></svg></span><span>Saved</span>');
            }
        });
    });
    $('#save_password').click(function() {
        var $this = $(this),
        password_current = $.trim($('#password_current').val()),
        password = $.trim($('#password').val()),
        logout = $('#logout_all').is(':checked') ? 1 : 0;
        if(!password_current || password_current.length < 6) {
            __tajs.showAlert('Current password is incorrect');
            return false;
        }
        if(!password || password.length < 6) {
            __tajs.showAlert('New password is required minimum 6 characters');
            return false;
        }
        if(password != $.trim($('#password_verify').val())) {
            __tajs.showAlert('Verify password does not match');
            return false;
        }
        if(password == password_current) {
            __tajs.showAlert('New password is the same with current one');
            return false;
        }

        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/password', {csrf_token: __tajs.csrf, password: password, password_current: password_current, logout: logout}, function(res) {
            if (!res.success) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.replace('/auth/logout');
            }
        });
    });

 <?php if(!$this->data->twoFactorToken): ?>
    $.post('/authentication/two-factor', {type: 'app', csrf_token: __tajs.csrf}, function(res) {
        //$this.removeClass('is-loading');
        //$this.prop('disabled', false);
        if (res.success) {
            $('#qrcode').attr('src', res.qrcode);
            console.log('#'+target+'-submit');
            $('#'+target+'-submit').addClass('is-active');
            $('#'+target).removeClass('is-active');
        }
        else {
            __tajs.showAlert(res.data);
        }
    });
<?php endif;?>
    
    $('.2fa-enable-submit').on('click', function() {
        var $this = $(this), code = parseInt($this.closest('.content').find('.input').val(),10), type = $this.attr('data-type');
        if(!code || code.toString().length != 6) {
            __tajs.showAlert('Please enter valid 6-digits from your ' + type);
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/authentication/two-factor', {type: type, code: code, csrf_token: __tajs.csrf}, function(res) {
            if (res.success) {
                window.location.reload(true);
            }
            else {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
        });
    });
    $('#2fa-disable').on('click', function() {
        var $this = $(this);
        __tajs.showConfirm('Are you sure? 2FA will be disabled for your account immediately', function(yes) {
            if (yes) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/authentication/disable-2fa', {csrf_token: __tajs.csrf}, function(res) {
                    if (res.success) {
                        window.location.reload(true);
                    }
                    else {
                        $this.removeClass('is-loading');
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                    }
                });
            }
        });
    });
});
</script>