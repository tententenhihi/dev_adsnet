
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
     <meta name="csrf-token" content="<?=$this->csrf()?>" />
    <title><?=SITE_NAME?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <link rel="apple-touch-icon" href="<?=$this->asset2('app-assets/images/ico/apple-icon-120.png')?>">
    <link rel="shortcut icon" type="image/x-icon" href="<?=$this->asset2('app-assets/images/logo/favicon.png')?>">
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
    <script src="<?=$this->asset2('assets/js/scripts.js')?>"></script>

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

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
                    <div class="col-xl-7 col-md-9 col-10 d-flex justify-content-center px-0">
                        <div class="card bg-authentication rounded-0 mb-0">
                            <div class="row m-0">
                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center">
                                    <img src="<?=$this->asset2('app-assets/images/pages/forgot-password.png')?>" alt="branding logo" width="100%">
                                </div>
                                <div class="col-lg-6 col-12 p-0">
                                    <div class="card rounded-0 mb-0 px-2 py-1 h-100 justify-content-center" id="forgot_form">
                                        <div class="card-header pb-1 d-block">
                                            <div class="card-logo d-flex justify-content-center mb-2 d-xl-none d-lg-none">
                                                <img src="<?=$this->asset2('app-assets/images/logo/logo1.png')?>" alt="branding logo" width="30%">
                                            </div>
                                            <div class="card-title">
                                                <h4 class="mb-0">Recover your password</h4>
                                            </div>
                                        </div>
                                        <p class="px-2 mb-0">Please enter your email address and we'll send you instructions on how to reset your password.</p>
                                        <div class="card-content">
                                            <div class="card-body">
                                                <form action="index.html">
                                                    <div class="form-label-group">
                                                        <input type="email" id="email" class="form-control" placeholder="Email">
                                                        <label for="inputEmail">Email</label>
                                                    </div>
                                                </form>
                                                <div class="float-md-left d-block mb-1">
                                                    <a href="/auth/login" class="btn btn-outline-primary btn-block px-75">Back to Login</a>
                                                </div>
                                                <div class="float-md-right d-block mb-1">
                                                    <button id="enterAction" class="btn btn-primary btn-block px-75">Recover Password</button>
                                                </div>
                                            </div>

                                            

                                        </div>
                                    </div>
                                    <div class="card rounded-0 mb-0 px-2 py-1"  id="forgot_done" style="display:none">
                                        <div class="card-header pb-1">
                                            <div class="card-title">
                                                <h4 class="mb-0">Recover your password</h4>
                                            </div>
                                        </div>
                                        
                                        <div class="card-content">
                                            <div class="card-body" id="forgot_form">
                                                <p><h5 class="mb-0 text-info">An email with reset link was sent to your email.</h5></p>
                                                <p><h6 class="mb-0 text-info">Click the link in your email to create new password.</h6></p>
                                                <p><h6 class="mb-0 text-info">The link is valid with in 2 hours. If you don't see the email, check your spam folder or other folders</h6></p>
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

    <?php if($this->data->is_expired): ?>
    <div class="modal is-active">
        <div class="modal-background"></div>
        <div class="modal-content">
            <div class="notification is-warning">
                Your token is invalid or expired, please make new Reset-Password request
            </div>
        </div>
        <button class="modal-close is-large"></button>
    </div>
    <?php endif; ?>
    <!-- END: Content-->


    <!-- BEGIN: Vendor JS-->
    <script src="<?=$this->asset2('app-assets/vendors/js/vendors.min.js')?>"></script>
    <!-- BEGIN Vendor JS-->

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
            var $this = $(this), email = $.trim($('#email').val());
            if (!email || email.length < 6 || email.indexOf('@') == -1 || email.indexOf('.') == -1) {
                __tajs.showAlert('Please enter the email you registered with us');
                return false;
            }
            
            $this.addClass('is-loading');
            $this.prop("disabled", true);
            $.post('/auth/forgot-password', {
                email: email,
                csrf_token: '<?=$this->csrf()?>'
            }, function(res) {
                if (!res.success) {
                    $this.removeClass('is-loading');
                    $this.prop("disabled", false);
                    __tajs.showAlert(res.data);
                }
                else {
                    $('#forgot_form').remove();
                    $('#forgot_done').show();
                }
            });
        });
    });
    </script>
</body>
<!-- END: Body-->
