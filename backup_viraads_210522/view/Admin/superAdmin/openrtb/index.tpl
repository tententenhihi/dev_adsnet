<section class="wrapper">
    <div class="content-body">
        <div class="row is-multiline">
            <div class="col-lg-3 col-md-6 col-12">
                <a class="card sumbox" href="/openrtb/report">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->impression)?></h2>
                            <p style="color: #626262">Impression</p>
                        </div>
                        <div class="avatar bg-rgba-primary p-50 m-0">
                            <div class="avatar-content">
                                <i class="feather icon-eye text-primary font-medium-5"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <a class="card sumbox" href="/openrtb/report">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->click)?></h2>
                            <p style="color: #626262">Click</p>
                        </div>
                        <div class="avatar bg-rgba-warning p-50 m-0">
                            <div class="avatar-content">
                                <i class="fa fa-mouse-pointer text-warning font-medium-5"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <div class="card sumbox">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->revenue)?></h2>
                            <p style="color: #626262">Estimated Revenue</p>
                        </div>
                        <div class="avatar bg-rgba-success p-50 m-0">
                            <div class="avatar-content">
                                <i class="fa fa-money text-success font-medium-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <div class="card sumbox">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->net_revenue)?></h2>
                            <p style="color: #626262">Recorded Revenue</p>
                        </div>
                        <div class="avatar bg-rgba-primary p-50 m-0">
                            <div class="avatar-content">
                                <i class="fa fa-money text-primary font-medium-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <a class="card sumbox" href="/openrtb/payment">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->payment)?></h2>
                            <p style="color: #626262">Paid Revenue</p>
                        </div>
                        <div class="avatar bg-rgba-danger p-50 m-0">
                            <div class="avatar-content">
                                <i class="fa fa-usd text-danger font-medium-5"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <a class="card sumbox" href="/openrtb/network">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->total_net)?></h2>
                            <p style="color: #626262">Total Networks</p>
                        </div>
                        <div class="avatar bg-rgba-info p-50 m-0">
                            <div class="avatar-content">
                                <i class="feather icon-globe text-info font-medium-5"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <a class="card sumbox" href="/openrtb/ad">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->active_ad)?>/<?=$this->helper->numberFormat($this->data->total_ad)?></h2>
                            <p style="color: #626262">Active/Total Ads</p>
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
                <div class="card sumbox">
                    <div class="card-header d-flex align-items-start pb-0">
                        <div class="title-billing-admin">
                            <h2 class="text-bold-700 mt-0"><?=$this->data->impression?$this->helper->currencyFormat($this->data->revenue*1000/$this->data->impression):'0.00'?></h2>
                            <p style="color: #626262">Avg eCPM</p>
                        </div>
                        <div class="avatar bg-rgba-danger p-50 m-0">
                            <div class="avatar-content">
                                <i class="feather icon-briefcase  text-danger font-medium-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>