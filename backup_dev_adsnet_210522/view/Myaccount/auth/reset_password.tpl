<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Recovery your password - <?=SITE_NAME?></title>
<link rel="shortcut icon" href="<?=$this->asset('img/favicon.png')?>">
<link rel="stylesheet" href="<?=$this->asset('css/app.css')?>">
<script src="<?=$this->asset('js/app.js')?>"></script>
</head>
<body>
    <section class="hero is-fullheight is-bold">
        <div class="hero-body">
            <div class="container">
                <div class="columns">
                    <div class="column is-4"></div>
                    <div class="column is-4">
                        <div class="field has-text-centered">
                            <h3 class="title is-4 text-muted">Password Recovery</h3>
                            <h4 class="subtitle is-5 text-muted">Please enter your NEW password</h4>
                        </div>
                        <div class="field">
                            <div class="control has-icons-left">
                                <input class="input is-medium" type="password" placeholder="Password" id="password">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M7,14A2,2 0 0,1 5,12A2,2 0 0,1 7,10A2,2 0 0,1 9,12A2,2 0 0,1 7,14M12.65,10C11.83,7.67 9.61,6 7,6A6,6 0 0,0 1,12A6,6 0 0,0 7,18C9.61,18 11.83,16.33 12.65,14H17V18H21V14H23V10H12.65Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <div class="control has-icons-left">
                                <input class="input is-medium" type="password" placeholder="Verify Password" id="password2">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M7,14A2,2 0 0,1 5,12A2,2 0 0,1 7,10A2,2 0 0,1 9,12A2,2 0 0,1 7,14M12.65,10C11.83,7.67 9.61,6 7,6A6,6 0 0,0 1,12A6,6 0 0,0 7,18C9.61,18 11.83,16.33 12.65,14H17V18H21V14H23V10H12.65Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <div class="control">
                                <button class="button is-success" id="enterAction">
                                    <span>Submit</span>
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,3H5C3.89,3 3,3.89 3,5V9H5V5H19V19H5V15H3V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M10.08,15.58L11.5,17L16.5,12L11.5,7L10.08,8.41L12.67,11H3V13H12.67L10.08,15.58Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                        </div>
                        <div class="field">
                            <div class="control">
                                <a href="/auth/login" class="button is-primary is-light is-transparent">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
                                        </svg>
                                    </span>
                                    <span>Back to login page</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="column is-4"></div>
                </div>
            </div>
        </div>
    </section>
<script>
/* global $, __tajs */
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var $this = $(this), password = $('#password').val(),
            password2 = $('#password2').val();
        if (!password || password.length < 6) {
            __tajs.showAlert('Password require minimum 6 characters, use strong password to portect your account');
            return false;
        }
        if (password != password2) {
            __tajs.showAlert('Oops! Verify Password does not match!');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop("disabled", true);
        $.post('/auth/reset-password', {
            csrf_token: '<?=$this->csrf()?>',
            token: '<?=$this->data->token?>',
            password: password
        }, function(res) {
            if (!res.success) {
                $this.removeClass('is-loading');
                $this.prop("disabled", false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.href = res.data;
            }
        });
    });
});
</script>
</body>
</html>
