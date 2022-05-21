<style>
    .collapse:not(.show) {
        display: inline;
    }
</style>
<section class="wrapper">
    <div class="content-body">
        <div class="row">
            <div class="col-12">
                <div class="alert alert-info">
                    <p>Becareful, changing anything on this page may break your system!</p>
                </div>
            </div>
        </div>
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-12">
                    <h3 class="title is-6">Basic Information</h3>
                </div>
            </div>
        </div>
        <div class="row flex-wrap" id="basic-info">
            <div class="col-lg-6 col-md-6 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">App Name</label>
                                <input class="input form-control" type="text" id="SITE_NAME" placeholder="Your app name" value="<?=SITE_NAME?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Landing Page</label>
                                <input class="input form-control" id="FRONTEND_URL" placeholder="Your Landing page link" value="<?=FRONTEND_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Blog Url</label>
                                <input class="input form-control" type="text" id="BLOG_URL" placeholder="Your blog url" value="<?=BLOG_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Asset Url</label>
                                <input class="input form-control" id="ASSET_URL" placeholder="Your Asset Server Url" value="<?=ASSET_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">API Url</label>
                                <input class="input form-control" id="API_URL" placeholder="Your API Server Url" value="<?=API_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Delivery Url</label>
                                <input class="input form-control" type="text" id="ADSERVER_URL" placeholder="ads.yourdomain.com" value="<?=ADSERVER_URL?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">MyAccount Panel</label>
                                <input class="input form-control" type="text" id="MYACCOUNT_URL" placeholder="me.yourdomain.com" value="<?=MYACCOUNT_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Publisher Panel</label>
                                <input class="input form-control" id="PUBLISHER_URL" placeholder="pub.yourdomain.com" value="<?=PUBLISHER_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Advertiser Panel</label>
                                <input class="input form-control" type="text" id="ADVERTISER_URL" placeholder="adv.yourdomain.com" value="<?=ADVERTISER_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Admin Panel</label>
                                <input class="input form-control" id="ADMIN_URL" placeholder="adm.yourdomain.com" value="<?=ADMIN_URL?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Timezone</label>
                                <input class="input form-control" id="TIMEZONE" placeholder="UTC" value="<?=TIMEZONE?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Google Analytics</label>
                                <input class="input form-control" id="GOOGLE_ANALYTICS" placeholder="your GA4 ID" value="<?=GOOGLE_ANALYTICS?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-12">
                    <h3 class="title is-6">Ad Server</h3>
                </div>
            </div>
        </div>
        <div class="row flex-wrap" id="adserver">
            <div class="col-lg-4 col-md-4 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">Master IP</label>
                                <input class="input form-control" type="text" id="ADSERVER_REDIS" placeholder="1.2.3.4">
                            </div>
                            <div class="form-group">
                                <label class="label">Master Port</label>
                                <input class="input form-control" type="text" id="ADSERVER_PORT" placeholder="9988" value="<?=ADSERVER_PORT?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Master Token</label>
                                <input class="input form-control" type="text" id="ADSERVER_AUTH" placeholder="ads.yourdomain.com" value="<?=ADSERVER_AUTH?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">Revshare</label>
                                <input class="input form-control" type="number" id="DEFAULT_REVSHARE" placeholder="0.8 ~ 80%" value="<?=DEFAULT_REVSHARE?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Min Ad Budget</label>
                                <input class="input form-control" type="number" id="MIN_AD_BUDGET" placeholder="5 ~ $5 minimum per ad" value="<?=MIN_AD_BUDGET?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Conversion Delays</label>
                                <input class="input form-control" type="number" id="CONVERSION_DURATION" placeholder="86400 ~ 1 day" value="<?=CONVERSION_DURATION?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">Data Retention</label>
                                <input class="input form-control" type="text" id="RAW_METRIC_DURATION" placeholder="Months to keep raw metric" value="<?=RAW_METRIC_DURATION?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Budget Capping</label>
                                <input class="input form-control" type="text" id="DEFAULT_CAPPING" placeholder="empty to disable" value="<?=DEFAULT_CAPPING?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-12">
                    <h3 class="title is-6">System</h3>
                </div>
            </div>
        </div>
        <div class="row" id="system">
            <div class="col-12">
                <div class="card flatbox">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="row is-multiline">
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="form-group">
                                        <div class="control">
                                            <label class="checkbox">
                                                <input type="checkbox" id="MAINTENANCE"<?php if(MAINTENANCE): ?> checked="checked"<?php endif; ?>>
                                                <span class="checkbox-text">Maintenance System</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="form-group has-text-left">
                                        <div class="control">
                                            <label class="checkbox">
                                                <input type="checkbox" id="MAINTENANCE_READONLY"<?php if(MAINTENANCE_READONLY): ?> checked="checked"<?php endif; ?>>
                                                <span class="checkbox-text">ReadOnly Mode</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="form-group has-text-left">
                                        <div class="control">
                                            <label class="checkbox">
                                                <input type="checkbox" id="MAINTENANCE_REGISTER"<?php if(MAINTENANCE_REGISTER): ?> checked="checked"<?php endif; ?>>
                                                <span class="checkbox-text">Maintenance Register</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="form-group has-text-left">
                                        <div class="control">
                                            <label class="checkbox">
                                                <input type="checkbox" id="SYSTEM_PAGE_404"<?php if(SYSTEM_PAGE_404): ?> checked="checked"<?php endif; ?>>
                                                <span class="checkbox-text">Enable 404</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="form-group has-text-left">
                                        <div class="control">
                                            <label class="checkbox">
                                                <input type="checkbox" id="HTML_CACHE"<?php if(HTML_CACHE): ?> checked="checked"<?php endif; ?>>
                                                <span class="checkbox-text">Enable HTML Cache</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="form-group has-text-left">
                                        <div class="control">
                                            <label class="checkbox">
                                                <input type="checkbox" id="REFERRAL"<?php if(REFERRAL): ?> checked="checked"<?php endif; ?>>
                                                <span class="checkbox-text">Enable Referral (<span><?=REFERRAL_COMMISSION*100?></span>%)</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-12">
                    <h3 class="title is-6">Email & SMS</h3>
                </div>
            </div>
        </div>
        <div class="row flex-wrap" id="email">
            <div class="col-lg-4 col-md-4 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">Host</label>
                                <input class="input form-control" type="text" id="EMAIL_SERVER_HOST" placeholder="1.2.3.4" value="<?=EMAIL_SERVER_HOST?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Port</label>
                                <input class="input form-control" type="number" id="EMAIL_SERVER_PORT" placeholder="9988" value="<?=EMAIL_SERVER_PORT?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Critical Email</label>
                                <input class="input form-control" type="text" id="EMAIL_CRITICAL" placeholder="cr@yourdomain.com" value="<?=EMAIL_CRITICAL?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">Noreply Email</label>
                                <input class="input form-control" type="text" id="EMAIL_DEFAULT_USER" placeholder="auto@yourdomain.com" value="<?=EMAIL_DEFAULT_USER?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Noreply Pass</label>
                                <input class="input form-control" type="text" id="EMAIL_DEFAULT_USER_PW" placeholder="verysecretpass" value="<?=EMAIL_DEFAULT_USER_PW?>">
                            </div>
                            <div class="form-group">
                                <label class="label">Noreply Display</label>
                                <input class="input form-control" type="text" id="EMAIL_DEFAULT_USER_NAME" placeholder="YourCompany Notification" value="<?=EMAIL_DEFAULT_USER_NAME?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-body card-dashboard">
                        <div class="form-group">
                            <div class="form-group">
                                <label class="label">ContactUS Email</label>
                                <input class="input form-control" type="text" id="EMAIL_CONTACTUS" placeholder="us@yourdomain.com" value="<?=EMAIL_CONTACTUS?>">
                            </div>
                            <div class="form-group">
                                <label class="label">SMS API</label>
                                <input class="input form-control" type="text" id="SMS_SENDER" placeholder="api.yoursms.com" value="<?=SMS_SENDER?>">
                            </div>
                            <div class="form-group">
                                <label class="label">SMS Token</label>
                                <input class="input form-control" type="text" id="SMS_APIKEY" placeholder="secrettoken" value="<?=SMS_APIKEY?>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    /* global $, __tajs */
    $(document).ready(function() {

    });
</script>
