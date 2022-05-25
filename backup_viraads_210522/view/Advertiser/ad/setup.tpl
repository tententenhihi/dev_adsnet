<style>
    #creative-preview {overflow: auto}
    .button.is-selected{background-color:#8b08bb;border-color:transparent;color:#fff;}
    .mode-toggle{
        /*margin-top:0;margin-bottom:-2.1rem!important;margin-right:0.1rem;*/
    }
    .country-toggle, .platform-toggle, .browser-toggle, .os-toggle, .time-toggle, .zone-toggle, .website-toggle, .audience-toggle{
        border: none;
        padding: 3px 10px 3px 10px;
    }
    .dropdown-menu{z-index:4}
    .box-image-ads {
        position: relative;
        display: -webkit-box;
        padding-bottom: 20px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        min-height: 176px;
    }
    .box-image-ads-svg {
        max-width: 210px;
        width: 100%;
    }
    .adFormat {
        cursor: pointer;
        height: 100%;
    }
    .adFormat.disabled, .adFormat.disabled:hover {
        /*cursor: not-allowed;*/
        /*border: none;*/
        /*opacity: 0.4;*/
    }
    .adFormat.is-selected, .adFormat:hover {
        /*border: 2px solid #7367F0;*/
    }
    .help-modal {
        margin-bottom: -1.7rem;
        text-align: right;
    }
    .help-modal .icon {
        cursor: pointer;
    }
    .help-modal .icon:hover {
        color: #7367F0;
    }
    .pricing, .audience-collect, .create-ad {
        margin-left:0.1rem;
        margin-right:0.1rem;
        cursor: pointer;
        border-radius: 33px;
        padding-top: 1rem;
        padding-bottom: 1rem;
    }
    .pricing.is-selected, .audience-collect.is-selected, .create-ad.is-selected {
        border: 2px solid #8b08bb;
        color: #8b08bb;
    }
    .pricing p {
        text-transform: uppercase;
        font-weight: 700;
    }
    .audience-collect p, .create-ad p {
        font-weight: 500;
    }
    .button.is-static {
        padding-left: 0.7rem !important;
        padding-right: 0.7rem !important;
    }
    .include-toggle {
        border-top-left-radius: 13px !important;
        border-bottom-left-radius: 13px !important;
    }
    .exclude-toggle {
        border-top-right-radius: 13px !important;
        border-bottom-right-radius: 13px !important;
    }
    table td, .table th {
        border: 1px solid #8b08bb  !important;
    }
    th.tid, th.tid-title {
        padding:0!important;
        background-color: #8b08bb ;
        color: #fff;
    }
    th.tid-title {
        background-color: #7d7d7d;
        text-transform: uppercase;
        font-size: 14px;
    }
    th.tid .tid-hour {
        text-align: center;
        padding-top: .2rem;
        padding-bottom: .3rem;
        cursor: pointer;
    }
    td.tid-day {
        background-color: #8b08bb;
        color: #fff !important;
        font-weight: bold;
        cursor: pointer;
    }
    .tid-select {
        padding:0!important;
        cursor: pointer;
        min-width: 30px;
    }
    .tid-select.is-selected, .tid-day.is-selected {
        background-color: #8b08bb75 !important;
    }
    .lib-item {
        /*overflow: scroll;*/
        max-height: 200px;
        margin-bottom: 0!important;
        padding: 20px 0 20px 0;
        border: 1px solid lightgray;
    }
    .lib-item:hover {
        box-shadow: 0 0 24px 0 rgba(0,0,0,.06), 0 1px 0 0 rgba(0,0,0,.02);
        background-color: #fff !important;
    }
    .lib-thumb {
        cursor: pointer;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
    }
    .lib-name {
        color: #006ed6;
        cursor: pointer;
    }
    .lib-size {
        color: #9a9292;
        font-size: 20px;
        cursor: pointer;
    }
    .lib-date {
        color: #9a9292;
        font-size: 14px;
        cursor: pointer;
    }
    #uploader-selector, #uploader-process {
        background-color: #fff;
    }
    #uploader-selector.dropactive {
        background-color: #f5f5f5;
    }
    .open-selector {
        color: #8b08bb !important;
        margin-top: 1.5rem;
    }
    .open-selector svg {
        height: 144px;
    }
    #progress-name {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    #progress-status {
        margin-top: -1.3rem;
    }
    .progress-detail:not(:last-child) {
        margin-right: 1rem;
    }
    #new-audience {
        color: #49c674 !important;
        font-size: 0.8rem;
    }



    .tag:not(body).is-rounded {
        border-radius: 290486px;
    }
    .tag:not(body).is-success {
        background-color: #48c774;
        color: #fff;
    }

    .tags-input .tag {
        font-size: 1rem;
        margin: 0.1rem;
    }
    .tag:not(body) {
        align-items: center;
        background-color: #f5f5f5;
        border-radius: 4px;
        /*color: #4a4a4a;*/
        display: inline-flex;
        font-size: .75rem;
        height: 2em;
        justify-content: center;
        line-height: 1.5;
        padding-left: 0.75em;
        padding-right: 0.75em;
        white-space: nowrap;
    }

    .tag:not(body) .delete {
        margin-left: 0.25rem;
        margin-right: -0.375rem;
    }
    .is-small.delete, .is-small.modal-close {
        height: 16px;
        max-height: 16px;
        max-width: 16px;
        min-height: 16px;
        min-width: 16px;
        width: 16px;
    }
    .delete, .modal-close {
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        -moz-appearance: none;
        -webkit-appearance: none;
        background-color: rgba(10,10,10,.2);
        border: none;
        border-radius: 290486px;
        cursor: pointer;
        pointer-events: auto;
        display: inline-block;
        flex-grow: 0;
        flex-shrink: 0;
        font-size: 0;
        height: 20px;
        max-height: 20px;
        max-width: 20px;
        min-height: 20px;
        min-width: 20px;
        outline: 0;
        position: relative;
        vertical-align: top;
        width: 20px;
    }
    .delete::before, .modal-close::before {
        height: 2px;
        width: 50%;
    }
    .delete::after, .delete::before {
        background-color: #fff;
        content: "";
        display: block;
        left: 50%;
        position: absolute;
        top: 50%;
        transform: translateX(-50%) translateY(-50%) rotate(45deg);
        transform-origin: center center;
    }
    .delete::after, .modal-close::after {
        height: 50%;
        width: 2px;
    }
    .delete::after, .delete::before{
        background-color: #fff;
        content: "";
        display: block;
        left: 50%;
        position: absolute;
        top: 50%;
        transform: translateX(-50%) translateY(-50%) rotate(45deg);
        transform-origin: center center;
    }

    .collapse:not(.show) {
        display: inline;
    }

    .field.has-addons .control.is-expanded {
        flex-grow: 1;
        flex-shrink: 1;
    }

    .pricing{
        box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
        margin-left: 0.1rem;
        margin-right: 0.1rem;
        cursor: pointer;
        border-radius: 33px;
        padding: 12px 15px 1px 15px;

    }

    .url-param{
        border: 1px solid rgba(128, 128, 128, 0.21);
        padding: 7px;
    }
    .audience-collect{
        border: 1px solid rgba(128, 128, 128, 0.21);
        padding: 10px 10px 1px 20px;
    }
    .hero {
        align-items: stretch;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }


    .hero-body {
        flex-grow: 1;
        flex-shrink: 0;
        /*padding: 9rem 1.5rem;*/
    }

    .toggle-handle {
        position: relative;
        margin: 0 auto;
        padding-top: 0px;
        padding-bottom: 0px;
        height: 100%;
        width: 0px;
        border-width: 0 1px;
    }
    .btn-default {
        color: #333;
        /*background-color: #fff;*/
        border-color: #ccc;
    }


    .adFormat {
        margin-left:0.1rem;
        margin-right:0.1rem;
        cursor: pointer;
        border-radius: 33px;
        padding-top: 1rem;
        padding-bottom: 1rem;
    }
    .is-selected {
        border: 2px solid #006ed6;
        color: #006ed6;
    }
    .adFormat{
        box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
        margin-left: 0.1rem;
        margin-right: 0.1rem;
        cursor: pointer;
        border-radius: 33px;
        padding: 12px 15px 1px 15px;
    }
</style>

<div class="content-body">



    <div class="page-title-box">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Select Ad Format</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="ad-format">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                            </svg>
                        </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row is-multiline" id="ad-format" style="flex-wrap: wrap">
        <?php foreach($this->data->adFormat as $item): ?>
        <div class="col-lg-4 col-md-6 col-12 mb-2">
            <div class="card h-100 mb-0 flatbox adFormat disabled<?php if(!$item->status): ?> disabled<?php endif; ?>" data-id="<?=$item->id?>" data-status="<?=$item->status?>" data-pricing="<?=$item->pricing_model?>" data-creative="<?=$item->creative_required?>" data-title="<?=$item->name?>">
                <div class="card-content data-step" id="ad-format">
                    <div class="card-body card-dashboard">
                        <div style="text-align:center;padding-bottom:1rem;">
                            <h2 class="title is-4 is-5-mobile"><?=$item->name?></h2>
                        </div>
                        <div class="box-image-ads">
                            <div class="box-image-ads-svg">
                                <?=$item->svg?>
                            </div>
                        </div>
                        <?php foreach(explode(PHP_EOL,$item->adv_description) as $desc): ?>
                        <div>
                            <span class="icon text-info">
                                <i class="feather icon-check"></i>
                            </span>
                            <span><?=$desc?></span>
                        </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>

    <div class="page-title-box data-step hidden">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Basic Information</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="basic-info">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                            </svg>
                        </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="row data-step hidden" id="basic-info" style="flex-wrap: wrap">
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="help-modal" data-target="helpModalBasic">
                            <span class="icon">
                                <svg viewBox="0 0 24 24" style="width: 20px;padding-bottom: 5px;">
                                    <path fill="currentColor" d="M15.07,11.25L14.17,12.17C13.45,12.89 13,13.5 13,15H11V14.5C11,13.39 11.45,12.39 12.17,11.67L13.41,10.41C13.78,10.05 14,9.55 14,9C14,7.89 13.1,7 12,7A2,2 0 0,0 10,9H8A4,4 0 0,1 12,5A4,4 0 0,1 16,9C16,9.88 15.64,10.67 15.07,11.25M13,19H11V17H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />
                                </svg>
                            </span>
                        </div>
                        <div class="form-group">
                            <label class="label">Ad Pricing</label>
                            <div class="columns is-gapless is-mobile d-flex" id="pricing_model" style="margin-left:-.35rem;margin-right:-.35rem"></div>
                        </div>
                        <div class="form-group">
                            <label class="label">Ad Name</label>
                            <input class="input form-control" type="text" id="name" placeholder="Should be unique name">

                        </div>
                        <div class="form-group">
                            <label class="label">Target Url</label>
                            <textarea class="textarea form-control" id="url" rows="5" placeholder="Your pre-landing or landing page"></textarea>
                        </div>
                        <div class="buttons are-small mb-1">
                            <button class="btn btn-default mb-1 url-param">{campaign_id}</button>
                            <button class="btn btn-default mb-1 url-param">{ad_id}</button>
                            <button class="btn btn-default mb-1 url-param">{country}</button>
                            <button class="btn btn-default mb-1 url-param">{platform}</button>
                            <button class="btn btn-default mb-1 url-param">{browser}</button>
                            <button class="btn btn-default mb-1 url-param">{os}</button>
                            <button class="btn btn-default mb-1 url-param">{audience_id}</button>
                            <button class="btn btn-default mb-1 url-param">{website_id}</button>
                            <button class="btn btn-default mb-1 url-param">{zone_id}</button>
                            <button class="btn btn-default mb-1 url-param">{cost}</button>
                            <button class="btn btn-default mb-1 url-param">{referrer}</button>
                            <button class="btn btn-default mb-1 url-param cpa-param hidden">{click_id}</button>
                        </div>
                        <p class="help text-danger cpa-param hidden" style="margin-top:-1rem">{click_id} is required for CPA campaign</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="help-modal" data-target="helpModalLimit">
                            <span class="icon">
                                <svg viewBox="0 0 24 24" style="width: 20px;padding-bottom: 5px;">
                                    <path fill="currentColor" d="M15.07,11.25L14.17,12.17C13.45,12.89 13,13.5 13,15H11V14.5C11,13.39 11.45,12.39 12.17,11.67L13.41,10.41C13.78,10.05 14,9.55 14,9C14,7.89 13.1,7 12,7A2,2 0 0,0 10,9H8A4,4 0 0,1 12,5A4,4 0 0,1 16,9C16,9.88 15.64,10.67 15.07,11.25M13,19H11V17H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />
                                </svg>
                            </span>
                        </div>
                        <div class="form-group">
                            <label class="label">Budget Limitation</label>
                            <div class="input-group">
                                <input class="input form-control" id="budget" type="number" min="<?=MIN_AD_BUDGET?>" step="0.01" value="9999" placeholder="Total budget">
                                <div class="input-group-append">
                                    <span class="input-group-text">Total</span>
                                </div>

                                <input class="input form-control" id="budget_daily" type="number" min="0" step="0.01" placeholder="Empty to not limit">
                                <div class="input-group-append">
                                    <span class="input-group-text">Daily</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="label"><span class="goal_type_label"></span> Limitation</label>
                            <div class="input-group">
                                <input class="input form-control" id="goal_total" type="number" min="0" value="" placeholder="Empty to not limit">
                                <div class="input-group-append">
                                    <span class="input-group-text">Total</span>
                                </div>

                                <input class="input form-control" id="goal_daily" type="number" min="0" placeholder="Empty to not limit">
                                <div class="input-group-append">
                                    <span class="input-group-text">Daily</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="label">Budget Capping</label>
                            <div class="input-group">
                                <input class="input form-control" id="budget_capping_number" type="number" min="0" step="0.01" placeholder="Empty to not set">
                                <div class="input-group-append">
                                    <span class="input-group-text">Per</span>
                                </div>

                                <input class="input form-control" id="budget_capping_time" type="number" min="1" value="1" placeholder="How long?">
                                <div class="input-group-append">
                                    <select id="budget_capping_timetype" class="form-control" style="width: 85px;">
                                        <option value="h">Hours</option>
                                        <option value="m">Mins</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="label"><span class="goal_type_label"></span> Capping</label>
                            <div class="input-group">
                                <input class="input form-control" id="goal_capping_number" type="number" min="0" placeholder="Empty to not set">
                                <div class="input-group-append">
                                    <span class="input-group-text">Per</span>
                                </div>

                                <input class="input form-control" id="goal_capping_time" type="number" min="1" value="1" placeholder="How long?">
                                <div class="input-group-append">
                                    <select id="goal_capping_timetype" class="form-control" style="width: 85px;">
                                        <option value="h">Hours</option>
                                        <option value="m">Mins</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="field">
                            <label class="label">Default Bidding</label>
                            <div class="input-group">
                                <input class="input form-control" id="bidding" type="number" min="0" step="0.0001" placeholder="Required, override by per country bidding">
                                <div class="input-group-append">
                                    <select id="optimization" class="form-control" style="width: 125px;">
                                        <option value="auto">Auto</option>
                                        <option value="speed">Max.Speed</option>
                                        <option value="cost">Min.Cost</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box data-step hidden" id="ad-creative-title" style="display:none">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Ad Creative</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-config">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                            </svg>
                        </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row data-step hidden" id="ad-creative" style="display:none; flex-wrap: wrap">
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0" >
                <div class="card-content">
                    <div class="card-body card-dashboard" id="creative-create">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-12 mb-2">
            <div class="card flatbox h-100 mb-0">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div id="creative-preview"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box data-step hidden">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Standard Targeting</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-config">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                            </svg>
                        </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row data-step hidden" id="standard-targeting">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="form-group">
                            <label class="label">Schedule</label>
                            <input class="input form-control" type="text" id="date-range">
                        </div>
                        <div class="form-group mb-3">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small country-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small country-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="label">Country</label>
                            <select id="country" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Country">
                                <?php foreach($this->data->country as $country): ?>
                                <option value="<?=$country->code?>"><?=$country->name?></option>
                                <?php endforeach; ?>
                            </select>
                            <p class="help text-info">Leave empty to accept all countries</p>
                        </div>
                        <div class="form-group">
                            <label class="label">Bidding</label>
                            <div class="control">
                                <select id="country_bid" class="input" multiple data-type="tags" autocomplete="off" data-placeholder="Country Bidding">
                                    <?php foreach($this->data->country as $country): ?>
                                    <option value="<?=$country->code?>"><?=$country->name?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <p class="help text-info">Overide default bidding for selected countries</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box data-step hidden">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Advanced Targeting</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-config">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                            </svg>
                        </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row data-step hidden" id="advanced-targeting">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="form-group">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small platform-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small platform-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">Platform</label>
                            <select id="platform" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Platform">
                                <?php foreach($this->data->platforms as $item): ?>
                                <option value="<?=$item->name?>"><?=$item->name?></option>
                                <?php endforeach; ?>
                            </select>
                            <p class="help text-info">Leave empty to accept all platforms</p>
                        </div>
                        <div class="form-group mb-3">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small os-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small os-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">OperaSystem</label>
                            <select id="os" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose OS">
                                <?php foreach($this->data->oses as $item): ?>
                                <option value="<?=$item->name?>"><?=$item->name?></option>
                                <?php endforeach; ?>
                            </select>
                            <p class="help text-info">Leave empty to accept all OSes</p>
                        </div>
                        <div class="form-group mb-4">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small browser-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small browser-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">Browser</label>
                            <select id="browser" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Browser">
                                <?php foreach($this->data->browsers as $item): ?>
                                <option value="<?=$item->name?>"><?=$item->name?></option>
                                <?php endforeach; ?>
                            </select>
                            <p class="help text-info">Leave empty to accept all browsers</p>
                        </div>
                        <div class="form-group mb-3">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small time-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small time-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">Advanced Time</label>

                            <div class="table-responsive">
                                <table class="table table-striped mb-1">
                                    <tbody>
                                    <tr>
                                        <th class="tid-title"><div class="hidden-touch" style="text-align:center;padding-top:.2rem">Day\Hour</div></th>
                                        <th class="tid" data-hour="00"><div class="tid-hour">00</div></th>
                                        <th class="tid" data-hour="01"><div class="tid-hour">01</div></th>
                                        <th class="tid" data-hour="02"><div class="tid-hour">02</div></th>
                                        <th class="tid" data-hour="03"><div class="tid-hour">03</div></th>
                                        <th class="tid" data-hour="04"><div class="tid-hour">04</div></th>
                                        <th class="tid" data-hour="05"><div class="tid-hour">05</div></th>
                                        <th class="tid" data-hour="06"><div class="tid-hour">06</div></th>
                                        <th class="tid" data-hour="07"><div class="tid-hour">07</div></th>
                                        <th class="tid" data-hour="08"><div class="tid-hour">08</div></th>
                                        <th class="tid" data-hour="09"><div class="tid-hour">09</div></th>
                                        <th class="tid" data-hour="10"><div class="tid-hour">10</div></th>
                                        <th class="tid" data-hour="11"><div class="tid-hour">11</div></th>
                                        <th class="tid" data-hour="12"><div class="tid-hour">12</div></th>
                                        <th class="tid" data-hour="13"><div class="tid-hour">13</div></th>
                                        <th class="tid" data-hour="14"><div class="tid-hour">14</div></th>
                                        <th class="tid" data-hour="15"><div class="tid-hour">15</div></th>
                                        <th class="tid" data-hour="16"><div class="tid-hour">16</div></th>
                                        <th class="tid" data-hour="17"><div class="tid-hour">17</div></th>
                                        <th class="tid" data-hour="18"><div class="tid-hour">18</div></th>
                                        <th class="tid" data-hour="19"><div class="tid-hour">19</div></th>
                                        <th class="tid" data-hour="20"><div class="tid-hour">20</div></th>
                                        <th class="tid" data-hour="21"><div class="tid-hour">21</div></th>
                                        <th class="tid" data-hour="22"><div class="tid-hour">22</div></th>
                                        <th class="tid" data-hour="23"><div class="tid-hour">23</div></th>
                                    </tr>
                                    <tr>
                                        <td class="tid-day" data-weekday="1">Mon</td>
                                        <td class="tid tid-select tid-hour-00 tid-day-1" id="100"></td>
                                        <td class="tid tid-select tid-hour-01 tid-day-1" id="101"></td>
                                        <td class="tid tid-select tid-hour-02 tid-day-1" id="102"></td>
                                        <td class="tid tid-select tid-hour-03 tid-day-1" id="103"></td>
                                        <td class="tid tid-select tid-hour-04 tid-day-1" id="104"></td>
                                        <td class="tid tid-select tid-hour-05 tid-day-1" id="105"></td>
                                        <td class="tid tid-select tid-hour-06 tid-day-1" id="106"></td>
                                        <td class="tid tid-select tid-hour-07 tid-day-1" id="107"></td>
                                        <td class="tid tid-select tid-hour-08 tid-day-1" id="108"></td>
                                        <td class="tid tid-select tid-hour-09 tid-day-1" id="109"></td>
                                        <td class="tid tid-select tid-hour-10 tid-day-1" id="110"></td>
                                        <td class="tid tid-select tid-hour-11 tid-day-1" id="111"></td>
                                        <td class="tid tid-select tid-hour-12 tid-day-1" id="112"></td>
                                        <td class="tid tid-select tid-hour-13 tid-day-1" id="113"></td>
                                        <td class="tid tid-select tid-hour-14 tid-day-1" id="114"></td>
                                        <td class="tid tid-select tid-hour-15 tid-day-1" id="115"></td>
                                        <td class="tid tid-select tid-hour-16 tid-day-1" id="116"></td>
                                        <td class="tid tid-select tid-hour-17 tid-day-1" id="117"></td>
                                        <td class="tid tid-select tid-hour-18 tid-day-1" id="118"></td>
                                        <td class="tid tid-select tid-hour-19 tid-day-1" id="119"></td>
                                        <td class="tid tid-select tid-hour-20 tid-day-1" id="120"></td>
                                        <td class="tid tid-select tid-hour-21 tid-day-1" id="121"></td>
                                        <td class="tid tid-select tid-hour-22 tid-day-1" id="122"></td>
                                        <td class="tid tid-select tid-hour-23 tid-day-1" id="123"></td>
                                    </tr>
                                    <tr>
                                        <td class="tid-day" data-weekday="2">Tue</td>
                                        <td class="tid tid-select tid-hour-00 tid-day-2" id="200"></td>
                                        <td class="tid tid-select tid-hour-01 tid-day-2" id="201"></td>
                                        <td class="tid tid-select tid-hour-02 tid-day-2" id="202"></td>
                                        <td class="tid tid-select tid-hour-03 tid-day-2" id="203"></td>
                                        <td class="tid tid-select tid-hour-04 tid-day-2" id="204"></td>
                                        <td class="tid tid-select tid-hour-05 tid-day-2" id="205"></td>
                                        <td class="tid tid-select tid-hour-06 tid-day-2" id="206"></td>
                                        <td class="tid tid-select tid-hour-07 tid-day-2" id="207"></td>
                                        <td class="tid tid-select tid-hour-08 tid-day-2" id="208"></td>
                                        <td class="tid tid-select tid-hour-09 tid-day-2" id="209"></td>
                                        <td class="tid tid-select tid-hour-10 tid-day-2" id="210"></td>
                                        <td class="tid tid-select tid-hour-11 tid-day-2" id="211"></td>
                                        <td class="tid tid-select tid-hour-12 tid-day-2" id="212"></td>
                                        <td class="tid tid-select tid-hour-13 tid-day-2" id="213"></td>
                                        <td class="tid tid-select tid-hour-14 tid-day-2" id="214"></td>
                                        <td class="tid tid-select tid-hour-15 tid-day-2" id="215"></td>
                                        <td class="tid tid-select tid-hour-16 tid-day-2" id="216"></td>
                                        <td class="tid tid-select tid-hour-17 tid-day-2" id="217"></td>
                                        <td class="tid tid-select tid-hour-18 tid-day-2" id="218"></td>
                                        <td class="tid tid-select tid-hour-19 tid-day-2" id="219"></td>
                                        <td class="tid tid-select tid-hour-20 tid-day-2" id="220"></td>
                                        <td class="tid tid-select tid-hour-21 tid-day-2" id="221"></td>
                                        <td class="tid tid-select tid-hour-22 tid-day-2" id="222"></td>
                                        <td class="tid tid-select tid-hour-23 tid-day-2" id="223"></td>
                                    </tr>
                                    <tr>
                                        <td class="tid-day" data-weekday="3">Wed</td>
                                        <td class="tid tid-select tid-hour-00 tid-day-3" id="300"></td>
                                        <td class="tid tid-select tid-hour-01 tid-day-3" id="301"></td>
                                        <td class="tid tid-select tid-hour-02 tid-day-3" id="302"></td>
                                        <td class="tid tid-select tid-hour-03 tid-day-3" id="303"></td>
                                        <td class="tid tid-select tid-hour-04 tid-day-3" id="304"></td>
                                        <td class="tid tid-select tid-hour-05 tid-day-3" id="305"></td>
                                        <td class="tid tid-select tid-hour-06 tid-day-3" id="306"></td>
                                        <td class="tid tid-select tid-hour-07 tid-day-3" id="307"></td>
                                        <td class="tid tid-select tid-hour-08 tid-day-3" id="308"></td>
                                        <td class="tid tid-select tid-hour-09 tid-day-3" id="309"></td>
                                        <td class="tid tid-select tid-hour-10 tid-day-3" id="310"></td>
                                        <td class="tid tid-select tid-hour-11 tid-day-3" id="311"></td>
                                        <td class="tid tid-select tid-hour-12 tid-day-3" id="312"></td>
                                        <td class="tid tid-select tid-hour-13 tid-day-3" id="313"></td>
                                        <td class="tid tid-select tid-hour-14 tid-day-3" id="314"></td>
                                        <td class="tid tid-select tid-hour-15 tid-day-3" id="315"></td>
                                        <td class="tid tid-select tid-hour-16 tid-day-3" id="316"></td>
                                        <td class="tid tid-select tid-hour-17 tid-day-3" id="317"></td>
                                        <td class="tid tid-select tid-hour-18 tid-day-3" id="318"></td>
                                        <td class="tid tid-select tid-hour-19 tid-day-3" id="319"></td>
                                        <td class="tid tid-select tid-hour-20 tid-day-3" id="320"></td>
                                        <td class="tid tid-select tid-hour-21 tid-day-3" id="321"></td>
                                        <td class="tid tid-select tid-hour-22 tid-day-3" id="322"></td>
                                        <td class="tid tid-select tid-hour-23 tid-day-3" id="323"></td>
                                    </tr>
                                    <tr>
                                        <td class="tid-day" data-weekday="4">Thu</td>
                                        <td class="tid tid-select tid-hour-00 tid-day-4" id="400"></td>
                                        <td class="tid tid-select tid-hour-01 tid-day-4" id="401"></td>
                                        <td class="tid tid-select tid-hour-02 tid-day-4" id="402"></td>
                                        <td class="tid tid-select tid-hour-03 tid-day-4" id="403"></td>
                                        <td class="tid tid-select tid-hour-04 tid-day-4" id="404"></td>
                                        <td class="tid tid-select tid-hour-05 tid-day-4" id="405"></td>
                                        <td class="tid tid-select tid-hour-06 tid-day-4" id="406"></td>
                                        <td class="tid tid-select tid-hour-07 tid-day-4" id="407"></td>
                                        <td class="tid tid-select tid-hour-08 tid-day-4" id="408"></td>
                                        <td class="tid tid-select tid-hour-09 tid-day-4" id="409"></td>
                                        <td class="tid tid-select tid-hour-10 tid-day-4" id="410"></td>
                                        <td class="tid tid-select tid-hour-11 tid-day-4" id="411"></td>
                                        <td class="tid tid-select tid-hour-12 tid-day-4" id="412"></td>
                                        <td class="tid tid-select tid-hour-13 tid-day-4" id="413"></td>
                                        <td class="tid tid-select tid-hour-14 tid-day-4" id="414"></td>
                                        <td class="tid tid-select tid-hour-15 tid-day-4" id="415"></td>
                                        <td class="tid tid-select tid-hour-16 tid-day-4" id="416"></td>
                                        <td class="tid tid-select tid-hour-17 tid-day-4" id="417"></td>
                                        <td class="tid tid-select tid-hour-18 tid-day-4" id="418"></td>
                                        <td class="tid tid-select tid-hour-19 tid-day-4" id="419"></td>
                                        <td class="tid tid-select tid-hour-20 tid-day-4" id="420"></td>
                                        <td class="tid tid-select tid-hour-21 tid-day-4" id="421"></td>
                                        <td class="tid tid-select tid-hour-22 tid-day-4" id="422"></td>
                                        <td class="tid tid-select tid-hour-23 tid-day-4" id="423"></td>
                                    </tr>
                                    <tr>
                                        <td class="tid-day" data-weekday="5">Fri</td>
                                        <td class="tid tid-select tid-hour-00 tid-day-5" id="500"></td>
                                        <td class="tid tid-select tid-hour-01 tid-day-5" id="501"></td>
                                        <td class="tid tid-select tid-hour-02 tid-day-5" id="502"></td>
                                        <td class="tid tid-select tid-hour-03 tid-day-5" id="503"></td>
                                        <td class="tid tid-select tid-hour-04 tid-day-5" id="504"></td>
                                        <td class="tid tid-select tid-hour-05 tid-day-5" id="505"></td>
                                        <td class="tid tid-select tid-hour-06 tid-day-5" id="506"></td>
                                        <td class="tid tid-select tid-hour-07 tid-day-5" id="507"></td>
                                        <td class="tid tid-select tid-hour-08 tid-day-5" id="508"></td>
                                        <td class="tid tid-select tid-hour-09 tid-day-5" id="509"></td>
                                        <td class="tid tid-select tid-hour-10 tid-day-5" id="510"></td>
                                        <td class="tid tid-select tid-hour-11 tid-day-5" id="511"></td>
                                        <td class="tid tid-select tid-hour-12 tid-day-5" id="512"></td>
                                        <td class="tid tid-select tid-hour-13 tid-day-5" id="513"></td>
                                        <td class="tid tid-select tid-hour-14 tid-day-5" id="514"></td>
                                        <td class="tid tid-select tid-hour-15 tid-day-5" id="515"></td>
                                        <td class="tid tid-select tid-hour-16 tid-day-5" id="516"></td>
                                        <td class="tid tid-select tid-hour-17 tid-day-5" id="517"></td>
                                        <td class="tid tid-select tid-hour-18 tid-day-5" id="518"></td>
                                        <td class="tid tid-select tid-hour-19 tid-day-5" id="519"></td>
                                        <td class="tid tid-select tid-hour-20 tid-day-5" id="520"></td>
                                        <td class="tid tid-select tid-hour-21 tid-day-5" id="521"></td>
                                        <td class="tid tid-select tid-hour-22 tid-day-5" id="522"></td>
                                        <td class="tid tid-select tid-hour-23 tid-day-5" id="523"></td>
                                    </tr>
                                    <tr>
                                        <td class="tid-day" data-weekday="6">Sat</td>
                                        <td class="tid tid-select tid-hour-00 tid-day-6" id="600"></td>
                                        <td class="tid tid-select tid-hour-01 tid-day-6" id="601"></td>
                                        <td class="tid tid-select tid-hour-02 tid-day-6" id="602"></td>
                                        <td class="tid tid-select tid-hour-03 tid-day-6" id="603"></td>
                                        <td class="tid tid-select tid-hour-04 tid-day-6" id="604"></td>
                                        <td class="tid tid-select tid-hour-05 tid-day-6" id="605"></td>
                                        <td class="tid tid-select tid-hour-06 tid-day-6" id="606"></td>
                                        <td class="tid tid-select tid-hour-07 tid-day-6" id="607"></td>
                                        <td class="tid tid-select tid-hour-08 tid-day-6" id="608"></td>
                                        <td class="tid tid-select tid-hour-09 tid-day-6" id="609"></td>
                                        <td class="tid tid-select tid-hour-10 tid-day-6" id="610"></td>
                                        <td class="tid tid-select tid-hour-11 tid-day-6" id="611"></td>
                                        <td class="tid tid-select tid-hour-12 tid-day-6" id="612"></td>
                                        <td class="tid tid-select tid-hour-13 tid-day-6" id="613"></td>
                                        <td class="tid tid-select tid-hour-14 tid-day-6" id="614"></td>
                                        <td class="tid tid-select tid-hour-15 tid-day-6" id="615"></td>
                                        <td class="tid tid-select tid-hour-16 tid-day-6" id="616"></td>
                                        <td class="tid tid-select tid-hour-17 tid-day-6" id="617"></td>
                                        <td class="tid tid-select tid-hour-18 tid-day-6" id="618"></td>
                                        <td class="tid tid-select tid-hour-19 tid-day-6" id="619"></td>
                                        <td class="tid tid-select tid-hour-20 tid-day-6" id="620"></td>
                                        <td class="tid tid-select tid-hour-21 tid-day-6" id="621"></td>
                                        <td class="tid tid-select tid-hour-22 tid-day-6" id="622"></td>
                                        <td class="tid tid-select tid-hour-23 tid-day-6" id="623"></td>
                                    </tr>
                                    <tr>
                                        <td class="tid-day" data-weekday="0">Sun</td>
                                        <td class="tid tid-select tid-hour-00 tid-day-0" id="000"></td>
                                        <td class="tid tid-select tid-hour-01 tid-day-0" id="001"></td>
                                        <td class="tid tid-select tid-hour-02 tid-day-0" id="002"></td>
                                        <td class="tid tid-select tid-hour-03 tid-day-0" id="003"></td>
                                        <td class="tid tid-select tid-hour-04 tid-day-0" id="004"></td>
                                        <td class="tid tid-select tid-hour-05 tid-day-0" id="005"></td>
                                        <td class="tid tid-select tid-hour-06 tid-day-0" id="006"></td>
                                        <td class="tid tid-select tid-hour-07 tid-day-0" id="007"></td>
                                        <td class="tid tid-select tid-hour-08 tid-day-0" id="008"></td>
                                        <td class="tid tid-select tid-hour-09 tid-day-0" id="009"></td>
                                        <td class="tid tid-select tid-hour-10 tid-day-0" id="010"></td>
                                        <td class="tid tid-select tid-hour-11 tid-day-0" id="011"></td>
                                        <td class="tid tid-select tid-hour-12 tid-day-0" id="012"></td>
                                        <td class="tid tid-select tid-hour-13 tid-day-0" id="013"></td>
                                        <td class="tid tid-select tid-hour-14 tid-day-0" id="014"></td>
                                        <td class="tid tid-select tid-hour-15 tid-day-0" id="015"></td>
                                        <td class="tid tid-select tid-hour-16 tid-day-0" id="016"></td>
                                        <td class="tid tid-select tid-hour-17 tid-day-0" id="017"></td>
                                        <td class="tid tid-select tid-hour-18 tid-day-0" id="018"></td>
                                        <td class="tid tid-select tid-hour-19 tid-day-0" id="019"></td>
                                        <td class="tid tid-select tid-hour-20 tid-day-0" id="020"></td>
                                        <td class="tid tid-select tid-hour-21 tid-day-0" id="021"></td>
                                        <td class="tid tid-select tid-hour-22 tid-day-0" id="022"></td>
                                        <td class="tid tid-select tid-hour-23 tid-day-0" id="023"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <p class="help text-info">Leave empty to accept all hours and days</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box data-step hidden">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Re-Targeting</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-config">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                            </svg>
                        </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row data-step hidden" id="re-targeting">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="media mb-2">
                            <div class="media-body" style="background-color: antiquewhite">
                                <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                                    <ul>
                                        <li><strong>Audience</strong> helps you to show Ads again to visitors who visited your website earlier but did not complete conversions,
                                            or not to show Ads to visitors that completed conversions already (exclude mode)</li>
                                        <li><strong>Website/Zone IDs</strong> You can get them from Reports or from your own tracking system if you use
                                            <strong>{website_id}</strong> <strong>{zone_id}</strong> in your target URL</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small audience-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small audience-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">Audience</label>
                            <select id="audience" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Audience">
                                <?php foreach($this->data->audience as $item): ?>
                                <option value="<?=$item->id?>"><?=$item->name?></option>
                                <?php endforeach; ?>
                            </select>
                            <p class="help text-info">Leave empty to accept all audiences</p>
                        </div>
                        <div class="form-group mb-3">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small website-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small website-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">Website</label>
                            <input id="website" class="input form-control" type="text" data-type="tags" autocomplete="off" placeholder="Website ID" value="">
                            <p class="help text-info">Leave empty to accept all websites</p>
                        </div>
                        <div class="form-group mb-3">
                            <div class="buttons has-addons pull-right mode-toggle d-flex">
                                <button class="button is-small zone-toggle include-toggle is-selected">Include</button>
                                <button class="button is-small zone-toggle exclude-toggle">Exclude</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">Adzone</label>
                            <input id="zone" class="input form-control" type="text" data-type="tags" autocomplete="off" placeholder="Adzone ID" value="">
                            <p class="help text-info">Leave empty to accept all zones</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box data-step hidden">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Collect Audience</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-config">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                            </svg>
                        </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row data-step hidden" id="collect-audience">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="media mb-2">
                            <div class="media-body" style="background-color: antiquewhite">
                                <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                                    <strong>Why do you need audiences?</strong>
                                    <ul>
                                        <li>Collect users that are likely to convert (interested in your page or clicked your ad)</li>
                                        <li>Retarget users who completed conversion and make upsells (S2S required)</li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="control">
                                <div class="row is-multiline">
                                    <div class="col-12">
                                        <div class="flatbox mb-1 audience-collect is-selected" data-type="none"><p>Do not collect</p></div>
                                    </div>
                                    <div class="col-12">
                                        <div class="flatbox mb-1 audience-collect" data-type="click"><p>Collect users who clicked on this ad</p></div>
                                    </div>
                                    <div class="col-12">
                                        <div class="flatbox mb-1 audience-collect" data-type="engage"><p>Collect users who were interested in your landing page</p></div>
                                    </div>
                                    <div class="col-12">
                                        <div class="flatbox mb-1 audience-collect" data-type="conversion"><p>Collect users who completed conversion in this ad</p></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" id="collect-wrap" style="display:none">
                            <label class="label">Assign Audience <a id="new-audience">(or create new one)</a></label>

                            <select id="collect" class="input form-control" data-type="tags" autocomplete="off" data-placeholder="Choose Audience">
                                <?php foreach($this->data->audience as $item): ?>
                                <option value="<?=$item->id?>" data-duration="<?=($item->duration*86400)?>"><?=$item->name?></option>
                                <?php endforeach; ?>
                            </select>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box data-step hidden">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Create Ad</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-config">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                    </svg>
                                </span>
                        <span>Collapse</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row data-step hidden" id="create-ad">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="field">
                            <div class="control">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="flatbox create-ad" data-type="pause" style="box-shadow: 0 0 16px 3px rgba(128,128,128,0.13);">
                                            <p class="text-info" style="padding-left: 40px; padding-right: 40px; margin-bottom: 0;">
                                                <span class="icon">
                                                    <svg viewBox="0 0 24 24" >
                                                        <path fill="currentColor" d="M19.03 7.39L20.45 5.97C20 5.46 19.55 5 19.04 4.56L17.62 6C16.07 4.74 14.12 4 12 4C7.03 4 3 8.03 3 13S7.03 22 12 22C17 22 21 17.97 21 13C21 10.88 20.26 8.93 19.03 7.39M13 14H11V7H13V14M15 1H9V3H15V1Z"></path>
                                                    </svg>
                                                </span>
                                                Create Ad then pause after approval
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="flatbox create-ad is-selected" data-type="start" style="box-shadow: 0 0 16px 3px rgba(128,128,128,0.13);">
                                            <p class="text-success" style="padding-left: 40px; padding-right: 40px; margin-bottom: 0;">
                                                <span class="icon">
                                                    <svg viewBox="0 0 24 24">
                                                        <path fill="currentColor" d="M13.13 22.19L11.5 18.36C13.07 17.78 14.54 17 15.9 16.09L13.13 22.19M5.64 12.5L1.81 10.87L7.91 8.1C7 9.46 6.22 10.93 5.64 12.5M21.61 2.39C21.61 2.39 16.66 .269 11 5.93C8.81 8.12 7.5 10.53 6.65 12.64C6.37 13.39 6.56 14.21 7.11 14.77L9.24 16.89C9.79 17.45 10.61 17.63 11.36 17.35C13.5 16.53 15.88 15.19 18.07 13C23.73 7.34 21.61 2.39 21.61 2.39M14.54 9.46C13.76 8.68 13.76 7.41 14.54 6.63S16.59 5.85 17.37 6.63C18.14 7.41 18.15 8.68 17.37 9.46C16.59 10.24 15.32 10.24 14.54 9.46M8.88 16.53L7.47 15.12L8.88 16.53M6.24 22L9.88 18.36C9.54 18.27 9.21 18.12 8.91 17.91L4.83 22H6.24M2 22H3.41L8.18 17.24L6.76 15.83L2 20.59V22M2 19.17L6.09 15.09C5.88 14.79 5.73 14.47 5.64 14.12L2 17.76V19.17Z"></path>
                                                    </svg>
                                                </span>
                                                Create Ad then start after approval
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="buttons text-center" style="margin-top:2rem;">
                            <button class="btn btn-success" id="process">
                                <i class="fa fa-cogs"></i>
                                <span>Setup</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade text-left" id="helpModalBasic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><strong>CPM Pricing:</strong> Cost Per Mille - 1,000 ad impressions. This is the best option if you are trying to increase or improve your brand visibility.</li>
                        <li><strong>CPC Pricing:</strong> Cost Per Click - 1 ad click. This is recommended option when trying to drive traffic to your website and you know how much you are willing to pay.</li>
                        <li><strong>CPA Pricing:</strong> Cost Per Acquisition - only pays when an "conversion" is made. To use this option, setup conversion tracking on your app/website is required.</li>
                        <li><strong>Ad Name:</strong> Should be unique name so you can search and filter in reports.</li>
                        <li><strong>Target URL:</strong> Your website or landing page. Add some parameters for tracking & follow up.</li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-close">Got It</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="helpModalLimit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><strong>Budget Limitation:</strong> Ad level budget. You can set maximum spending each day by setting daily budget.</li>
                        <li><strong><span class="goal_type_label"></span> Limitation:</strong> How many <span class="goal_type_label"></span> you expect to get - total and daily.</li>
                        <li><strong>Budget Capping:</strong> Give you more controls on how your budget is used. Default is no capping</li>
                        <li><strong><span class="goal_type_label"></span> Capping:</strong> Maximum <span class="goal_type_label"></span> you will get per time frame. Default is no capping</li>
                        <li><strong>Default Bidding:</strong> Maximum dollas you willing to pay for <strong class="goal_type"></strong>. This can be overided by country bidding</li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-close">Got It</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="helpModalIPP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><strong>Title:</strong> Push notification title, maximum 30 characters.</li>
                        <li><strong>Description:</strong> a short description of your ad, max 40 characters.</li>
                        <li><strong>Image:</strong> Should be 192x192 px. To fit the container, smaller images will be upscaled, and larger images will be downscaled.
                            It is recommend to optimize your image before uploading for better ad serving, using services like <a href="https://tinypng.com/" target="_blank">TinyPng</a>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-close">Got It</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="helpModalVAST" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><strong>Custom Tracking:</strong> You can set your own urls for impressions and clicks tracking, eg to build your own realtime dashboard</li>
                        <li><strong>Video File:</strong> Must be .mp4 file, from 10s to 60s duration. We will not encode your file on our server,
                            so it must be already optimized for fast streaming. You can use tools like <a href="https://handbrake.fr/" target="_blank">Handbrake</a>
                            and <a href="https://www.ffmpeg.org/" target="_blank">FFmpeg</a></li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-close">Got It</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="helpModalNATIVE" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><strong>Creative Size:</strong> In pixels. Native Ad has title and description (publisher may choose to hide them) while others only has static image.</li>
                        <li><strong>Image:</strong> Should be the same size as picked creative size. It is recommend to optimize your image before uploading for better ad serving,
                            using services like <a href="https://tinypng.com/" target="_blank">TinyPng</a>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-close">Got It</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="helpModalDIALOG" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><strong>Image:</strong> Should be 480x320 px. Larger one will be downscaled to fit the container. It is recommend to optimize your image before uploading for better ad serving,
                            using services like <a href="https://tinypng.com/" target="_blank">TinyPng</a>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-close">Got It</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="countryBidModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">You are bidding for <strong class="goal_type"></strong> for traffic from <strong id="your_bid_countrycode"></strong> - <strong id="your_bid_country"></strong></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">$</span>
                        </div>
                        <input id="your_bid" class="input form-control" type="number" min="0" step="0.0001" placeholder="Your bidding" value="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="your_bid_submit">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="creativeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-body" style="padding:4px;background-color: #f5f5f5;">
                    <fieldset class="form-group position-relative has-icon-left">
                        <input class="input form-control" type="text" id="library_search" placeholder="Creative Name or Size">
                        <div class="form-control-position">
                            <i class="feather icon-search"></i>
                        </div>
                    </fieldset>
                    <div id="library_content"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="uploadModal">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Upload Creative</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="uploader-selector">
                        <input type="file" id="upload_file" class="hidden" />
                        <div class="" style="text-align: center">
                            <button class="button is-large is-light is-transparent open-selector" style="background: none; border: none">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor"
                                          d="M14,13V17H10V13H7L12,8L17,13M19.35,10.03C18.67,6.59 15.64,4 12,4C9.11,4 6.6,5.64 5.35,8.03C2.34,8.36 0,10.9 0,14A6,6 0 0,0 6,20H19A5,5 0 0,0 24,15C24,12.36 21.95,10.22 19.35,10.03Z"/>
                                </svg>
                            </button>

                            <h2 class="title is-4 text-center open-selector">Select file to upload</h2>
                            <h3 class="subtitle is-6 text-center">Or drag and drop here</h3>

                        </div>
                    </div>
                    <div id="uploader-process" style="display:none">
                        <div class="hero is-medium">
                            <div class="hero-body">
                                <h1 class="title is-6 text-center text-danger">Uploading Your File, please keep this page open.</h1>
                                <div><h2 class="title is-6" id="progress-name"></h2></div>
                                <h3 class="subtitle is-6" style="margin-bottom: 0.2rem;">
                                    <span class="progress-detail" id="progress-size"></span>
                                    <span class="progress-detail" id="progress-percent"></span>
                                    <span class="progress-detail" id="progress-time"></span>
                                </h3>
                                <progress id="progress" class="progress is-large btn-success" max="100"></progress>
                                <div id="progress-status"></div>
                                <div class="buttons" id="upload_control"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="createAudienceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="collect-type" value="none" />
                    <div class="form-group">
                        <label class="label">Audience Name</label>
                        <input id="audience-name" class="input form-control" type="text" placeholder="Unique Audience Name" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Audience Duration</label>
                        <div class="input-group">
                            <input id="audience-duration" class="input form-control" type="number" min="1" max="360" placeholder="Amount of time that a visitor remains in this audience" value="90">
                            <div class="input-group-append">
                                <span class="input-group-text">Days</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="create-audience">Create and Pick</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?=$this->asset('js/litepicker.js')?>"></script>
<script src="<?=$this->asset('js/tagsinput.min.js')?>"></script>
<script src="<?=$this->asset('js/tus.min.js')?>"></script>
<script src="<?=$this->asset('js/dnd.min.js')?>"></script>
<script>
    /* global $, Litepicker, __tajs, BulmaTagsInput */
    var picker = new Litepicker({
        element: document.getElementById('date-range'),
        singleMode: false,
        selectForward: true,
        format: 'YYYY-MM-DD',
        delimiter: ' => ',
        minDate: new Date(),
        minDays: 1,
        maxDays: 365,
        numberOfMonths: 2,
        numberOfColumns: 2,
        startDate: new Date(),
        endDate: '<?=date("Y-m-d", strtotime("+90 days"))?>'
    });
    var platforms = <?=json_encode($this->data->platforms)?>;
    var oses = <?=json_encode($this->data->oses)?>;
    var browsers = <?=json_encode($this->data->browsers)?>;
    var mapPlatformOs = <?=json_encode($this->data->mapPlatformOs)?>;
    var mapOsBrowser = <?=json_encode($this->data->mapOsBrowser)?>;
    var creatives = {image:null,video:null,current:'image'};
    var creative_search = null, uploader, country_bid = {};
    var current_url = null, current_creative = null;
    BulmaTagsInput.attach('[data-type="tags"]', {
        allowDuplicates: false,
        caseSensitive: false,
        clearSelectionOnTyping: false,
        closeDropdownOnItemSelect: true,
        delimiter: ',',
        freeInput: true,
        highlightDuplicate: true,
        highlightMatchesString: true,
        itemValue: undefined,
        itemText: undefined,
        maxTags: undefined,
        maxChars: undefined,
        minChars: 1,
        noResultsLabel: 'No results found',
        placeholder: '',
        removable: true,
        searchMinChars: 2,
        searchOn: 'text',
        selectable: false,
        source: undefined,
        tagClass: 'is-rounded btn-success',
        trim: true
    });
    var platform_tags = document.getElementById('platform').BulmaTagsInput(),
        os_tags = document.getElementById('os').BulmaTagsInput(),
        browser_tags = document.getElementById('browser').BulmaTagsInput(),
        collect_tags = document.getElementById('collect').BulmaTagsInput(),
        country_tags = document.getElementById('country').BulmaTagsInput(),
        bidding_tags = document.getElementById('country_bid').BulmaTagsInput(),
        website_tags = document.getElementById('website').BulmaTagsInput(),
        zone_tags = document.getElementById('zone').BulmaTagsInput(),
        audience_tags = document.getElementById('audience').BulmaTagsInput();
    platform_tags.on('after.add', function(data) {
        buildOsSelection();
    });
    platform_tags.on('after.remove', function(data) {
        buildOsSelection();
    });
    os_tags.on('after.add', function(data) {
        buildBrowserSelection();
    });
    os_tags.on('after.remove', function(data) {
        buildBrowserSelection();
    });
    collect_tags.flush();
    country_tags.on('after.add', function(data) {
        buildBiddingFromCountry();
    });
    country_tags.on('after.remove', function(data) {
        buildBiddingFromCountry();
    });
    bidding_tags.on('before.add', function(data) {
        if(data.value.indexOf(':') == -1) {
            $('#your_bid_country').html(data.text);
            $('#your_bid_countrycode').html(data.value);
            $('#your_bid').val(_parseFloat($('#bidding').val()));
            $('#countryBidModal').modal('show');
            setTimeout(function(){$('#your_bid').focus()},100);
            return false;
        }
        var bid = data.value.split(':');
        data.value = bid[0];
        bid = bid[1];
        if(country_bid[data.value]) return false;
        country_bid[data.value] = bid;
        Array.from(bidding_tags.dropdown.children).some(function(a){
            if(a.dataset.value==data.value) {
                a.remove();
                return true;
            }
        });
        return data;
    });
    bidding_tags.on('after.remove', function(data) {
        let text = $("#country option[value='"+data.value+"']").text();
        bidding_tags._createDropdownItem({text: text, value: data.value});
        delete country_bid[data.value];
    });
    function buildBiddingFromCountry() {
        bidding_tags.removeAll();
        bidding_tags._emptyDropdown();
        country_bid = {};
        var cv = country_tags.value;
        if(!cv.length) {
            $("#country option").each(function(){
                var $this = $(this);
                bidding_tags._createDropdownItem({text: $this.text(), value: $this.val()});
            });
            return true;
        }
        var isInclude = $('.country-toggle.is-selected').hasClass('include-toggle');
        $("#country option").each(function(){
            var $this = $(this), text = $this.text(), val = $this.val();
            if(isInclude) {
                if(cv.indexOf(val) != -1) {
                    bidding_tags._createDropdownItem({text: text, value: val});
                }
            } else {
                if(cv.indexOf($this.val()) == -1) {
                    bidding_tags._createDropdownItem({text: text, value: val});
                }
            }
        });
    }
    function buildOsSelection() {
        os_tags.removeAll();
        os_tags._emptyDropdown();
        let selected = platform_tags.value;
        let isInclude = $('.platform-toggle.is-selected').hasClass('include-toggle');
        if(!selected.length) {
            oses.forEach((item) => {
                os_tags._createDropdownItem({text: item.name, value: item.name});
            })
            buildBrowserSelection();
            return true;
        }
        let p_ids = [];
        platforms.forEach((item) => {
            if(isInclude) {
                if(selected.indexOf(item.name) > -1) p_ids.push(item.id)
            } else {
                if(selected.indexOf(item.name) == -1) p_ids.push(item.id)
            }
        })
        let o_ids = [];
        p_ids.forEach((id) => {
            mapPlatformOs.forEach((item) => {
                if(id == item.platform_id) o_ids.push(item.os_id)
            })
        })
        oses.forEach((item) => {
            if(o_ids.indexOf(item.id) > -1) {
                os_tags._createDropdownItem({text: item.name, value: item.name});
            }
        })
        buildBrowserSelection();
    }
    function buildBrowserSelection() {
        browser_tags.removeAll();
        browser_tags._emptyDropdown();
        let selected = os_tags.value;
        let isInclude = $('.os-toggle.is-selected').hasClass('include-toggle');
        let available = []
        Array.from(os_tags.dropdown.children).some(function(a){
            available.push(a.dataset.value)
        })
        let p_names = [];
        available.forEach((name) => {
            if(!selected.length) {
                p_names.push(name)
            } else {
                if(isInclude) {
                    if(selected.indexOf(name) > -1) p_names.push(name)
                } else {
                    if(selected.indexOf(name) == -1) p_names.push(name)
                }
            }
        })
        let p_ids = [];
        oses.forEach((item) => {
            if(p_names.indexOf(item.name) > -1) p_ids.push(item.id)
        })
        let o_ids = [];
        p_ids.forEach((id) => {
            mapOsBrowser.forEach((item) => {
                if(id == item.os_id) o_ids.push(item.browser_id)
            })
        })
        browsers.forEach((item) => {
            if(o_ids.indexOf(item.id) > -1) {
                browser_tags._createDropdownItem({text: item.name, value: item.name});
            }
        })
    }
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
    function buildPricing(model) {
        model = model.split(',');
        var html = '';
        for(var i = 0;i<model.length;i++) {
            html += '<div class="col-4">';
            html += '<div class="flatbox pricing';
            if(i==0) html += ' is-selected';
            html += '" data-model="'+model[i]+'"><p>'+model[i]+'</p></div>';
            html += '</div>';
        }
        $('#pricing_model').html(html);
        if(model[0] == 'cpc') {
            $('.goal_type_label').html('Click');
            $('.goal_type').html('1 Click');
        } else if(model[0] == 'cpa') {
            $('.goal_type_label').html('Conversion');
            $('.goal_type').html('1 Conversion');
        } else {
            $('.goal_type_label').html('Impression');
            $('.goal_type').html('1000 Impressions');
        }
    }
    function buildCreative(id) {
        if(id == 1) return buildCreativeIPP();
        if(id == 4) return buildCreativeNATIVE();
        if(id == 3) return buildCreativeVAST();
        if(id == 6) return buildCreativeDIALOG();
        $('#creative-create').html('');
        $('#ad-creative-title').hide();
        $('#ad-creative').hide();
        return false;
    }
    function buildCreativeIPP() {
        var html ='';

        html += '<div class="help-modal" data-target="helpModalIPP">';
        html += '<span class="icon"><svg viewBox="0 0 24 24" style="width: 20px;padding-bottom: 5px;">';
        html += '<path fill="currentColor" d="M15.07,11.25L14.17,12.17C13.45,12.89 13,13.5 13,15H11V14.5C11,13.39 11.45,12.39 12.17,11.67L13.41,10.41C13.78,10.05 14,9.55 14,9C14,7.89 13.1,7 12,7A2,2 0 0,0 10,9H8A4,4 0 0,1 12,5A4,4 0 0,1 16,9C16,9.88 15.64,10.67 15.07,11.25M13,19H11V17H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />';
        html += '</svg></span></div>';

        html += '<div class="form-group">';
        html += '<label class="label">Ad Title</label>';
        html += '<input class="input form-control ad_content_create" type="text" id="ad_title" placeholder="Ad title">';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Ad Description</label>';
        html += '<textarea class="textarea form-control ad_content_create" id="ad_description" rows="5" placeholder="Ad description"></textarea>';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Image</label></div>';
        html += '<div class="buttons" id="creative-file-form">';
        html += '<button class="btn btn-primary mb-1 mr-1" id="upload" data-type="image">';
        html += '<i class="feather icon-upload"></i> ';
        html += '<span> From your device</span></button>';
        html += '<button class="btn btn-success mb-1" id="library" data-type="image">';
        html += '<i class="feather icon-image"></i> ';
        html += '<span> From your creative library</span></button>';
        html += '</div><div id="creative-file-wrap"></div>';

        $('#creative-create').html(html);
        $('#ad-creative-title').show();
        $('#ad-creative').attr('style','');
        $(document).on('input', '#ad_title, #ad_description', function(){
            generatePreviewIPP();
        });
    }
    function buildCreativeNATIVE() {
        var html ='';

        html += '<div class="help-modal" data-target="helpModalNATIVE">';
        html += '<span class="icon"><svg viewBox="0 0 24 24" style="width: 20px;padding-bottom: 5px;">';
        html += '<path fill="currentColor" d="M15.07,11.25L14.17,12.17C13.45,12.89 13,13.5 13,15H11V14.5C11,13.39 11.45,12.39 12.17,11.67L13.41,10.41C13.78,10.05 14,9.55 14,9C14,7.89 13.1,7 12,7A2,2 0 0,0 10,9H8A4,4 0 0,1 12,5A4,4 0 0,1 16,9C16,9.88 15.64,10.67 15.07,11.25M13,19H11V17H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />';
        html += '</svg></span></div>';

        html += '<div class="form-group">';
        html += '<label class="label">Creative Size</label>';

        html += '<select class="ad_content_create form-control" id="ad_size">';
        html += '<option value="300x300">Native Ad 300x300</option>';
        html += '<option value="728x90">Leaderboard 728x90</option>';
        html += '<option value="300x250">Rectangle 300x250</option>';
        html += '<option value="300x100">Rectangle 300x100</option>';
        html += '<option value="160x600">Skyscraper 160x600</option>';
        html += '<option value="900x250">Banner 900x250</option>';
        html += '</select></div>';


        html += '<div class="form-group">';
        html += '<label class="label">Ad Title</label>';
        html += '<input class="input form-control ad_content_create" type="text" id="ad_title" placeholder="Ad title" value="">';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Ad Description</label>';
        html += '<textarea class="textarea form-control ad_content_create" id="ad_description" placeholder="Ad description" rows="5" value=""></textarea>';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Image</label></div>';
        html += '<div class="buttons" id="creative-file-form">';
        html += '<button class="btn btn-primary mb-1 mr-1" id="upload" data-type="image">';
        html += '<i class="feather icon-upload"></i> ';
        html += '<span> From your device</span></button>';
        html += '<button class="btn btn-success mb-1" id="library" data-type="image">';
        html += '<i class="feather icon-image"></i> ';
        html += '<span> From your creative library</span></button>';
        html += '</div><div id="creative-file-wrap"></div>';

        $('#creative-create').html(html);
        $('#ad-creative-title').show();
        $('#ad-creative').attr('style','');
        $(document).on('input', '#ad_title, #ad_description', function(){
            generatePreviewNATIVE();
        });
        $(document).on('change', '#size', function(){
            if($(this).val() == '300x300') {
                $('#ad_title, #ad_description').prop('disabled', false);
            } else {
                $('#ad_title').val('');
                $('#ad_description').val('');
                $('#ad_title, #ad_description').prop('disabled', true);
            }
            generatePreviewNATIVE();
        });
    }
    function buildCreativeVAST() {
        var html ='';

        html += '<div class="help-modal" data-target="helpModalVAST">';
        html += '<span class="icon"><svg viewBox="0 0 24 24" style="width: 20px;padding-bottom: 5px;">';
        html += '<path fill="currentColor" d="M15.07,11.25L14.17,12.17C13.45,12.89 13,13.5 13,15H11V14.5C11,13.39 11.45,12.39 12.17,11.67L13.41,10.41C13.78,10.05 14,9.55 14,9C14,7.89 13.1,7 12,7A2,2 0 0,0 10,9H8A4,4 0 0,1 12,5A4,4 0 0,1 16,9C16,9.88 15.64,10.67 15.07,11.25M13,19H11V17H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />';
        html += '</svg></span></div>';

        html += '<div class="form-group">';
        html += '<label class="label">Impression Tracking</label>';
        html += '<input class="input form-control ad_content_create" type="text" id="track_impression" placeholder="Impression Tracking Url">';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Click Tracking</label>';
        html += '<input class="input form-control ad_content_create" type="text" id="track_click" placeholder="Click Tracking Url">';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Video</label></div>';
        html += '<div class="buttons" id="creative-file-form">';
        html += '<button class="btn btn-primary mb-1 mr-1" id="upload" data-type="video">';
        html += '<i class="feather icon-upload"></i> ';
        html += '<span> From your device</span></button>';
        html += '<button class="btn btn-success mb-1" id="library" data-type="video">';
        html += '<i class="feather icon-image"></i> ';
        html += '<span> From your creative library</span></button>';
        html += '</div><div id="creative-file-wrap"></div>';

        $('#creative-create').html(html);
        $('#ad-creative-title').show();
        $('#ad-creative').attr('style','');
    }
    function buildCreativeDIALOG() {
        var html ='';

        html += '<div class="help-modal" data-target="helpModalDIALOG">';
        html += '<span class="icon"><svg viewBox="0 0 24 24" style="width: 20px;padding-bottom: 5px;">';
        html += '<path fill="currentColor" d="M15.07,11.25L14.17,12.17C13.45,12.89 13,13.5 13,15H11V14.5C11,13.39 11.45,12.39 12.17,11.67L13.41,10.41C13.78,10.05 14,9.55 14,9C14,7.89 13.1,7 12,7A2,2 0 0,0 10,9H8A4,4 0 0,1 12,5A4,4 0 0,1 16,9C16,9.88 15.64,10.67 15.07,11.25M13,19H11V17H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />';
        html += '</svg></span></div>';

        html += '<div class="form-group">';
        html += '<label class="label">Title</label>';
        html += '<input class="input form-control ad_content_create" type="text" id="ad_title" placeholder="Ad title">';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Description</label>';
        html += '<textarea class="textarea form-control ad_content_create" id="ad_description" placeholder="Ad description"></textarea>';
        html += '</div>';

        html += '<div class="form-group">';
        html += '<label class="label">Image</label></div>';
        html += '<div class="buttons" id="creative-file-form">';
        html += '<button class="btn btn-primary mb-1 mr-1" id="upload" data-type="image">';
        html += '<i class="feather icon-upload"></i> ';
        html += '<span> From your device</span></button>';
        html += '<button class="btn btn-success mb-1" id="library" data-type="image">';
        html += '<i class="feather icon-image"></i>';
        html += '<span> From your creative library</span></button>';
        html += '</div><div id="creative-file-wrap"></div>';

        $('#creative-create').html(html);
        $('#ad-creative-title').show();
        $('#ad-creative').attr('style','');
        $(document).on('input', '#ad_title, #ad_description', function(){
            generatePreviewDIALOG();
        });
    }
    function getCreativeLib() {
        if(creatives[creatives.current]) {
            buildCreativeLib();
            return false;
        }
        $('#library_search').prop('disabled', true);
        $('#library_content').html('<div class="hero is-medium"><div class="hero-body"><p class="text-center text-info">Loading...</p></div></div>');
        $.post('/creative', {csrf_token: __tajs.csrf, type: creatives.current}, function(res){
            if(!res.success) {
                $('#library_content').html('<div class="hero is-medium"><div class="hero-body"><p class="text-center text-danger">Something was wrong, please try again later</p></div></div>');
                return false;
            }
            $('#library_search').prop('disabled', false);
            if(!res.data || !res.data.length) {
                $('#library_content').html('<div class="hero is-medium"><div class="hero-body"><p class="text-center text-info">No creatives found!</p></div></div>');
                return false;
            }
            if(!creatives[creatives.current]) creatives[creatives.current] = res.data;
            buildCreativeLib();
        });
    }
    function buildCreativeLib() {
        var html = '<div class="row is-multiline">';
        html += '<div class="col-12">';
        html += '<table>';
        for(var i = 0;i<creatives[creatives.current].length;i++) {
            html += '<div class="col-12 lib-item-wrap">';
            html += '<div class="row is-mobile lib-item" data-id="'+creatives[creatives.current][i].id+'">';
            html += '<div class="col-7 lib-thumb" style="background-image: url('+creatives[creatives.current][i].thumb+');"></div>';
            html += '<div class="col-5">';
            html += '<div class="row is-multiline">';
            html += '<div class="col-12 lib-name">'+creatives[creatives.current][i].name+'</div>';
            html += '<div class="col-12"><a href="'+creatives[creatives.current][i].url+'" target="_blank">View Original</a></div>';
            html += '<div class="col-12 lib-size">'+creatives[creatives.current][i].size+'</div>';
            html += '<div class="col-12 lib-date">'+creatives[creatives.current][i].created_at+'</div>';
            html += '</div></div></div></div>';
        }
        html += '<div class="col-12 hero is-medium lib-noitem hidden"><div class="hero-body"><p class="text-center text-info">No creatives found!</p></div></div>';
        html += '</table>';
        html += '</div>';
        html += '</div>';

        $('#library_content').html(html);
        $('#library_search').val('');
    }
    function searchCreativeLib() {
        if(!creatives[creatives.current]) return false;
        var key = $('#library_search').val() || false;
        if(key && key.length < 2) key = false;
        var items = $('.lib-item-wrap'), noitems = $('.lib-noitem'), shown = 0;
        if(!key) {
            items.removeClass('hidden');
            noitems.addClass('hidden');
            return true;
        }
        items.each(function(){
            var $this = $(this), name = $this.find('.lib-name').text(), size = $this.find('.lib-size').text();
            if(name.indexOf(key) > -1 || size.indexOf(key) > -1) {
                $this.removeClass('hidden');
                shown++;
            } else {
                $this.addClass('hidden');
            }
        });
        if(shown) {
            noitems.addClass('hidden');
        } else {
            noitems.removeClass('hidden');
        }
    }
    function pickCreative(id, name, url) {
        var html = '';
        html += '<div class="input-group">';
        html += '<div class="input-group-prepend">';
        html += '<button class="btn btn-primary waves-effect waves-light" type="button" id="creative-id" data-id="'+id+'">';
        html += '<i class="feather icon-check-square">';
        html += '</i></button></div>';
        html += '<input type="text" class="form-control" value="'+name+'" readonly />';
        html += '<div class="input-group-append">';
        html += '<a class="btn btn-info waves-effect waves-light" type="button" id="creative-url" href="'+url+'" target="_blank"><i class="feather icon-eye"></i> View</a>';
        html += '<button class="btn btn-warning waves-effect waves-light" type="button" id="creative-repick"><i class="feather icon-x"></i> Clear</button>';
        html += '</div></div>';

        $('#creative-file-wrap').html(html);
        $('#creative-file-form').addClass('hidden');
        generatePreview($('.adFormat.is-selected').attr('data-id'));
    }
    function generatePreview(code) {
        if(code == 1) return generatePreviewIPP();
        if(code == 4) return generatePreviewNATIVE();
        if(code == 3) return generatePreviewVAST();
        if(code == 6) return generatePreviewDIALOG();
        $('#creative-preview').html('');
        return false;
    }
    function generatePreviewIPP() {
        var title = $.trim($('#ad_title').val()) || 'this is ad title';
        var description = $.trim($('#ad_description').val()) || 'this is ad description';
        var creative_url = $('#creative-url').length ? $('#creative-url').attr('href') : '<?=ASSET_URL?>/preview/ipp.png';
        if(!$('#preview-ipp').length) {
            var html = '<style>.preview-animated{transform:translate(0) !important;transition:transform 1s ease;}</style>';
            html += '<div id="preview-ipp" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
            html += '<div style="width:100%;height:25px;display:flex;align-items:center;justify-content:flex-start;background-color:#fafafa;border-radius:10px 10px 0 0;">';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#f14668;"></div>';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#ffdd57;"></div>';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#48c774;"></div>';
            html += '</div>';
            html += '<div style="position:relative;width:100%;min-height:200px;">';
            html += '<div id="preview-item" class="preview-animated" style="position:absolute;display:flex;justify-content:flex-start;width:310px;height:60px;background:#fff;box-shadow:0 3px 3px rgba(0,0,0,.25);border-radius:6px;padding:10px;top:18px;right:14px;transform:translate(3700px);">';
            html += '<div style="margin-right:12px;"><img id="preview-image" width="40" height="40" src="'+creative_url+'"></div>';
            html += '<div style="display:flex;flex-direction:column;justify-content:center;">';
            html += '<div id="preview-title" style="max-width:230px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;margin-bottom:4px;font-weight:500;font-size:12px;">'+title+'</div>';
            html += '<div id="preview-description" style="max-width:230px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-size:11px;">'+description+'</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            $('#creative-preview').html(html);
            if(window.timers) clearInterval(window.timers);
            window.timers = setInterval(function(){
                $('#preview-item').removeClass('preview-animated');
                setTimeout(function(){$('#preview-item').addClass('preview-animated');},500)
            }, 5000);
        } else {
            $('#preview-title').html(title);
            $('#preview-description').html(description);
            $('#preview-image').attr('src', creative_url);
        }
    }
    function generatePreviewNATIVE() {
        var size = $('#size').val();
        var title = $.trim($('#ad_title').val()) || 'this is ad title';
        var description = $.trim($('#ad_description').val()) || 'this is ad description';
        var creative_url = $('#creative-url').length ? $('#creative-url').attr('href') : '<?=ASSET_URL?>/preview/ipp.png';
        if(size == '300x300') {
            if(!$('#preview-native').length) {
                var html = '<div id="preview-native" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
                html += '<div style="width:100%;height:25px;display:flex;align-items:center;justify-content:flex-start;background-color:#fafafa;border-radius:10px 10px 0 0;">';
                html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#f14668;"></div>';
                html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#ffdd57;"></div>';
                html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#48c774;"></div>';
                html += '</div>';
                html += '<div class="columns is-gapless is-mobile mt-5">';
                html += '<div class="column is-4"><div style="padding:.1rem">';
                html += '<img src="<?=ASSET_URL?>/preview/ipp.png" style="width:100%;height:200px;">';
                html += '<div style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:600;font-size:1.05rem;color:#b5b5b5;text-shadow:0 0 black;padding-right:.5rem;">website content title</div>';
                html += '<div style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400;font-size:.80rem;color:#b5b5b5;padding-right:.5rem">website content description</div>';
                html += '</div></div>';
                html += '<div class="column is-4"><div style="padding:.1rem">';
                html += '<img id="preview-image" src="'+creative_url+'" style="width:100%;height:200px;">';
                html += '<div id="preview-title" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:600;font-size:1.05rem;color:#b5b5b5;text-shadow:0 0 black;padding-right:.5rem">'+title+'</div>';
                html += '<div id="preview-description" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400;font-size:.80rem;color:#b5b5b5;padding-right:.5rem">'+description+'</div>';
                html += '</div></div>';
                html += '<div class="column is-4"><div style="padding:.1rem">';
                html += '<img src="<?=ASSET_URL?>/preview/ipp.png" style="width:100%;height:200px;">';
                html += '<div style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:600;font-size:1.05rem;color:#b5b5b5;text-shadow:0 0 black;">website content title</div>';
                html += '<div style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400;font-size:.80rem;color:#b5b5b5;">website content description</div>';
                html += '</div></div></div></div>';
                $('#creative-preview').html(html);
            } else {
                $('#preview-title').html(title);
                $('#preview-description').html(description);
                $('#preview-image').attr('src', creative_url);
            }
        } else {
            if(!$('#preview-classic').length) {
                var html = '<div id="preview-classic" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
                html += '<div style="width:100%;height:25px;display:flex;align-items:center;justify-content:flex-start;background-color:#fafafa;border-radius:10px 10px 0 0;">';
                html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#f14668;"></div>';
                html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#ffdd57;"></div>';
                html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#48c774;"></div>';
                html += '</div>';
                html += '<div style="background-image:url(<?=ASSET_URL?>/preview/banner.jpg);background-size:contain;width:100%;min-height:330px;background-repeat:no-repeat;"></div>';
                html += '</div>';
                $('#creative-preview').html(html);
            }
        }
        if(window.timers) clearInterval(window.timers);
    }
    function generatePreviewVAST() {
        var creative_url = $('#creative-url').length ? $('#creative-url').attr('href') : 'https://content.jwplatform.com/videos/AEhg3fFb-bPwArWA4.mp4';
        var playerSettings = {
            "file": "//content.jwplatform.com/videos/1g8jjku3-cIp6U8lV.mp4",
            "image": "//content.jwplatform.com/thumbs/1g8jjku3-720.jpg",
            "autostart": false,
            "displayPlaybackLabel": true,
            "primary": "html5",
            "advertising": {
                "schedule": [{
                    "vastxml": '<VAST version="2.0"><Ad id="preroll"><InLine><Creatives><Creative><Linear><MediaFiles><MediaFile height="396" width="600" bitrate="0" type="video/mp4" delivery="progressive"><![CDATA['+creative_url+']]></MediaFile></MediaFiles></Linear></Creative></Creatives></InLine></Ad></VAST>',
                    "offset": "pre"
                }],
                "client": "vast"
            }
        };
        if(!$('#preview-vast').length) {
            var html = '<div id="preview-vast" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
            html += '<div style="width:100%;height:25px;display:flex;align-items:center;justify-content:flex-start;background-color:#fafafa;border-radius:10px 10px 0 0;">';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#f14668;"></div>';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#ffdd57;"></div>';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#48c774;"></div>';
            html += '</div>';
            html += '<div style="width:100%;display:flex;flex-direction:column;align-items:center;justify-content:center;">';
            html += '<div id="preview-player"></div>';
            html += '</div>';
            html += '</div>';
            $('#creative-preview').html(html);
            if(window.timers) clearInterval(window.timers);
        }
        try {
            jwplayer().remove();
            jwplayer('preview-player').setup(playerSettings);
        }catch(e) {
            $.getScript('https://cdn.jwplayer.com/libraries/qWykpG2x.js', function(){
                jwplayer('preview-player').setup(playerSettings);
            });
        }
    }
    function generatePreviewDIALOG() {
        var title = $.trim($('#ad_title').val()) || 'this is ad title';
        var description = $.trim($('#ad_description').val()) || 'this is ad description';
        var creative_url = $('#creative-url').length ? $('#creative-url').attr('href') : '<?=ASSET_URL?>/preview/ipp.png';
        if(!$('#preview-dialog').length) {
            var html = '<style>.preview-animated{transform:translate(0,.5rem) !important;}</style>';
            html += '<div id="preview-dialog" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
            html += '<div style="width:100%;height:25px;display:flex;align-items:center;justify-content:flex-start;background-color:#fafafa;border-radius:10px 10px 0 0;">';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#f14668;"></div>';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#ffdd57;"></div>';
            html += '<div style="width:9px;height:9px;margin-left:8px;border-radius:50%;background-color:#48c774;"></div>';
            html += '</div>';
            html += '<div style="width:100%;min-height:200px;display:flex;flex-direction:column;align-items:center;justify-content:center;">';
            html += '<div style="width:100%;height:40px;padding-right:20px;display:flex;align-items:center;justify-content:flex-end;"><span class="icon"><svg viewBox="0 0 24 24">';
            html += '<path fill="#afa6a6" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>';
            html += '</svg></span></div>';
            html += '<div style="display:flex;justify-content:center;padding:10px;">';
            html += '<div style="position:relative;width:calc(100% - 40px);max-width:400px;max-height:400px;display:flex;justify-content:center;">';
            html += '<img id="preview-image" src="'+creative_url+'">';
            html += '<div style="position:absolute;width:100%;padding:.3rem .5rem 1rem;background:linear-gradient(0deg, transparent, rgba(0, 0, 0, .7));">';
            html += '<div id="preview-title" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:600;font-size:1.25rem;color:#fff;">'+title+'</div>';
            html += '<div id="preview-description" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400;font-size:.95rem;color:#fff;">'+description+'</div>';
            html += '</div>';
            html += '<div style="position:absolute;width:100%;bottom:0;padding:1rem .7rem;background:linear-gradient(180deg, transparent, rgba(0, 0, 0, .7));">';
            html += '<div id="preview-item" class="preview-animated" style="transition:transform 2.2s ease;transform:translate(0);text-transform:uppercase;background-color:#00a980;color:#fff;font-size:1.3rem;font-weight:500;padding:.3rem 0;text-align:center;border-radius:.3rem;box-shadow:0 1rem 1rem rgba(0, 0, 0, .15);background-size:1px 1px;background-position:50%;background:linear-gradient(0deg, #008b24, #44f75b);text-shadow:0 1px 1px rgba(0, 0, 0, .3);">Continue</div>'
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            $('#creative-preview').html(html);
            if(window.timers) clearInterval(window.timers);
            window.timers = setInterval(function(){
                $('#preview-item').toggleClass('preview-animated');
            }, 2000);
        } else {
            $('#preview-title').html(title);
            $('#preview-description').html(description);
            $('#preview-image').attr('src', creative_url);
        }
    }
    function processFile(file) {
        var fileSize = sizeFormat(file.size), minSizeLimit = 1024, maxSizeLimit = 20*1024*1024, extensions = {image:'jpg,jpeg,png',video:'mp4'};
        var file_extension = $.trim(file.name.split('.').pop().toLowerCase()), allow_extensions = extensions[creatives.current].split(',');
        if($.inArray(file_extension, allow_extensions) == -1) {
            __tajs.showAlert('Not a valid '+creatives.current+' file, upload rejected');
            return false;
        }
        if(maxSizeLimit < file.size) {
            __tajs.showAlert('This file is too big, should be less than '+sizeFormat(maxSizeLimit)+', upload rejected');
            return false;
        }
        if(minSizeLimit > file.size) {
            __tajs.showAlert('This file is too small, should be from '+sizeFormat(minSizeLimit)+', upload rejected');
            return false;
        }
        if(creatives.current == 'image') {
            var f = new FileReader();
            f.onload = function (e) {
                var img = new Image();
                img.src = e.target.result;
                img.onload = function () {
                    fileSize = this.width+'x'+this.height;
                }
            };
            f.readAsDataURL(file);
        }
        var options = {
            resume  : true,
            removeFingerprintOnSuccess: true,
            chunkSize: 3*1024*1024,
            retryDelays: [0, 1000, 3000, 5000],
            onError: function(e){
                $('#progress-status').html('<span class="text-danger">'+e+'</span>');
                if(e.originalRequest) {
                    $('#upload_control').html('<button class="btn btn-info mr-1 mb-1 waves-effect waves-light upload_control" data-action="retry">Retry</button><button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                } else {
                    $('#upload_control').html('<button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                }
            },
            onProgress: function(uploadedBytes, totalBytes){
                var ps = ((uploadedBytes/totalBytes)*100).toFixed(2),
                    seconds = (((new Date()) - uploader.startedAt)/1000),
                    speed = (uploadedBytes/seconds).toFixed(2),
                    time = Math.floor((totalBytes - uploadedBytes)/speed);
                $('#progress').attr('value', ps);
                $('#progress-percent').html(ps+'% uploaded');
                $('#progress-time').html(timeFormat(time)+' remaining');
                $('#progress-status').html('Uploading '+sizeFormat(uploadedBytes)+'/'+sizeFormat(totalBytes)+' . Speed '+sizeFormat(speed*8)+'bps');
            },
            onSuccess: function(){
                $('#progress-percent').html('0% processed');
                $('#progress-time').html('Calculating time...');
                $('#progress-status').html('<span class="text-info">Adding file to your Creative Library...</span>');
                $('#upload_control').html('');
                createCreative(uploader.url, file.name, fileSize);
            }
        };
        $('#progress-name').html(file.name);
        $('#progress-size').html(sizeFormat(file.size));
        $('#progress-percent').html('0% uploaded');
        $('#progress-time').html('Calculating time...');
        $('#progress-status').html('<span>Validating...</span>');
        $('#upload_control').html('<button class="btn btn-warning mr-1 mb-1 waves-effect waves-light upload_control" data-action="pause">Pause</button><button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
        $.post('/creative/upload', {csrf_token: __tajs.csrf, name: file.name}, function(res){
            if(!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            options.endpoint = res.data.endpoint;
            options.metadata = res.data.metadata;
            $('#uploader-selector').hide();
            $('#uploader-process').show();
            uploader = new tus.Upload(file, options);
            uploader.startedAt = new Date();
            uploader.start();
        });
    }
    function createCreative(url, name, size) {
        $.post('/creative/create', {csrf_token: __tajs.csrf, type: creatives.current, url: url, name: name, size: size}, function(res){
            if(!res.success) {
                $('#progress-status').html('<span class="text-danger">'+res.data+'</span>');
                $('#upload_control').html('<button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                return false;
            }
            pickCreative(res.data.id, size+' '+name, res.data.url);
            if(creatives[creatives.current]) {
                creatives[creatives.current].unshift({id: res.data.id, name: name, size: size, url: res.data.url, thumb: res.data.thumb, created_at: res.data.created_at});
            }
            $('#uploadModal').modal('hide');
            $('#uploader-selector').show();
            $('#uploader-process').hide();
        });
    }
    function buildTargetUrl() {
        var url = $.trim($('#url').val());
        if(!url) url = 'https://your-landing-page.com';
        if(url.indexOf('?') < 0) url += '?';
        $('.url-param').each(function(){
            var $this = $(this), param = $this.text().replace('{','').replace('}','');
            if(!$this.hasClass('hidden')) {
                if($this.hasClass('btn-success')) {
                    if(url.indexOf(param+'={'+param+'}') < 0) {
                        url += '&'+param+'={'+param+'}';
                    }
                } else {
                    url = url.replace(param+'={'+param+'}','');
                }
            }
        });
        url = url.replace(/&&+/g, '&').replace('?&','?').replace(/&$/, '');
        $('#url').val(url);
    }
    function sizeFormat(bytes) {
        if(parseInt(bytes,10) == 0) return '0 Byte';
        var i = Math.floor( Math.log(bytes) / Math.log(1024) );
        return ( bytes / Math.pow(1024, i) ).toFixed(2) * 1 + ['B', 'K', 'M', 'G', 'T'][i];
    }
    function timeFormat(seconds) {
        var hours = Math.floor(seconds / 3600), minutes;
        seconds %= 3600;
        minutes = Math.floor(seconds / 60), seconds = seconds % 60;
        return ('0'+hours).slice(-2)+':'+('0'+minutes).slice(-2)+':'+('0'+seconds).slice(-2);
    }
    function initUploader() {
        if(!tus.isSupported || !tus.canStoreURLs) {
            var html = '<div class="hero is-medium">';
            html += '<div class="hero-body"><div class="container text-center">';
            html += '<h1 class="title is-1">UnSupported</h1>';
            html += '<h2 class="subtitle is-6">Your browser is too old, please upgrade to newer, recommend latest chrome, firefox...</h2>';
            html += '</div></div></div>';
            $('#uploader-selector').html(html);
            return false;
        }
        new DragAndDrop({
            dropZoneElement: document.getElementById('uploader-selector'),
            classes: {
                dropActive: "dropactive"
            },
            callbacks: {
                processingDroppedFilesComplete: function(files, dropTarget) {
                    processFile(files[0]);
                }
            }
        });
    }
    function _parseFloat(e) {
        let number = parseFloat(e);
        if(number<0){
            number = -number;
        }
        return number || 0;
    }
    function _parseInt(e) {
        let number = parseInt(e,10);
        if(number<0){
            number = -number;
        }
        return number || 0;
    }
    function initData() {
        <?php if($this->data->data): ?>
        var data = <?=$this->data->data?>;
        buildPricing('<?=$this->data->pricing_model?>');
        buildCreative('<?=$this->data->ad_format?>');
        $('#name').val('<?=$this->data->name?>');
        for (const i in data.content) {
            $('#'+i).val(data.content[i]);
        }
        current_url = data.content.url;
        $('.url-param').each(function(){
            var $this = $(this), param = $.trim($this.text());
            if(data.content.url.indexOf(param) > -1) $this.addClass('btn-success');
        });
        $('#budget').val('<?=$this->data->budget?>');
        $('#budget').prop('disabled', true);
        $('#budget_daily').val(data.budget_daily);
        $('#goal_total').val(data.goal_total);
        $('#goal_daily').val(data.goal_daily);
        if(data.budget_capping) {
            if(data.budget_capping.indexOf('m') > -1) {
                $('#budget_capping_timetype').val('m');
            } else {
                $('#budget_capping_timetype').val('h');
            }
            var budget_capping = data.budget_capping.split(':');
            $('#budget_capping_number').val(_parseFloat(budget_capping[0]));
            $('#budget_capping_time').val(_parseInt(budget_capping[1]));
        } else {
            $('#budget_capping_timetype').val('h');
            $('#budget_capping_number').val('');
            $('#budget_capping_time').val('');
        }
        if(data.goal_capping) {
            if(data.goal_capping.indexOf('m') > -1) {
                $('#goal_capping_timetype').val('m');
            } else {
                $('#goal_capping_timetype').val('h');
            }
            var goal_capping = data.goal_capping.split(':');
            $('#goal_capping_number').val(_parseInt(goal_capping[0]));
            $('#goal_capping_time').val(_parseInt(goal_capping[1]));
        } else {
            $('#goal_capping_timetype').val('h');
            $('#goal_capping_number').val('');
            $('#goal_capping_time').val('');
        }

        $('#bidding').val(data.bidding.default??'');
        $('#optimization').val(data.optimization);
        <?php if(isset($this->data->creative)): ?>
        current_creative = <?=$this->data->creative->id?>;
        pickCreative(current_creative, '<?=$this->data->creative->size?> <?=$this->data->creative->name?>', '<?=$this->data->creative->url?>');
        <?php endif; ?>
        generatePreview('<?=$this->data->ad_format?>');

        var selected, arr;
        picker.setDateRange('<?=$this->data->start_date?>', '<?=$this->data->end_date?>');
        $('.country-toggle').removeClass('is-selected');
        if(data.country_include !== undefined) {
            $('.country-toggle.include-toggle').addClass('is-selected');
            selected = data.country_include;
        } else {
            $('.country-toggle.exclude-toggle').addClass('is-selected');
            selected = data.country_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: $('#country option[value="'+selected[i]+'"]').text(), value: selected[i]});
            }
            if(arr.length) country_tags.add(arr);
        }
        arr = [];
        for(var i in data.bidding) {
            if (i != 'default') {
                var b = data.bidding[i];
                arr.push({text: $('#country option[value="'+i+'"]').text()+': $'+b, value: i+':'+b});
            }
        }
        if(arr.length) bidding_tags.add(arr);
        $('.browser-toggle').removeClass('is-selected');
        if(data.browser_include !== undefined) {
            $('.browser-toggle.include-toggle').addClass('is-selected');
            selected = data.browser_include;
        } else {
            $('.browser-toggle.exclude-toggle').addClass('is-selected');
            selected = data.browser_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: $('#browser option[value="'+selected[i]+'"]').text(), value: selected[i]});
            }
            if(arr.length) browser_tags.add(arr);
        }
        $('.platform-toggle').removeClass('is-selected');
        if(data.platform_include !== undefined) {
            $('.platform-toggle.include-toggle').addClass('is-selected');
            selected = data.platform_include;
        } else {
            $('.platform-toggle.exclude-toggle').addClass('is-selected');
            selected = data.platform_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: $('#platform option[value="'+selected[i]+'"]').text(), value: selected[i]});
            }
            if(arr.length) platform_tags.add(arr);
        }
        $('.os-toggle').removeClass('is-selected');
        if(data.os_include !== undefined) {
            $('.os-toggle.include-toggle').addClass('is-selected');
            selected = data.os_include;
        } else {
            $('.os-toggle.exclude-toggle').addClass('is-selected');
            selected = data.os_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: selected[i], value: selected[i]});
            }
            if(arr.length) os_tags.add(arr);
        }
        $('.time-toggle').removeClass('is-selected');
        if(data.time_include !== undefined) {
            $('.time-toggle.include-toggle').addClass('is-selected');
            selected = data.time_include;
        } else {
            $('.time-toggle.exclude-toggle').addClass('is-selected');
            selected = data.time_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                $('.tid-select[id="'+selected[i]+'"]').addClass('is-selected');
            }
        }

        $('.audience-toggle').removeClass('is-selected');
        if(data.audience_include !== undefined) {
            $('.audience-toggle.include-toggle').addClass('is-selected');
            selected = data.audience_include;
        } else {
            $('.audience-toggle.exclude-toggle').addClass('is-selected');
            selected = data.audience_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: $('#audience option[value="'+selected[i]+'"]').text(), value: selected[i]});
            }
            if(arr.length) audience_tags.add(arr);
        }
        $('.website-toggle').removeClass('is-selected');
        if(data.website_include !== undefined) {
            $('.website-toggle.include-toggle').addClass('is-selected');
            selected = data.website_include;
        } else {
            $('.website-toggle.exclude-toggle').addClass('is-selected');
            selected = data.website_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push(selected[i]);
            }
            if(arr.length) website_tags.add(arr);
        }
        $('.zone-toggle').removeClass('is-selected');
        if(data.zone_include !== undefined) {
            $('.zone-toggle.include-toggle').addClass('is-selected');
            selected = data.zone_include;
        } else {
            $('.zone-toggle.exclude-toggle').addClass('is-selected');
            selected = data.zone_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push(selected[i]);
            }
            if(arr.length) zone_tags.add(arr);
        }

        selected = data.content.collect ? data.content.collect.split(':') : null;
        if(selected) {
            $('.audience-collect').removeClass('is-selected');
            $('.audience-collect[data-type="'+selected[0]+'"]').addClass('is-selected');
            collect_tags.add({text: $('#audience option[value="'+selected[1]+'"]').text(), value: selected[1]});
            $('#collect-wrap').show();
        }

        $('.create-ad').removeClass('is-selected');
        $('.create-ad[data-type="'+data.after_approval+'"]').addClass('is-selected');
        $('.create-ad').addClass('disabled');

        var collapse = $('.collapse[data-target="ad-format"]');
        $('.adFormat').removeClass('is-selected').addClass('disabled');
        $('.adFormat[data-id="<?=$this->data->ad_format?>"]').removeClass('disabled').addClass('is-selected');
        $('#ad-format').hide();
        collapse.attr('data-action', 'expand');
        collapse.find('.icon').toggleClass('spin90');
        $('.data-step').removeClass('hidden');
        <?php else: ?>
        $('.adFormat[data-status="Active"]').removeClass('disabled');
        <?php endif; ?>
    }
    $(document).ready(function() {
        initUploader();
        buildBiddingFromCountry();
        initData();
        $('.adFormat').on('click', function() {
            var $this = $(this), collapse = $('.collapse[data-target="ad-format"]');
            if($this.hasClass('disabled')) return false;
            $('.adFormat').removeClass('is-selected');
            $this.addClass('is-selected');
            buildPricing($this.attr('data-pricing'))
            buildCreative($this.attr('data-id'));
            generatePreview($this.attr('data-id'));
            $('#ad-format').fadeOut(800);
            collapse.attr('data-action', 'expand');
            collapse.find('.icon').toggleClass('spin90');
            $('.data-step').removeClass('hidden');
            $('#adformat-container').collapse('hide');
            $('#selected-format').attr('data-id',$this.attr('data-id'));
            $('#selected-format .title').html($this.attr('data-title'));
        });
        $(document).on('click', '.help-modal', function() {
            $('#'+$(this).attr('data-target')).modal('show');
        });
        $(document).on('click', '.pricing', function() {
            var $this = $(this), model = $this.attr('data-model');
            $('.pricing').removeClass('is-selected');
            $this.addClass('is-selected');
            if(model == 'cpc') {
                $('.goal_type').html('1 Click');
                $('.goal_type_label').html('Click');
                $('.cpa-param').addClass('hidden');
                if(url) url
            } else if(model == 'cpa') {
                $('.goal_type').html('1 Conversion');
                $('.goal_type_label').html('Conversion');
                $('.cpa-param').removeClass('hidden');
            } else {
                $('.goal_type').html('1000 Impressions');
                $('.goal_type_label').html('Impression');
                $('.cpa-param').addClass('hidden');
            }
            $('#url').val('');
            $('.url-param').removeClass('btn-success');
        });
        $('.url-param').on('click', function() {
            $(this).toggleClass('btn-success');
            buildTargetUrl();
        });
        $('.bidding').on('click', function() {
            $('.bidding').toggleClass('is-selected');
        });
        $('#your_bid_submit').on('click', function() {
            var b = _parseFloat($('#your_bid').val()), c = $('#your_bid_countrycode').text(), d = $('#your_bid_country').text();
            if(!b) {
                $('#countryBidModal').modal('show');
                return false;
            }
            bidding_tags.add({text: d+': $'+b, value: c+':'+b});
            $('#countryBidModal').modal('show');
        });
        $(document).on('click', '#library', function() {
            creatives.current = $(this).attr('data-type');
            getCreativeLib();
            $('#creativeModal').modal('show');
        });
        $('#library_search').on('input', function() {
            if(creative_search) clearTimeout(creative_search);
            creative_search = setTimeout(function(){searchCreativeLib();},800);
        });
        $(document).on('click', '.lib-thumb, .lib-name, .lib-size, .lib-date', function() {
            var $this = $(this).closest('.lib-item');
            pickCreative($this.attr('data-id'), $this.find('.lib-size').text() + ' ' + $this.find('.lib-name').text(), $this.find('a').attr('href'));
            $('#creativeModal').modal('hide');
        });
        $(document).on('click', '#creative-repick', function() {
            $('#creative-file-wrap').html('');
            $('#creative-file-form').removeClass('hidden');
        });
        $(document).on('click', '#upload', function() {
            creatives.current = $(this).attr('data-type');
            $('#uploadModal').modal('show');
        });
        $('.open-selector').on('click', function() {
            $('#upload_file').val('');
            $('#upload_file').click();
        });
        $('#upload_file').on('change', function(e){
            processFile(e.target.files[0]);
        });
        $(document).on('click', '.upload_control', function(){
            var act = $(this).attr('data-action');
            switch(act) {
                case 'pause':
                    uploader.abort();
                    $('#upload_control').html('<button class="btn btn-primary mr-1 mb-1 waves-effect waves-light upload_control" data-action="resume">Resume</button><button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                    $('#progress-status').html('<span class="text-warning">Upload paused</span>');
                    break;
                case 'resume':
                    uploader.start();
                    $('#upload_control').html('<button class="btn btn-warning mr-1 mb-1 waves-effect waves-light upload_control" data-action="pause">Pause</button><button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                    $('#progress-status').html('<span class="text-success">Upload resuming...</span>');
                    break;
                case 'retry':
                    uploader.start();
                    $('#upload_control').html('<button class="btn btn-warning mr-1 mb-1 waves-effect waves-light upload_control" data-action="pause">Pause</button><button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                    $('#progress-status').html('<span class="text-success">Upload retrying...</span>');
                    break;
                case 'cancel':
                    __tajs.showConfirm('Are you sure? this upload will be canceled', function(res){
                        if(res) {
                            uploader.abort();
                            var xhr = new XMLHttpRequest();
                            xhr.open("DELETE", uploader.url, true);
                            xhr.setRequestHeader("Tus-Resumable", "1.0.0");
                            xhr.send();
                            $('#uploader-selector').show();
                            $('#uploader-process').hide();
                        }
                    });
                    break;
                default:
                    return;
            }
        });
        $('.country-toggle').on('click', function() {
            $('.country-toggle').toggleClass('is-selected');
            buildBiddingFromCountry();
        });
        $('.platform-toggle').on('click', function() {
            $('.platform-toggle').toggleClass('is-selected');
            buildOsSelection();
        });
        $('.os-toggle').on('click', function() {
            $('.os-toggle').toggleClass('is-selected');
            buildBrowserSelection();
        });
        $('.browser-toggle').on('click', function() {
            $('.browser-toggle').toggleClass('is-selected');
        });
        $('.website-toggle').on('click', function() {
            $('.website-toggle').toggleClass('is-selected');
        });
        $('.audience-toggle').on('click', function() {
            $('.audience-toggle').toggleClass('is-selected');
        });
        $('.zone-toggle').on('click', function() {
            $('.zone-toggle').toggleClass('is-selected');
        });
        $('.time-toggle').on('click', function() {
            $('.time-toggle').toggleClass('is-selected');
        });
        $('.audience-collect').on('click', function() {
            var $this = $(this), t = $this.attr('data-type');
            $('.audience-collect').removeClass('is-selected');
            $this.addClass('is-selected');
            $('#collect-type').html(t);
            if(t != 'none') {
                $('#collect-wrap').show();
            } else {
                $('#collect-wrap').hide();

            }
        });
        $('#new-audience').on('click', function() {
            $('#createAudienceModal').modal('show');
            $('#audience-name').val('');
            $('#audience-name').focus();
        });
        $('#create-audience').on('click', function() {
            var $this = $(this), data = {id: 0};
            data.name = $.trim($('#audience-name').val());
            data.duration = _parseInt($('#audience-duration').val(),10);
            if(!data.name || data.name.length < 3) {
                __tajs.showAlert('Audience name is required');
                return false;
            }
            if(!data.duration) {
                __tajs.showAlert('Audience duration is required');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/audience/create', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
                $this.removeClass('is-loading');
                $this.prop('disabled', true);
                if (!res.success) {
                    __tajs.showAlert(res.data);
                    return false;
                }
                var aitem = {text: data.name, value: res.data};
                collect_tags._createDropdownItem(aitem);
                audience_tags._createDropdownItem(aitem);
                collect_tags.add(aitem);
                $('#collect option[value="'+res.data+'"]').attr('data-duration', data.duration*86400);
                $('#createAudienceModal').modal('hide');
            });
        });
        $('.tid-select').on('click', function() {
            $(this).toggleClass('is-selected');
        });
        $('.tid-hour').on('click', function() {
            var $this = $(this), h = $.trim($this.text());
            $this.toggleClass('is-selected');
            if($this.hasClass('is-selected')) {
                $('.tid-hour-'+h).addClass('is-selected');
            } else {
                $('.tid-hour-'+h).removeClass('is-selected');
            }
        });
        $('.tid-day').on('click', function() {
            var $this = $(this), d = $this.attr('data-weekday');
            $this.toggleClass('is-selected');
            if($this.hasClass('is-selected')) {
                $('.tid-day-'+d).addClass('is-selected');
            } else {
                $('.tid-day-'+d).removeClass('is-selected');
            }
        });
        $('.create-ad').on('click', function() {
            var $this = $(this);
            $('.create-ad').removeClass('is-selected');
            $this.addClass('is-selected');
        });
        $('#process').on('click', function() {
            var $this = $(this), format = $('.adFormat.is-selected'), data = {content: {}};
            <?php if($this->data->data): ?>
            data.id = <?=$this->data->id?>;
            <?php else: ?>
            data.campaign_id = <?=$this->data->id?>;
            <?php endif; ?>
            data.ad_format = format.attr('data-id');
            data.pricing_model = $('.pricing.is-selected').attr('data-model');
            data.name = $.trim($('#name').val());
            if(!data.name || data.name.length < 3) {
                __tajs.showAlert('Ad Name is required and minimum 3 characters');
                return false;
            }
            data.budget = _parseFloat($('#budget').val());
            if(!data.budget || data.budget < <?=MIN_AD_BUDGET?>) {
                __tajs.showAlert('Ad budget is required and minimum $<?=MIN_AD_BUDGET?>');
                return false;
            }
            data.content.url = $.trim($('#url').val());
            if(!data.content.url || data.content.url.indexOf('https://') != 0) {
                __tajs.showAlert('Target URL is required, please use valid https url');
                return false;
            }
            data.creative_id = $('#creative-id').attr('data-id') || null;
            if(_parseInt(format.attr('data-creative'))) {
                if(!data.creative_id) {
                    __tajs.showAlert('Ad creative is required with this ad format');
                    return false;
                }
            }

            data.bidding = country_bid;
            data.bidding.default = _parseFloat($('#bidding').val());
            if(!data.bidding.default) {
                __tajs.showAlert('Default bidding is required!');
                return false;
            }
            data.budget_daily = _parseFloat($('#budget_daily').val());
            data.budget_capping = _parseFloat($('#budget_capping_number').val())+':'+_parseInt($('#budget_capping_time').val())+$('#budget_capping_timetype').val();
            data.goal_daily = _parseFloat($('#goal_daily').val());
            data.goal_total = _parseFloat($('#goal_total').val());
            data.goal_capping = _parseInt($('#goal_capping_number').val())+':'+_parseInt($('#goal_capping_time').val())+$('#goal_capping_timetype').val();
            data.optimization = $('#optimization').val();

            $('.ad_content_create').each(function() {
                var id = this.id
                data.content[id] = $('#'+id).val();
            });
            var collect = collect_tags.value[0];
            if(collect) {
                var collect_duration = $("#collect option[value='"+collect+"']").attr('data-duration');
                data.content.collect = $('.audience-collect.is-selected').attr('data-type') + ':' + collect+':'+collect_duration;
            }

            data.start_date = formatDate(picker.getStartDate());
            data.end_date = formatDate(picker.getEndDate());
            if($('.country-toggle.is-selected').hasClass('include-toggle')) {
                data.country_include = country_tags.value;
            } else {
                data.country_exclude = country_tags.value;
            }
            if($('.browser-toggle.is-selected').hasClass('include-toggle')) {
                data.browser_include = browser_tags.value;
            } else {
                data.browser_exclude = browser_tags.value;
            }
            if($('.os-toggle.is-selected').hasClass('include-toggle')) {
                data.platform_include = platform_tags.value;
                data.os_include = os_tags.value;
            } else {
                data.platform_exclude = platform_tags.value;
                data.os_exclude = os_tags.value;
            }
            if($('.time-toggle.is-selected').hasClass('include-toggle')) {
                data.time_include = $('.tid-select.is-selected').map(function(){return this.id}).get();
            } else {
                data.time_exclude = $('.tid-select.is-selected').map(function(){return this.id}).get();
            }
            if($('.audience-toggle.is-selected').hasClass('include-toggle')) {
                data.audience_include = audience_tags.value;
            } else {
                data.audience_exclude = audience_tags.value;
            }
            if($('.website-toggle.is-selected').hasClass('include-toggle')) {
                data.website_include = website_tags.items;
            } else {
                data.website_exclude = website_tags.items;
            }
            if($('.zone-toggle.is-selected').hasClass('include-toggle')) {
                data.zone_include = zone_tags.items;
            } else {
                data.zone_exclude = zone_tags.items;
            }
            data.after_approval = $('.create-ad.is-selected').attr('data-type');

            var reapproval = false;
            if(current_url && current_url != data.content.url) reapproval = true;
            if(current_creative && current_creative != data.creative_id) reapproval = true;

            if(reapproval) {
                __tajs.showConfirm('Target URL and/or Ad Creative are changed, so we will set this ad back to "Pending", stop delivering it until our staff approval it again, okay?', function(yes) {
                    if (yes) {
                        $this.addClass('is-loading');
                        $this.prop('disabled', true);
                        $.post('/ad/setup', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res){
                            if(!res.success) {
                                $this.removeClass('is-loading');
                                $this.prop('disabled', false);
                                __tajs.showAlert(res.data);
                                return false;
                            }
                            __tajs.showAlert('Success! now redirecting...', 'success');
                            setTimeout(function(){window.location.replace(res.data)},1000);
                        });
                    }
                }, 'warning');
            } else {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/ad/setup', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res){
                    if(!res.success) {
                        $this.removeClass('is-loading');
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                        return false;
                    }
                    __tajs.showAlert('Success! now redirecting...', 'success');
                    setTimeout(function(){window.location.replace(res.data)},1000);
                });
            }
        });
    });
</script>