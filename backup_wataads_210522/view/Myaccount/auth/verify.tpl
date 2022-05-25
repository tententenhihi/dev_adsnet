<!--<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Verify your registration - <?=SITE_NAME?></title>
<link rel="shortcut icon" href="<?=$this->asset('img/favicon.png')?>">
<link rel="stylesheet" href="<?=$this->asset('css/app.css')?>">
<script src="<?=$this->asset('js/app.js')?>"></script>
</head>-->
<style>
    .modal-content button{
        display: none;
    }
</style>
<!DOCTYPE html>
<html>
<head>

    <meta name="csrf-token" content="<?=$this->csrf()?>" />
    <title>Verify your registration - <?=SITE_NAME?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <link rel="apple-touch-icon" href="<?=$this->asset2('app-assets/images/ico/apple-icon-120.png')?>">
    <link rel="shortcut icon" type="image/x-icon" href="<?=$this->asset2('app-assets/images/ico/favicon.png')?>">
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

</head>

<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row"></div>
        <div class="content-body">
            <section class="row flexbox-container">
                <div class="col-xl-8 col-10 d-flex justify-content-center" >
                    <div class="card bg-authentication rounded-0 mb-0" >
                        <div class="row m-0">
                            <div class="col-lg-6 d-lg-block text-center align-self-center pl-0 pr-3 py-0">
                                <img src="<?=$this->asset2('app-assets/images/pages/register.png')?>" alt="branding logo" width="100%">
                            </div>
                            <div class="col-lg-6 col-12 p-0">
                                <div class="card rounded-0 mb-0 p-2">
                                    <div class="card-header pt-50" style="justify-content: space-around">
                                        <div class="card-title text-center">
                                            <h3>Almost Ready</h3>
                                            <h4>Please complete your profile</h4>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body pt-0">
                                            <div class="form-group">
                                                <textarea class="textarea is-medium form-control" id="address" placeholder="Your Address"></textarea>
                                            </div>

                                            <div class="form-group">
                                                <select id="country" class="form-control">
                                                    <option value="0" phone="" checked>Your Country</option>
                                                    <?php foreach($this->data->countries as $country): ?>
                                                    <option value="<?=$country->id?>" phone="<?=$country->phone?>"><?=$country->code?> - <?=$country->name?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <input class="input is-medium form-control" type="text" id="phone_prefix" placeholder="+000" style="max-width:120px;" readonly>
                                                    </div>
                                                    <input class="input is-medium form-control" type="text" placeholder="Your phone number" id="phone">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <select id="chat_prefix" class="form-control" style="width:120px;">
                                                            <?php foreach($this->data->chats as $m): ?>
                                                            <option value="<?=$m?>"><?=$m?></option>
                                                            <?php endforeach; ?>
                                                        </select>
                                                    </div>
                                                    <input class="input is-medium form-control" type="text" placeholder="Your chat account" id="chat_account">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <input class="input is-medium form-control" type="text" value="Your Birthday" style="width:120px;" readonly>
                                                    </div>
                                                    <input class="input is-medium form-control" type="text" id="birthday" placeholder="yyyy-mm-dd">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <select id="timezone" class="form-control">
                                                    <option value="UTC" checked>Your Timezone</option>
                                                    <?php foreach($this->data->timezones as $timezone): ?>
                                                    <option value="<?=$timezone?>"><?=$timezone?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <select id="language" class="form-control">
                                                    <option value="en" checked>Your Language</option>
                                                    <?php foreach($this->data->languages as $code => $name): ?>
                                                    <option value="<?=$code?>"><?=$name?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="is_subscribed" checked="checked">
                                                    <label class="custom-control-label" for="is_subscribed">Subscribe to Newsletters and Notifications</label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <button type="button" class="btn btn-primary mr-1 mb-1 waves-effect waves-light" id="enterAction">
                                                    <i class="feather icon-log-in"></i> Submit
                                                </button>
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
<script src="<?=$this->asset('js/litepicker.js')?>"></script>
<script>
/* global $, Litepicker, __tajs */
var picker = new Litepicker({
    element: document.getElementById('birthday'),
    singleMode: true,
    numberOfMonths: 1,
    numberOfColumns: 1,
    format: 'YYYY-MM-DD',
    dropdowns: {minYear: 1930, maxYear: null, months: false, years: 'asc',},
    startDate: null
});
function formatDate(d) {
    var month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
$(document).ready(function() {
    $('#country').on('change', function() {
        $('#phone_prefix').val($("#country option:selected").attr('phone'));
    });
    $('#enterAction').on('click', function() {

        if (picker.getStartDate()==null) {
            __tajs.showAlert('Please choose your birthday!');
            return false;
        }
        var $this = $(this),
            address = $('#address').val(),
            country = parseInt($('#country').val(),10),
            phone = $.trim($('#phone').val()),
            chat_account = $('#chat_prefix').val() + ':' + $('#chat_account').val(),
            birthday = formatDate(picker.getStartDate()),
            timezone = $('#timezone').val(),
            language = $('#language').val(),
            is_subscribed = $('#is_subscribed').is(':checked') ? 1 : 0;
        console.log(country)
        if (!address || address.length < 6) {
            __tajs.showAlert('Please correct your address!');
            return false;
        }
        if (country == "0") {
            __tajs.showAlert('Oops! You forgot to select your country!');
            return false;
        }
        if (phone.length < 9) {
            __tajs.showAlert('Please correct your phone number!');
            return false;
        }
        if (chat_account.length < 8) {
            __tajs.showAlert('Please correct your chatting account!');
            return false;
        }
        if (!birthday || birthday.length < 10) {
            __tajs.showAlert('Please correct your birthday!');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop("disabled", true);
        $.post('/auth/verify', {
            csrf_token: '<?=$this->csrf()?>',
            reset_token: '<?=$this->data->token?>',
            address: address,
            country_id: country,
            phone: phone,
            chat_account: chat_account,
            birthday: birthday,
            timezone: timezone,
            language: language,
            is_subscribed: is_subscribed
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
