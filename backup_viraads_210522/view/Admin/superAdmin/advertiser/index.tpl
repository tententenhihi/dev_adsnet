<style>
    .sumbox {
        display: flex;
        background-color: #fff;
        border-radius: 0.25rem;
        padding: 25px;
        border: none;
        -webkit-box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);
        box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);
        flex-flow: row nowrap;
        align-content: center;
        justify-content: space-between;
        align-items: center;
    }
    span.icon svg {
        width: 50px;
    }

    .title{
        font-size: 1.5rem;
    }
    .subtitle{
        font-size: 1rem;
    }

    .advertiser {
        flex: 1;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="row is-multiline">
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/all">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->ads->All)?></h2>
                                <p style="color: #626262">All Ads</p>
                            </div>
                            <div class="avatar bg-rgba-primary p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-airplay text-primary font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox" href="/advertiser/ad/all">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->numberFormat($this->data->ads->All)?></p>
                                <p class="subtitle is-6 text-muted">All Ads</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/pending">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->ads->Pending??0)?></h2>
                                <p style="color: #626262">Pending Ads</p>
                            </div>
                            <div class="avatar bg-rgba-warning p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-airplay text-warning font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox d-flex" href="/advertiser/ad/pending">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->numberFormat($this->data->ads->Pending??0)?></p>
                                <p class="subtitle is-6 text-muted">Pending Ads</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/active">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->ads->Active??0)?></h2>
                                <p style="color: #626262">Active Ads</p>
                            </div>
                            <div class="avatar bg-rgba-success p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-airplay text-success font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox" href="/advertiser/ad/active">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->numberFormat($this->data->ads->Active??0)?></p>
                                <p class="subtitle is-6 text-muted">Active Ads</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/paused">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->ads->Paused??0)?></h2>
                                <p style="color: #626262">Paused Ads</p>
                            </div>
                            <div class="avatar bg-rgba-info p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-airplay text-info font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox" href="/advertiser/ad/paused">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->numberFormat($this->data->ads->Paused??0)?></p>
                                <p class="subtitle is-6 text-muted">Paused Ads</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/billing/balance">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->adv->cnt??0)?></h2>
                                <p style="color: #626262">Total Advertisers</p>
                            </div>
                            <div class="avatar bg-rgba-success p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-users text-success font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox" href="/billing/balance">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->numberFormat($this->data->adv->cnt??0)?></p>
                                <p class="subtitle is-6 text-muted">Total Advertisers</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/billing/deposit/paid">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->adv->deposit_value??0)?></h2>
                                <p style="color: #626262">Total Deposit</p>
                            </div>
                            <div class="avatar bg-rgba-primary p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-money text-primary font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox" href="/billing/deposit/paid">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->currencyFormat($this->data->adv->deposit_value??0)?></p>
                                <p class="subtitle is-6 text-muted">Total Deposit</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/billing/receipt">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->adv->receipt_value??0)?></h2>
                                <p style="color: #626262">Total Spent</p>
                            </div>
                            <div class="avatar bg-rgba-success p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-money text-success font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox" href="/billing/receipt">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->currencyFormat($this->data->adv->receipt_value??0)?></p>
                                <p class="subtitle is-6 text-muted">Total Spent</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/stopped">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="advertiser">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->ads->Stopped??0)?></h2>
                                <p style="color: #626262">Stopped Ads</p>
                            </div>
                            <div class="avatar bg-rgba-danger p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-airplay text-danger font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                    <!--<div class="card">
                        <a class="sumbox" href="/advertiser/ad/stopped">
                            <div class="sumbox-text">
                                <p class="title is-4"><?=$this->helper->numberFormat($this->data->ads->Stopped??0)?></p>
                                <p class="subtitle is-6 text-muted">Stopped Ads</p>
                            </div>
                            <div class="sumbox-icon has-text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                            </div>
                        </a>
                    </div>-->
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */

</script>