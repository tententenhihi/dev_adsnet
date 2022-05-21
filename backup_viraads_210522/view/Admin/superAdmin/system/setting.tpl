<style>
#creative-preview {
    overflow: auto
}

.button.is-selected {
    background-color: #006ed6;
    border-color: transparent;
    color: #fff;
}

.mode-toggle {
    /*margin-top:0;margin-bottom:-2.1rem!important;margin-right:0.1rem;*/
}

.country-toggle,
.platform-toggle,
.browser-toggle,
.os-toggle,
.time-toggle,
.zone-toggle,
.website-toggle,
.audience-toggle {
    border: none;
    padding: 3px 10px 3px 10px;
}

.dropdown-menu {
    z-index: 4
}

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

.adFormat.disabled,
.adFormat.disabled:hover {
    /*cursor: not-allowed;*/
    /*border: none;*/
    /*opacity: 0.4;*/
}

.adFormat.is-selected,
.adFormat:hover {
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

.pricing,
.audience-collect,
.create-ad {
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding-top: 1rem;
    padding-bottom: 1rem;
}

.pricing.is-selected,
.audience-collect.is-selected,
.create-ad.is-selected {
    border: 2px solid #006ed6;
    color: #006ed6;
}

.pricing p {
    text-transform: uppercase;
    font-weight: 700;
}

.audience-collect p,
.create-ad p {
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

table td,
.table th {
    border: 1px solid #006ed6 !important;
}

th.tid,
th.tid-title {
    padding: 0 !important;
    background-color: #006ed6;
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
    background-color: #006ed6;
    color: #fff !important;
    font-weight: bold;
    cursor: pointer;
}

.tid-select {
    padding: 0 !important;
    cursor: pointer;
    min-width: 30px;
}

.tid-select.is-selected,
.tid-day.is-selected {
    background-color: #006ed691 !important;
}

.lib-item {
    /*overflow: scroll;*/
    max-height: 200px;
    margin-bottom: 0 !important;
    padding: 20px 0 20px 0;
    border: 1px solid lightgray;
}

.lib-item:hover {
    box-shadow: 0 0 24px 0 rgba(0, 0, 0, .06), 0 1px 0 0 rgba(0, 0, 0, .02);
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

#uploader-selector,
#uploader-process {
    background-color: #fff;
}

#uploader-selector.dropactive {
    background-color: #f5f5f5;
}

.open-selector {
    color: #006ed6 !important;
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

.is-small.delete,
.is-small.modal-close {
    height: 16px;
    max-height: 16px;
    max-width: 16px;
    min-height: 16px;
    min-width: 16px;
    width: 16px;
}

.delete,
.modal-close {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    background-color: rgba(10, 10, 10, .2);
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

.delete::before,
.modal-close::before {
    height: 2px;
    width: 50%;
}

.delete::after,
.delete::before {
    background-color: #fff;
    content: "";
    display: block;
    left: 50%;
    position: absolute;
    top: 50%;
    transform: translateX(-50%) translateY(-50%) rotate(45deg);
    transform-origin: center center;
}

.delete::after,
.modal-close::after {
    height: 50%;
    width: 2px;
}

.delete::after,
.delete::before {
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

.pricing {
    box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding: 12px 15px 1px 15px;

}

.url-param {
    border: 1px solid rgba(128, 128, 128, 0.21);
    padding: 7px;
}

.audience-collect {
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
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding-top: 1rem;
    padding-bottom: 1rem;
}

.is-selected {
    border: 2px solid #006ed6;
    color: #006ed6;
}

.adFormat {
    box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding: 12px 15px 1px 15px;
}
</style>
<section class="wrapper">
    <div class="content-body">
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-6">
                    <h3 class="title is-6">Basic Information</h3>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse"
                            data-target="bacsic-info">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor"
                                        d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="basic-info">
            <div class=" col-lg-6 col-md-6 col-6">
                <div class="card flatbox">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">App Name</label>
                                <div class="control has-icons-left">
                                    <input class="input" type="text" id="SITE_NAME" placeholder="Your app name"
                                        value="<?=SITE_NAME?>">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label">Landing Page</label>
                                <div class="control has-icons-left">
                                    <input class="input" id="FRONTEND_URL" placeholder="Your Landing page link"
                                        value="<?=FRONTEND_URL?>">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M16.36,14C16.44,13.34 16.5,12.68 16.5,12C16.5,11.32 16.44,10.66 16.36,10H19.74C19.9,10.64 20,11.31 20,12C20,12.69 19.9,13.36 19.74,14M14.59,19.56C15.19,18.45 15.65,17.25 15.97,16H18.92C17.96,17.65 16.43,18.93 14.59,19.56M14.34,14H9.66C9.56,13.34 9.5,12.68 9.5,12C9.5,11.32 9.56,10.65 9.66,10H14.34C14.43,10.65 14.5,11.32 14.5,12C14.5,12.68 14.43,13.34 14.34,14M12,19.96C11.17,18.76 10.5,17.43 10.09,16H13.91C13.5,17.43 12.83,18.76 12,19.96M8,8H5.08C6.03,6.34 7.57,5.06 9.4,4.44C8.8,5.55 8.35,6.75 8,8M5.08,16H8C8.35,17.25 8.8,18.45 9.4,19.56C7.57,18.93 6.03,17.65 5.08,16M4.26,14C4.1,13.36 4,12.69 4,12C4,11.31 4.1,10.64 4.26,10H7.64C7.56,10.66 7.5,11.32 7.5,12C7.5,12.68 7.56,13.34 7.64,14M12,4.03C12.83,5.23 13.5,6.57 13.91,8H10.09C10.5,6.57 11.17,5.23 12,4.03M18.92,8H15.97C15.65,6.75 15.19,5.55 14.59,4.44C16.43,5.07 17.96,6.34 18.92,8M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label">Blog Url</label>
                                <div class="control has-icons-left">
                                    <input class="input" type="text" id="BLOG_URL" placeholder="Your blog url"
                                        value="<?=BLOG_URL?>">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label">Asset Url</label>
                                <div class="control has-icons-left">
                                    <input class="input" id="ASSET_URL" placeholder="Your Asset Server Url"
                                        value="<?=ASSET_URL?>">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M16.36,14C16.44,13.34 16.5,12.68 16.5,12C16.5,11.32 16.44,10.66 16.36,10H19.74C19.9,10.64 20,11.31 20,12C20,12.69 19.9,13.36 19.74,14M14.59,19.56C15.19,18.45 15.65,17.25 15.97,16H18.92C17.96,17.65 16.43,18.93 14.59,19.56M14.34,14H9.66C9.56,13.34 9.5,12.68 9.5,12C9.5,11.32 9.56,10.65 9.66,10H14.34C14.43,10.65 14.5,11.32 14.5,12C14.5,12.68 14.43,13.34 14.34,14M12,19.96C11.17,18.76 10.5,17.43 10.09,16H13.91C13.5,17.43 12.83,18.76 12,19.96M8,8H5.08C6.03,6.34 7.57,5.06 9.4,4.44C8.8,5.55 8.35,6.75 8,8M5.08,16H8C8.35,17.25 8.8,18.45 9.4,19.56C7.57,18.93 6.03,17.65 5.08,16M4.26,14C4.1,13.36 4,12.69 4,12C4,11.31 4.1,10.64 4.26,10H7.64C7.56,10.66 7.5,11.32 7.5,12C7.5,12.68 7.56,13.34 7.64,14M12,4.03C12.83,5.23 13.5,6.57 13.91,8H10.09C10.5,6.57 11.17,5.23 12,4.03M18.92,8H15.97C15.65,6.75 15.19,5.55 14.59,4.44C16.43,5.07 17.96,6.34 18.92,8M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label">API Url</label>
                                <div class="control has-icons-left">
                                    <input class="input" id="API_URL" placeholder="Your API Server Url"
                                        value="<?=API_URL?>">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M16.36,14C16.44,13.34 16.5,12.68 16.5,12C16.5,11.32 16.44,10.66 16.36,10H19.74C19.9,10.64 20,11.31 20,12C20,12.69 19.9,13.36 19.74,14M14.59,19.56C15.19,18.45 15.65,17.25 15.97,16H18.92C17.96,17.65 16.43,18.93 14.59,19.56M14.34,14H9.66C9.56,13.34 9.5,12.68 9.5,12C9.5,11.32 9.56,10.65 9.66,10H14.34C14.43,10.65 14.5,11.32 14.5,12C14.5,12.68 14.43,13.34 14.34,14M12,19.96C11.17,18.76 10.5,17.43 10.09,16H13.91C13.5,17.43 12.83,18.76 12,19.96M8,8H5.08C6.03,6.34 7.57,5.06 9.4,4.44C8.8,5.55 8.35,6.75 8,8M5.08,16H8C8.35,17.25 8.8,18.45 9.4,19.56C7.57,18.93 6.03,17.65 5.08,16M4.26,14C4.1,13.36 4,12.69 4,12C4,11.31 4.1,10.64 4.26,10H7.64C7.56,10.66 7.5,11.32 7.5,12C7.5,12.68 7.56,13.34 7.64,14M12,4.03C12.83,5.23 13.5,6.57 13.91,8H10.09C10.5,6.57 11.17,5.23 12,4.03M18.92,8H15.97C15.65,6.75 15.19,5.55 14.59,4.44C16.43,5.07 17.96,6.34 18.92,8M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label">Delivery Url</label>
                                <div class="control has-icons-left">
                                    <input class="input" type="text" id="ADSERVER_URL" placeholder="ads.yourdomain.com"
                                        value="<?=ADSERVER_URL?>">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label">MyAccount Panel</label>
                                <div class="control has-icons-left">
                                    <input class="input" type="text" id="MYACCOUNT_URL" placeholder="me.yourdomain.com"
                                        value="<?=MYACCOUNT_URL?>">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                        </svg>
                                    </span>
                                </div>
                                <div class="field">
                                    <label class="label">Publisher Panel</label>
                                    <div class="control has-icons-left">
                                        <input class="input" id="PUBLISHER_URL" placeholder="pub.yourdomain.com"
                                            value="<?=PUBLISHER_URL?>">
                                        <span class="icon is-small is-left">
                                            <svg viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                    d="M16.36,14C16.44,13.34 16.5,12.68 16.5,12C16.5,11.32 16.44,10.66 16.36,10H19.74C19.9,10.64 20,11.31 20,12C20,12.69 19.9,13.36 19.74,14M14.59,19.56C15.19,18.45 15.65,17.25 15.97,16H18.92C17.96,17.65 16.43,18.93 14.59,19.56M14.34,14H9.66C9.56,13.34 9.5,12.68 9.5,12C9.5,11.32 9.56,10.65 9.66,10H14.34C14.43,10.65 14.5,11.32 14.5,12C14.5,12.68 14.43,13.34 14.34,14M12,19.96C11.17,18.76 10.5,17.43 10.09,16H13.91C13.5,17.43 12.83,18.76 12,19.96M8,8H5.08C6.03,6.34 7.57,5.06 9.4,4.44C8.8,5.55 8.35,6.75 8,8M5.08,16H8C8.35,17.25 8.8,18.45 9.4,19.56C7.57,18.93 6.03,17.65 5.08,16M4.26,14C4.1,13.36 4,12.69 4,12C4,11.31 4.1,10.64 4.26,10H7.64C7.56,10.66 7.5,11.32 7.5,12C7.5,12.68 7.56,13.34 7.64,14M12,4.03C12.83,5.23 13.5,6.57 13.91,8H10.09C10.5,6.57 11.17,5.23 12,4.03M18.92,8H15.97C15.65,6.75 15.19,5.55 14.59,4.44C16.43,5.07 17.96,6.34 18.92,8M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                            </svg>
                                        </span>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Advertiser Panel</label>
                                    <div class="control has-icons-left">
                                        <input class="input" type="text" id="ADVERTISER_URL"
                                            placeholder="adv.yourdomain.com" value="<?=ADVERTISER_URL?>">
                                        <span class="icon is-small is-left">
                                            <svg viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                    d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                            </svg>
                                        </span>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Admin Panel</label>
                                    <div class="control has-icons-left">
                                        <input class="input" id="ADMIN_URL" placeholder="adm.yourdomain.com"
                                            value="<?=ADMIN_URL?>">
                                        <span class="icon is-small is-left">
                                            <svg viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                    d="M16.36,14C16.44,13.34 16.5,12.68 16.5,12C16.5,11.32 16.44,10.66 16.36,10H19.74C19.9,10.64 20,11.31 20,12C20,12.69 19.9,13.36 19.74,14M14.59,19.56C15.19,18.45 15.65,17.25 15.97,16H18.92C17.96,17.65 16.43,18.93 14.59,19.56M14.34,14H9.66C9.56,13.34 9.5,12.68 9.5,12C9.5,11.32 9.56,10.65 9.66,10H14.34C14.43,10.65 14.5,11.32 14.5,12C14.5,12.68 14.43,13.34 14.34,14M12,19.96C11.17,18.76 10.5,17.43 10.09,16H13.91C13.5,17.43 12.83,18.76 12,19.96M8,8H5.08C6.03,6.34 7.57,5.06 9.4,4.44C8.8,5.55 8.35,6.75 8,8M5.08,16H8C8.35,17.25 8.8,18.45 9.4,19.56C7.57,18.93 6.03,17.65 5.08,16M4.26,14C4.1,13.36 4,12.69 4,12C4,11.31 4.1,10.64 4.26,10H7.64C7.56,10.66 7.5,11.32 7.5,12C7.5,12.68 7.56,13.34 7.64,14M12,4.03C12.83,5.23 13.5,6.57 13.91,8H10.09C10.5,6.57 11.17,5.23 12,4.03M18.92,8H15.97C15.65,6.75 15.19,5.55 14.59,4.44C16.43,5.07 17.96,6.34 18.92,8M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                            </svg>
                                        </span>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Timezone</label>
                                    <div class="control has-icons-left">
                                        <input class="input" id="TIMEZONE" placeholder="UTC" value="<?=TIMEZONE?>">
                                        <span class="icon is-small is-left">
                                            <svg viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                    d="M16.36,14C16.44,13.34 16.5,12.68 16.5,12C16.5,11.32 16.44,10.66 16.36,10H19.74C19.9,10.64 20,11.31 20,12C20,12.69 19.9,13.36 19.74,14M14.59,19.56C15.19,18.45 15.65,17.25 15.97,16H18.92C17.96,17.65 16.43,18.93 14.59,19.56M14.34,14H9.66C9.56,13.34 9.5,12.68 9.5,12C9.5,11.32 9.56,10.65 9.66,10H14.34C14.43,10.65 14.5,11.32 14.5,12C14.5,12.68 14.43,13.34 14.34,14M12,19.96C11.17,18.76 10.5,17.43 10.09,16H13.91C13.5,17.43 12.83,18.76 12,19.96M8,8H5.08C6.03,6.34 7.57,5.06 9.4,4.44C8.8,5.55 8.35,6.75 8,8M5.08,16H8C8.35,17.25 8.8,18.45 9.4,19.56C7.57,18.93 6.03,17.65 5.08,16M4.26,14C4.1,13.36 4,12.69 4,12C4,11.31 4.1,10.64 4.26,10H7.64C7.56,10.66 7.5,11.32 7.5,12C7.5,12.68 7.56,13.34 7.64,14M12,4.03C12.83,5.23 13.5,6.57 13.91,8H10.09C10.5,6.57 11.17,5.23 12,4.03M18.92,8H15.97C15.65,6.75 15.19,5.55 14.59,4.44C16.43,5.07 17.96,6.34 18.92,8M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                            </svg>
                                        </span>
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Google Analytics</label>
                                    <div class="control has-icons-left">
                                        <input class="input" id="GOOGLE_ANALYTICS" placeholder="your GA4 ID"
                                            value="<?=GOOGLE_ANALYTICS?>">
                                        <span class="icon is-small is-left">
                                            <svg viewBox="0 0 24 24">
                                                <path fill="currentColor"
                                                    d="M16.36,14C16.44,13.34 16.5,12.68 16.5,12C16.5,11.32 16.44,10.66 16.36,10H19.74C19.9,10.64 20,11.31 20,12C20,12.69 19.9,13.36 19.74,14M14.59,19.56C15.19,18.45 15.65,17.25 15.97,16H18.92C17.96,17.65 16.43,18.93 14.59,19.56M14.34,14H9.66C9.56,13.34 9.5,12.68 9.5,12C9.5,11.32 9.56,10.65 9.66,10H14.34C14.43,10.65 14.5,11.32 14.5,12C14.5,12.68 14.43,13.34 14.34,14M12,19.96C11.17,18.76 10.5,17.43 10.09,16H13.91C13.5,17.43 12.83,18.76 12,19.96M8,8H5.08C6.03,6.34 7.57,5.06 9.4,4.44C8.8,5.55 8.35,6.75 8,8M5.08,16H8C8.35,17.25 8.8,18.45 9.4,19.56C7.57,18.93 6.03,17.65 5.08,16M4.26,14C4.1,13.36 4,12.69 4,12C4,11.31 4.1,10.64 4.26,10H7.64C7.56,10.66 7.5,11.32 7.5,12C7.5,12.68 7.56,13.34 7.64,14M12,4.03C12.83,5.23 13.5,6.57 13.91,8H10.09C10.5,6.57 11.17,5.23 12,4.03M18.92,8H15.97C15.65,6.75 15.19,5.55 14.59,4.44C16.43,5.07 17.96,6.34 18.92,8M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                            </svg>
                                        </span>
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
                <div class="col-6">
                    <h3 class="title is-6">Ad Server</h3>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse"
                            data-target="adserver">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor"
                                        d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row data-step" id="adserver">
            <div class="col-lg-6 col-md-12 col-12 mb-2">
                <div class=" card flatbox is-100height">
                    <div class="card-body card-dashboard">
                        <div class="field">
                            <label class="label">Master Token</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="ADSERVER_AUTH" placeholder="ads.yourdomain.com"
                                    value="<?=ADSERVER_AUTH?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Revshare</label>
                            <div class="control has-icons-left">
                                <input class="input" type="number" id="DEFAULT_REVSHARE" placeholder="0.8 ~ 80%"
                                    value="<?=DEFAULT_REVSHARE?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Min Ad Budget</label>
                            <div class="control has-icons-left">
                                <input class="input" type="number" id="MIN_AD_BUDGET"
                                    placeholder="5 ~ $5 minimum per ad" value="<?=MIN_AD_BUDGET?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Conversion Delays</label>
                            <div class="control has-icons-left">
                                <input class="input" type="number" id="CONVERSION_DURATION" placeholder="86400 ~ 1 day"
                                    value="<?=CONVERSION_DURATION?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Data Retention</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="RAW_METRIC_DURATION"
                                    placeholder="Months to keep raw metric" value="<?=RAW_METRIC_DURATION?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Budget Capping</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="DEFAULT_CAPPING" placeholder="empty to disable"
                                    value="<?=DEFAULT_CAPPING?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-6">
                    <h3 class="title is-6">System</h3>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse"
                            data-target="system">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor"
                                        d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="system">
            <div class="col-lg-6 col-md-12 col-12 mb-2">
                <div class=" card flatbox is-100height">
                    <div class="card-body card-dashboard">
                        <div class="row is-12">
                            <div class="flatbox">
                                <div class="columns is-multiline">
                                    <div class="column is-4">
                                        <div class="field has-text-left">
                                            <div class="control">
                                                <label class="checkbox">
                                                    <input type="checkbox" id="MAINTENANCE" <?php if(MAINTENANCE): ?>
                                                        checked="checked" <?php endif; ?>>
                                                    <span class="checkbox-text text-muted">Maintenance
                                                        System</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="column is-4">
                                        <div class="field has-text-left">
                                            <div class="control">
                                                <label class="checkbox">
                                                    <input type="checkbox" id="MAINTENANCE_READONLY"
                                                        <?php if(MAINTENANCE_READONLY): ?> checked="checked"
                                                        <?php endif; ?>>
                                                    <span class="checkbox-text text-muted">ReadOnly Mode</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="column is-4">
                                        <div class="field has-text-left">
                                            <div class="control">
                                                <label class="checkbox">
                                                    <input type="checkbox" id="MAINTENANCE_REGISTER"
                                                        <?php if(MAINTENANCE_REGISTER): ?> checked="checked"
                                                        <?php endif; ?>>
                                                    <span class="checkbox-text text-muted">Maintenance
                                                        Register</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="column is-4">
                                        <div class="field has-text-left">
                                            <div class="control">
                                                <label class="checkbox">
                                                    <input type="checkbox" id="SYSTEM_PAGE_404"
                                                        <?php if(SYSTEM_PAGE_404): ?> checked="checked" <?php endif; ?>>
                                                    <span class="checkbox-text text-muted">Enable 404</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="column is-4">
                                        <div class="field has-text-left">
                                            <div class="control">
                                                <label class="checkbox">
                                                    <input type="checkbox" id="HTML_CACHE" <?php if(HTML_CACHE): ?>
                                                        checked="checked" <?php endif; ?>>
                                                    <span class="checkbox-text text-muted">Enable HTML
                                                        Cache</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="column is-4">
                                        <div class="field has-text-left">
                                            <div class="control">
                                                <label class="checkbox">
                                                    <input type="checkbox" id="REFERRAL" <?php if(REFERRAL): ?>
                                                        checked="checked" <?php endif; ?>>
                                                    <span class="checkbox-text text-muted">Enable Referral
                                                        (<span><?=REFERRAL_COMMISSION*100?></span>%)</span>
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
        </div>
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-6">
                    <h1 class="title is-6">Email & SMS</h1>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse"
                            data-target="email">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor"
                                        d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="email">
            <div class="col-lg-6 col-md-12 col-12 mb-2">
                <div class=" card flatbox is-100height">
                    <div class="card-body card-dashboard">
                        <div class="field">
                            <label class="label">Host</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="EMAIL_SERVER_HOST" placeholder="1.2.3.4"
                                    value="<?=EMAIL_SERVER_HOST?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Port</label>
                            <div class="control has-icons-left">
                                <input class="input" type="number" id="EMAIL_SERVER_PORT" placeholder="9988"
                                    value="<?=EMAIL_SERVER_PORT?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Critical Email</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="EMAIL_CRITICAL" placeholder="cr@yourdomain.com"
                                    value="<?=EMAIL_CRITICAL?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Noreply Email</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="EMAIL_DEFAULT_USER"
                                    placeholder="auto@yourdomain.com" value="<?=EMAIL_DEFAULT_USER?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Noreply Pass</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="EMAIL_DEFAULT_USER_PW" placeholder="verysecretpass"
                                    value="<?=EMAIL_DEFAULT_USER_PW?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Noreply Display</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="EMAIL_DEFAULT_USER_NAME"
                                    placeholder="YourCompany Notification" value="<?=EMAIL_DEFAULT_USER_NAME?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">ContactUS Email</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="EMAIL_CONTACTUS" placeholder="us@yourdomain.com"
                                    value="<?=EMAIL_CONTACTUS?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">SMS API</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="SMS_SENDER" placeholder="api.yoursms.com"
                                    value="<?=SMS_SENDER?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">SMS Token</label>
                            <div class="control has-icons-left">
                                <input class="input" type="text" id="SMS_APIKEY" placeholder="secrettoken"
                                    value="<?=SMS_APIKEY?>">
                                <span class="icon is-small is-left">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor"
                                            d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                    </svg>
                                </span>
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