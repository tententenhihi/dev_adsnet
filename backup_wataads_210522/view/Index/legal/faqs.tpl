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
                <img src="<?=$this->asset('img/logo.png')?>" alt="" class="" height="21">
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
                        <a href="#general" class="nav-link">General</a>
                    </li>
                    <li class="nav-item">
                        <a href="#account" class="nav-link">Account</a>
                    </li>
                    <li class="nav-item">
                        <a href="#billing" class="nav-link">Billing</a>
                    </li>
                    <li class="nav-item">
                        <a href="#service" class="nav-link">Service</a>
                    </li>
                    <li class="nav-item">
                        <a href="#policy" class="nav-link">Policy</a>
                    </li>
                </ul>
                <div class="call-no">
                    <a href="<?=MYACCOUNT_URL?>" class="nav-link text-warning">
                        <span class="icon mgb4">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,14C16.42,14 20,15.79 20,18V20H4V18C4,15.79 7.58,14 12,14Z" />
                            </svg>
                        </span>
                        <span>My Account</span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <!-- Hero Start -->
    <section class="hero-7-bg position-relative bg-light d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-12 mx-auto text-center mb-4">
                    <h3 class="font-weight-normal text-dark">Frequently Asked <span class="text-warning">Questions</span></h3>
                    <p class="text-muted mb-4">Everything you need to know so you can use <?=SITE_NAME?> like a pro</p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-12 col-md-10 col-lg-8 mt-50 mt-lg-0">
                    <div class="article-entry accordion accordion-faqs" id="accordion">
                        <div class="mb-4" id="general">
                            <div>
                                <h3 class="font-weight-normal line-height-1_4">General</h3>
                                <p class="text-muted">General questions and answers</p>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading11">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse11" aria-expanded="false" aria-controls="collapse11">
                                            <span class="ml-4">I want to become your reseller, what are your requirements and what i need to do</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse11" class="collapse" aria-labelledby="heading11" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading12">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse12" aria-expanded="false" aria-controls="collapse12">
                                            <span class="ml-4">I found a bug/an issue, or i have some great ideas, suggestions</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse12" class="collapse" aria-labelledby="heading12" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading13">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse13" aria-expanded="false" aria-controls="collapse13">
                                            <span class="ml-4">Do you have referral program, where can I find a referral link</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse13" class="collapse" aria-labelledby="heading13" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">We appreciate it when you recommend us to your contacts. As a way of thank you, we will credit you with 5% of future revenues made by the publishers you send our way. Statistics and referral links are available in your account. Please note that the referral program does not apply to advertisers.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-4" id="account">
                            <div>
                                <h3 class="font-weight-normal line-height-1_4">Account</h3>
                                <p class="text-muted">All about your profile and account settings</p>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading21">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse21" aria-expanded="false" aria-controls="collapse21">
                                            <span class="ml-4">I did not receive confirmation email after registering</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse21" class="collapse" aria-labelledby="heading21" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading22">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse22" aria-expanded="false" aria-controls="collapse22">
                                            <span class="ml-4">Tried to use my email to register but it says "already registered"</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse22" class="collapse" aria-labelledby="heading22" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading23">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse23" aria-expanded="false" aria-controls="collapse23">
                                            <span class="ml-4">How to activate and use two-factor authentication</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse23" class="collapse" aria-labelledby="heading23" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading24">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse24" aria-expanded="false" aria-controls="collapse24">
                                            <span class="ml-4">How to reset a lost or forgotten password</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse24" class="collapse" aria-labelledby="heading24" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading25">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse25" aria-expanded="false" aria-controls="collapse25">
                                            <span class="ml-4">How to update my email address, changing email is impossible on panel</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse25" class="collapse" aria-labelledby="heading25" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-4" id="billing">
                            <div>
                                <h3 class="font-weight-normal line-height-1_4">Billing</h3>
                                <p class="text-muted">Give you more informations about how our billing works</p>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading31">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse31" aria-expanded="false" aria-controls="collapse31">
                                            <span class="ml-4">Which payment method are you supporting, max and min deposit, withdraw</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse31" class="collapse" aria-labelledby="heading31" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">We support and provide almost payment method globally. You could find some popular such as Paypal, Payoneer,... evenly bitcoin.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading32">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse32" aria-expanded="false" aria-controls="collapse32">
                                            <span class="ml-4">Do you offer free trial or money back guarantee</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse32" class="collapse" aria-labelledby="heading32" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Based on demands of advertisers, we will release some consistent trial programs...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading33">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse33" aria-expanded="false" aria-controls="collapse33">
                                            <span class="ml-4">Can i send/receive balance from other account, if possible then how long it take</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse33" class="collapse" aria-labelledby="heading33" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-4" id="service">
                            <div>
                                <h3 class="font-weight-normal line-height-1_4">Service</h3>
                                <p class="text-muted">Common issues and confusions while using service</p>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading41">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse41" aria-expanded="false" aria-controls="collapse41">
                                            <span class="ml-4">Is your YouTube service approved by Google, is it safe for my video and channel</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse41" class="collapse" aria-labelledby="heading41" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading42">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse42" aria-expanded="false" aria-controls="collapse42">
                                            <span class="ml-4">Some of my YouTube orders get cancelled automatically all the time</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse42" class="collapse" aria-labelledby="heading42" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading43">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse43" aria-expanded="false" aria-controls="collapse43">
                                            <span class="ml-4">I receive more or less views than what i ordered, is it normal</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse43" class="collapse" aria-labelledby="heading43" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading44">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse44" aria-expanded="false" aria-controls="collapse44">
                                            <span class="ml-4">Can you provide 10 million views or more for single video in one day</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse44" class="collapse" aria-labelledby="heading44" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading45">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse45" aria-expanded="false" aria-controls="collapse45">
                                            <span class="ml-4">Why are your services so cheap, how can you do that</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse45" class="collapse" aria-labelledby="heading45" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-4" id="policy">
                            <div>
                                <h3 class="font-weight-normal line-height-1_4">Policy</h3>
                                <p class="text-muted">Understand the rules and policies</p>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading51">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse51" aria-expanded="false" aria-controls="collapse51">
                                            <span class="ml-4">Who does the policy apply to, what issues will be covered under it</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse51" class="collapse" aria-labelledby="heading51" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading52">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse52" aria-expanded="false" aria-controls="collapse52">
                                            <span class="ml-4">How does <?=SITE_NAME?> protect my privacy and keep my information secure</span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse52" class="collapse" aria-labelledby="heading52" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="heading33">
                                    <h5 class="bottom-line">
                                        <button class="btn btn-header collapsed" data-toggle="collapse" data-target="#collapse53" aria-expanded="false" aria-controls="collapse53">
                                            <span class="ml-4">How can I remove information about myself from <?=SITE_NAME?></span>
                                        </button>
                                    </h5>
                                </div>

                                <div id="collapse53" class="collapse" aria-labelledby="heading53" data-parent="#accordion" style="">
                                    <div class="card-body">
                                        <p class="">Updating...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- accordion end -->
                </div>
                <!-- col-12 end -->
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="text-center mt-5 mb-4">
                        <h6 class="text-muted font-weight-normal">Do not see your questions? ping us at <a href="https://t.me/viraadsnet">Telegram</a> or open <span class="text-warning">Support Ticket</span></h6>
                    </div>
                    <div class="text-center">
                        <a class="btn btn-warning" href="<?=MYACCOUNT_URL?>/support/create">Create Support Ticket</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero End -->

    <!-- footer Start -->
    <section class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="mb-4">
                        <img src="<?=$this->asset('img/logo.png')?>" alt="" class="footer-logo" height="26" />
                        <ul class="list-unstyled sub-menu">
                            <li><a href="/legal/faqs">FAQs</a></li>
                            <li><a href="/legal/terms">Terms</a></li>
                            <li><a href="/legal/privacy">Privacy Policy</a></li>
                            <li><a href="/legal/cookie">Cookie Policy</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-md-4">
                            <h6 class="footer-list-title text-warning mb-3">Customers</h6>
                            <ul class="list-unstyled sub-menu">
                                <li><a href="https://adv.viraads.com/">Advertisers</a></li>
                                <li><a href="https://pub.viraads.com/">Publishers</a></li>
                                <li><a href="">Agency</a></li>
                                <li><a href="">Ad Network</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h6 class="footer-list-title text-warning mb-3">Resources</h6>
                            <ul class="list-unstyled sub-menu">
                                <li><a href="https://api.viraads.com/">API Documentation</a></li>
                                <li><a href="/blog">Blog</a></li>
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
                                    <span>@viraads</span>
                                </a></li>
                                <li><a href="skype:live:.cid.3a7b22ac71aa01f4?chat">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M18,6C20.07,8.04 20.85,10.89 20.36,13.55C20.77,14.27 21,15.11 21,16A5,5 0 0,1 16,21C15.11,21 14.27,20.77 13.55,20.36C10.89,20.85 8.04,20.07 6,18C3.93,15.96 3.15,13.11 3.64,10.45C3.23,9.73 3,8.89 3,8A5,5 0 0,1 8,3C8.89,3 9.73,3.23 10.45,3.64C13.11,3.15 15.96,3.93 18,6M12.04,17.16C14.91,17.16 16.34,15.78 16.34,13.92C16.34,12.73 15.78,11.46 13.61,10.97L11.62,10.53C10.86,10.36 10,10.13 10,9.42C10,8.7 10.6,8.2 11.7,8.2C13.93,8.2 13.72,9.73 14.83,9.73C15.41,9.73 15.91,9.39 15.91,8.8C15.91,7.43 13.72,6.4 11.86,6.4C9.85,6.4 7.7,7.26 7.7,9.54C7.7,10.64 8.09,11.81 10.25,12.35L12.94,13.03C13.75,13.23 13.95,13.68 13.95,14.1C13.95,14.78 13.27,15.45 12.04,15.45C9.63,15.45 9.96,13.6 8.67,13.6C8.09,13.6 7.67,14 7.67,14.57C7.67,15.68 9,17.16 12.04,17.16Z" />
                                        </svg>
                                    </span>
                                    <span>viraads.com</span>
                                </a></li>
                                <li><a href="mailto:contact@gome.io">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,8L12,13L4,8V6L12,11L20,6M20,4H4C2.89,4 2,4.89 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6C22,4.89 21.1,4 20,4Z" />
                                        </svg>
                                    </span>
                                    <span>contact@viraads.com</span>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="<?=$this->asset('landing/js/scrollspy.min.js')?>"></script>
    <!-- Main Js -->
    <script src="<?=$this->asset('landing/js/faqs.js')?>"></script>
</body>
</html>