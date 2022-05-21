<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><?=$this->title?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="an Advertising Network and Social Media Marketing Platform" />
    <meta name="keywords" content="smm, marketing, advertising, publishers, advertisers, youtube views, instagram follows, facebook fans, twitter views" />
    <!-- favicon -->
    <link rel="shortcut icon" href="<?=$this->asset('img/favicon.png')?>">
    <!--Slider-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
    <!-- css -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?=$this->asset('landing/css/style.min.css')?>" rel="stylesheet" type="text/css" />

</head>
<body>

    <!-- Loader -->
    <div id="preloader">
        <div id="status">
            <div class="spinner">
                <div class="dot1"></div>
                <div class="dot2"></div>
            </div>
        </div>
    </div>

    <!--Navbar Start-->
    <nav class="navbar navbar-expand-lg fixed-top navbar-custom sticky sticky-dark">
        <div class="container">
            <!-- LOGO -->
            <a class="navbar-brand logo" href="/">
                <img src="<?=$this->asset('img/smm.gome.io.png')?>" alt="" class="" height="21">
            </a>
            <button class="navbar-toggler p-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon">
                    <svg viewBox="0 0 24 24">
                        <path fill="currentColor" d="M3,6H21V8H3V6M3,11H21V13H3V11M3,16H21V18H3V16Z" />
                    </svg>
                </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto navbar-center" id="mySidenav">
                    <li class="nav-item active">
                        <a href="#pricing" class="nav-link">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a href="#why-us" class="nav-link">Why Us</a>
                    </li>
                    <li class="nav-item">
                        <a href="#clients" class="nav-link">Clients</a>
                    </li>
                    <li class="nav-item">
                        <a href="#contact-us" class="nav-link">Contact Us</a>
                    </li>
                </ul>
                <div class="call-no">
                    <a href="<?=MYACCOUNT_URL?>" class="nav-link text-warning">
                        <span class="icon mgb4">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,14C16.42,14 20,15.79 20,18V20H4V18C4,15.79 7.58,14 12,14Z" />
                            </svg>
                        </span>
                        <span>Sign Up</span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <!-- Pricing Start -->
    <section class="hero-8-bg position-relative bg-light d-flex align-items-center" id="pricing">
        <div class="container">
            <div class="row">
                <div class="col-12 mx-auto text-center">
                    <h3 class="font-weight-normal text-dark">Compare Our <span class="text-warning">Pricing</span></h3>
                    <p class="text-muted">Little Money for the best result! Let's see how much you will save with us</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="pricing">
                        <div class="pricing-header">
                            <div class="pricing-header--icon icon-competitors">
                                <span class="icon x2">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M19.31,5.6C18.09,5.56 16.88,6.5 16.5,8C16,10 16,10 15,11C13,13 10,14 4,15C3,15.16 2.5,15.5 2,16C4,16 6,16 4.5,17.5L3,19H6L8,17C10,18 11.33,18 13.33,17L14,19H17L16,16C16,16 17,12 18,11C19,10 19,11 20,11C21,11 22,10 22,8.5C22,8 22,7 20.5,6C20.15,5.76 19.74,5.62 19.31,5.6M9,6A6,6 0 0,0 3,12C3,12.6 3.13,13.08 3.23,13.6C9.15,12.62 12.29,11.59 13.93,9.94L14.43,9.44C13.44,7.34 11.32,6 9,6Z" />
                                    </svg>
                                </span>
                            </div>
                            <h2 class="text-dark">Competitors</h2>
                            <div class="pricing-price">
								<p class="text-dark">
                                    From
                                    <span class="pricing-number"><em class="pricing-currency">$</em>3.00</span>
                                    <small>/1000 views</small>
                                </p>                           
                            </div>
                        </div>
                        <div class="pricing-content">
                            <ul>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    Risk for channel
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    Slow start
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    Slow delivery
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    Small order only
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    No refill if drop
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    5s-10s retention
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    No or slow support
                                </li>
                            </ul>
                        </div>          
                        <div class="pricing-action">
                            <button class="btn btn-default" disabled>&nbsp;</button>
                        </div>          
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="pricing pricing-blue">
                        <div class="pricing-header">
                            <div class="pricing-header--icon">
                                <span class="icon x2">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M6,16.5L3,19.44V11H6M11,14.66L9.43,13.32L8,14.64V7H11M16,13L13,16V3H16M18.81,12.81L17,11H22V16L20.21,14.21L13,21.36L9.53,18.34L5.75,22H3L9.47,15.66L13,18.64" />
                                    </svg>
                                </span>
                            </div>
                            <h2 class="text-warning">Gome.io</h2>
                            <div class="pricing-price">
								<p class="text-warning">
                                    From
                                    <span class="pricing-number"><em class="pricing-currency">$</em>0.75</span>
                                    <small>/1000 views</small>
                                </p>                           
                            </div>
                        </div>
                        <div class="pricing-content">
                            <ul>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Safety and Reliability
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Instantly start
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Fast delivery speed
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    40M+ daily possible
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Guaranteed views
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    High retention
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    24/7/365 support
                                </li>
                            </ul>
                        </div>          
                        <div class="pricing-action">
                            <a class="btn btn-warning" href="<?=MYACCOUNT_URL?>">Sign Me Up</a>
                        </div>          
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="pricing pricing-orange">
                        <div class="pricing-header">
                            <div class="pricing-header--icon icon-adwords">
                                <span class="icon x2">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M12.25 1.47C11.55 1.42 10.82 1.58 10.17 1.96C8.41 2.97 7.81 5.21 8.82 6.96L16.16 19.66C17.17 21.42 19.41 22 21.17 21C22.92 20 23.5 17.75 22.5 16L15.18 3.3C14.54 2.2 13.43 1.56 12.25 1.47M6.82 6.76L1.5 16A3.67 3.67 0 0 0 1 17.83A3.67 3.67 0 0 0 4.67 21.5A3.67 3.67 0 0 0 7.84 19.66V19.67L11 14.19C9.65 11.89 8.27 9.6 7.03 7.23C6.95 7.08 6.88 6.92 6.83 6.76ZL16.4 5Z" />
                                    </svg>
                                </span>
                            </div>
                            <h2 class="text-primary">Adwords</h2>
                            <div class="pricing-price">
								<p class="text-primary">
                                    From
                                    <span class="pricing-number"><em class="pricing-currency">$</em>5.00</span>
                                    <small>/1000 views</small>
                                </p>                           
                            </div>
                        </div>
                        <div class="pricing-content">
                            <ul>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Safety and Reliability
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    24hrs-72hrs delay
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Normal delivery speed
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Medium order possible
                                </li>
                                <li class="included">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                                        </svg>
                                    </span>
                                    Guaranteed views
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    Random retention
                                </li>
                                <li class="unincluded">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                                        </svg>
                                    </span>
                                    Slow support
                                </li>
                            </ul>
                        </div>          
                        <div class="pricing-action">
                            <button class="btn btn-default" disabled>&nbsp;</button>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Pricing End -->
    
    <!-- Features Start -->
    <section class="section" id="why-us">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="title text-center mb-5">
                        <h3 class="font-weight-normal text-dark">Why <span class="text-warning">Us</span></h3>
                        <p class="text-muted">Let us show you few more very important reasons why you should come and work with us.</p>
                    </div>
                </div>
            </div>

            <div class="row align-items-center">
                <div class="col-md-5" style="background: url(<?=$this->asset('landing/img/features-bg.png')?>) center center">
                    <div class="owl-carousel owl-theme owl-carousel1">
                        <div class="item">
                            <div class="position-relative">
                                <div class="owl-img">
                                    <img src="<?=$this->asset('landing/img/easy-panel-order.png')?>" alt="" class="img-fluid d-block mx-auto">
                                </div>
                                <div class="owl-desc">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-muted f-15">Placing Order</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="position-relative">
                                <div class="owl-img">
                                    <img src="<?=$this->asset('landing/img/easy-panel-order2.png')?>" alt="" class="img-fluid d-block mx-auto">
                                </div>
                                <div class="owl-desc">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-muted f-15">List Order</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="position-relative">
                                <div class="owl-img">
                                    <img src="<?=$this->asset('landing/img/easy-panel-support.png')?>" alt="" class="img-fluid d-block mx-auto">
                                </div>
                                <div class="owl-desc">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-muted f-15">Open support ticket</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="position-relative">
                                <div class="owl-img">
                                    <img src="<?=$this->asset('landing/img/easy-panel-stats.png')?>" alt="" class="img-fluid d-block mx-auto">
                                </div>
                                <div class="owl-desc">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-muted f-15">Realtime & In-depth Stats</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="position-relative">
                                <div class="owl-img">
                                    <img src="<?=$this->asset('landing/img/easy-panel-billing.png')?>" alt="" class="img-fluid d-block mx-auto">
                                </div>
                                <div class="owl-desc">
                                    <div class="media align-items-center">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-muted f-15">Billing</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                    </div>
                </div>
                <div class="col-md-6 offset-md-1">
                    <div class="features-box mt-5 mt-sm-0 mb-4">
                        <div class="features-icon my-4">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M20 2H4C2.89 2 2 2.89 2 4V20C2 21.11 2.89 22 4 22H20C21.11 22 22 21.11 22 20V4C22 2.89 21.11 2 20 2M11 4C13.21 4 15 5.79 15 8C15 9.5 14.2 10.77 13 11.46V10.24C13.61 9.69 14 8.89 14 8C14 6.34 12.66 5 11 5S8 6.34 8 8C8 8.89 8.39 9.69 9 10.24V11.46C7.8 10.77 7 9.5 7 8C7 5.79 8.79 4 11 4M18 18.5C17.97 19.32 17.32 19.97 16.5 20H11C10.62 20 10.26 19.85 10 19.57L6 15.37L6.74 14.6C6.93 14.39 7.2 14.28 7.5 14.28H7.7L10 16V8C10 7.45 10.45 7 11 7S12 7.45 12 8V12.47L13.21 12.6L17.15 14.79C17.68 15.03 18 15.56 18 16.14V18.5Z" />
                                </svg>
                            </span>
                        </div>
                        <h5 class="text-dark font-weight-normal mb-3 pt-3">1-2-3 Easy Panel</h5>
                        <p class="text-muted mb-3 f-15">The panel with beautiful UI and UX-friendly that you will love. It works fine on any devices or browsers, powerful features but simple to use. Watch your realtime statistics or schedule advanced reports.</p>
                        <a href="<?=MYACCOUNT_URL?>" class="f-16 text-warning">Try It Now 
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M22,12L18,8V11H3V13H18V16L22,12Z" />
                                </svg>
                            </span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row align-items-center mt-5">
                <div class="col-md-6">
                    <div class="features-box mb-4">
                        <div class="features-icon my-4">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M17.45,15.18L22,7.31V19L22,21H2V3H4V15.54L9.5,6L16,9.78L20.24,2.45L21.97,3.45L16.74,12.5L10.23,8.75L4.31,19H6.57L10.96,11.44L17.45,15.18Z" />
                                </svg>
                            </span>
                        </div>
                        <h5 class="text-dark font-weight-normal mb-3 pt-3">Powerful APIs</h5>
                        <p class="text-muted mb-3 f-15">We have two APIs for you to easy implement with your systems: Standard Smm API and our own Advanced API, provide almost all features and data available on our panel, even realtime statistics</p>
                        <a href="<?=MYACCOUNT_URL?>" class="f-16 text-warning">Sign Up Now 
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M22,12L18,8V11H3V13H18V16L22,12Z" />
                                </svg>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-md-5 offset-md-1 mt-5 mt-sm-0" style="background: url(<?=$this->asset('landing/img/features-bg.png')?>) center center">
                    <div class="features-img">
                        <img src="<?=$this->asset('landing/img/features-img-2.png')?>" alt="" class="img-fluid d-block mx-auto">
                    </div>
                </div>
            </div>

            <div class="row align-items-center mt-5">
                <div class="col-md-5" style="background: url(<?=$this->asset('landing/img/features-bg.png')?>) center center">
                    <div class="features-img">
                        <img src="<?=$this->asset('landing/img/features-img-3.png')?>" alt="" class="img-fluid d-block mx-auto">
                    </div>
                </div>
                <div class="col-md-6 offset-md-1">
                    <div class="features-box mt-5 mt-sm-0 mb-4">
                        <div class="features-icon my-4">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M12,6A6,6 0 0,1 18,12C18,14.22 16.79,16.16 15,17.2V19A1,1 0 0,1 14,20H10A1,1 0 0,1 9,19V17.2C7.21,16.16 6,14.22 6,12A6,6 0 0,1 12,6M14,21V22A1,1 0 0,1 13,23H11A1,1 0 0,1 10,22V21H14M20,11H23V13H20V11M1,11H4V13H1V11M13,1V4H11V1H13M4.92,3.5L7.05,5.64L5.63,7.05L3.5,4.93L4.92,3.5M16.95,5.63L19.07,3.5L20.5,4.93L18.37,7.05L16.95,5.63Z" />
                                </svg>
                            </span>
                        </div>
                        <h5 class="text-dark font-weight-normal mb-3 pt-3">Auto Optimization</h5>
                        <p class="text-muted mb-3 f-15">Our AI-based system fine-tunes things to ensure you get the best result. For example we will focus your videos to whom may interested in them, so you will get organic subscribers in addition to views.</p>
                        <a href="<?=MYACCOUNT_URL?>" class="f-16 text-warning">Join Us Now 
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M22,12L18,8V11H3V13H18V16L22,12Z" />
                                </svg>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Features End -->
    
    <!-- Testimonial Start -->
    <section class="section bg-light" id="clients">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="title text-center mb-5">
                        <h3 class="font-weight-normal text-dark">Client <span class="text-warning">Testimonials</span></h3>
                        <p class="text-muted">See what top Resellers and YouTubers are saying. Learn why we are the best on providing YouTube Services.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <h3 class="font-weight-normal mt-3 line-height-1_4">Some Words From Our <span class="font-weight-medium text-warning">Happy Clients </span></h3>
                    <div class="testi-border my-4"></div>
                    <p class="text-muted">Can't wait to join our happy clients list?</p>
                    <a href="<?=MYACCOUNT_URL?>/auth/register" class="btn btn-warning">Get Started Now 
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                            </svg>
                        </span>
                    </a>
                </div>
                <div class="col-lg-8">
                    <div class="owl-carousel owl-theme owl-carousel2">
                        <div class="item">
                            <div class="testi-content m-3 position-relative">
                                <div class="testi-box p-4">
                                    <ul class="list-unstyled f-15 text-warning mb-2">
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                    </ul>
                                    <p class="text-muted position-relative mb-0 f-14"><span class="f-20 mr-1">"</span>Highly recommended! Get guaranteed views and delivery very fast, and never face any issues with my channels<span class="f-16">"</span></p>
                                </div>
                                <div class="testi-user mt-4">
                                    <div class="media align-items-center">
                                        <img src="<?=$this->asset('landing/img/user-img-1.jpg')?>" alt="" class="mr-3 img-fluid d-block rounded-circle">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-dark f-15">Julie</h6>
                                            <p class="text-muted mb-0 f-14">Youtuber</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="testi-content m-3 position-relative">
                                <div class="testi-box p-4">
                                    <ul class="list-unstyled f-15 text-warning mb-2">
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                    </ul>
                                    <p class="text-muted position-relative mb-0 f-14"><span class="f-20 mr-1">"</span>API ready and good price, also they (gome.io) can delivery 10m+ daily, which i never see on other providers.<span class="f-16">"</span></p>
                                </div>
                                <div class="testi-user mt-4">
                                    <div class="media align-items-center">
                                        <img src="<?=$this->asset('landing/img/user-img-2.jpg')?>" alt="" class="mr-3 img-fluid d-block rounded-circle">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-dark f-15">Robert</h6>
                                            <p class="text-muted mb-0 f-14">SMM Reseller</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="testi-content m-3 position-relative">
                                <div class="testi-box p-4">
                                    <ul class="list-unstyled f-15 text-warning mb-2">
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                    </ul>
                                    <p class="text-muted position-relative mb-0 f-14"><span class="f-20 mr-1">"</span>The panel is very easy to use and i am in love with it. I switched all youtube campaigns from adwords to Gome.<span class="f-16">"</span></p>
                                </div>
                                <div class="testi-user mt-4">
                                    <div class="media align-items-center">
                                        <img src="<?=$this->asset('landing/img/user-img-6.png')?>" alt="" class="mr-3 img-fluid d-block rounded-circle">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-dark f-15">Changying</h6>
                                            <p class="text-muted mb-0 f-14">Youtuber</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="testi-content m-3 position-relative">
                                <div class="testi-box p-4">
                                    <ul class="list-unstyled f-15 text-warning mb-2">
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                    </ul>
                                    <p class="text-muted position-relative mb-0 f-14"><span class="f-20 mr-1">"</span>Staff is very professional, i get the answers for my questions very quick, regardless what time in a day<span class="f-16">"</span></p>
                                </div>
                                <div class="testi-user mt-4">
                                    <div class="media align-items-center">
                                        <img src="<?=$this->asset('landing/img/user-img-7.png')?>" alt="" class="mr-3 img-fluid d-block rounded-circle">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-dark f-15">Ichika</h6>
                                            <p class="text-muted mb-0 f-14">Youtuber</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                        <div class="item">
                            <div class="testi-content m-3 position-relative">
                                <div class="testi-box p-4">
                                    <ul class="list-unstyled f-15 text-warning mb-2">
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item mr-1">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                        <li class="list-inline-item">
                                            <span class="icon">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                                                </svg>
                                            </span>
                                        </li>
                                    </ul>
                                    <p class="text-muted position-relative mb-0 f-14"><span class="f-20 mr-1">"</span>I were hard on how to promote my videos to more people. Now things are simple, create videos then place orders<span class="f-16">"</span></p>
                                </div>
                                <div class="testi-user mt-4">
                                    <div class="media align-items-center">
                                        <img src="<?=$this->asset('landing/img/user-img-8.png')?>" alt="" class="mr-3 img-fluid d-block rounded-circle">
                                        <div class="media-body">
                                            <h6 class="mb-0 text-dark f-15">Linh</h6>
                                            <p class="text-muted mb-0 f-14">Youtuber</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- owl item and -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial End -->
    
    <!-- Contact Us Start -->
    <section class="section" id="contact-us">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="title text-center mb-5">
                        <h3 class="font-weight-normal text-dark">Still have <span class="text-warning"> Question</span></h3>
                        <p class="text-muted">If you still have questions, feel free to contact us via this form, or even better - live chat with us on <a href="https://t.me/viraadsnet">Telegram</a></p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-address">
                        <h4 class="text-dark mb-4">FAQs</h4>
                        <p class="text-muted f-15">Almost questions are already answered, please check our <a href="/faqs">Frequently Asked Questions</a>.</p>
                        <p class="text-muted f-15 mb-4">Wonder why our services are so good? Well, in short, we work hard. Long story: we work very hard day and night.</p>
                    </div>
                </div>

                <div class="col-lg-7 offset-lg-1">
                    <div class="custom-form mt-4 mt-lg-0">
                        <div id="message"></div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group app-label">
                                    <label for="name">Name</label>
                                    <input name="name" id="name" type="text" class="form-control" placeholder="Enter your name..">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group app-label">
                                    <label for="email">Email address</label>
                                    <input name="email" id="email" type="email" class="form-control" placeholder="Enter your email..">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group app-label">
                                    <label for="subject">Subject</label>
                                    <input type="text" class="form-control" id="subject" placeholder="Enter Subject.." />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group app-label">
                                    <label for="comments">Message</label>
                                    <textarea name="comments" id="comments" rows="3" class="form-control" placeholder="Enter message.."></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <button id="contact" class="btn btn-warning">Send Message 
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M9.78,18.65L10.06,14.42L17.74,7.5C18.08,7.19 17.67,7.04 17.22,7.31L7.74,13.3L3.64,12C2.76,11.75 2.75,11.14 3.84,10.7L19.81,4.54C20.54,4.21 21.24,4.72 20.96,5.84L18.24,18.65C18.05,19.56 17.5,19.78 16.74,19.36L12.6,16.3L10.61,18.23C10.38,18.46 10.19,18.65 9.78,18.65Z" />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Us End -->
    
    <!-- Step Start -->
    <section class="section bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="row">
                        <div class="col-2">
                            <div class="subscribe-icon">
                                <span class="icon x3">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M15,14C12.33,14 7,15.33 7,18V20H23V18C23,15.33 17.67,14 15,14M6,10V7H4V10H1V12H4V15H6V12H9V10M15,12A4,4 0 0,0 19,8A4,4 0 0,0 15,4A4,4 0 0,0 11,8A4,4 0 0,0 15,12Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="center-icon">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M5.59,7.41L7,6L13,12L7,18L5.59,16.59L10.17,12L5.59,7.41M11.59,7.41L13,6L19,12L13,18L11.59,16.59L16.17,12L11.59,7.41Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="subscribe-icon">
                                <span class="icon x3">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M11,9H13V6H16V4H13V1H11V4H8V6H11M7,18A2,2 0 0,0 5,20A2,2 0 0,0 7,22A2,2 0 0,0 9,20A2,2 0 0,0 7,18M17,18A2,2 0 0,0 15,20A2,2 0 0,0 17,22A2,2 0 0,0 19,20A2,2 0 0,0 17,18M7.17,14.75L7.2,14.63L8.1,13H15.55C16.3,13 16.96,12.59 17.3,11.97L21.16,4.96L19.42,4H19.41L18.31,6L15.55,11H8.53L8.4,10.73L6.16,6L5.21,4L4.27,2H1V4H3L6.6,11.59L5.25,14.04C5.09,14.32 5,14.65 5,15A2,2 0 0,0 7,17H19V15H7.42C7.29,15 7.17,14.89 7.17,14.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="center-icon">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M5.59,7.41L7,6L13,12L7,18L5.59,16.59L10.17,12L5.59,7.41M11.59,7.41L13,6L19,12L13,18L11.59,16.59L16.17,12L11.59,7.41Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="subscribe-icon">
                                <span class="icon x3">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M6,16.5L3,19.44V11H6M11,14.66L9.43,13.32L8,14.64V7H11M16,13L13,16V3H16M18.81,12.81L17,11H22V16L20.21,14.21L13,21.36L9.53,18.34L5.75,22H3L9.47,15.66L13,18.64" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="text-center mt-5 mb-4">
                        <h6 class="text-muted font-weight-normal">3 steps away from success: Create an account > Place orders > <span class="d-block mt-2 text-warning">Views increase like rocket!</span></h6>
                    </div>
                    <div class="text-center">
                        <a class="btn btn-warning" href="<?=MYACCOUNT_URL?>">Create an Account</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Step End -->

    <!-- footer Start -->
    <section class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="mb-4">
                        <img src="<?=$this->asset('img/gome.io.png')?>" alt="" class="footer-logo" height="26" />
                        <ul class="list-unstyled sub-menu">
                            <li><a href="/legal/terms">Terms</a></li>
                            <li><a href="/legal/privacy">Privacy Policy</a></li>
                            <li><a href="/legal/cookie">Cookie Policy</a></li>
                            <li><a href="/legal/dmca">DMCA Report</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-md-4">
                            <h6 class="footer-list-title text-warning mb-3">Customers</h6>
                            <ul class="list-unstyled sub-menu">
                                <li><a href="/advertisers">Advertisers</a></li>
                                <li><a href="/publishers">Publishers</a></li>
                                <li><a href="/youtubers">Youtubers</a></li>
                                <li><a href="/resellers">Resellers</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h6 class="footer-list-title text-warning mb-3">Resources</h6>
                            <ul class="list-unstyled sub-menu">
                                <li><a href="/api">API Documentation</a></li>
                                <li><a href="/referral">Referral Program</a></li>
                                <li><a href="/faqs">FAQs</a></li>
                                <li><a href="#">Blog</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h6 class="footer-list-title text-warning mb-3">Connect Us</h6>
                            <ul class="list-unstyled sub-menu">
                                <li><a href="https://t.me/viraadsnet">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M9.78,18.65L10.06,14.42L17.74,7.5C18.08,7.19 17.67,7.04 17.22,7.31L7.74,13.3L3.64,12C2.76,11.75 2.75,11.14 3.84,10.7L19.81,4.54C20.54,4.21 21.24,4.72 20.96,5.84L18.24,18.65C18.05,19.56 17.5,19.78 16.74,19.36L12.6,16.3L10.61,18.23C10.38,18.46 10.19,18.65 9.78,18.65Z" />
                                        </svg>
                                    </span>
                                    <span>@viraadsnet</span>
                                </a></li>
                                <li><a href="skype:live:.cid.3a7b22ac71aa01f4?chat">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M18,6C20.07,8.04 20.85,10.89 20.36,13.55C20.77,14.27 21,15.11 21,16A5,5 0 0,1 16,21C15.11,21 14.27,20.77 13.55,20.36C10.89,20.85 8.04,20.07 6,18C3.93,15.96 3.15,13.11 3.64,10.45C3.23,9.73 3,8.89 3,8A5,5 0 0,1 8,3C8.89,3 9.73,3.23 10.45,3.64C13.11,3.15 15.96,3.93 18,6M12.04,17.16C14.91,17.16 16.34,15.78 16.34,13.92C16.34,12.73 15.78,11.46 13.61,10.97L11.62,10.53C10.86,10.36 10,10.13 10,9.42C10,8.7 10.6,8.2 11.7,8.2C13.93,8.2 13.72,9.73 14.83,9.73C15.41,9.73 15.91,9.39 15.91,8.8C15.91,7.43 13.72,6.4 11.86,6.4C9.85,6.4 7.7,7.26 7.7,9.54C7.7,10.64 8.09,11.81 10.25,12.35L12.94,13.03C13.75,13.23 13.95,13.68 13.95,14.1C13.95,14.78 13.27,15.45 12.04,15.45C9.63,15.45 9.96,13.6 8.67,13.6C8.09,13.6 7.67,14 7.67,14.57C7.67,15.68 9,17.16 12.04,17.16Z" />
                                        </svg>
                                    </span>
                                    <span>Gome.io</span>
                                </a></li>
                                <li><a href="mailto:contact@gome.io">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,8L12,13L4,8V6L12,11L20,6M20,4H4C2.89,4 2,4.89 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6C22,4.89 21.1,4 20,4Z" />
                                        </svg>
                                    </span>
                                    <span>contact@gome.io</span>
                                </a></li>
                            </ul>
                            <ul class="list-unstyled footer-social-list">
                                <li class="list-inline-item"><a href="#">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M10,15L15.19,12L10,9V15M21.56,7.17C21.69,7.64 21.78,8.27 21.84,9.07C21.91,9.87 21.94,10.56 21.94,11.16L22,12C22,14.19 21.84,15.8 21.56,16.83C21.31,17.73 20.73,18.31 19.83,18.56C19.36,18.69 18.5,18.78 17.18,18.84C15.88,18.91 14.69,18.94 13.59,18.94L12,19C7.81,19 5.2,18.84 4.17,18.56C3.27,18.31 2.69,17.73 2.44,16.83C2.31,16.36 2.22,15.73 2.16,14.93C2.09,14.13 2.06,13.44 2.06,12.84L2,12C2,9.81 2.16,8.2 2.44,7.17C2.69,6.27 3.27,5.69 4.17,5.44C4.64,5.31 5.5,5.22 6.82,5.16C8.12,5.09 9.31,5.06 10.41,5.06L12,5C16.19,5 18.8,5.16 19.83,5.44C20.73,5.69 21.31,6.27 21.56,7.17Z" />
                                        </svg>
                                    </span>
                                </a></li>
                                <li class="list-inline-item"><a href="https://twitter.com/viraadsnet">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M22.46,6C21.69,6.35 20.86,6.58 20,6.69C20.88,6.16 21.56,5.32 21.88,4.31C21.05,4.81 20.13,5.16 19.16,5.36C18.37,4.5 17.26,4 16,4C13.65,4 11.73,5.92 11.73,8.29C11.73,8.63 11.77,8.96 11.84,9.27C8.28,9.09 5.11,7.38 3,4.79C2.63,5.42 2.42,6.16 2.42,6.94C2.42,8.43 3.17,9.75 4.33,10.5C3.62,10.5 2.96,10.3 2.38,10C2.38,10 2.38,10 2.38,10.03C2.38,12.11 3.86,13.85 5.82,14.24C5.46,14.34 5.08,14.39 4.69,14.39C4.42,14.39 4.15,14.36 3.89,14.31C4.43,16 6,17.26 7.89,17.29C6.43,18.45 4.58,19.13 2.56,19.13C2.22,19.13 1.88,19.11 1.54,19.07C3.44,20.29 5.7,21 8.12,21C16,21 20.33,14.46 20.33,8.79C20.33,8.6 20.33,8.42 20.32,8.23C21.16,7.63 21.88,6.87 22.46,6Z" />
                                        </svg>
                                    </span>
                                </a></li>
                                <li class="list-inline-item"><a href="#">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M12 2.04C6.5 2.04 2 6.53 2 12.06C2 17.06 5.66 21.21 10.44 21.96V14.96H7.9V12.06H10.44V9.85C10.44 7.34 11.93 5.96 14.22 5.96C15.31 5.96 16.45 6.15 16.45 6.15V8.62H15.19C13.95 8.62 13.56 9.39 13.56 10.18V12.06H16.34L15.89 14.96H13.56V21.96A10 10 0 0 0 22 12.06C22 6.53 17.5 2.04 12 2.04Z" />
                                        </svg>
                                    </span>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-12">
                    <div class="text-center text-muted">
                        <p class="mb-0 f-15">2020 © <span class="text-warning"><?=SITE_NAME?></span>. All Rights Reserved</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- footer End -->
    
    <!-- cookie start -->
    <div id="cookie-wrap" style="display:none">
        <p>This website uses cookies to ensure you get the best experience on our website. <a href="/legal/cookie" class="cookie-link">Learn more</a></p>
        <div class="text-center">
            <button class="btn btn-white" id="cookie-btn">Got it!</button>
        </div>
    </div>
    <!-- cookie end -->

    <!-- javascript -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="<?=$this->asset('landing/js/scrollspy.min.js')?>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- carousel -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <!-- reCAPTCHA Js -->
    <script src="https://www.google.com/recaptcha/api.js?render=6LcJqdcUAAAAAHjxpVd4PhktKYXHFPaGSEMSbnuF"></script>
    <!-- Main Js -->
    <script src="<?=$this->asset('landing/js/youtubers.js')?>"></script>
</body>
</html>