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

    .title-billing-admin {
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
                    <div class="card">
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
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=$this->helper->numberFormat($this->data->impression)?></p>
                            <p class="subtitle is-6 text-muted">Impression</p>
                        </div>
                        <div class="sumbox-icon text-info">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M12,9A3,3 0 0,0 9,12A3,3 0 0,0 12,15A3,3 0 0,0 15,12A3,3 0 0,0 12,9M12,17A5,5 0 0,1 7,12A5,5 0 0,1 12,7A5,5 0 0,1 17,12A5,5 0 0,1 12,17M12,4.5C7,4.5 2.73,7.61 1,12C2.73,16.39 7,19.5 12,19.5C17,19.5 21.27,16.39 23,12C21.27,7.61 17,4.5 12,4.5Z"></path>
                            </svg>
                        </span>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-billing-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->revenue)?></h2>
                                <p style="color: #626262">Estimated Revenue</p>
                            </div>
                            <div class="avatar bg-rgba-success p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-usd text-success font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=$this->helper->currencyFormat($this->data->revenue)?></p>
                            <p class="subtitle is-6 text-muted">Estimated Revenue</p>
                        </div>
                        <div class="sumbox-icon text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M3,6H21V18H3V6M12,9A3,3 0 0,1 15,12A3,3 0 0,1 12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9M7,8A2,2 0 0,1 5,10V14A2,2 0 0,1 7,16H17A2,2 0 0,1 19,14V10A2,2 0 0,1 17,8H7Z"/>
                            </svg>
                        </span>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-billing-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->net_revenue)?></h2>
                                <p style="color: #626262">Recorded Revenue</p>
                            </div>
                            <div class="avatar bg-rgba-info p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-usd text-info font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=$this->helper->currencyFormat($this->data->net_revenue)?></p>
                            <p class="subtitle is-6 text-muted">Recorded Revenue</p>
                        </div>
                        <div class="sumbox-icon text-primary">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M2,5H22V20H2V5M20,18V7H4V18H20M17,8A2,2 0 0,0 19,10V15A2,2 0 0,0 17,17H7A2,2 0 0,0 5,15V10A2,2 0 0,0 7,8H17M17,13V12C17,10.9 16.33,10 15.5,10C14.67,10 14,10.9 14,12V13C14,14.1 14.67,15 15.5,15C16.33,15 17,14.1 17,13M15.5,11A0.5,0.5 0 0,1 16,11.5V13.5A0.5,0.5 0 0,1 15.5,14A0.5,0.5 0 0,1 15,13.5V11.5A0.5,0.5 0 0,1 15.5,11M13,13V12C13,10.9 12.33,10 11.5,10C10.67,10 10,10.9 10,12V13C10,14.1 10.67,15 11.5,15C12.33,15 13,14.1 13,13M11.5,11A0.5,0.5 0 0,1 12,11.5V13.5A0.5,0.5 0 0,1 11.5,14A0.5,0.5 0 0,1 11,13.5V11.5A0.5,0.5 0 0,1 11.5,11M8,15H9V10H8L7,10.5V11.5L8,11V15Z"/>
                            </svg>
                        </span>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-billing-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->currencyFormat($this->data->payment)?></h2>
                                <p style="color: #626262">Paid Revenue</p>
                            </div>
                            <div class="avatar bg-rgba-warning p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fa fa-usd text-warning font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=$this->helper->currencyFormat($this->data->payment)?></p>
                            <p class="subtitle is-6 text-muted">Paid Revenue</p>
                        </div>
                        <div class="sumbox-icon text-danger">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M7,15H9C9,16.08 10.37,17 12,17C13.63,17 15,16.08 15,15C15,13.9 13.96,13.5 11.76,12.97C9.64,12.44 7,11.78 7,9C7,7.21 8.47,5.69 10.5,5.18V3H13.5V5.18C15.53,5.69 17,7.21 17,9H15C15,7.92 13.63,7 12,7C10.37,7 9,7.92 9,9C9,10.1 10.04,10.5 12.24,11.03C14.36,11.56 17,12.22 17,15C17,16.79 15.53,18.31 13.5,18.82V21H10.5V18.82C8.47,18.31 7,16.79 7,15Z"/>
                            </svg>
                        </span>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-billing-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->total_net)?></h2>
                                <p style="color: #626262">Total Networks</p>
                            </div>
                            <div class="avatar bg-rgba-primary p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-globe text-primary font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=$this->helper->numberFormat($this->data->total_net)?></p>
                            <p class="subtitle is-6 text-muted">Total Networks</p>
                        </div>
                        <div class="sumbox-icon text-info">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M12,2A8,8 0 0,0 4,10C4,14.03 7,17.42 11,17.93V19H10A1,1 0 0,0 9,20H2V22H9A1,1 0 0,0 10,23H14A1,1 0 0,0 15,22H22V20H15A1,1 0 0,0 14,19H13V17.93C17,17.43 20,14.03 20,10A8,8 0 0,0 12,2M12,4C12,4 12.74,5.28 13.26,7H10.74C11.26,5.28 12,4 12,4M9.77,4.43C9.5,4.93 9.09,5.84 8.74,7H6.81C7.5,5.84 8.5,4.93 9.77,4.43M14.23,4.44C15.5,4.94 16.5,5.84 17.19,7H15.26C14.91,5.84 14.5,4.93 14.23,4.44M6.09,9H8.32C8.28,9.33 8.25,9.66 8.25,10C8.25,10.34 8.28,10.67 8.32,11H6.09C6.03,10.67 6,10.34 6,10C6,9.66 6.03,9.33 6.09,9M10.32,9H13.68C13.72,9.33 13.75,9.66 13.75,10C13.75,10.34 13.72,10.67 13.68,11H10.32C10.28,10.67 10.25,10.34 10.25,10C10.25,9.66 10.28,9.33 10.32,9M15.68,9H17.91C17.97,9.33 18,9.66 18,10C18,10.34 17.97,10.67 17.91,11H15.68C15.72,10.67 15.75,10.34 15.75,10C15.75,9.66 15.72,9.33 15.68,9M6.81,13H8.74C9.09,14.16 9.5,15.07 9.77,15.56C8.5,15.06 7.5,14.16 6.81,13M10.74,13H13.26C12.74,14.72 12,16 12,16C12,16 11.26,14.72 10.74,13M15.26,13H17.19C16.5,14.16 15.5,15.07 14.23,15.57C14.5,15.07 14.91,14.16 15.26,13Z"></path>
                            </svg>
                        </span>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-billing-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->active_ad)?>/<?=$this->
                                    helper->numberFormat($this->data->total_ad)?></h2>
                                <p style="color: #626262">Active/Total Ads</p>
                            </div>
                            <div class="avatar bg-rgba-success p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-airplay text-success font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=$this->helper->numberFormat($this->data->active_ad)?>/<?=$this->
                                helper->numberFormat($this->data->total_ad)?></p>
                            <p class="subtitle is-6 text-muted">Active/Total Ads</p>
                        </div>
                        <div class="sumbox-icon text-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                            </svg>
                        </span>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-billing-admin">
                                <h2 class="text-bold-700 mt-0"><?=$this->
                                    data->impression?$this->helper->currencyFormat($this->data->revenue*1000/$this->data->impression):'0.00'?></h2>
                                <p style="color: #626262">Avg eCPM</p>
                            </div>
                            <div class="avatar bg-rgba-info p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-briefcase text-info font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=$this->
                                data->impression?$this->helper->currencyFormat($this->data->revenue*1000/$this->data->impression):'0.00'?></p>
                            <p class="subtitle is-6 text-muted">Avg eCPM</p>
                        </div>
                        <div class="sumbox-icon text-danger">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M12,13A5,5 0 0,1 7,8H9A3,3 0 0,0 12,11A3,3 0 0,0 15,8H17A5,5 0 0,1 12,13M12,3A3,3 0 0,1 15,6H9A3,3 0 0,1 12,3M19,6H17A5,5 0 0,0 12,1A5,5 0 0,0 7,6H5C3.89,6 3,6.89 3,8V20A2,2 0 0,0 5,22H19A2,2 0 0,0 21,20V8C21,6.89 20.1,6 19,6Z"></path>
                            </svg>
                        </span>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div class="title-billing-admin">
                                <h2 class="text-bold-700 mt-0"><?=round($this->data->adjust*100,2)?>%</h2>
                                <p style="color: #626262">Bid Adjustment</p>
                            </div>
                            <div class="avatar bg-rgba-warning p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-disc text-warning font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="sumbox card" style="height: 90%">
                        <div class="sumbox-text">
                            <p class="title is-4"><?=round($this->data->adjust*100,2)?>%</p>
                            <p class="subtitle is-6 text-muted">Bid Adjustment</p>
                        </div>
                        <div class="sumbox-icon text-warning">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor"
                                      d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20C7.59,20 4,16.41 4,12C4,7.59 7.59,4 12,4C16.41,4 20,7.59 20,12C20,16.41 16.41,20 12,20M15,12A3,3 0 0,1 12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9A3,3 0 0,1 15,12Z"></path>
                            </svg>
                        </span>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>