<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Mạng quảng cáo số một việt nam">
    <meta name="keywords" content="Advertiser,Publisher,ads,adsnet,quang cao">
    <meta name="author" content="WataAds">
    <meta name="csrf-token" content="<?=$this->csrf()?>" />
    <title><?=$this->title.' - '.SITE_NAME?></title>
    <link rel="apple-touch-icon" href="<?=$this->asset2('app-assets/images/ico/apple-icon-120.png')?>">
    <link rel="shortcut icon" type="image/x-icon" href="<?=$this->asset2('app-assets/images/logo/favicon.png')?>">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/vendors/css/vendors.min.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/vendors/css/forms/select/select2.min.css')?>">
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
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/plugins/forms/wizard.css')?>">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('assets/css/style.css')?>">
    <!-- END: Custom CSS-->

    <!-- BEGIN: Vendor JS-->
    <script src="<?=$this->asset2('app-assets/vendors/js/vendors.min.js')?>"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Vendor JS-->
    <script src="<?=$this->asset2('assets/js/scripts.js')?>"></script>
    <!-- BEGIN Vendor JS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

    <!-- BEGIN: Header-->
    <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-dark bg-primary navbar-shadow">
        <div class="navbar-wrapper">
            <div class="navbar-container content">
                <div class="navbar-collapse" id="navbar-mobile">
                    <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                        <ul class="nav navbar-nav">
                            <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                        </ul>
                        <ul class="nav navbar-nav bookmark-icons">
                            <span class="renderTime text-white" style="font-size:2rem" data-time="<?=date('c')?>" data-offset="<?=date('Z')?>" data-format="h:i:s">00:00:00</span>

                            <!--<li class="nav-item d-none d-md-block">
                                <a class="nav-link" href="<?=MYACCOUNT_URL?>" data-toggle="tooltip" data-placement="top" title="Back to MyAccount Panel">
                                    <i class="feather icon-log-in"></i> Back to MyAccount
                                </a>
                            </li>-->
                        </ul>
                        
                    </div>
                    <ul class="nav navbar-nav float-right ">
                        <!--<li class="dropdown dropdown-language nav-item">
                            <a class="dropdown-toggle nav-link" id="dropdown-flag" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="flag-icon flag-icon-us"></i><span class="selected-language">English</span></a>
                            <div class="dropdown-menu" aria-labelledby="dropdown-flag">
                                <a class="dropdown-item" href="#" data-language="en"><i class="flag-icon flag-icon-us"></i> English</a>
				                <a class="dropdown-item" href="#" data-language="vn"><i class="flag-icon flag-icon-vn"></i> Tiếng Việt</a>
                            </div>
                        </li>-->
                        <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                        
                        
                        <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon feather icon-bell"></i><span class="badge badge-pill badge-warning badge-up" id="noti_count_flag">0</span></a>
                            <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                                <li class="dropdown-menu-header">
                                    <div class="dropdown-header m-0 p-2">
                                        <h3 class="white" id="noti_count">0</h3><span class="notification-title">App Notifications</span>
                                    </div>
                                </li>
                                <li class="dropdown-menu-footer" id="noti_viewall"><a class="dropdown-item p-1 text-center" href="/notification" >View all notifications</a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600"><?=$this->getSession('name')?></span><span class="user-status">Available</span></div><span><img class="round" src="https://www.gravatar.com/avatar/<?=md5($this->getSession('email'))?>" alt="avatar" height="40" width="40"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="<?=MYACCOUNT_URL . '/profile' ?>">
                                    <i class="feather icon-user"></i> Account setting
                                </a>
                                <div class="dropdown-divider"></div><a class="dropdown-item" href="<?=MYACCOUNT_URL?><?php if($this->isLoginAsClient()): ?>/admin/login<?php else: ?>/auth/logout<?php endif; ?>"><i class="feather icon-power"></i> Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <ul class="main-search-list-defaultlist-other-list d-none">
        <li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer"><a class="d-flex align-items-center justify-content-between w-100 py-50">
                <div class="d-flex justify-content-start"><span class="mr-75 feather icon-alert-circle"></span><span>No results found.</span></div>
            </a></li>
    </ul>
    <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mr-auto"><a class="navbar-brand" href="#">
                        <div class="brand-logo"></div>
                    </a></li>
                <li class="nav-item nav-toggle">
                    <a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse">
                        <i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i>
                        <i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary hidden" data-ticon="icon-disc"></i>
                    </a>
                </li>
            </ul>
        </div>
        <div class="shadow-bottom"></div>
        <div class="main-menu-content mt-1">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                <li class=" nav-item"><a href="/dashboard"><i class="feather icon-home"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span></a>
                </li>
                <li class=" navigation-header"><span>Website</span>
                </li>
                <li class=" nav-item"><a href="/website"><i class="feather icon-globe"></i><span class="menu-title" data-i18n="Email">Website</span></a>
                </li>
                <li class=" nav-item"><a href="/zone"><i class="feather icon-map-pin"></i><span class="menu-title" data-i18n="Chat">Zone</span></a>
                </li>
                
                <li class=" navigation-header"><span>Adblock</span>
                </li>
                <li class=" nav-item"><a href="/domain"><i class="fa fa-globe"></i><span class="menu-title" data-i18n="Email">Adblock</span></a>
                </li>
                <li class=" navigation-header"><span>Billing</span>
                </li>

                <li class=" nav-item"><a href="<?=MYACCOUNT_URL?>/billing"><i class="fa fa-tachometer"></i><span class="menu-title" data-i18n="Google Maps">Overview</span></a></li>
                <li class=" nav-item"><a href="<?=MYACCOUNT_URL?>/billing/balance"><i class="fa fa-money"></i><span class="menu-title" data-i18n="Google Maps">Balance</span></a></li>
                <li class=" nav-item"><a href="<?=MYACCOUNT_URL?>/billing/withdraw"><i class="fa fa-credit-card"></i><span class="menu-title" data-i18n="Google Maps">Withdraw</span></a>
                </li>
                <li class=" nav-item"><a href="<?=MYACCOUNT_URL?>/billing/receipt"><i class="fa fa-file-text-o"></i><span class="menu-title" data-i18n="Google Maps">Receipts</span></a>
                </li>
                <li class=" navigation-header"><span>Report</span>
                </li>
                
                <li class=" nav-item"><a href="/report"><i class="fa fa-file-text-o"></i><span class="menu-title" data-i18n="Google Maps">Standard Report</span></a></li>
                <li class=" nav-item"><a href="/report/schedule"><i class="fa fa-calendar-plus-o"></i><span class="menu-title" data-i18n="Google Maps">Scheduled Report</span></a></li>
                <li class=" nav-item"><a href="/report/realtime"><i class="fa fa-clock-o"></i><span class="menu-title" data-i18n="Google Maps">Realtime Report</span></a></li>
                
                
            </ul>
        </div>
    </div>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0"><?=$this->title?></h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/"><?=SITE_NAME?></a>
                                    </li>
                                    <li class="breadcrumb-item active"><?=$this->title?>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>