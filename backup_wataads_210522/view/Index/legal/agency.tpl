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
    <nav class="navbar navbar-expand-lg fixed-top navbar-custom nav-sticky sticky-dark">
        <div class="container">
            <button class="navbar-toggler p-0" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon">
                    <svg viewBox="0 0 24 24">
                        <path fill="currentColor" d="M3,6H21V8H3V6M3,11H21V13H3V11M3,16H21V18H3V16Z" />
                    </svg>
                </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mx-auto navbar-center" id="mySidenav">
                    <li class="nav-item active">
                        <a href="/" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="/#services" class="nav-link">Services</a>
                    </li>
                    <li class="nav-item">
                        <a href="/#about" class="nav-link">About</a>
                    </li>
                    <li class="nav-item">
                        <a href="/#features" class="nav-link">Features</a>
                    </li>
                    <li class="nav-item">
                        <a href="/blog" class="nav-link">Blog</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <section class="hero-7-bg position-relative bg-light d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-12 mx-auto text-center mb-4">
                    <a href="/">
                        <img src="<?=$this->asset('img/logo.png')?>" alt="" class="img-fluid" width="500">
                    </a>
                </div>
                <div class="col-12 mx-auto text-center mb-4">
                    <h3 class="font-weight-normal text-dark">Agency <span class="text-warning">Policy</span></h3>
                    <p class="text-muted mb-4">Documentation</p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 col-lg-10 mt-50 mt-lg-0">
                    <div id="content" class="centring">
                        <div class="documentation__cnts">
                            <div class="documentation__cnt follow-block init in-sight anim-end">
                                <h3>Ad Exchange</h3>
                                <p>WataAds - Self-Serve Advertising Platform unlocks the best available audience for your campaign across a broad network of premium websites, via a highly targeted segment, or even from a single site.</p>
                                <p>- Buy in real-time</p>
                                <p>- Manage, traffic, serve and review your campaigns & ads across online display, rich media, in-stream video</p>
                                <p>- Approximately over 25K including agencies & advertisers globally.</p>
                                <p>- Publisher system with over 30K connections.</p>
                                <h3>Agency connection</h3>
                                <p>We always have best policies for Agency.</p>
                                <p>To receive promotion, please register from now.</p>
                                <section class="section">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="custom-form mt-4 mt-lg-0">
                                                    <div id="show-mess"></div>
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="form-group app-label">
                                                                <label for="name">Agency Name</label>
                                                                <input name="name" id="name" type="text" class="form-control" placeholder="Enter your name.." required />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="form-group app-label">
                                                                <label for="personal_email">Personal Email</label>
                                                                <input name="personal_email" id="personal_email" type="email" class="form-control" placeholder="Enter your email.." required />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="form-group app-label">
                                                                <label for="work_email">Work Email</label>
                                                                <input name="work_email" id="work_email" type="text" class="form-control" placeholder="Enter your name.." required />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="form-group app-label">
                                                                <label for="contact">Skype/Telegram</label>
                                                                <input name="contact" id="contact" type="text" class="form-control" placeholder="Enter your name.." required />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="form-group app-label">
                                                                <label for="message">Message</label>
                                                                <textarea name="message" id="message" rows="3" class="form-control" placeholder="Enter message.." required></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <button id="submit" class="btn btn-warning">Submit 
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
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
                                <li><a href="https://adv.wataads.com/">Advertisers</a></li>
                                <li><a href="https://pub.wataads.com/">Publishers</a></li>
                                <li><a href="/legal/agency">Agency</a></li>
                                <li><a href="/legal/ad-network">Ad Network</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h6 class="footer-list-title text-warning mb-3">Resources</h6>
                            <ul class="list-unstyled sub-menu">
                                <li><a href="https://api.wataads.com/">API Documentation</a></li>
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
                                    <span>@wataads</span>
                                </a></li>
                                <li><a href="skype:live:.cid.3a7b22ac71aa01f4?chat">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M18,6C20.07,8.04 20.85,10.89 20.36,13.55C20.77,14.27 21,15.11 21,16A5,5 0 0,1 16,21C15.11,21 14.27,20.77 13.55,20.36C10.89,20.85 8.04,20.07 6,18C3.93,15.96 3.15,13.11 3.64,10.45C3.23,9.73 3,8.89 3,8A5,5 0 0,1 8,3C8.89,3 9.73,3.23 10.45,3.64C13.11,3.15 15.96,3.93 18,6M12.04,17.16C14.91,17.16 16.34,15.78 16.34,13.92C16.34,12.73 15.78,11.46 13.61,10.97L11.62,10.53C10.86,10.36 10,10.13 10,9.42C10,8.7 10.6,8.2 11.7,8.2C13.93,8.2 13.72,9.73 14.83,9.73C15.41,9.73 15.91,9.39 15.91,8.8C15.91,7.43 13.72,6.4 11.86,6.4C9.85,6.4 7.7,7.26 7.7,9.54C7.7,10.64 8.09,11.81 10.25,12.35L12.94,13.03C13.75,13.23 13.95,13.68 13.95,14.1C13.95,14.78 13.27,15.45 12.04,15.45C9.63,15.45 9.96,13.6 8.67,13.6C8.09,13.6 7.67,14 7.67,14.57C7.67,15.68 9,17.16 12.04,17.16Z" />
                                        </svg>
                                    </span>
                                    <span>wataads.com</span>
                                </a></li>
                                <li><a href="mailto:contact@gome.io">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,8L12,13L4,8V6L12,11L20,6M20,4H4C2.89,4 2,4.89 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6C22,4.89 21.1,4 20,4Z" />
                                        </svg>
                                    </span>
                                    <span>contact@wataads.com</span>
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
    
    <!-- javascript -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="<?=$this->asset('landing/js/app.js')?>"></script>
    
<script>
$(document).ready(function() {
    $('#submit').on('click', function() {
        $("#show-mess").html('');
        var $this = $(this);
        var data = {};
        data.name = $.trim($('#name').val()), data.personal_email = $.trim($('#personal_email').val()), data.work_email = $.trim($('#work_email').val()), data.contact = $.trim($('#contact').val()), data.message = $.trim($('#message').val());
        if (data.name.length < 3 || data.personal_email.indexOf('@') < 0 || data.work_email.indexOf('@') < 0 || data.contact.length < 3 || data.message.length < 10) {
            $("#show-mess").html('<p class="text-danger f-15 mb-4">Please fill contact form with valid informations!</p>');
            return false;
        }
        $this.prop('disabled', true);
        $this.html('Sending...');
        $.post('/legal/agency', {data: JSON.stringify(data)}, function(res) {
            if (!res.success) {
                $("#show-mess").html('<p class="text-danger f-15 mb-4">'+ res.data +'</p>');
                $this.prop('disabled', false);
                $this.html('Send Message <span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M9.78,18.65L10.06,14.42L17.74,7.5C18.08,7.19 17.67,7.04 17.22,7.31L7.74,13.3L3.64,12C2.76,11.75 2.75,11.14 3.84,10.7L19.81,4.54C20.54,4.21 21.24,4.72 20.96,5.84L18.24,18.65C18.05,19.56 17.5,19.78 16.74,19.36L12.6,16.3L10.61,18.23C10.38,18.46 10.19,18.65 9.78,18.65Z" /></svg></span>');
            } else {
                $("#show-mess").html('<p class="text-success f-15 mb-4">We received your message and will get back shortly. Thank you!</p>');
                $this.html('Message sent successfully!');
                setTimeout(function() {window.location.reload()}, 1500)
            }
        });
    });
})
</script>
</body>
</html>