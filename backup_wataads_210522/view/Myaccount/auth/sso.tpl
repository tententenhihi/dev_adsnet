
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
     <meta name="csrf-token" content="<?=$this->csrf()?>" />
    <title><?=SITE_NAME?></title>
    
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
                        <section class="text-bold">
                            <div class="hero-body">
                                <div class="container has-text-centered">
                                    <h1 class="title is-1">Waiting...</h1><p></p>
                                    <h2 class="subtitle is-6">You are sending to destination page. If you see this page in a long time, please refresh or contact administrator.</h2>
                                </div>
                            </div>
                        </section>
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
    $.ajax({
        url: '<?=$this->data->auth_sso?>',
        method: 'POST',
        data: {token: '<?=$this->data->login_token?>'},
        xhrFields: { withCredentials: true },
        success: function(res) {
            if(res.success) {
                window.location.replace('<?=$this->data->return_url?>');
            } else {
                __tajs.showAlert(res.data);
            }
        }
    });

    </script>
</body>
<!-- END: Body-->
