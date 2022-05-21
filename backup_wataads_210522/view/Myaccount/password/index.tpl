<section class="wrapper">
    <div class="container">
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-4-tablet is-12-mobile">
                    <h1 class="title is-5">
                        Change Password
                    </h1>
                </div>
                <div class="column is-8-tablet is-hidden-mobile">
                    <nav class="breadcrumb has-succeeds-separator is-right" aria-label="breadcrumbs">
                        <ul>
                            <li><a href="/"><?=SITE_NAME?></a></li>
                            <li class="is-active"><a href="#" aria-current="page">Password</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <div class="message is-info">
                    <div class="message-body">
                        <p>A secure password helps protect your online account. A strong password can be memorable to you but nearly impossible for someone else to guess.<br>
                        Don't use a password that: Is particularly weak. Example: "password123", or You've used before on your account</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <article class="flatbox">
                    <div class="field">
                        <label class="label">Current Password</label>
                        <div class="control has-icons-left">
                            <input class="input" type="password" id="password_current" placeholder="Current Password" value="">
                            <span class="icon is-small is-left">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7,14A2,2 0 0,1 5,12A2,2 0 0,1 7,10A2,2 0 0,1 9,12A2,2 0 0,1 7,14M12.65,10C11.83,7.67 9.61,6 7,6A6,6 0 0,0 1,12A6,6 0 0,0 7,18C9.61,18 11.83,16.33 12.65,14H17V18H21V14H23V10H12.65Z" />
                                </svg>
                            </span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">New Password</label>
                        <div class="control has-icons-left">
                            <input class="input" type="password" id="password" placeholder="New Password" value="">
                            <span class="icon is-small is-left">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7,14A2,2 0 0,1 5,12A2,2 0 0,1 7,10A2,2 0 0,1 9,12A2,2 0 0,1 7,14M12.65,10C11.83,7.67 9.61,6 7,6A6,6 0 0,0 1,12A6,6 0 0,0 7,18C9.61,18 11.83,16.33 12.65,14H17V18H21V14H23V10H12.65Z" />
                                </svg>
                            </span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Verify Password</label>
                        <div class="control has-icons-left">
                            <input class="input" type="password" id="password_verify" placeholder="Verify Password" value="">
                            <span class="icon is-small is-left">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7,14A2,2 0 0,1 5,12A2,2 0 0,1 7,10A2,2 0 0,1 9,12A2,2 0 0,1 7,14M12.65,10C11.83,7.67 9.61,6 7,6A6,6 0 0,0 1,12A6,6 0 0,0 7,18C9.61,18 11.83,16.33 12.65,14H17V18H21V14H23V10H12.65Z" />
                                </svg>
                            </span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Logout Option</label>
                        <p class="control">
                            <label class="checkbox">
                                <input type="checkbox" id="logout_all">
                                <span class="checkbox-text text-muted">Logout all logged in devices/browsers</span>
                            </label>
                        </p>
                    </div>
                    <div class="buttons is-centered pt-1">
                        <button class="button is-warning" id="save_password">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                </svg>
                            </span>
                            <span>Update Password</span>
                        </button>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>
<script>
/* global $, __tajs */
$(document).ready(function() {
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
});
</script>