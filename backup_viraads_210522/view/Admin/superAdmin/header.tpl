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
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/bootstrap.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/bootstrap-extended.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/colors.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/components.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/themes/dark-layout.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/themes/semi-dark-layout.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/vendors/css/forms/select/select2.min.css')?>">


    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/core/menu/menu-types/vertical-menu.css')?>">
    <link rel="stylesheet" type="text/css" href="<?=$this->asset2('app-assets/css/core/colors/palette-gradient.css')?>">
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
                            <a class="dropdown-item" href="/profile">
                                <i class="feather icon-user"></i> Account setting
                            </a>
                            <div class="dropdown-divider"></div><a class="dropdown-item" href="<?=MYACCOUNT_URL?>/auth/logout"><i class="feather icon-power"></i> Logout</a>
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
            <li class=" nav-item">
                <a href="/dashboard">
                    <i class="feather icon-home"></i>
                    <span class="menu-title" data-i18n="Dashboard">Dashboard</span>
                </a>
            </li>
            <li class=" navigation-header"><span>User</span>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-users"></i><span class="menu-title" data-i18n="Card">Users</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/user"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Users</span></a>
                    </li>
                    <li class=""><a href="/user/api"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">APIs</span></a>
                    </li>
                    <li class=""><a href="/user/referral"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">User Referrals</span></a>
                    </li>
                    <li class=""><a href="/user/notification"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">User Notifications</span></a>
                    </li>
                    <li class=""><a href="/user/activity"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">User Activities</span></a>
                    </li>
                    <li class=""><a href="/user/authentication"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">Authentications</span></a>
                    </li>
                    <li class=""><a href="/user/session"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">User Sessions</span></a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-users"></i><span class="menu-title" data-i18n="Card">Publisher</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/publisher"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Publishers Overview</span></a>
                    </li>
                    <li class=""><a href="/publisher/website"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">Websites</span></a>
                    </li>
                    <li class=""><a href="/publisher/zone"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">Zones</span></a>
                    </li>
                    <li class=""><a href="/publisher/domain"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Anti-Adblock Domains</span></a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-users"></i><span class="menu-title" data-i18n="Card">Advertiser</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/advertiser"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Advertiser Overview</span></a>
                    </li>
                    <li class=""><a href="/advertiser/campaign"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">Campaigns</span></a>
                    </li>
                    <li class=""><a href="/advertiser/ad"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">Ads</span></a>
                    </li>
                    <li class=""><a href="/advertiser/creative"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Creative</span></a>
                    </li>
                    <li class=""><a href="/advertiser/audience"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Audiences</span></a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-credit-card"></i><span class="menu-title" data-i18n="Card">Billing</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/billing"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Overview</span></a>
                    </li>
                    <li class=""><a href="/billing/paygate"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">Paygate</span></a>
                    </li>
                    <li class=""><a href="/billing/deposit"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">Deposit</span></a>
                    </li>
                    <li class=""><a href="/billing/withdraw"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Withdraw</span></a>
                    </li>
                    <li class=""><a href="/billing/receipt"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">Receipt</span></a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-settings"></i><span class="menu-title" data-i18n="Card">System</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/system"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Overview</span></a>
                    </li>
                    <li class=""><a href="/system/adformat"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">Ad Formats</span></a>
                    </li>
                    <li class=""><a href="/system/country"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">Country</span></a>
                    </li>
                    <li class=""><a href="/system/dimension"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">System Dimensions</span></a>
                    </li>
                    <li class=""><a href="/system/task"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">Task</span></a>
                    </li>
                    <li class=""><a href="/system/log"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">Log</span></a>
                    </li>
                    <li class=""><a href="/system/setting"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">System Overview</span></a>
                    </li>
                </ul>
            </li>
            
            <li class=" nav-item"><a href="/announcement"><i class="feather icon-bell"></i><span class="menu-title" data-i18n="Email">Announcement</span></a>
            </li>
            <li class=" nav-item"><a href="/ad"><i class="feather icon-airplay"></i><span class="menu-title" data-i18n="Chat">Ads</span></a>
            </li>
            <li class=" nav-item"><a href="/edge"><i class="feather icon-server"></i><span class="menu-title" data-i18n="Chat">Edge</span></a>
            </li>
            <li class=" nav-item"><a href="/loadbalancer"><i class="fa fa-sitemap"></i><span class="menu-title" data-i18n="Chat">LoadBalancer</span></a>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-repeat"></i><span class="menu-title" data-i18n="Card">Exchange</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/exchange"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Exchange</span></a>
                    </li>
                    <li class=""><a href="/exchange/network"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">All Networks</span></a>
                    </li>
                    <li class=""><a href="/exchange/ad"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">Ads</span></a>
                    </li>
                    <li class=""><a href="/exchange/payment"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Exchange Payments</span></a>
                    </li>
                    <li class=""><a href="/exchange/report"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">Standard Report</span></a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-repeat"></i><span class="menu-title" data-i18n="Card">OpenRTB</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/openrtb"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Overview</span></a>
                    </li>
                    <li class=""><a href="/openrtb/network"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">All Networks</span></a>
                    </li>
                    <li class=""><a href="/openrtb/ad"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">Ads</span></a>
                    </li>
                    <li class=""><a href="/openrtb/payment"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Exchange Payments</span></a>
                    </li>
                    <li class=""><a href="/openrtb/report"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Card Actions">Standard Report</span></a>
                    </li>
                </ul>
            </li>
            <li class="nav-item has-sub sidebar-group"><a href="#"><i class="feather icon-help-circle"></i><span class="menu-title" data-i18n="Card">Support</span></a>
                <ul class="menu-content" >
                    <li class=""><a href="/support"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Basic">Support</span></a>
                    </li>
                    <li class=""><a href="/support/create"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Advance">Create new ticket</span></a>
                    </li>
                    <li class=""><a href="/support/opening"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Statistics">Opening Support</span></a>
                    </li>
                </ul>
            </li>
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

