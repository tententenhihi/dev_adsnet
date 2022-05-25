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

    .title-advertiser-admin {
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
                            <div class="title-advertiser-admin">
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
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/pending">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-advertiser-admin">
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
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/active">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-advertiser-admin">
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
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/paused">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-advertiser-admin">
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
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/billing/balance">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-advertiser-admin">
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
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/billing/deposit/paid">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-advertiser-admin">
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
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/billing/receipt">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-advertiser-admin">
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
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="card" href="/advertiser/ad/stopped">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-advertiser-admin">
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
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
/* global $, __tajs, google */

</script>