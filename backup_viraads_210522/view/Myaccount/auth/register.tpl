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
    <!-- BEGIN: Custom JS-->
    <script src="<?=$this->asset2('assets/js/scripts.js')?>"></script>
    <!-- BEGIN Custom JS-->
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
<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-xl-8 col-10 d-flex justify-content-center" >
                        <div class="card bg-authentication rounded-0 mb-0" >
                            <div class="row m-0">
                               
                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center pl-0 pr-3 py-0">
                                    <img src="<?=$this->asset2('app-assets/images/pages/register2.png')?>" alt="branding logo" width="100%">
                                </div>
                                <div class="col-lg-6 col-12 p-0">
                                    <div class="card rounded-0 mb-0 p-2  h-100 justify-content-center" id="register_form" >
                                      <div class="card-logo d-flex justify-content-center mb-2 d-xl-none d-lg-none">
                                        <img src="<?=$this->asset2('app-assets/images/logo/logo-viraads.png')?>" alt="logo" id="logo1" width="70%" style="margin-top: 20px;">
                                    </div>
                                        <div class="card-header pt-50 pb-1">
                                            <div class="card-title">
                                                <h4 class="mb-0">Create Account</h4>
                                            </div>
                                        </div>
                                        <p class="px-2">Fill the below form to create a new account.</p>
                                        <div class="card-content">
                                            <div class="card-body pt-0">
                                                <div>
                                                    <div class="form-label-group">
                                                        <input type="text" id="name" class="form-control" placeholder="Name" required="">
                                                        <label for="inputName">Name</label>
                                                    </div>
                                                    <div class="form-label-group">
                                                        <input type="email" id="email" class="form-control" placeholder="Email" required="">
                                                        <label for="inputEmail">Email</label>
                                                    </div>
                                                    <div class="form-label-group">
                                                        <input type="password" id="password" class="form-control" placeholder="Password" required="">
                                                        <label for="password">Password</label>
                                                    </div>
                                                    <div class="form-label-group">
                                                        <input type="password" id="password2" class="form-control" placeholder="Confirm Password" required="">
                                                        <label for="password2">Confirm Password</label>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-12">
                                                            <fieldset class="checkbox">
                                                                <div class="vs-checkbox-con vs-checkbox-primary">
                                                                    <input type="checkbox" checked="" id="agree_tac">
                                                                    <span class="vs-checkbox">
                                                                        <span class="vs-checkbox--check">
                                                                            <i class="vs-icon feather icon-check"></i>
                                                                        </span>
                                                                    </span>
                                                                    <span class=""> I accept the <a href="<?=FRONTEND_URL?>/legal/terms">terms &amp; conditions.</a></span>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                    <a href="/auth/login" class="btn btn-outline-primary float-left btn-inline mb-50 waves-effect waves-light">Login</a>
                                                    <button id="enterAction" class="btn btn-primary float-right btn-inline mb-50 waves-effect waves-light">Register</button>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card rounded-0 mb-0 p-2 h-100"  id="register_done" style="display:none">
                                        <div class="card-header pt-50 pb-1">
                                            <div class="card-title">
                                                
                                            </div>
                                            <div class="card-content">
                                                <div class="card-body pt-0">
                                                    <div>
                                                    <div class="swal2-icon swal2-success swal2-animate-success-icon" style="display: flex;"><div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div><span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span><div class="swal2-success-ring"></div> <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div><div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div></div>
                                                    </div>
                                                    <h2 class="mb-1 text-center">Registration successfull</h2>
                                                    <div class="form-label-group">
                                                        <p>We've just sent you an email, please follow it to activate your account.</p>
                                                        <p>The activation link is valid for 2hrs from now. Check spam folder if it is not delivered to your inbox</p>
                                                    </div>
                                                    <a href="/auth/login" class="btn btn-outline-primary float-left btn-inline mb-50 waves-effect waves-light">Back to login</a>
                                                </div>
                                            </div>
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


    <!-- BEGIN: Vendor JS-->
    <script src="<?=$this->asset2('app-assets/vendors/js/vendors.min.js')?>"></script>
    
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="<?=$this->asset2('app-assets/vendors/js/extensions/sweetalert2.all.min.js')?>" aria-hidden="true"></script>
    <script src="<?=$this->asset2('app-assets/vendors/js/extensions/polyfill.min.js')?>" aria-hidden="true"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="<?=$this->asset2('app-assets/js/core/app-menu.js')?>"></script>
    <script src="<?=$this->asset2('app-assets/js/core/app.js')?>"></script>
    <script src="<?=$this->asset2('app-assets/js/scripts/components.js')?>"></script>
    <script src="<?=$this->asset2('app-assets/js/scripts/pages/bootstrap-toast.js')?>"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <!-- END: Page JS-->



    
<script>
/* global $, __tajs */

$(document).ready(function() {
    $('#agree_tac').on('change', function() {
        if (this.checked) {
            $('#enterAction').prop('disabled', false);
        }
        else {
            $('#enterAction').prop('disabled', true);
        }
    });
    $('#name, #email, #password, #password2').on('input', function() {
        $(this).removeClass('is-danger');
    });
    $('#toast').on('click', function () {
        Swal.fire({
        title: "Good job!",
        text: "You clicked the button!",
        type: "success",
        confirmButtonClass: 'btn btn-primary',
        buttonsStyling: false,
        });
    });
    $('#enterAction').on('click', function() {
        var $this = $(this),
            name = $.trim($('#name').val()),
            email = $.trim($('#email').val()),
            password = $.trim($('#password').val()),
            password2 = $.trim($('#password2').val());
            $('#name').removeClass('is-danger');
            $('#email').removeClass('is-danger');
            $('#password').removeClass('is-danger');
            $('#password2').removeClass('is-danger');
        if(!name || name.length < 3) {
            __tajs.showAlert2('Please let us know your full name');
            $('#name').addClass('is-danger');
            return false;
        }
        if (!email || email.length < 6 || email.indexOf('@') == -1 || email.indexOf('.') == -1) {
            __tajs.showAlert2('Please using your real email, you\'ll need it to verify your account');
            $('#email').addClass('is-danger');
            return false;
        }
        if(!password || password.length < 6) {
            __tajs.showAlert2('Please use strong password to protect your account');
            $('#password').addClass('is-danger');
            return false;
        }
        if(password != password2) {
            __tajs.showAlert2('Your password does not match!');
            $('#password2').addClass('is-danger');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop("disabled", true);
        $.post('/auth/register', {
            email: email,
            name: name,
            password: password,
            csrf_token: '<?=$this->csrf()?>'
        }, function(res) {
            if (!res.success) {
                __tajs.showAlert(res.data);
                $this.removeClass('is-loading');
                $this.prop("disabled", false);
            }
            else {
                $('#register_form').remove();
                $('#register_done').show();
            }
        });
    });
});
</script>
</body>
</html>
