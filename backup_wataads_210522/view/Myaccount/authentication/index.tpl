<section class="wrapper">
    <div class="container">
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-4-tablet is-12-mobile">
                    <h1 class="title is-5">
                        Authentication
                    </h1>
                </div>
                <div class="column is-8-tablet is-hidden-mobile">
                    <nav class="breadcrumb has-succeeds-separator is-right" aria-label="breadcrumbs">
                        <ul>
                            <li><a href="/"><?=SITE_NAME?></a></li>
                            <li class="is-active"><a href="#" aria-current="page">Authentication</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="message is-info">
            <div class="message-body">
                <p>Two-Factor Authentication (2FA) is an extra layer of security used to make sure that people trying to gain access to an online account are who they say they are</p>
                <p>RememberMe Cookie keeps you signing back in automatically on browsers you logged in and checked the "RememberMe" checkbox (should be on your personal devices)</p>
            </div>
        </div>
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">Two-Factor</h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <button class="button is-info is-light is-transparent collapse" data-action="collapse" data-target="2fablock">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns" id="2fablock">
            <div class="column">
                <article class="flatbox">
                    <?php if($this->data->twoFactorToken): ?>
                    <h3 class="title is-6 text-muted">2FA - <?=$this->data->twoFactorToken?> method is enabled for your account</h3>
                    <p class="subtitle is-6 text-muted">It is recommended all the way. However, you can disable it if you really want</p>
                    <div class="buttons is-centered">
                        <button class="button is-danger" id="2fa-disable">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M19.43,19L21.5,21.11L20.12,22.5L18.03,20.41L15.91,22.53L14.5,21.11L16.61,19L14.5,16.86L15.88,15.47L18,17.59L20.12,15.47L21.55,16.9L19.43,19M12,1L21,5V11C21,11.9 20.9,12.78 20.71,13.65C19.9,13.23 19,13 18,13A6,6 0 0,0 12,19C12,20.36 12.45,21.62 13.22,22.62L12,23C6.84,21.74 3,16.55 3,11V5L12,1Z"></path>
                                </svg>
                            </span>
                            <span>Disable 2FA</span>
                        </button>
                    </div>
                    <?php else: ?>
                    <h3 class="title is-6 text-muted">2FA is disabled for your account.</h3>
                    <p class="subtitle is-6 text-muted">We highly recommend enabling it - so even somebody guesses your password, they won’t be able to access your account. 
                    Click the 2FA option you want to enable</p>
                    <div class="buttons is-centered">
                        <button class="button is-primary 2fa-modal" data-type="app">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M12,1L3,5V11C3,16.55 6.84,21.74 12,23C17.16,21.74 21,16.55 21,11V5L12,1Z"></path>
                                </svg>
                            </span>
                            <span>Authenticator App</span>
                        </button>
                        <button class="button is-success 2fa-modal" data-type="email">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M20.5,0A2.5,2.5 0 0,1 23,2.5V3A1,1 0 0,1 24,4V8A1,1 0 0,1 23,9H18A1,1 0 0,1 17,8V4A1,1 0 0,1 18,3V2.5A2.5,2.5 0 0,1 20.5,0M12,11L4,6V8L12,13L16.18,10.39C16.69,10.77 17.32,11 18,11H22V18A2,2 0 0,1 20,20H4A2,2 0 0,1 2,18V6A2,2 0 0,1 4,4H15V8C15,8.36 15.06,8.7 15.18,9L12,11M20.5,1A1.5,1.5 0 0,0 19,2.5V3H22V2.5A1.5,1.5 0 0,0 20.5,1Z"></path>
                                </svg>
                            </span>
                            <span>Email Authentication</span>
                        </button>
                        <button class="button is-info 2fa-modal" data-type="sms">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M4,2H20A2,2 0 0,1 22,4V16A2,2 0 0,1 20,18H16L12,22L8,18H4A2,2 0 0,1 2,16V4A2,2 0 0,1 4,2Z"></path>
                                </svg>
                            </span>
                            <span>SMS Authentication</span>
                        </button>
                    </div>
                    <?php endif; ?>
                </article>
            </div>
        </div>
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">RememberMe</h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <button class="button is-info is-light is-transparent collapse" data-action="collapse" data-target="cookieblock">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns" id="cookieblock">
            <div class="column">
                <article class="flatbox">
                    <h3 class="title is-6 text-muted">Manage your RememberMe cookies</h3>
                    <p class="subtitle is-6 text-muted">Lost your personal devices that you are using RememberMe feature and your account is still logged in? 
                    Or check "RememberMe" checkbox on the public PC by mistake? You will have to invalidate RememberMe cookies on these browsers/devices, 
                    so your account will be logged out immediately</p>
                    <div class="buttons is-centered">
                        <button class="button is-warning" id="clear-all"<?php if(!$this->data->rememberMeToken): ?> disabled<?php endif; ?>>
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M12,3A9,9 0 0,0 3,12A9,9 0 0,0 12,21A9,9 0 0,0 21,12C21,11.5 20.96,11 20.87,10.5C20.6,10 20,10 20,10H18V9C18,8 17,8 17,8H15V7C15,6 14,6 14,6H13V4C13,3 12,3 12,3M9.5,6A1.5,1.5 0 0,1 11,7.5A1.5,1.5 0 0,1 9.5,9A1.5,1.5 0 0,1 8,7.5A1.5,1.5 0 0,1 9.5,6M6.5,10A1.5,1.5 0 0,1 8,11.5A1.5,1.5 0 0,1 6.5,13A1.5,1.5 0 0,1 5,11.5A1.5,1.5 0 0,1 6.5,10M11.5,11A1.5,1.5 0 0,1 13,12.5A1.5,1.5 0 0,1 11.5,14A1.5,1.5 0 0,1 10,12.5A1.5,1.5 0 0,1 11.5,11M16.5,13A1.5,1.5 0 0,1 18,14.5A1.5,1.5 0 0,1 16.5,16H16.5A1.5,1.5 0 0,1 15,14.5H15A1.5,1.5 0 0,1 16.5,13M11,16A1.5,1.5 0 0,1 12.5,17.5A1.5,1.5 0 0,1 11,19A1.5,1.5 0 0,1 9.5,17.5A1.5,1.5 0 0,1 11,16Z"></path>
                                </svg>
                            </span>
                            <span>Invalidate All RememberMe</span>
                        </button>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>
<div class="modal" id="2fa-modal-app">
    <div class="modal-background"></div>
    <div class="modal-card">
        <div class="modal-card-body">
            <div class="content">
                <p>You are opting to use an authenticator app for 2FA, these common authenticator apps can be found in your mobile device app store:</p>
                <ul>
                    <li>Google Authenticator</li>
                    <li>LastPass Authenticator</li>
                    <li>Microsoft Authenticator</li>
                    <li>Authy</li>
                </ul>
                <p>Once you installed one of these apps, click bellow button to enable 2FA</p>
                <div class="buttons is-centered">
                    <button class="button is-primary 2fa-enable enterAction" data-type="app">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,1L3,5V11C3,16.55 6.84,21.74 12,23C17.16,21.74 21,16.55 21,11V5L12,1Z"></path>
                            </svg>
                        </span>
                        <span>Enable 2FA</span>
                    </button>
                    <button class="button is-light btn-close">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>
                            </svg>
                        </span>
                        <span>Close</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button class="modal-close is-large"></button>
</div>
<div class="modal" id="2fa-modal-app-submit">
    <div class="modal-background"></div>
    <div class="modal-card">
        <div class="modal-card-body">
            <div class="content">
                <p>Open your authenticator app and scan this QRCode to register our system, then get code from it to use here</p>
                <div class="hero">
                    <img id="qrcode" style="margin:auto; margin-top:2em;margin-bottom:2em" src="" />
                </div>
                <div class="field">
                    <p class="control has-icons-left">
                        <input class="input is-medium" type="text" placeholder="Your 2FA code">
                        <span class="icon is-small is-left">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M5.41,21L6.12,17H2.12L2.47,15H6.47L7.53,9H3.53L3.88,7H7.88L8.59,3H10.59L9.88,7H15.88L16.59,3H18.59L17.88,7H21.88L21.53,9H17.53L16.47,15H20.47L20.12,17H16.12L15.41,21H13.41L14.12,17H8.12L7.41,21H5.41M9.53,9L8.47,15H14.47L15.53,9H9.53Z" />
                            </svg>
                        </span>
                    </p>
                </div>
                <div class="buttons is-centered">
                    <button class="button is-primary 2fa-enable-submit enterAction" data-type="app">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,1L3,5V11C3,16.55 6.84,21.74 12,23C17.16,21.74 21,16.55 21,11V5L12,1Z"></path>
                            </svg>
                        </span>
                        <span>Enable 2FA</span>
                    </button>
                    <button class="button is-light btn-close">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>
                            </svg>
                        </span>
                        <span>Close</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button class="modal-close is-large"></button>
</div>
<div class="modal" id="2fa-modal-email">
    <div class="modal-background"></div>
    <div class="modal-card">
        <div class="modal-card-body">
            <div class="content">
                <p>You are opting to use email authentication for 2FA, mean we will send you an email with verification code each time you login on new browser</p>
                <p>Click bellow button to enable 2FA, and do not close this browser till done</p>
                <div class="buttons is-centered">
                    <button class="button is-primary 2fa-enable enterAction" data-type="email">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M20.5,0A2.5,2.5 0 0,1 23,2.5V3A1,1 0 0,1 24,4V8A1,1 0 0,1 23,9H18A1,1 0 0,1 17,8V4A1,1 0 0,1 18,3V2.5A2.5,2.5 0 0,1 20.5,0M12,11L4,6V8L12,13L16.18,10.39C16.69,10.77 17.32,11 18,11H22V18A2,2 0 0,1 20,20H4A2,2 0 0,1 2,18V6A2,2 0 0,1 4,4H15V8C15,8.36 15.06,8.7 15.18,9L12,11M20.5,1A1.5,1.5 0 0,0 19,2.5V3H22V2.5A1.5,1.5 0 0,0 20.5,1Z"></path>
                            </svg>
                        </span>
                        <span>Enable 2FA</span>
                    </button>
                    <button class="button is-light btn-close">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>
                            </svg>
                        </span>
                        <span>Close</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button class="modal-close is-large"></button>
</div>
<div class="modal" id="2fa-modal-email-submit">
    <div class="modal-background"></div>
    <div class="modal-card">
        <div class="modal-card-body">
            <div class="content">
                <p>We sent you an email with 2fa code, please check spam folder if it is not delivered to your inbox</p>
                <p>Once you have the code, please submit it here to complete the 2FA process</p>
                <div class="field">
                    <p class="control has-icons-left">
                        <input class="input is-medium" type="text" placeholder="Your 2FA code">
                        <span class="icon is-small is-left">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M5.41,21L6.12,17H2.12L2.47,15H6.47L7.53,9H3.53L3.88,7H7.88L8.59,3H10.59L9.88,7H15.88L16.59,3H18.59L17.88,7H21.88L21.53,9H17.53L16.47,15H20.47L20.12,17H16.12L15.41,21H13.41L14.12,17H8.12L7.41,21H5.41M9.53,9L8.47,15H14.47L15.53,9H9.53Z" />
                            </svg>
                        </span>
                    </p>
                </div>
                <div class="buttons is-centered">
                    <button class="button is-primary 2fa-enable-submit enterAction" data-type="email">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M20.5,0A2.5,2.5 0 0,1 23,2.5V3A1,1 0 0,1 24,4V8A1,1 0 0,1 23,9H18A1,1 0 0,1 17,8V4A1,1 0 0,1 18,3V2.5A2.5,2.5 0 0,1 20.5,0M12,11L4,6V8L12,13L16.18,10.39C16.69,10.77 17.32,11 18,11H22V18A2,2 0 0,1 20,20H4A2,2 0 0,1 2,18V6A2,2 0 0,1 4,4H15V8C15,8.36 15.06,8.7 15.18,9L12,11M20.5,1A1.5,1.5 0 0,0 19,2.5V3H22V2.5A1.5,1.5 0 0,0 20.5,1Z"></path>
                            </svg>
                        </span>
                        <span>Enable 2FA</span>
                    </button>
                    <button class="button is-light btn-close">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>
                            </svg>
                        </span>
                        <span>Close</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button class="modal-close is-large"></button>
</div>
<div class="modal" id="2fa-modal-sms">
    <div class="modal-background"></div>
    <div class="modal-card">
        <div class="modal-card-body">
            <div class="content">
                <p>You are opting to use sms authentication for 2FA, mean we will send you an sms with verification code each time you login on new browser</p>
                <p>Click bellow button to enable 2FA, and do not close this browser till done</p>
                <div class="buttons is-centered">
                    <button class="button is-primary 2fa-enable enterAction" data-type="sms">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M4,2H20A2,2 0 0,1 22,4V16A2,2 0 0,1 20,18H16L12,22L8,18H4A2,2 0 0,1 2,16V4A2,2 0 0,1 4,2Z"></path>
                            </svg>
                        </span>
                        <span>Enable 2FA</span>
                    </button>
                    <button class="button is-light btn-close">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>
                            </svg>
                        </span>
                        <span>Close</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button class="modal-close is-large"></button>
</div>
<div class="modal" id="2fa-modal-sms-submit">
    <div class="modal-background"></div>
    <div class="modal-card">
        <div class="modal-card-body">
            <div class="content">
                <p>We sent you an sms with 2fa code, it may take up to 60s to get delivered</p>
                <p>Once you have the code, please submit it here to complete the 2FA process</p>
                <div class="field">
                    <p class="control has-icons-left">
                        <input class="input is-medium" type="text" placeholder="Your 2FA code">
                        <span class="icon is-small is-left">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M5.41,21L6.12,17H2.12L2.47,15H6.47L7.53,9H3.53L3.88,7H7.88L8.59,3H10.59L9.88,7H15.88L16.59,3H18.59L17.88,7H21.88L21.53,9H17.53L16.47,15H20.47L20.12,17H16.12L15.41,21H13.41L14.12,17H8.12L7.41,21H5.41M9.53,9L8.47,15H14.47L15.53,9H9.53Z" />
                            </svg>
                        </span>
                    </p>
                </div>
                <div class="buttons is-centered">
                    <button class="button is-primary 2fa-enable-submit enterAction" data-type="sms">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M4,2H20A2,2 0 0,1 22,4V16A2,2 0 0,1 20,18H16L12,22L8,18H4A2,2 0 0,1 2,16V4A2,2 0 0,1 4,2Z"></path>
                            </svg>
                        </span>
                        <span>Enable 2FA</span>
                    </button>
                    <button class="button is-light btn-close">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>
                            </svg>
                        </span>
                        <span>Close</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button class="modal-close is-large"></button>
</div>
<script>
/* global $, __tajs */
$(document).ready(function() {
    $('#clear-all').on('click', function() {
        var $this = $(this);
        __tajs.showConfirm('Are you sure? All remember-me cookies will be invalidated', function(yes) {
            if (yes) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/authentication/rememberme', {csrf_token: __tajs.csrf}, function(res) {
                    $this.removeClass('is-loading');
                    if (res.success) {
                        __tajs.showAlert('Clear successfully!', 'success');
                    }
                    else {
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                    }
                });
            }
        });
    });
    $('.2fa-modal').on('click', function() {
        var target = $('#2fa-modal-'+$(this).attr('data-type'));
        target.addClass('is-active');
    });
    $('.2fa-enable').on('click', function() {
        var $this = $(this), type = $this.attr('data-type'), target = '2fa-modal-'+type;
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/authentication/two-factor', {type: type, csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (res.success) {
                if (type == 'app') $('#qrcode').attr('src', res.qrcode);
                console.log('#'+target+'-submit');
                $('#'+target+'-submit').addClass('is-active');
                $('#'+target).removeClass('is-active');
            }
            else {
                __tajs.showAlert(res.data);
            }
        });
    });
    $('.2fa-enable-submit').on('click', function() {
        var $this = $(this), code = parseInt($this.closest('.content').find('.input').val(),10), type = $this.attr('data-type');
        if(!code || code.toString().length != 6) {
            __tajs.showAlert('Please enter valid 6-digits from your '+type);
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