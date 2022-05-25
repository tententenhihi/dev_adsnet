<!DOCTYPE html>
<html>
<head>
    <meta name="csrf-token" content="<?=$this->csrf()?>" />
    <title><?=SITE_NAME?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <link rel="apple-touch-icon" href="<?=$this->asset2('app-assets/images/ico/apple-icon-120.png')?>">
    <link rel="shortcut icon" type="image/x-icon" href="<?=$this->asset2('app-assets/images/ico/favicon.ico')?>">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/vendors/css/vendors.min.css')?>">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/bootstrap.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/bootstrap-extended.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/colors.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/components.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/themes/dark-layout.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/themes/semi-dark-layout.css')?>">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/core/menu/menu-types/vertical-menu.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/core/colors/palette-gradient.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/pages/authentication.css')?>">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('assets/css/style.css')?>">
    <!-- END: Custom CSS-->
    <link rel="stylesheet" href="<?=$this->asset2('assets/css/style.css')?>">
    <!-- BEGIN: Vendor JS-->
    <script src="<?=$this->asset2('app-assets/vendors/js/vendors.min.js')?>"></script>
    <!-- BEGIN Vendor JS-->
    <script src="<?=$this->asset2('assets/js/scripts.js')?>"></script>
    <style>
        btn-primary{
            background-color:#8b08bb;
        }
        a{
            color:#8b08bb;
        }
    </style>
</head>
<!-- END: Head-->
<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="2-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-xl-8 col-11 d-flex justify-content-center">
                        <div class="card bg-authentication rounded-0 mb-0">
                            <div class="row m-0">
                            <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
                                             <img src="<?=$this->asset2('app-assets/images/pages/login2.png')?>" alt="branding logo" width="100%">
                                        </div>
                                <div class="col-lg-6 col-12 p-0">
                                    <div class="card rounded-0 mb-0 px-2 h-100 justify-content-center">
                                         <div class="card-logo d-flex justify-content-center mb-2 d-xl-none d-lg-none" style="">
                                        <img src="<?=$this->asset2('app-assets/images/logo/logo-viraads.png')?>" alt="logo" id="logo1" width="70%" style="margin-top: 20px;">
                                    </div>
                                        <div class="card-header pb-1">
                                            <div class="card-title">
                                                <h4 class="mb-0">Login</h4>
                                            </div>
                                        </div>
                                        <p class="px-2">Welcome back, please login to your account.</p>
                                        <div class="card-content">
                                            <div class="card-body pt-1">
                                                
                                                    <fieldset class="form-label-group form-group position-relative has-icon-left">
                                                        <input type="text" class="form-control" id="email" placeholder="Email" required>
                                                        <div class="form-control-position">
                                                            <i class="feather icon-user"></i>
                                                        </div>
                                                        <label for="user-name">Email</label>
                                                    </fieldset>

                                                    <fieldset class="form-label-group  position-relative has-icon-left">
                                                        <input type="password" class="form-control" id="password" placeholder="Password" required>
                                                        <div class="form-control-position">
                                                            <i class="feather icon-lock"></i>
                                                        </div>
                                                        <label for="password">Password</label>
                                                    </fieldset>
                                                    <div class="form-group d-flex justify-content-between align-items-center">
                                                        <div class="text-left">
                                                            <fieldset class="checkbox">
                                                                <div class="vs-checkbox-con vs-checkbox-primary">
                                                                    <input type="checkbox">
                                                                    <span class="vs-checkbox">
                                                                        <span class="vs-checkbox--check">
                                                                            <i class="vs-icon feather icon-check"></i>
                                                                        </span>
                                                                    </span>
                                                                    <span class="">Remember me</span>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                        <div class="text-right"><a href="/auth/forgot-password" class="card-link">Forgot Password?</a></div>
                                                    </div>
                                                    <a href="/auth/register" class="btn btn-outline-primary float-left btn-inline">Register</a>
                                                    <button class="btn btn-primary float-right btn-inline" id="enterAction">Login</button>
                                                
                                            </div>
                                        </div>
                                        <div class="login-footer mb-2">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <!-- END: Content-->


    

    <!-- BEGIN: Page Vendor JS-->
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="<?=$this->asset2('app-assets/js/core/app-menu.js')?>"></script>
    <script src="<?=$this->asset2('app-assets/js/core/app.js')?>"></script>
    <script src="<?=$this->asset2('app-assets/js/scripts/components.js')?>"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <!-- END: Page JS-->

<script>

/* global $, __tajs */
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var $this = $(this), email = $.trim($('#email').val()),
            password = $('#password').val(), code = $.trim($('#2fa-code').val());
        if (!email || email.length < 6 || email.indexOf('@') == -1 || email.indexOf('.') == -1) {
            __tajs.showAlert('Invalid email address!');
            return false;
        }
        if (!password || password.length < 6) {
            __tajs.showAlert('Invalid password');
            return false;
        }

        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/auth/login', {
            csrf_token: '<?=$this->csrf()?>',
            email: email,
            password: password,
            code: code,
            remember_me: $('#remember_me').is(':checked') ? 1 : 0
        }, function(res) {
            if (!res.success) {
                if(!res.two_factor) {
                    $this.removeClass('is-loading');
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                    return false;
                }
                $('#2fa-text').html(res.data);
                $('#2fa-code').val('');
                $('#2fa-verification').toggleClass('is-active');
            }
            else {
                window.location.reload(true);
            }
        });
    });
});
</script>
</body>
</html>
