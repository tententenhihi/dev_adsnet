<style>
.help-modal {
    /*margin-bottom: -1.7rem;*/
    margin-bottom: -20px;
    text-align: right;
}
.help-modal .icon {
    cursor: pointer;
}
.help-modal .icon:hover {
    color: #006ed6;
}
.message-header .icon{transition: 0.5s ease-in-out;}
.message-header .spin180 {transform:rotate(180deg);}
.native_type, .pop_method, .dia_method {
    margin-left:0.1rem;
    margin-right:0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding-top: 1rem;
    padding-bottom: 1rem;
}
.flatbox.is-selected {
    border: 2px solid #006ed6;
    color: #006ed6;
}
.button.is-selected {
    background-color: #880d88;
    color: #fff;
}
.button.is-selected:focus {
    border-color: #880d88;
    box-shadow: none;
}
.button.is-default:focus {
    border-color: #dbdbdb;
    box-shadow: none;
}
.zone-preview-wrap {
    min-height: 300px;
    border: 2px solid #e1e4eb;
    border-radius: 8px;
}
.columns.is-gaplessly {
    margin: 0 0 .85rem 0 !important;
}
.columns.is-gaplessly>.column {
    margin: 0;
    padding: 0!important;
}
.message.is-orange {
    background-color: transparent;
    border-bottom: 1px solid #006ed6;
    border-left: 1px solid #006ed6;
    border-right: 1px solid #006ed6;
}
.message.is-orange .message-header {
    background-color: #006ed6;
    color: #fff;
    cursor: pointer;
}
.message.is-orange .message-body {
    padding: 1.25em .25em;
}



.collapse:not(.show) {
    display: inline;
}
.ipp_label, .ipp_position, .preview-device{
    border: 1px solid rgba(128, 128, 128, 0.21);
    padding: 7px;
}
.native_type, .pop_method, .dia_method{
    box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding: 12px 15px 1px 15px;
}
.message-header{
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    border-bottom: 1px solid;
}
.native-align, .desktop-text, .desktop-spacing, .mobile-text, .mobile-spacing{
    border: 1px solid rgba(128, 128, 128, 0.21);
    padding: 7px;
}
.desktop-image, .mobile-image{
    box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding: 12px 15px 10px 15px;
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
</style>
<div class="content-body">

    <div class="page-title-box data-step">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Setup</h3>
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
    <div class="row is-multiline data-step" id="step-config" style="flex-wrap: wrap;">
        <div class="col-lg-6 col-md-12 col-12 mb-2" id="zone-setting">
            <div class="card flatbox h-100">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="help-modal" data-target="helpModal1">
                            <span class="icon">
                                <svg viewBox="0 0 24 24" style="width: 20px">
                                    <path fill="currentColor" d="M15.07,11.25L14.17,12.17C13.45,12.89 13,13.5 13,15H11V14.5C11,13.39 11.45,12.39 12.17,11.67L13.41,10.41C13.78,10.05 14,9.55 14,9C14,7.89 13.1,7 12,7A2,2 0 0,0 10,9H8A4,4 0 0,1 12,5A4,4 0 0,1 16,9C16,9.88 15.64,10.67 15.07,11.25M13,19H11V17H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12C22,6.47 17.5,2 12,2Z" />
                                </svg>
                            </span>
                        </div>
                        <div class="form-group">
                            <label class="label">Floor eCPM</label>
                            <input class="input form-control" type="number" id="bid" placeholder="Leave empty to use our optimization">
                        </div>
                        <div class="form-group">
                            <label class="label">Frequency / Capping</label>
                            <div class="input-group">
                                <input class="input form-control" id="frequency_number" type="number" placeholder="Empty to disable capping" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">Every</span>
                                </div>

                                <input class="input form-control" id="frequency_time" type="number" value="24">
                                <div class="input-group-append">
                                    <select id="frequency_timetype" class="form-control" style="width: 85px;">
                                        <option value="h">Hours</option>
                                        <option value="m">Mins</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label">Fallback Url</label>
                            <input class="input form-control" type="text" id="fallback" placeholder="Your fallback url">

                        </div>
                        <div class="form-group">
                            <label class="label">Block Ad Types</label>
                            <div class="buttons are-small">
                                <?php foreach($this->data->adType as $item): ?>
                                <button class="btn exclude-ad btn-outline-light mb-1" data-value="<?=$item->id?>"><?=$item->name?></button>
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <div id="zone-build-setting"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-12 mb-2" id="zone-generate-preview" style="display:none">
            <div class="card flatbox h-100">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="buttons has-addons text-center mb-1">
                            <button class="button preview-device is-selected mb-1" data-value="desktop">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M21,14H3V4H21M21,2H3C1.89,2 1,2.89 1,4V16A2,2 0 0,0 3,18H10L8,21V22H16V21L14,18H21A2,2 0 0,0 23,16V4C23,2.89 22.1,2 21,2Z"></path>
                                    </svg>
                                </span>
                                <span class="hidden-mobile">Desktop</span>
                            </button>
                            <button class="button preview-device mb-1" data-value="tablet">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M19,19H4V3H19M11.5,23A1.5,1.5 0 0,1 10,21.5A1.5,1.5 0 0,1 11.5,20A1.5,1.5 0 0,1 13,21.5A1.5,1.5 0 0,1 11.5,23M18.5,0H4.5A2.5,2.5 0 0,0 2,2.5V21.5A2.5,2.5 0 0,0 4.5,24H18.5A2.5,2.5 0 0,0 21,21.5V2.5A2.5,2.5 0 0,0 18.5,0Z"></path>
                                    </svg>
                                </span>
                                <span class="hidden-mobile">Tablet</span>
                            </button>
                            <button class="button preview-device mb-1" data-value="mobile">
                                <span class="icon">
                                    <svg viewBox="0 0 24 24">
                                        <path fill="currentColor" d="M16,18H7V4H16M11.5,22A1.5,1.5 0 0,1 10,20.5A1.5,1.5 0 0,1 11.5,19A1.5,1.5 0 0,1 13,20.5A1.5,1.5 0 0,1 11.5,22M15.5,1H7.5A2.5,2.5 0 0,0 5,3.5V20.5A2.5,2.5 0 0,0 7.5,23H15.5A2.5,2.5 0 0,0 18,20.5V3.5A2.5,2.5 0 0,0 15.5,1Z"></path>
                                    </svg>
                                </span>
                                <span class="hidden-mobile">Mobile</span>
                            </button>
                        </div>
                        <div class="zone-preview-wrap">
                            <svg id="device-desktop" width="100%" viewBox="0 0 891 77" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <rect y="40" width="891" height="36" fill="white"/>
                                <g filter="url(#filter0_d)">
                                    <rect y="40" width="891" height="36" fill="white"/>
                                </g>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M870.5 53C870.5 53.8284 869.828 54.5 869 54.5C868.172 54.5 867.5 53.8284 867.5 53C867.5 52.1716 868.172 51.5 869 51.5C869.828 51.5 870.5 52.1716 870.5 53ZM870.5 58C870.5 58.8284 869.828 59.5 869 59.5C868.172 59.5 867.5 58.8284 867.5 58C867.5 57.1716 868.172 56.5 869 56.5C869.828 56.5 870.5 57.1716 870.5 58ZM869 64.5C869.828 64.5 870.5 63.8284 870.5 63C870.5 62.1716 869.828 61.5 869 61.5C868.172 61.5 867.5 62.1716 867.5 63C867.5 63.8284 868.172 64.5 869 64.5Z" fill="#4B4D52"/>
                                <circle cx="837" cy="58" r="10" fill="url(#pattern0)"/>
                                <circle cx="837" cy="58" r="10" fill="url(#pattern1)"/>
                                <rect x="112" y="44" width="699" height="28" rx="14" fill="#EFF1F4"/>
                                <path d="M793 51.629L794.311 55.6941L794.423 56.0414L794.788 56.0406L799.059 56.0313L795.598 58.5343L795.302 58.7481L795.416 59.095L796.745 63.1543L793.295 60.6361L793 60.421L792.705 60.6361L789.255 63.1543L790.584 59.095L790.698 58.7481L790.402 58.5343L786.941 56.0313L791.212 56.0406L791.577 56.0414L791.689 55.6941L793 51.629Z" stroke="#4B4D52"/>
                                <path d="M151.377 61.1475L153.1 55.6035H154.453L151.479 64.1416C151.019 65.3721 150.288 65.9873 149.285 65.9873L149.046 65.9668L148.574 65.8779V64.8525L148.916 64.8799C149.344 64.8799 149.677 64.7933 149.914 64.6201C150.156 64.4469 150.354 64.1302 150.509 63.6699L150.789 62.918L148.15 55.6035H149.531L151.377 61.1475ZM155.424 59.2334C155.424 58.5088 155.565 57.8571 155.847 57.2783C156.134 56.6995 156.531 56.2529 157.037 55.9385C157.547 55.624 158.128 55.4668 158.78 55.4668C159.787 55.4668 160.601 55.8154 161.22 56.5127C161.845 57.21 162.157 58.1374 162.157 59.2949V59.3838C162.157 60.1038 162.018 60.751 161.74 61.3252C161.467 61.8949 161.072 62.3392 160.557 62.6582C160.047 62.9772 159.459 63.1367 158.794 63.1367C157.791 63.1367 156.978 62.7881 156.353 62.0908C155.733 61.3936 155.424 60.4707 155.424 59.3223V59.2334ZM156.695 59.3838C156.695 60.2041 156.884 60.8626 157.262 61.3594C157.645 61.8561 158.156 62.1045 158.794 62.1045C159.436 62.1045 159.947 61.8538 160.325 61.3525C160.703 60.8467 160.892 60.1403 160.892 59.2334C160.892 58.4222 160.699 57.766 160.311 57.2646C159.928 56.7588 159.418 56.5059 158.78 56.5059C158.156 56.5059 157.652 56.7542 157.269 57.251C156.886 57.7477 156.695 58.4587 156.695 59.3838ZM168.589 62.2686C168.097 62.8473 167.375 63.1367 166.422 63.1367C165.634 63.1367 165.032 62.9089 164.618 62.4531C164.207 61.9928 164 61.3138 163.996 60.416V55.6035H165.26V60.3818C165.26 61.5029 165.716 62.0635 166.627 62.0635C167.594 62.0635 168.236 61.7035 168.555 60.9834V55.6035H169.82V63H168.617L168.589 62.2686ZM175.603 56.7383C175.411 56.7064 175.204 56.6904 174.981 56.6904C174.151 56.6904 173.588 57.0436 173.292 57.75V63H172.028V55.6035H173.258L173.278 56.458C173.693 55.7972 174.281 55.4668 175.042 55.4668C175.288 55.4668 175.475 55.4987 175.603 55.5625V56.7383ZM183.724 61.2568L185.145 55.6035H186.41L184.257 63H183.231L181.433 57.3945L179.683 63H178.658L176.512 55.6035H177.769L179.225 61.1406L180.948 55.6035H181.967L183.724 61.2568ZM191.051 63.1367C190.049 63.1367 189.233 62.8086 188.604 62.1523C187.975 61.4915 187.661 60.6097 187.661 59.5068V59.2744C187.661 58.5407 187.8 57.8867 188.078 57.3125C188.36 56.7337 188.752 56.2826 189.254 55.959C189.759 55.6309 190.306 55.4668 190.894 55.4668C191.856 55.4668 192.603 55.7835 193.136 56.417C193.67 57.0505 193.936 57.9574 193.936 59.1377V59.6641H188.925C188.944 60.3932 189.156 60.9834 189.561 61.4346C189.971 61.8812 190.491 62.1045 191.12 62.1045C191.566 62.1045 191.945 62.0133 192.254 61.8311C192.564 61.6488 192.836 61.4072 193.068 61.1064L193.84 61.708C193.221 62.6605 192.291 63.1367 191.051 63.1367ZM190.894 56.5059C190.384 56.5059 189.955 56.6927 189.609 57.0664C189.263 57.4355 189.048 57.9551 188.966 58.625H192.671V58.5293C192.635 57.8867 192.462 57.39 192.152 57.0391C191.842 56.6836 191.423 56.5059 190.894 56.5059ZM201.948 59.3838C201.948 60.514 201.688 61.4232 201.168 62.1113C200.649 62.7949 199.951 63.1367 199.076 63.1367C198.142 63.1367 197.42 62.8063 196.909 62.1455L196.848 63H195.686V52.5H196.951V56.417C197.461 55.7835 198.165 55.4668 199.063 55.4668C199.961 55.4668 200.665 55.8063 201.175 56.4854C201.69 57.1644 201.948 58.0941 201.948 59.2744V59.3838ZM200.683 59.2402C200.683 58.3789 200.517 57.7135 200.184 57.2441C199.851 56.7747 199.373 56.54 198.748 56.54C197.914 56.54 197.315 56.9274 196.951 57.7021V60.9014C197.338 61.6761 197.942 62.0635 198.762 62.0635C199.368 62.0635 199.84 61.8288 200.177 61.3594C200.514 60.89 200.683 60.1836 200.683 59.2402ZM208.134 61.0381C208.134 60.6963 208.004 60.432 207.744 60.2451C207.489 60.0537 207.04 59.8896 206.397 59.7529C205.759 59.6162 205.251 59.4521 204.873 59.2607C204.499 59.0693 204.221 58.8415 204.039 58.5771C203.861 58.3128 203.772 57.9984 203.772 57.6338C203.772 57.0277 204.028 56.515 204.538 56.0957C205.053 55.6764 205.709 55.4668 206.507 55.4668C207.345 55.4668 208.024 55.6833 208.544 56.1162C209.068 56.5492 209.33 57.1029 209.33 57.7773H208.059C208.059 57.431 207.911 57.1325 207.614 56.8818C207.323 56.6312 206.953 56.5059 206.507 56.5059C206.047 56.5059 205.687 56.6061 205.427 56.8066C205.167 57.0072 205.037 57.2692 205.037 57.5928C205.037 57.8981 205.158 58.1283 205.399 58.2832C205.641 58.4382 206.076 58.5863 206.705 58.7275C207.339 58.8688 207.851 59.0374 208.243 59.2334C208.635 59.4294 208.925 59.6663 209.111 59.9443C209.303 60.2178 209.398 60.5527 209.398 60.9492C209.398 61.61 209.134 62.141 208.606 62.542C208.077 62.9385 207.391 63.1367 206.548 63.1367C205.955 63.1367 205.431 63.0319 204.976 62.8223C204.52 62.6126 204.162 62.321 203.902 61.9473C203.647 61.569 203.52 61.1611 203.52 60.7236H204.784C204.807 61.1475 204.976 61.4847 205.29 61.7354C205.609 61.9814 206.028 62.1045 206.548 62.1045C207.026 62.1045 207.409 62.0088 207.696 61.8174C207.988 61.6214 208.134 61.3617 208.134 61.0381ZM212.7 63H211.435V55.6035H212.7V63ZM211.333 53.6416C211.333 53.4365 211.394 53.2633 211.517 53.1221C211.645 52.9808 211.832 52.9102 212.078 52.9102C212.324 52.9102 212.511 52.9808 212.638 53.1221C212.766 53.2633 212.83 53.4365 212.83 53.6416C212.83 53.8467 212.766 54.0176 212.638 54.1543C212.511 54.291 212.324 54.3594 212.078 54.3594C211.832 54.3594 211.645 54.291 211.517 54.1543C211.394 54.0176 211.333 53.8467 211.333 53.6416ZM216.726 53.8125V55.6035H218.107V56.5811H216.726V61.168C216.726 61.4642 216.788 61.6875 216.911 61.8379C217.034 61.9837 217.243 62.0566 217.54 62.0566C217.685 62.0566 217.886 62.0293 218.141 61.9746V63C217.808 63.0911 217.485 63.1367 217.17 63.1367C216.605 63.1367 216.179 62.9658 215.892 62.624C215.605 62.2822 215.461 61.7969 215.461 61.168V56.5811H214.115V55.6035H215.461V53.8125H216.726ZM222.94 63.1367C221.937 63.1367 221.121 62.8086 220.492 62.1523C219.863 61.4915 219.549 60.6097 219.549 59.5068V59.2744C219.549 58.5407 219.688 57.8867 219.966 57.3125C220.249 56.7337 220.64 56.2826 221.142 55.959C221.648 55.6309 222.195 55.4668 222.782 55.4668C223.744 55.4668 224.491 55.7835 225.025 56.417C225.558 57.0505 225.824 57.9574 225.824 59.1377V59.6641H220.814C220.832 60.3932 221.044 60.9834 221.449 61.4346C221.86 61.8812 222.379 62.1045 223.008 62.1045C223.455 62.1045 223.833 62.0133 224.143 61.8311C224.453 61.6488 224.724 61.4072 224.956 61.1064L225.729 61.708C225.109 62.6605 224.179 63.1367 222.94 63.1367ZM222.782 56.5059C222.272 56.5059 221.844 56.6927 221.497 57.0664C221.151 57.4355 220.937 57.9551 220.855 58.625H224.56V58.5293C224.523 57.8867 224.35 57.39 224.04 57.0391C223.73 56.6836 223.311 56.5059 222.782 56.5059ZM227.601 62.3369C227.601 62.1182 227.665 61.9359 227.793 61.79C227.925 61.6442 228.121 61.5713 228.381 61.5713C228.641 61.5713 228.837 61.6442 228.969 61.79C229.105 61.9359 229.174 62.1182 229.174 62.3369C229.174 62.5465 229.105 62.722 228.969 62.8633C228.837 63.0046 228.641 63.0752 228.381 63.0752C228.121 63.0752 227.925 63.0046 227.793 62.8633C227.665 62.722 227.601 62.5465 227.601 62.3369ZM234.512 62.1045C234.964 62.1045 235.358 61.9678 235.695 61.6943C236.032 61.4209 236.219 61.0791 236.256 60.6689H237.452C237.429 61.0928 237.283 61.4961 237.014 61.8789C236.745 62.2617 236.385 62.5671 235.934 62.7949C235.488 63.0228 235.014 63.1367 234.512 63.1367C233.505 63.1367 232.703 62.8018 232.106 62.1318C231.514 61.4574 231.217 60.5368 231.217 59.3701V59.1582C231.217 58.4382 231.35 57.7979 231.614 57.2373C231.878 56.6768 232.256 56.2415 232.749 55.9316C233.245 55.6217 233.831 55.4668 234.506 55.4668C235.335 55.4668 236.023 55.7152 236.57 56.2119C237.121 56.7087 237.415 57.3535 237.452 58.1465H236.256C236.219 57.668 236.037 57.276 235.709 56.9707C235.385 56.6608 234.984 56.5059 234.506 56.5059C233.863 56.5059 233.364 56.7383 233.008 57.2031C232.658 57.6634 232.482 58.3311 232.482 59.2061V59.4453C232.482 60.2975 232.658 60.9538 233.008 61.4141C233.359 61.8743 233.861 62.1045 234.512 62.1045ZM238.819 59.2334C238.819 58.5088 238.96 57.8571 239.243 57.2783C239.53 56.6995 239.926 56.2529 240.432 55.9385C240.942 55.624 241.523 55.4668 242.175 55.4668C243.182 55.4668 243.996 55.8154 244.616 56.5127C245.24 57.21 245.552 58.1374 245.552 59.2949V59.3838C245.552 60.1038 245.413 60.751 245.135 61.3252C244.862 61.8949 244.467 62.3392 243.952 62.6582C243.442 62.9772 242.854 63.1367 242.189 63.1367C241.186 63.1367 240.373 62.7881 239.748 62.0908C239.129 61.3936 238.819 60.4707 238.819 59.3223V59.2334ZM240.09 59.3838C240.09 60.2041 240.279 60.8626 240.658 61.3594C241.04 61.8561 241.551 62.1045 242.189 62.1045C242.831 62.1045 243.342 61.8538 243.72 61.3525C244.098 60.8467 244.287 60.1403 244.287 59.2334C244.287 58.4222 244.094 57.766 243.706 57.2646C243.324 56.7588 242.813 56.5059 242.175 56.5059C241.551 56.5059 241.047 56.7542 240.664 57.251C240.282 57.7477 240.09 58.4587 240.09 59.3838ZM248.607 55.6035L248.642 56.4238C249.184 55.7858 249.915 55.4668 250.836 55.4668C251.871 55.4668 252.575 55.8633 252.948 56.6562C253.194 56.3008 253.513 56.0137 253.905 55.7949C254.302 55.5762 254.769 55.4668 255.307 55.4668C256.929 55.4668 257.754 56.3258 257.781 58.0439V63H256.517V58.1191C256.517 57.5905 256.396 57.1963 256.154 56.9365C255.913 56.6722 255.507 56.54 254.938 56.54C254.468 56.54 254.079 56.6813 253.769 56.9639C253.459 57.2419 253.279 57.6178 253.229 58.0918V63H251.957V58.1533C251.957 57.0778 251.431 56.54 250.378 56.54C249.549 56.54 248.981 56.8932 248.676 57.5996V63H247.411V55.6035H248.607ZM260.228 63.8545H259.141L263.298 53.0469H264.378L260.228 63.8545Z" fill="#4B4D52"/>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M133 56.2676V56V55C133 53.3431 131.657 52 130 52C128.343 52 127 53.3431 127 55V56V56.2676C126.402 56.6134 126 57.2597 126 58V61C126 62.1046 126.895 63 128 63H132C133.105 63 134 62.1046 134 61V58C134 57.2597 133.598 56.6134 133 56.2676ZM128 56H129H131H132V55C132 53.8954 131.105 53 130 53C128.895 53 128 53.8954 128 55V56Z" fill="#4B4D52"/>
                                <rect x="72" y="44" width="28" height="28" fill="white"/>
                                <path d="M86 63.5C88.6961 63.5 90.9391 61.5601 91.4093 59H92.9291C92.4439 62.3923 89.5265 65 86 65C82.134 65 79 61.866 79 58C79 54.134 82.134 51 86 51C88.1877 51 90.141 52.0035 91.4246 53.5754L93 52V57H88L90.357 54.643C89.3513 53.3396 87.7737 52.5 86 52.5C82.9624 52.5 80.5 54.9624 80.5 58C80.5 61.0376 82.9624 63.5 86 63.5Z" fill="#4B4D52"/>
                                <rect x="40" y="44" width="28" height="28" fill="white"/>
                                <path d="M48 57.75H60M60 57.75L54.5 52M60 57.75L54.5 63" stroke="#A9AEB8" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <rect x="8" y="44" width="28" height="28" fill="white"/>
                                <path d="M28 57.75H16M16 57.75L21.5 52M16 57.75L21.5 63" stroke="#4B4D52" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M0 6.4C0 4.15979 0 3.03969 0.435974 2.18404C0.819467 1.43139 1.43139 0.819467 2.18404 0.435974C3.03969 0 4.15979 0 6.4 0H884.6C886.84 0 887.96 0 888.816 0.435974C889.569 0.819467 890.181 1.43139 890.564 2.18404C891 3.03969 891 4.15979 891 6.4V40H0V6.4Z" fill="#E1E4EB"/>
                                <path d="M337 24H347M342 19V29" stroke="#4B4D52" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M80 16C80 11.5817 83.5817 8 88 8H312C316.418 8 320 11.5817 320 16V40H80V16Z" fill="white"/>
                                <rect x="92" y="16" width="16" height="16" rx="3" fill="url(#pattern2)"/>
                                <rect x="92" y="16" width="16" height="16" rx="3" fill="#C8E6A4"/>
                                <path d="M119.592 23.752L121.818 19.4688H123.096L120.154 24.8184V28H119.029V24.8184L116.088 19.4688H117.377L119.592 23.752ZM123.594 24.7715C123.594 24.1504 123.715 23.5918 123.957 23.0957C124.203 22.5996 124.543 22.2168 124.976 21.9473C125.414 21.6777 125.912 21.543 126.47 21.543C127.334 21.543 128.031 21.8418 128.562 22.4395C129.097 23.0371 129.365 23.832 129.365 24.8242V24.9004C129.365 25.5176 129.246 26.0723 129.008 26.5645C128.773 27.0527 128.435 27.4336 127.994 27.707C127.556 27.9805 127.052 28.1172 126.482 28.1172C125.623 28.1172 124.926 27.8184 124.39 27.2207C123.859 26.623 123.594 25.832 123.594 24.8477V24.7715ZM124.683 24.9004C124.683 25.6035 124.845 26.168 125.17 26.5938C125.498 27.0195 125.935 27.2324 126.482 27.2324C127.033 27.2324 127.47 27.0176 127.795 26.5879C128.119 26.1543 128.281 25.5488 128.281 24.7715C128.281 24.0762 128.115 23.5137 127.783 23.084C127.455 22.6504 127.017 22.4336 126.47 22.4336C125.935 22.4336 125.504 22.6465 125.176 23.0723C124.847 23.498 124.683 24.1074 124.683 24.9004ZM134.878 27.373C134.457 27.8691 133.837 28.1172 133.021 28.1172C132.345 28.1172 131.83 27.9219 131.474 27.5312C131.123 27.1367 130.945 26.5547 130.941 25.7852V21.6602H132.025V25.7559C132.025 26.7168 132.416 27.1973 133.197 27.1973C134.025 27.1973 134.576 26.8887 134.849 26.2715V21.6602H135.933V28H134.902L134.878 27.373ZM140.89 22.6328C140.726 22.6055 140.548 22.5918 140.357 22.5918C139.646 22.5918 139.163 22.8945 138.909 23.5V28H137.825V21.6602H138.88L138.898 22.3926C139.253 21.8262 139.757 21.543 140.409 21.543C140.62 21.543 140.781 21.5703 140.89 21.625V22.6328ZM147.358 25.3105L147.522 26.4355L147.763 25.4219L149.45 19.4688H150.399L152.046 25.4219L152.28 26.4531L152.462 25.3047L153.786 19.4688H154.917L152.848 28H151.823L150.065 21.7832L149.93 21.1328L149.796 21.7832L147.973 28H146.948L144.886 19.4688H146.011L147.358 25.3105ZM158.684 28.1172C157.825 28.1172 157.126 27.8359 156.586 27.2734C156.047 26.707 155.778 25.9512 155.778 25.0059V24.8066C155.778 24.1777 155.897 23.6172 156.135 23.125C156.377 22.6289 156.713 22.2422 157.143 21.9648C157.577 21.6836 158.045 21.543 158.549 21.543C159.374 21.543 160.014 21.8145 160.471 22.3574C160.928 22.9004 161.157 23.6777 161.157 24.6895V25.1406H156.862C156.877 25.7656 157.059 26.2715 157.407 26.6582C157.758 27.041 158.204 27.2324 158.743 27.2324C159.126 27.2324 159.45 27.1543 159.715 26.998C159.981 26.8418 160.213 26.6348 160.413 26.377L161.075 26.8926C160.544 27.709 159.747 28.1172 158.684 28.1172ZM158.549 22.4336C158.112 22.4336 157.745 22.5938 157.448 22.9141C157.151 23.2305 156.967 23.6758 156.897 24.25H160.073V24.168C160.042 23.6172 159.893 23.1914 159.627 22.8906C159.362 22.5859 159.002 22.4336 158.549 22.4336ZM168.024 24.9004C168.024 25.8691 167.801 26.6484 167.356 27.2383C166.91 27.8242 166.313 28.1172 165.563 28.1172C164.762 28.1172 164.143 27.834 163.705 27.2676L163.653 28H162.657V19H163.741V22.3574C164.178 21.8145 164.782 21.543 165.551 21.543C166.321 21.543 166.924 21.834 167.362 22.416C167.803 22.998 168.024 23.7949 168.024 24.8066V24.9004ZM166.94 24.7773C166.94 24.0391 166.797 23.4688 166.512 23.0664C166.227 22.6641 165.817 22.4629 165.282 22.4629C164.567 22.4629 164.053 22.7949 163.741 23.459V26.2012C164.073 26.8652 164.59 27.1973 165.293 27.1973C165.813 27.1973 166.217 26.9961 166.506 26.5938C166.795 26.1914 166.94 25.5859 166.94 24.7773ZM173.326 26.3184C173.326 26.0254 173.215 25.7988 172.992 25.6387C172.774 25.4746 172.389 25.334 171.838 25.2168C171.291 25.0996 170.856 24.959 170.531 24.7949C170.211 24.6309 169.973 24.4355 169.816 24.209C169.664 23.9824 169.588 23.7129 169.588 23.4004C169.588 22.8809 169.807 22.4414 170.244 22.082C170.686 21.7227 171.248 21.543 171.932 21.543C172.65 21.543 173.232 21.7285 173.678 22.0996C174.127 22.4707 174.352 22.9453 174.352 23.5234H173.262C173.262 23.2266 173.135 22.9707 172.881 22.7559C172.631 22.541 172.315 22.4336 171.932 22.4336C171.537 22.4336 171.229 22.5195 171.006 22.6914C170.783 22.8633 170.672 23.0879 170.672 23.3652C170.672 23.627 170.775 23.8242 170.982 23.957C171.19 24.0898 171.563 24.2168 172.102 24.3379C172.645 24.459 173.084 24.6035 173.42 24.7715C173.756 24.9395 174.004 25.1426 174.164 25.3809C174.328 25.6152 174.41 25.9023 174.41 26.2422C174.41 26.8086 174.184 27.2637 173.731 27.6074C173.277 27.9473 172.69 28.1172 171.967 28.1172C171.459 28.1172 171.01 28.0273 170.619 27.8477C170.229 27.668 169.922 27.418 169.699 27.0977C169.481 26.7734 169.371 26.4238 169.371 26.0488H170.455C170.475 26.4121 170.619 26.7012 170.889 26.916C171.162 27.127 171.522 27.2324 171.967 27.2324C172.377 27.2324 172.705 27.1504 172.951 26.9863C173.201 26.8184 173.326 26.5957 173.326 26.3184ZM177.24 28H176.156V21.6602H177.24V28ZM176.068 19.9785C176.068 19.8027 176.121 19.6543 176.226 19.5332C176.336 19.4121 176.496 19.3516 176.707 19.3516C176.918 19.3516 177.078 19.4121 177.187 19.5332C177.297 19.6543 177.351 19.8027 177.351 19.9785C177.351 20.1543 177.297 20.3008 177.187 20.418C177.078 20.5352 176.918 20.5938 176.707 20.5938C176.496 20.5938 176.336 20.5352 176.226 20.418C176.121 20.3008 176.068 20.1543 176.068 19.9785ZM180.691 20.125V21.6602H181.875V22.498H180.691V26.4297C180.691 26.6836 180.744 26.875 180.849 27.0039C180.955 27.1289 181.134 27.1914 181.388 27.1914C181.513 27.1914 181.685 27.168 181.904 27.1211V28C181.619 28.0781 181.341 28.1172 181.072 28.1172C180.588 28.1172 180.222 27.9707 179.976 27.6777C179.73 27.3848 179.607 26.9688 179.607 26.4297V22.498H178.453V21.6602H179.607V20.125H180.691ZM186.017 28.1172C185.158 28.1172 184.458 27.8359 183.919 27.2734C183.38 26.707 183.111 25.9512 183.111 25.0059V24.8066C183.111 24.1777 183.23 23.6172 183.468 23.125C183.71 22.6289 184.046 22.2422 184.476 21.9648C184.91 21.6836 185.378 21.543 185.882 21.543C186.706 21.543 187.347 21.8145 187.804 22.3574C188.261 22.9004 188.49 23.6777 188.49 24.6895V25.1406H184.195C184.21 25.7656 184.392 26.2715 184.74 26.6582C185.091 27.041 185.536 27.2324 186.076 27.2324C186.458 27.2324 186.783 27.1543 187.048 26.998C187.314 26.8418 187.546 26.6348 187.745 26.377L188.408 26.8926C187.876 27.709 187.079 28.1172 186.017 28.1172ZM185.882 22.4336C185.445 22.4336 185.077 22.5938 184.781 22.9141C184.484 23.2305 184.3 23.6758 184.23 24.25H187.406V24.168C187.374 23.6172 187.226 23.1914 186.96 22.8906C186.695 22.5859 186.335 22.4336 185.882 22.4336Z" fill="#4B4D52"/>
                                <path d="M303 21L309 27M309 21L303 27" stroke="#4B4D52" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M328 40H320V32C320 36.4183 323.582 40 328 40Z" fill="white"/>
                                <path d="M72 40H80V32C80 36.4183 76.4183 40 72 40Z" fill="white"/>
                                <circle cx="60" cy="24" r="6" fill="#64C255"/>
                                <circle cx="60" cy="24" r="5.75" stroke="black" stroke-opacity="0.16" stroke-width="0.5"/>
                                <circle cx="40" cy="24" r="6" fill="#FFD171"/>
                                <circle cx="40" cy="24" r="5.75" stroke="black" stroke-opacity="0.16" stroke-width="0.5"/>
                                <circle cx="20" cy="24" r="6" fill="#FF796F"/>
                                <circle cx="20" cy="24" r="5.75" stroke="black" stroke-opacity="0.16" stroke-width="0.5"/>
                                <defs>
                                    <filter id="filter0_d" x="0" y="40" width="891" height="37" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                                        <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
                                        <feOffset dy="1"/>
                                        <feColorMatrix type="matrix" values="0 0 0 0 0.937725 0 0 0 0 0.944105 0 0 0 0 0.956863 0 0 0 1 0"/>
                                        <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
                                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
                                    </filter>
                                    <pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
                                        <use xlink:href="#image0" transform="translate(-0.195652) scale(0.00543478)"/>
                                    </pattern>
                                    <pattern id="pattern1" patternContentUnits="objectBoundingBox" width="1" height="1">
                                        <use xlink:href="#image1" transform="scale(0.00390625)"/>
                                    </pattern>
                                    <pattern id="pattern2" patternContentUnits="objectBoundingBox" width="1" height="1">
                                        <use xlink:href="#image2" transform="scale(0.00333333)"/>
                                    </pattern>
                                    <image id="image0" width="256" height="184" xlink:href="data:image/jpeg;base64,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"/>
                                    <image id="image1" width="256" height="256" xlink:href="data:image/jpeg;base64,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"/>
                                    <image id="image2" width="300" height="300" xlink:href="data:image/png;base64,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"/>
                                </defs>
                            </svg>
                            <svg id="device-tablet" class="hidden" width="100%" viewBox="0 0 891 77"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <defs>
                                    <filter color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse" height="37" width="891" y="40" x="0" id="filter0_d"/>
                                    <image xlink:href="data:image/jpeg;base64,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" height="184" width="256" id="image0"/>
                                    <image xlink:href="data:image/jpeg;base64,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" height="256" width="256" id="image1"/>
                                    <image xlink:href="data:image/png;base64,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" height="300" width="300" id="image2"/>
                                    <pattern height="1" width="1" patternContentUnits="objectBoundingBox" id="pattern0">
                                        <use id="svg_1" transform="translate(-0.195652) scale(0.00543478)" xlink:href="#image0"/>
                                    </pattern>
                                    <pattern height="1" width="1" patternContentUnits="objectBoundingBox" id="pattern1">
                                        <use id="svg_2" transform="scale(0.00390625)" xlink:href="#image1"/>
                                    </pattern>
                                    <pattern height="1" width="1" patternContentUnits="objectBoundingBox" id="pattern2">
                                        <use id="svg_3" transform="scale(0.00333333)" xlink:href="#image2"/>
                                    </pattern>
                                </defs>
                                <g>
                                    <title>Layer 1</title>
                                    <rect x="0" id="svg_4" fill="white" height="36" width="891" y="40"/>
                                    <g id="svg_5" filter="url(#filter0_d)">
                                        <rect id="svg_6" fill="white" height="36" width="891" y="36"/>
                                    </g>
                                    <path transform="rotate(90.8204 867.667 58)" id="svg_7" fill="#4B4D52" d="m869.16665,53c0,0.8284 -0.672,1.5 -1.5,1.5c-0.828,0 -1.5,-0.6716 -1.5,-1.5c0,-0.8284 0.672,-1.5 1.5,-1.5c0.828,0 1.5,0.6716 1.5,1.5zm0,5c0,0.8284 -0.672,1.5 -1.5,1.5c-0.828,0 -1.5,-0.6716 -1.5,-1.5c0,-0.8284 0.672,-1.5 1.5,-1.5c0.828,0 1.5,0.6716 1.5,1.5zm-1.5,6.5c0.828,0 1.5,-0.6716 1.5,-1.5c0,-0.8284 -0.672,-1.5 -1.5,-1.5c-0.828,0 -1.5,0.6716 -1.5,1.5c0,0.8284 0.672,1.5 1.5,1.5z" clip-rule="evenodd" fill-rule="evenodd"/>
                                    <rect id="svg_10" fill="#EFF1F4" rx="14" height="28" width="699" y="44" x="111.33332"/>
                                    <path id="svg_12" fill="#4B4D52" d="m151.377,61.1475l1.723,-5.544l1.353,0l-2.974,8.5381c-0.46,1.2305 -1.191,1.8457 -2.194,1.8457l-0.239,-0.0205l-0.472,-0.0889l0,-1.0254l0.342,0.0274c0.428,0 0.761,-0.0866 0.998,-0.2598c0.242,-0.1732 0.44,-0.4899 0.595,-0.9502l0.28,-0.7519l-2.639,-7.3145l1.381,0l1.846,5.544zm4.047,-1.9141c0,-0.7246 0.141,-1.3763 0.423,-1.9551c0.287,-0.5788 0.684,-1.0254 1.19,-1.3398c0.51,-0.3145 1.091,-0.4717 1.743,-0.4717c1.007,0 1.821,0.3486 2.44,1.0459c0.625,0.6973 0.937,1.6247 0.937,2.7822l0,0.0889c0,0.72 -0.139,1.3672 -0.417,1.9414c-0.273,0.5697 -0.668,1.014 -1.183,1.333c-0.51,0.319 -1.098,0.4785 -1.763,0.4785c-1.003,0 -1.816,-0.3486 -2.441,-1.0459c-0.62,-0.6972 -0.929,-1.6201 -0.929,-2.7685l0,-0.0889zm1.271,0.1504c0,0.8203 0.189,1.4788 0.567,1.9756c0.383,0.4967 0.894,0.7451 1.532,0.7451c0.642,0 1.153,-0.2507 1.531,-0.752c0.378,-0.5058 0.567,-1.2122 0.567,-2.1191c0,-0.8112 -0.193,-1.4674 -0.581,-1.9688c-0.383,-0.5058 -0.893,-0.7587 -1.531,-0.7587c-0.624,0 -1.128,0.2483 -1.511,0.7451c-0.383,0.4967 -0.574,1.2077 -0.574,2.1328zm11.894,2.8848c-0.492,0.5787 -1.214,0.8681 -2.167,0.8681c-0.788,0 -1.39,-0.2278 -1.804,-0.6836c-0.411,-0.4603 -0.618,-1.1393 -0.622,-2.0371l0,-4.8125l1.264,0l0,4.7783c0,1.1211 0.456,1.6817 1.367,1.6817c0.967,0 1.609,-0.36 1.928,-1.0801l0,-5.3799l1.265,0l0,7.3965l-1.203,0l-0.028,-0.7314zm7.014,-5.5303c-0.192,-0.0319 -0.399,-0.0479 -0.622,-0.0479c-0.83,0 -1.393,0.3532 -1.689,1.0596l0,5.25l-1.264,0l0,-7.3965l1.23,0l0.02,0.8545c0.415,-0.6608 1.003,-0.9912 1.764,-0.9912c0.246,0 0.433,0.0319 0.561,0.0957l0,1.1758zm8.121,4.5185l1.421,-5.6533l1.265,0l-2.153,7.3965l-1.026,0l-1.798,-5.6055l-1.75,5.6055l-1.025,0l-2.146,-7.3965l1.257,0l1.456,5.5371l1.723,-5.5371l1.019,0l1.757,5.6533zm7.327,1.8799c-1.002,0 -1.818,-0.3281 -2.447,-0.9844c-0.629,-0.6608 -0.943,-1.5426 -0.943,-2.6455l0,-0.2324c0,-0.7337 0.139,-1.3877 0.417,-1.9619c0.282,-0.5788 0.674,-1.0299 1.176,-1.3535c0.505,-0.3281 1.052,-0.4922 1.64,-0.4922c0.962,0 1.709,0.3167 2.242,0.9502c0.534,0.6335 0.8,1.5404 0.8,2.7207l0,0.5264l-5.011,0c0.019,0.7291 0.231,1.3193 0.636,1.7705c0.41,0.4466 0.93,0.6699 1.559,0.6699c0.446,0 0.825,-0.0912 1.134,-0.2734c0.31,-0.1823 0.582,-0.4239 0.814,-0.7247l0.772,0.6016c-0.619,0.9525 -1.549,1.4287 -2.789,1.4287zm-0.157,-6.6308c-0.51,0 -0.939,0.1868 -1.285,0.5605c-0.346,0.3691 -0.561,0.8887 -0.643,1.5586l3.705,0l0,-0.0957c-0.036,-0.6426 -0.209,-1.1393 -0.519,-1.4902c-0.31,-0.3555 -0.729,-0.5332 -1.258,-0.5332zm11.054,2.8779c0,1.1302 -0.26,2.0394 -0.78,2.7275c-0.519,0.6836 -1.217,1.0254 -2.092,1.0254c-0.934,0 -1.656,-0.3304 -2.167,-0.9912l-0.061,0.8545l-1.162,0l0,-10.5l1.265,0l0,3.917c0.51,-0.6335 1.214,-0.9502 2.112,-0.9502c0.898,0 1.602,0.3395 2.112,1.0186c0.515,0.679 0.773,1.6087 0.773,2.789l0,0.1094zm-1.265,-0.1436c0,-0.8613 -0.166,-1.5267 -0.499,-1.9961c-0.333,-0.4694 -0.811,-0.7041 -1.436,-0.7041c-0.834,0 -1.433,0.3874 -1.797,1.1621l0,3.1993c0.387,0.7747 0.991,1.1621 1.811,1.1621c0.606,0 1.078,-0.2347 1.415,-0.7041c0.337,-0.4694 0.506,-1.1758 0.506,-2.1192zm7.451,1.7979c0,-0.3418 -0.13,-0.6061 -0.39,-0.793c-0.255,-0.1914 -0.704,-0.3555 -1.347,-0.4922c-0.638,-0.1367 -1.146,-0.3008 -1.524,-0.4922c-0.374,-0.1914 -0.652,-0.4192 -0.834,-0.6836c-0.178,-0.2643 -0.267,-0.5787 -0.267,-0.9433c0,-0.6061 0.256,-1.1188 0.766,-1.5381c0.515,-0.4193 1.171,-0.6289 1.969,-0.6289c0.838,0 1.517,0.2165 2.037,0.6494c0.524,0.433 0.786,0.9867 0.786,1.6611l-1.271,0c0,-0.3463 -0.148,-0.6448 -0.445,-0.8955c-0.291,-0.2506 -0.661,-0.3759 -1.107,-0.3759c-0.46,0 -0.82,0.1002 -1.08,0.3007c-0.26,0.2006 -0.39,0.4626 -0.39,0.7862c0,0.3053 0.121,0.5355 0.362,0.6904c0.242,0.155 0.677,0.3031 1.306,0.4443c0.634,0.1413 1.146,0.3099 1.538,0.5059c0.392,0.196 0.682,0.4329 0.868,0.7109c0.192,0.2735 0.287,0.6084 0.287,1.0049c0,0.6608 -0.264,1.1918 -0.792,1.5928c-0.529,0.3965 -1.215,0.5947 -2.058,0.5947c-0.593,0 -1.117,-0.1048 -1.572,-0.3144c-0.456,-0.2097 -0.814,-0.5013 -1.074,-0.875c-0.255,-0.3783 -0.382,-0.7862 -0.382,-1.2237l1.264,0c0.023,0.4239 0.192,0.7611 0.506,1.0118c0.319,0.246 0.738,0.3691 1.258,0.3691c0.478,0 0.861,-0.0957 1.148,-0.2871c0.292,-0.196 0.438,-0.4557 0.438,-0.7793zm4.566,1.9619l-1.265,0l0,-7.3965l1.265,0l0,7.3965zm-1.367,-9.3584c0,-0.2051 0.061,-0.3783 0.184,-0.5195c0.128,-0.1413 0.315,-0.2119 0.561,-0.2119c0.246,0 0.433,0.0706 0.56,0.2119c0.128,0.1412 0.192,0.3144 0.192,0.5195c0,0.2051 -0.064,0.376 -0.192,0.5127c-0.127,0.1367 -0.314,0.2051 -0.56,0.2051c-0.246,0 -0.433,-0.0684 -0.561,-0.2051c-0.123,-0.1367 -0.184,-0.3076 -0.184,-0.5127zm5.393,0.1709l0,1.791l1.381,0l0,0.9776l-1.381,0l0,4.5869c0,0.2962 0.062,0.5195 0.185,0.6699c0.123,0.1458 0.332,0.2187 0.629,0.2187c0.145,0 0.346,-0.0273 0.601,-0.082l0,1.0254c-0.333,0.0911 -0.656,0.1367 -0.971,0.1367c-0.565,0 -0.991,-0.1709 -1.278,-0.5127c-0.287,-0.3418 -0.431,-0.8271 -0.431,-1.456l0,-4.5869l-1.346,0l0,-0.9776l1.346,0l0,-1.791l1.265,0zm6.214,9.3242c-1.003,0 -1.819,-0.3281 -2.448,-0.9844c-0.629,-0.6608 -0.943,-1.5426 -0.943,-2.6455l0,-0.2324c0,-0.7337 0.139,-1.3877 0.417,-1.9619c0.283,-0.5788 0.674,-1.0299 1.176,-1.3535c0.506,-0.3281 1.053,-0.4922 1.64,-0.4922c0.962,0 1.709,0.3167 2.243,0.9502c0.533,0.6335 0.799,1.5404 0.799,2.7207l0,0.5264l-5.01,0c0.018,0.7291 0.23,1.3193 0.635,1.7705c0.411,0.4466 0.93,0.6699 1.559,0.6699c0.447,0 0.825,-0.0912 1.135,-0.2734c0.31,-0.1823 0.581,-0.4239 0.813,-0.7247l0.773,0.6016c-0.62,0.9525 -1.55,1.4287 -2.789,1.4287zm-0.158,-6.6308c-0.51,0 -0.938,0.1868 -1.285,0.5605c-0.346,0.3691 -0.56,0.8887 -0.642,1.5586l3.705,0l0,-0.0957c-0.037,-0.6426 -0.21,-1.1393 -0.52,-1.4902c-0.31,-0.3555 -0.729,-0.5332 -1.258,-0.5332zm4.819,5.831c0,-0.2187 0.064,-0.401 0.192,-0.5469c0.132,-0.1458 0.328,-0.2187 0.588,-0.2187c0.26,0 0.456,0.0729 0.588,0.2187c0.136,0.1459 0.205,0.3282 0.205,0.5469c0,0.2096 -0.069,0.3851 -0.205,0.5264c-0.132,0.1413 -0.328,0.2119 -0.588,0.2119c-0.26,0 -0.456,-0.0706 -0.588,-0.2119c-0.128,-0.1413 -0.192,-0.3168 -0.192,-0.5264zm6.911,-0.2324c0.452,0 0.846,-0.1367 1.183,-0.4102c0.337,-0.2734 0.524,-0.6152 0.561,-1.0254l1.196,0c-0.023,0.4239 -0.169,0.8272 -0.438,1.21c-0.269,0.3828 -0.629,0.6882 -1.08,0.916c-0.446,0.2279 -0.92,0.3418 -1.422,0.3418c-1.007,0 -1.809,-0.3349 -2.406,-1.0049c-0.592,-0.6744 -0.889,-1.595 -0.889,-2.7617l0,-0.2119c0,-0.72 0.133,-1.3603 0.397,-1.9209c0.264,-0.5605 0.642,-0.9958 1.135,-1.3057c0.496,-0.3099 1.082,-0.4648 1.757,-0.4648c0.829,0 1.517,0.2484 2.064,0.7451c0.551,0.4968 0.845,1.1416 0.882,1.9346l-1.196,0c-0.037,-0.4785 -0.219,-0.8705 -0.547,-1.1758c-0.324,-0.3099 -0.725,-0.4648 -1.203,-0.4648c-0.643,0 -1.142,0.2324 -1.498,0.6972c-0.35,0.4603 -0.526,1.128 -0.526,2.003l0,0.2392c0,0.8522 0.176,1.5085 0.526,1.9688c0.351,0.4602 0.853,0.6904 1.504,0.6904zm4.307,-2.8711c0,-0.7246 0.141,-1.3763 0.424,-1.9551c0.287,-0.5788 0.683,-1.0254 1.189,-1.3398c0.51,-0.3145 1.091,-0.4717 1.743,-0.4717c1.007,0 1.821,0.3486 2.441,1.0459c0.624,0.6973 0.936,1.6247 0.936,2.7822l0,0.0889c0,0.72 -0.139,1.3672 -0.417,1.9414c-0.273,0.5697 -0.668,1.014 -1.183,1.333c-0.51,0.319 -1.098,0.4785 -1.763,0.4785c-1.003,0 -1.816,-0.3486 -2.441,-1.0459c-0.619,-0.6972 -0.929,-1.6201 -0.929,-2.7685l0,-0.0889zm1.271,0.1504c0,0.8203 0.189,1.4788 0.568,1.9756c0.382,0.4967 0.893,0.7451 1.531,0.7451c0.642,0 1.153,-0.2507 1.531,-0.752c0.378,-0.5058 0.567,-1.2122 0.567,-2.1191c0,-0.8112 -0.193,-1.4674 -0.581,-1.9688c-0.382,-0.5058 -0.893,-0.7587 -1.531,-0.7587c-0.624,0 -1.128,0.2483 -1.511,0.7451c-0.382,0.4967 -0.574,1.2077 -0.574,2.1328zm8.517,-3.7803l0.035,0.8203c0.542,-0.638 1.273,-0.957 2.194,-0.957c1.035,0 1.739,0.3965 2.112,1.1894c0.246,-0.3554 0.565,-0.6425 0.957,-0.8613c0.397,-0.2187 0.864,-0.3281 1.402,-0.3281c1.622,0 2.447,0.859 2.474,2.5771l0,4.9561l-1.264,0l0,-4.8809c0,-0.5286 -0.121,-0.9228 -0.363,-1.1826c-0.241,-0.2643 -0.647,-0.3965 -1.216,-0.3965c-0.47,0 -0.859,0.1413 -1.169,0.4239c-0.31,0.278 -0.49,0.6539 -0.54,1.1279l0,4.9082l-1.272,0l0,-4.8467c0,-1.0755 -0.526,-1.6133 -1.579,-1.6133c-0.829,0 -1.397,0.3532 -1.702,1.0596l0,5.4004l-1.265,0l0,-7.3965l1.196,0zm11.621,8.251l-1.087,0l4.157,-10.8076l1.08,0l-4.15,10.8076z"/>
                                    <path id="svg_13" fill="#4B4D52" d="m133,56.2676l0,-0.2676l0,-1c0,-1.6569 -1.343,-3 -3,-3c-1.657,0 -3,1.3431 -3,3l0,1l0,0.2676c-0.598,0.3458 -1,0.9921 -1,1.7324l0,3c0,1.1046 0.895,2 2,2l4,0c1.105,0 2,-0.8954 2,-2l0,-3c0,-0.7403 -0.402,-1.3866 -1,-1.7324zm-5,-0.2676l1,0l2,0l1,0l0,-1c0,-1.1046 -0.895,-2 -2,-2c-1.105,0 -2,0.8954 -2,2l0,1z" clip-rule="evenodd" fill-rule="evenodd"/>
                                    <rect id="svg_14" fill="white" height="28" width="28" y="44" x="72"/>
                                    <path id="svg_15" fill="#4B4D52" d="m86,63.5c2.6961,0 4.9391,-1.9399 5.4093,-4.5l1.5198,0c-0.4852,3.3923 -3.4026,6 -6.9291,6c-3.866,0 -7,-3.134 -7,-7c0,-3.866 3.134,-7 7,-7c2.1877,0 4.141,1.0035 5.4246,2.5754l1.5754,-1.5754l0,5l-5,0l2.357,-2.357c-1.0057,-1.3034 -2.5833,-2.143 -4.357,-2.143c-3.0376,0 -5.5,2.4624 -5.5,5.5c0,3.0376 2.4624,5.5 5.5,5.5z"/>
                                    <rect id="svg_16" fill="white" height="28" width="28" y="44" x="40"/>
                                    <path id="svg_17" stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#A9AEB8" d="m48,57.75l12,0m0,0l-5.5,-5.75m5.5,5.75l-5.5,5.25"/>
                                    <rect id="svg_18" fill="white" height="28" width="28" y="44" x="8"/>
                                    <path id="svg_19" stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#4B4D52" d="m28,57.75l-12,0m0,0l5.5,-5.75m-5.5,5.75l5.5,5.25"/>
                                    <path id="svg_20" fill="#E1E4EB" d="m0,6.4c0,-2.24021 0,-3.36031 0.43597,-4.21596c0.3835,-0.75265 0.99542,-1.36457 1.74807,-1.74807c0.85565,-0.43597 1.97575,-0.43597 4.21596,-0.43597l878.2,0c2.24,0 3.36,0 4.216,0.43597c0.753,0.3835 1.365,0.99542 1.748,1.74807c0.436,0.85565 0.436,1.97575 0.436,4.21596l0,33.6l-891,0l0,-33.6z"/>
                                    <path id="svg_21" stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="#4B4D52" d="m270,24l10,0m-5,-5l0,10"/>
                                    <path id="svg_22" fill="white" d="m13,16c0,-4.4183 3.5817,-8 8,-8l224,0c4.418,0 8,3.5817 8,8l0,24l-240,0l0,-24z"/>
                                    <rect id="svg_23" fill="url(#pattern2)" rx="3" height="16" width="16" y="16" x="25"/>
                                    <rect id="svg_24" fill="#C8E6A4" rx="3" height="16" width="16" y="16" x="25"/>
                                    <path id="svg_25" fill="#4B4D52" d="m52.592,23.752l2.226,-4.2832l1.278,0l-2.942,5.3496l0,3.1816l-1.125,0l0,-3.1816l-2.941,-5.3496l1.289,0l2.215,4.2832zm4.002,1.0195c0,-0.6211 0.121,-1.1797 0.363,-1.6758c0.246,-0.4961 0.586,-0.8789 1.019,-1.1484c0.438,-0.2696 0.936,-0.4043 1.494,-0.4043c0.864,0 1.561,0.2988 2.092,0.8965c0.535,0.5976 0.803,1.3925 0.803,2.3847l0,0.0762c0,0.6172 -0.119,1.1719 -0.357,1.6641c-0.235,0.4882 -0.573,0.8691 -1.014,1.1425c-0.438,0.2735 -0.942,0.4102 -1.512,0.4102c-0.859,0 -1.556,-0.2988 -2.092,-0.8965c-0.531,-0.5977 -0.796,-1.3887 -0.796,-2.373l0,-0.0762zm1.089,0.1289c0,0.7031 0.162,1.2676 0.487,1.6934c0.328,0.4257 0.765,0.6386 1.312,0.6386c0.551,0 0.988,-0.2148 1.313,-0.6445c0.324,-0.4336 0.486,-1.0391 0.486,-1.8164c0,-0.6953 -0.166,-1.2578 -0.498,-1.6875c-0.328,-0.4336 -0.766,-0.6504 -1.313,-0.6504c-0.535,0 -0.966,0.2129 -1.294,0.6387c-0.329,0.4257 -0.493,1.0351 -0.493,1.8281zm10.195,2.4726c-0.421,0.4961 -1.041,0.7442 -1.857,0.7442c-0.676,0 -1.191,-0.1953 -1.547,-0.586c-0.351,-0.3945 -0.529,-0.9765 -0.533,-1.746l0,-4.125l1.084,0l0,4.0957c0,0.9609 0.391,1.4414 1.172,1.4414c0.828,0 1.379,-0.3086 1.652,-0.9258l0,-4.6113l1.084,0l0,6.3398l-1.031,0l-0.024,-0.627zm6.012,-4.7402c-0.164,-0.0273 -0.342,-0.041 -0.533,-0.041c-0.711,0 -1.194,0.3027 -1.448,0.9082l0,4.5l-1.084,0l0,-6.3398l1.055,0l0.018,0.7324c0.355,-0.5664 0.859,-0.8496 1.511,-0.8496c0.211,0 0.372,0.0273 0.481,0.082l0,1.0078zm6.468,2.6777l0.164,1.125l0.241,-1.0136l1.687,-5.9531l0.949,0l1.647,5.9531l0.234,1.0312l0.182,-1.1484l1.324,-5.8359l1.131,0l-2.069,8.5312l-1.025,0l-1.758,-6.2168l-0.135,-0.6504l-0.134,0.6504l-1.823,6.2168l-1.025,0l-2.062,-8.5312l1.125,0l1.347,5.8417zm11.326,2.8067c-0.859,0 -1.558,-0.2813 -2.098,-0.8438c-0.539,-0.5664 -0.808,-1.3222 -0.808,-2.2675l0,-0.1993c0,-0.6289 0.119,-1.1894 0.357,-1.6816c0.242,-0.4961 0.578,-0.8828 1.008,-1.1602c0.434,-0.2812 0.902,-0.4218 1.406,-0.4218c0.825,0 1.465,0.2715 1.922,0.8144c0.457,0.543 0.686,1.3203 0.686,2.3321l0,0.4511l-4.295,0c0.015,0.625 0.197,1.1309 0.545,1.5176c0.351,0.3828 0.797,0.5742 1.336,0.5742c0.383,0 0.707,-0.0781 0.972,-0.2344c0.266,-0.1562 0.498,-0.3632 0.698,-0.621l0.662,0.5156c-0.531,0.8164 -1.328,1.2246 -2.391,1.2246zm-0.135,-5.6836c-0.437,0 -0.804,0.1602 -1.101,0.4805c-0.297,0.3164 -0.481,0.7617 -0.551,1.3359l3.176,0l0,-0.082c-0.031,-0.5508 -0.18,-0.9766 -0.446,-1.2774c-0.265,-0.3047 -0.625,-0.457 -1.078,-0.457zm9.475,2.4668c0,0.9687 -0.223,1.748 -0.668,2.3379c-0.446,0.5859 -1.043,0.8789 -1.793,0.8789c-0.801,0 -1.42,-0.2832 -1.858,-0.8496l-0.052,0.7324l-0.996,0l0,-9l1.084,0l0,3.3574c0.437,-0.5429 1.041,-0.8144 1.81,-0.8144c0.77,0 1.373,0.291 1.811,0.873c0.441,0.582 0.662,1.3789 0.662,2.3906l0,0.0938zm-1.084,-0.1231c0,-0.7382 -0.143,-1.3085 -0.428,-1.7109c-0.285,-0.4023 -0.695,-0.6035 -1.23,-0.6035c-0.715,0 -1.229,0.332 -1.541,0.9961l0,2.7422c0.332,0.664 0.849,0.9961 1.552,0.9961c0.52,0 0.924,-0.2012 1.213,-0.6035c0.289,-0.4024 0.434,-1.0079 0.434,-1.8165zm6.386,1.5411c0,-0.293 -0.111,-0.5196 -0.334,-0.6797c-0.218,-0.1641 -0.603,-0.3047 -1.154,-0.4219c-0.547,-0.1172 -0.982,-0.2578 -1.307,-0.4219c-0.32,-0.164 -0.558,-0.3594 -0.715,-0.5859c-0.152,-0.2266 -0.228,-0.4961 -0.228,-0.8086c0,-0.5195 0.219,-0.959 0.656,-1.3184c0.442,-0.3593 1.004,-0.539 1.688,-0.539c0.718,0 1.3,0.1855 1.746,0.5566c0.449,0.3711 0.674,0.8457 0.674,1.4238l-1.09,0c0,-0.2968 -0.127,-0.5527 -0.381,-0.7675c-0.25,-0.2149 -0.566,-0.3223 -0.949,-0.3223c-0.395,0 -0.703,0.0859 -0.926,0.2578c-0.223,0.1719 -0.334,0.3965 -0.334,0.6738c0,0.2618 0.103,0.459 0.31,0.5918c0.208,0.1328 0.581,0.2598 1.12,0.3809c0.543,0.1211 0.982,0.2656 1.318,0.4336c0.336,0.168 0.584,0.3711 0.744,0.6094c0.164,0.2343 0.246,0.5214 0.246,0.8613c0,0.5664 -0.226,1.0215 -0.679,1.3652c-0.454,0.3399 -1.041,0.5098 -1.764,0.5098c-0.508,0 -0.957,-0.0899 -1.348,-0.2695c-0.39,-0.1797 -0.697,-0.4297 -0.92,-0.75c-0.218,-0.3243 -0.328,-0.6739 -0.328,-1.0489l1.084,0c0.02,0.3633 0.164,0.6524 0.434,0.8672c0.273,0.211 0.633,0.3164 1.078,0.3164c0.41,0 0.738,-0.082 0.984,-0.2461c0.25,-0.1679 0.375,-0.3906 0.375,-0.6679zm3.914,1.6816l-1.084,0l0,-6.3398l1.084,0l0,6.3398zm-1.172,-8.0215c0,-0.1758 0.053,-0.3242 0.158,-0.4453c0.11,-0.1211 0.27,-0.1816 0.481,-0.1816c0.211,0 0.371,0.0605 0.48,0.1816c0.11,0.1211 0.164,0.2695 0.164,0.4453c0,0.1758 -0.054,0.3223 -0.164,0.4395c-0.109,0.1172 -0.269,0.1758 -0.48,0.1758c-0.211,0 -0.371,-0.0586 -0.481,-0.1758c-0.105,-0.1172 -0.158,-0.2637 -0.158,-0.4395zm4.623,0.1465l0,1.5352l1.184,0l0,0.8378l-1.184,0l0,3.9317c0,0.2539 0.053,0.4453 0.158,0.5742c0.106,0.125 0.285,0.1875 0.539,0.1875c0.125,0 0.297,-0.0234 0.516,-0.0703l0,0.8789c-0.285,0.0781 -0.563,0.1172 -0.832,0.1172c-0.484,0 -0.85,-0.1465 -1.096,-0.4395c-0.246,-0.2929 -0.369,-0.7089 -0.369,-1.248l0,-3.9317l-1.154,0l0,-0.8378l1.154,0l0,-1.5352l1.084,0zm5.326,7.9922c-0.859,0 -1.559,-0.2813 -2.098,-0.8438c-0.539,-0.5664 -0.808,-1.3222 -0.808,-2.2675l0,-0.1993c0,-0.6289 0.119,-1.1894 0.357,-1.6816c0.242,-0.4961 0.578,-0.8828 1.008,-1.1602c0.434,-0.2812 0.902,-0.4218 1.406,-0.4218c0.824,0 1.465,0.2715 1.922,0.8144c0.457,0.543 0.686,1.3203 0.686,2.3321l0,0.4511l-4.295,0c0.015,0.625 0.197,1.1309 0.545,1.5176c0.351,0.3828 0.796,0.5742 1.336,0.5742c0.382,0 0.707,-0.0781 0.972,-0.2344c0.266,-0.1562 0.498,-0.3632 0.697,-0.621l0.663,0.5156c-0.532,0.8164 -1.329,1.2246 -2.391,1.2246zm-0.135,-5.6836c-0.437,0 -0.805,0.1602 -1.101,0.4805c-0.297,0.3164 -0.481,0.7617 -0.551,1.3359l3.176,0l0,-0.082c-0.032,-0.5508 -0.18,-0.9766 -0.446,-1.2774c-0.265,-0.3047 -0.625,-0.457 -1.078,-0.457z"/>
                                    <path id="svg_26" stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#4B4D52" d="m236,21l6,6m0,-6l-6,6"/>
                                    <path id="svg_27" fill="white" d="m261,40l-8,0l0,-8c0,4.4183 3.582,8 8,8z"/>
                                    <path id="svg_28" fill="white" d="m5,40l8,0l0,-8c0,4.4183 -3.5817,8 -8,8z"/>
                                    <g opacity="0.6" stroke="null" id="svg_79">
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.292387 496.244 42.9261)" id="svg_61">
                                            <path stroke="null" id="svg_62" d="m1249.38768,43.63224l-10.112,0l0,6l10.112,0c3.007,0 5.34,1.536 5.34,2.858l0,26.606c0,1.322 -2.333,2.858 -5.34,2.858l-38.222,0c-3.007,0 -5.34,-1.536 -5.34,-2.858l0,-26.605c0,-1.322 2.333,-2.858 5.34,-2.858l10.11,0l0,-6l-10.11,0c-6.359,0 -11.34,3.891 -11.34,8.858l0,26.606c0,4.968 4.981,8.858 11.34,8.858l38.223,0c6.358,0 11.34,-3.891 11.34,-8.858l0,-26.606c-0.001,-4.968 -4.982,-8.859 -11.341,-8.859z"/>
                                            <path stroke="null" id="svg_63" d="m1221.39868,35.23924c0.768,0 1.535,-0.293 2.121,-0.879l3.756,-3.756l0,13.028l0,6l0,11.494c0,1.657 1.343,3 3,3s3,-1.343 3,-3l0,-11.494l0,-6l0,-13.231l3.959,3.959c0.586,0.586 1.354,0.879 2.121,0.879s1.535,-0.293 2.121,-0.879c1.172,-1.171 1.172,-3.071 0,-4.242l-8.957,-8.957c-0.586,-0.586 -1.353,-0.877 -2.12,-0.877c-0.008,0 -0.015,0 -0.023,0s-0.015,0 -0.023,0c-0.767,0 -1.534,0.291 -2.12,0.877l-8.957,8.957c-1.172,1.171 -1.172,3.071 0,4.242c0.587,0.586 1.354,0.879 2.122,0.879z"/>
                                        </g>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_64"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_65"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_66"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_67"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_68"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_69"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_70"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_71"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_72"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_73"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_74"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_75"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_76"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_77"/>
                                        <g stroke="null" transform="matrix(0.274197 0 0 0.279177 496.244 44.0521)" id="svg_78"/>
                                    </g>
                                    <g opacity="0.6" stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_84">
                                        <g stroke="null" id="svg_85">
                                            <path stroke="null" id="svg_86" fill="#010002" d="m6451.53167,397.85402l5.744,0c22.447,0 40.641,-18.194 40.641,-40.641l0,-92.768c0,-22.447 -18.194,-40.641 -40.641,-40.641l-5.744,0c-22.447,0 -40.641,18.194 -40.641,40.641l0,92.769c0.001,22.446 18.194,40.64 40.641,40.64z"/>
                                            <path stroke="null" id="svg_87" fill="#010002" d="m6448.96467,424.95102l0,43.61l-38.073,0c-4.504,0 -8.159,3.65 -8.159,8.159s3.655,8.159 8.159,8.159l92.464,0c4.504,0 8.159,-3.65 8.159,-8.159s-3.655,-8.159 -8.159,-8.159l-38.073,0l0,-43.823c34.832,-3.138 63.262,-34.44 63.262,-71.208c0,-4.509 -3.655,-8.159 -8.159,-8.159s-8.159,3.65 -8.159,8.159c0,29.92 -24.122,55.201 -52.672,55.201l-8.686,0c-28.544,0 -52.666,-24.699 -52.666,-53.939c0,-4.509 -3.655,-8.159 -8.159,-8.159s-8.159,3.65 -8.159,8.159c0,38.085 29.926,69.121 67.08,70.159z"/>
                                        </g>
                                    </g>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_88"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_89"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_90"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_91"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_92"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_93"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_94"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_95"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_96"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_97"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_98"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_99"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_100"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_101"/>
                                    <g stroke="null" transform="matrix(0.0747336 0 0 0.0747336 307.083 31.5131)" id="svg_102"/>
                                </g>
                            </svg>
                            <svg id="device-mobile" class="hidden" width="100%" viewBox="0 0 891 77"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g>
                                    <title>Layer 1</title>
                                    <rect stroke="null" x="16.33334" y="9" width="854.99998" height="57" rx="28" fill="#EFF1F4" id="svg_10"/>
                                    <path stroke="null" d="m338.45886,42.22206l3.3685,-10.83863l2.64514,0l-5.81423,16.69215c-0.89931,2.40565 -2.32843,3.60838 -4.28931,3.60838l-0.46725,-0.04008l-0.92277,-0.1738l0,-2.00468l0.66862,0.05357c0.83675,0 1.48777,-0.1693 1.95111,-0.50791c0.47311,-0.33861 0.86021,-0.95776 1.16324,-1.85766l0.54741,-1.46998l-5.1593,-14.29999l2.69988,0l3.60897,10.83863zm7.91196,-3.7421c0,-1.41661 0.27566,-2.69069 0.82697,-3.82226c0.56109,-1.13157 1.33723,-2.00468 2.32647,-2.61933c0.99706,-0.61485 2.13293,-0.92218 3.4076,-0.92218c1.9687,0 3.56009,0.68152 4.77025,2.04475c1.22189,1.36324 1.83185,3.17632 1.83185,5.43925l0,0.1738c0,1.40761 -0.27175,2.6729 -0.81524,3.79547c-0.53372,1.11377 -1.30595,1.98239 -2.31279,2.60604c-0.99706,0.62365 -2.14661,0.93548 -3.4467,0.93548c-1.96088,0 -3.55032,-0.68152 -4.7722,-2.04475c-1.21211,-1.36304 -1.81621,-3.16733 -1.81621,-5.41247l0,-0.1738zm2.48483,0.29403c0,1.6037 0.3695,2.89108 1.1085,3.86234c0.74877,0.97106 1.74779,1.45668 2.99509,1.45668c1.25512,0 2.25414,-0.49012 2.99313,-1.47017c0.739,-0.98885 1.1085,-2.36987 1.1085,-4.14288c0,-1.58591 -0.37732,-2.8688 -1.13587,-3.84904c-0.74877,-0.98885 -1.74583,-1.48327 -2.99313,-1.48327c-1.21993,0 -2.20526,0.48543 -2.95403,1.45668c-0.74877,0.97106 -1.12218,2.36108 -1.12218,4.16967zm23.253,5.63984c-0.96187,1.13137 -2.37339,1.69715 -4.23653,1.69715c-1.54056,0 -2.71748,-0.44535 -3.52685,-1.33645c-0.80351,-0.8999 -1.2082,-2.22735 -1.21602,-3.98257l0,-9.40853l2.47114,0l0,9.34167c0,2.19177 0.89149,3.28776 2.67251,3.28776c1.8905,0 3.14563,-0.70381 3.76928,-2.11162l0,-10.51781l2.4731,0l0,14.4603l-2.35189,0l-0.05474,-1.4299zm13.71251,-10.81184c-0.37536,-0.06237 -0.78005,-0.09365 -1.21602,-0.09365c-1.62267,0 -2.72334,0.69051 -3.30203,2.07154l0,10.26385l-2.47114,0l0,-14.4603l2.40467,0l0.0391,1.67056c0.81133,-1.29188 1.96088,-1.93782 3.44865,-1.93782c0.48093,0 0.84652,0.06237 1.09677,0.1871l0,2.29871zm15.87671,8.83376l2.77808,-11.05231l2.4731,0l-4.20916,14.4603l-2.00585,0l-3.51512,-10.95886l-3.42128,10.95886l-2.00389,0l-4.19547,-14.4603l2.45746,0l2.84651,10.82514l3.3685,-10.82514l1.99216,0l3.43497,11.05231zm14.32443,3.67524c-1.95893,0 -3.55423,-0.64144 -4.78393,-1.92452c-1.22971,-1.29188 -1.84358,-3.01581 -1.84358,-5.172l0,-0.45435c0,-1.4344 0.27175,-2.71298 0.81524,-3.83555c0.55132,-1.13157 1.31768,-2.01347 2.2991,-2.64612c0.98728,-0.64144 2.05668,-0.96226 3.20623,-0.96226c1.88073,0 3.34113,0.61915 4.38315,1.85766c1.04398,1.2385 1.56402,3.01151 1.56402,5.31902l0,1.02912l-9.7966,0c0.03715,1.4254 0.45161,2.57926 1.24339,3.46136c0.80156,0.87311 1.81817,1.30967 3.04788,1.30967c0.87194,0 1.61289,-0.1783 2.21699,-0.5345c0.60606,-0.3564 1.13782,-0.82873 1.59139,-1.4168l1.50927,1.17614c-1.21016,1.86216 -3.02832,2.79314 -5.45255,2.79314zm-0.30694,-12.96334c-0.99706,0 -1.83576,0.3652 -2.5122,1.09579c-0.67644,0.7216 -1.09677,1.73743 -1.25708,3.04709l7.24335,0l0,-0.1871c-0.07038,-1.2563 -0.4086,-2.22735 -1.01466,-2.91337c-0.60606,-0.69501 -1.42521,-1.04242 -2.45941,-1.04242zm21.61078,5.62635c0,2.20956 -0.50831,3.98707 -1.52492,5.33232c-1.01466,1.33645 -2.37926,2.00468 -4.0899,2.00468c-1.82599,0 -3.23751,-0.64594 -4.23653,-1.93782l-0.11926,1.67056l-2.27173,0l0,-20.5277l2.4731,0l0,7.65781c0.99706,-1.2385 2.37339,-1.85766 4.129,-1.85766c1.75561,0 3.13194,0.66373 4.129,1.99138c1.00683,1.32746 1.51123,3.14504 1.51123,5.45255l0,0.21388zm-2.4731,-0.28074c0,-1.68386 -0.32453,-2.98473 -0.97555,-3.90241c-0.65102,-0.91769 -1.58552,-1.37653 -2.80741,-1.37653c-1.63049,0 -2.80154,0.75737 -3.51317,2.27193l0,6.25469c0.75659,1.51455 1.93742,2.27193 3.54054,2.27193c1.18474,0 2.10751,-0.45884 2.76635,-1.37653c0.65884,-0.91769 0.98924,-2.29871 0.98924,-4.14308zm14.56685,3.51493c0,-0.66823 -0.25415,-1.18494 -0.76246,-1.55033c-0.49853,-0.37419 -1.37633,-0.69501 -2.63341,-0.96226c-1.2473,-0.26725 -2.24045,-0.58807 -2.97945,-0.96226c-0.73118,-0.37419 -1.27467,-0.81954 -1.63049,-1.33645c-0.34799,-0.51671 -0.52199,-1.13137 -0.52199,-1.84417c0,-1.18494 0.50048,-2.18728 1.49754,-3.00702c1.00683,-0.81974 2.28933,-1.22951 3.84943,-1.22951c1.63831,0 2.96576,0.42326 3.98237,1.26959c1.02443,0.84652 1.53665,1.92902 1.53665,3.24748l-2.48483,0c0,-0.67702 -0.28934,-1.2606 -0.86998,-1.75072c-0.56891,-0.48993 -1.29227,-0.73489 -2.16421,-0.73489c-0.89931,0 -1.60312,0.19589 -2.11142,0.58787c-0.50831,0.39218 -0.76246,0.90439 -0.76246,1.53704c0,0.59687 0.23656,1.04691 0.70772,1.34975c0.47311,0.30303 1.32355,0.59257 2.55326,0.86862c1.23948,0.27624 2.24045,0.60586 3.00682,0.98904c0.76637,0.38318 1.33332,0.84633 1.69696,1.38982c0.37536,0.5347 0.56109,1.18943 0.56109,1.9646c0,1.29188 -0.51613,2.32999 -1.54838,3.11395c-1.03421,0.77517 -2.37535,1.16265 -4.02343,1.16265c-1.15933,0 -2.18376,-0.20489 -3.07329,-0.61466c-0.89149,-0.40997 -1.59139,-0.98005 -2.09969,-1.71064c-0.49853,-0.73958 -0.74682,-1.53704 -0.74682,-2.39236l2.47114,0c0.04497,0.82873 0.37536,1.48797 0.98924,1.97809c0.62365,0.48093 1.4428,0.7216 2.45941,0.7216c0.9345,0 1.68327,-0.1871 2.24436,-0.56129c0.57087,-0.38318 0.8563,-0.8909 0.8563,-1.52355zm8.92662,3.83555l-2.4731,0l0,-14.4603l2.4731,0l0,14.4603zm-2.67251,-18.29585c0,-0.40097 0.11926,-0.73958 0.35972,-1.01563c0.25024,-0.27624 0.61583,-0.41427 1.09677,-0.41427c0.48093,0 0.84652,0.13802 1.09481,0.41427c0.25024,0.27605 0.37536,0.61466 0.37536,1.01563c0,0.40097 -0.12512,0.73509 -0.37536,1.00234c-0.24829,0.26725 -0.61388,0.40097 -1.09481,0.40097c-0.48093,0 -0.84652,-0.13372 -1.09677,-0.40097c-0.24047,-0.26725 -0.35972,-0.60136 -0.35972,-1.00234zm10.54342,0.33411l0,3.50144l2.69988,0l0,1.91123l-2.69988,0l0,8.96748c0,0.57908 0.12121,1.01563 0.36168,1.30967c0.24047,0.28504 0.64907,0.42756 1.22971,0.42756c0.28348,0 0.67644,-0.05337 1.17497,-0.16031l0,2.00468c-0.65102,0.1781 -1.28249,0.26725 -1.89832,0.26725c-1.10459,0 -1.93742,-0.33411 -2.49851,-1.00234c-0.56109,-0.66823 -0.84261,-1.617 -0.84261,-2.84651l0,-8.96748l-2.63146,0l0,-1.91123l2.63146,0l0,-3.50144l2.4731,0zm12.14849,18.22899c-1.96088,0 -3.55618,-0.64144 -4.78589,-1.92452c-1.22971,-1.29188 -1.84358,-3.01581 -1.84358,-5.172l0,-0.45435c0,-1.4344 0.27175,-2.71298 0.81524,-3.83555c0.55327,-1.13157 1.31768,-2.01347 2.2991,-2.64612c0.98924,-0.64144 2.05864,-0.96226 3.20623,-0.96226c1.88073,0 3.34113,0.61915 4.38511,1.85766c1.04203,1.2385 1.56206,3.01151 1.56206,5.31902l0,1.02912l-9.79465,0c0.03519,1.4254 0.44965,2.57926 1.24144,3.46136c0.80351,0.87311 1.81817,1.30967 3.04788,1.30967c0.87389,0 1.61289,-0.1783 2.21895,-0.5345c0.60606,-0.3564 1.13587,-0.82873 1.58943,-1.4168l1.51123,1.17614c-1.21211,1.86216 -3.03028,2.79314 -5.45255,2.79314zm-0.30889,-12.96334c-0.99706,0 -1.83381,0.3652 -2.5122,1.09579c-0.67644,0.7216 -1.09481,1.73743 -1.25512,3.04709l7.24335,0l0,-0.1871c-0.07234,-1.2563 -0.41055,-2.22735 -1.01661,-2.91337c-0.60606,-0.69501 -1.42521,-1.04242 -2.45941,-1.04242zm9.42124,11.39972c0,-0.42756 0.12512,-0.78396 0.37536,-1.0692c0.25806,-0.28504 0.64125,-0.42756 1.14955,-0.42756c0.50831,0 0.89149,0.14252 1.14955,0.42756c0.26588,0.28524 0.40078,0.64164 0.40078,1.0692c0,0.40977 -0.1349,0.75288 -0.40078,1.02912c-0.25806,0.27624 -0.64125,0.41427 -1.14955,0.41427c-0.50831,0 -0.89149,-0.13802 -1.14955,-0.41427c-0.25024,-0.27624 -0.37536,-0.61935 -0.37536,-1.02912zm13.51114,-0.45435c0.88367,0 1.65395,-0.26725 2.31279,-0.80195c0.65884,-0.5345 1.02443,-1.20273 1.09677,-2.00468l2.3382,0c-0.04497,0.82873 -0.3304,1.61719 -0.8563,2.36557c-0.5259,0.74838 -1.22971,1.34544 -2.11142,1.7908c-0.87194,0.44555 -1.79862,0.66823 -2.78004,0.66823c-1.9687,0 -3.53663,-0.65474 -4.70378,-1.9646c-1.15737,-1.31847 -1.73801,-3.11826 -1.73801,-5.39918l0,-0.41427c0,-1.40761 0.26002,-2.65941 0.77614,-3.7554c0.51613,-1.09579 1.25512,-1.94681 2.21895,-2.55267c0.96969,-0.60586 2.11533,-0.90869 3.43497,-0.90869c1.62071,0 2.96576,0.48563 4.03516,1.45668c1.07722,0.97125 1.65199,2.23185 1.72433,3.78218l-2.3382,0c-0.07234,-0.93548 -0.42815,-1.70184 -1.0694,-2.29871c-0.63343,-0.60586 -1.41739,-0.90869 -2.35189,-0.90869c-1.25708,0 -2.23263,0.45435 -2.92862,1.36304c-0.68426,0.8999 -1.02834,2.20526 -1.02834,3.9159l0,0.46764c0,1.66607 0.34408,2.94915 1.02834,3.84904c0.68621,0.8997 1.66763,1.34975 2.94035,1.34975zm8.42027,-5.61306c0,-1.41661 0.27566,-2.69069 0.82893,-3.82226c0.56109,-1.13157 1.33528,-2.00468 2.32452,-2.61933c0.99706,-0.61485 2.13293,-0.92218 3.4076,-0.92218c1.9687,0 3.56009,0.68152 4.7722,2.04475c1.21993,1.36324 1.8299,3.17632 1.8299,5.43925l0,0.1738c0,1.40761 -0.27175,2.6729 -0.81524,3.79547c-0.53372,1.11377 -1.30595,1.98239 -2.31279,2.60604c-0.99706,0.62365 -2.14661,0.93548 -3.4467,0.93548c-1.96088,0 -3.55032,-0.68152 -4.7722,-2.04475c-1.21016,-1.36304 -1.81621,-3.16733 -1.81621,-5.41247l0,-0.1738zm2.48483,0.29403c0,1.6037 0.3695,2.89108 1.11045,3.86234c0.74682,0.97106 1.74583,1.45668 2.99313,1.45668c1.25512,0 2.25414,-0.49012 2.99313,-1.47017c0.739,-0.98885 1.1085,-2.36987 1.1085,-4.14288c0,-1.58591 -0.37732,-2.8688 -1.13587,-3.84904c-0.74682,-0.98885 -1.74583,-1.48327 -2.99313,-1.48327c-1.21993,0 -2.20526,0.48543 -2.95403,1.45668c-0.74682,0.97106 -1.12218,2.36108 -1.12218,4.16967zm16.6509,-7.39056l0.06843,1.6037c1.05962,-1.2473 2.48874,-1.87095 4.28931,-1.87095c2.02345,0 3.39978,0.77517 4.129,2.3253c0.48093,-0.69481 1.10459,-1.2561 1.87095,-1.68386c0.77614,-0.42756 1.68914,-0.64144 2.74094,-0.64144c3.17104,0 4.78393,1.67936 4.83672,5.03828l0,9.68927l-2.47114,0l0,-9.54225c0,-1.03342 -0.23656,-1.80409 -0.70967,-2.31201c-0.47116,-0.51671 -1.2649,-0.77517 -2.3773,-0.77517c-0.91886,0 -1.67936,0.27624 -2.28542,0.82873c-0.60606,0.5435 -0.95796,1.27839 -1.05571,2.20507l0,9.59563l-2.48678,0l0,-9.47539c0,-2.10262 -1.02834,-3.15403 -3.08698,-3.15403c-1.62071,0 -2.73116,0.69051 -3.32744,2.07154l0,10.55789l-2.4731,0l0,-14.4603l2.3382,0zm22.71928,16.13086l-2.12511,0l8.12702,-21.12907l2.11142,0l-8.11333,21.12907z" fill="#4B4D52" id="svg_12"/>
                                    <path stroke="null" fill-rule="evenodd" clip-rule="evenodd" d="m308.125,36.18925l0,-0.50175l0,-1.875c0,-3.10669 -2.51813,-5.625 -5.625,-5.625c-3.10688,0 -5.625,2.51831 -5.625,5.625l0,1.875l0,0.50175c-1.12125,0.64838 -1.875,1.86019 -1.875,3.24825l0,5.625c0,2.07113 1.67813,3.75 3.75,3.75l7.5,0c2.07188,0 3.75,-1.67888 3.75,-3.75l0,-5.625c0,-1.38806 -0.75375,-2.59988 -1.875,-3.24825zm-9.375,-0.50175l1.875,0l3.75,0l1.875,0l0,-1.875c0,-2.07113 -1.67813,-3.75 -3.75,-3.75c-2.07188,0 -3.75,1.67888 -3.75,3.75l0,1.875z" fill="#4B4D52" id="svg_13"/>
                                    <g stroke="null" id="svg_79" opacity="0.6">
                                        <g stroke="null" id="svg_61" transform="matrix(0.454811 0 0 0.484983 314.379 72.6679)">
                                            <path stroke="null" d="m1166.18724,-80.93927l-10.112,0l0,6l10.112,0c3.007,0 5.34,1.536 5.34,2.858l0,26.606c0,1.322 -2.333,2.858 -5.34,2.858l-38.222,0c-3.007,0 -5.34,-1.536 -5.34,-2.858l0,-26.605c0,-1.322 2.333,-2.858 5.34,-2.858l10.11,0l0,-6l-10.11,0c-6.359,0 -11.34,3.891 -11.34,8.858l0,26.606c0,4.968 4.981,8.858 11.34,8.858l38.223,0c6.358,0 11.34,-3.891 11.34,-8.858l0,-26.606c-0.001,-4.968 -4.982,-8.859 -11.341,-8.859z" id="svg_62"/>
                                            <path stroke="null" d="m1138.19824,-89.33227c0.768,0 1.535,-0.293 2.121,-0.879l3.756,-3.756l0,13.028l0,6l0,11.494c0,1.657 1.343,3 3,3s3,-1.343 3,-3l0,-11.494l0,-6l0,-13.231l3.959,3.959c0.586,0.586 1.354,0.879 2.121,0.879s1.535,-0.293 2.121,-0.879c1.172,-1.171 1.172,-3.071 0,-4.242l-8.957,-8.957c-0.586,-0.586 -1.353,-0.877 -2.12,-0.877c-0.008,0 -0.015,0 -0.023,0s-0.015,0 -0.023,0c-0.767,0 -1.534,0.291 -2.12,0.877l-8.957,8.957c-1.172,1.171 -1.172,3.071 0,4.242c0.587,0.586 1.354,0.879 2.122,0.879z" id="svg_63"/>
                                        </g>
                                        <g stroke="null" id="svg_64" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_65" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_66" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_67" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_68" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_69" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_70" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_71" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_72" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_73" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_74" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_75" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_76" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_77" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                        <g stroke="null" id="svg_78" transform="matrix(0.454811 0 0 0.463072 314.379 74.5356)"/>
                                    </g>
                                    <g stroke="null" opacity="0.61" id="svg_8">
                                        <path stroke="null" id="svg_7" d="m35.34035,22.16666c-1.19506,0 -2.17369,0.97864 -2.17369,2.17642l0,22.15209c0,1.19506 0.97864,2.17369 2.17369,2.17369l13.61111,0l2.01036,6.16447l12.69917,0c1.19233,0 2.17233,-0.96231 2.17233,-2.13967l0,-21.8295c0,-1.17736 -0.97864,-2.13967 -2.17369,-2.13967l-13.51584,0l-2.10428,-6.55783l-12.69917,0zm15.12059,7.5392l13.1987,0c0.3185,0 0.61931,0.12386 0.84389,0.34708a1.13517,1.13517 0 0 1 0.34844,0.81122l0,21.8295a1.12156,1.12156 0 0 1 -0.34708,0.81122a1.19914,1.19914 0 0 1 -0.84389,0.34708l-11.81036,0l4.69583,-5.18311l0.00544,0l-1.00722,-3.13328c0.01361,-0.01225 0.78944,-0.68192 1.74631,-1.69731a71.59446,71.59446 0 0 0 3.83561,3.81928l1.05078,-1.05078c-1.73133,-1.57072 -3.00125,-2.8175 -3.93361,-3.81792c1.2495,-1.47953 2.51942,-3.34153 2.78892,-5.047l2.7685,0l0,0.00408l0.00272,0l0,-1.27944l-6.16856,0l0,-2.06889l-2.00356,0l0,2.06889l-2.99989,0l-2.17097,-6.76064zm-8.12039,0.62611c1.37744,0 2.53303,0.50906 3.42047,1.32708l-1.3475,1.29578a2.98628,2.98628 0 0 0 -2.07297,-0.79489c-1.77761,0 -3.21767,1.47 -3.21767,3.27892c0,1.81028 1.44006,3.27892 3.21767,3.27892c2.05256,0 2.89917,-1.47 2.98083,-2.46089l-2.97811,-0.00272l0,-1.74767l4.77886,0c0.06806,0.31306 0.12114,0.62203 0.12114,1.03989c0,2.92231 -1.95047,4.99392 -4.90272,4.99392a5.10689,5.10689 0 0 1 -5.10553,-5.10417c0,-2.8175 2.28667,-5.10417 5.10553,-5.10417zm10.70242,7.41397l6.48706,0c-0.41922,1.47544 -1.34478,2.86922 -2.24856,3.95267c-1.60067,-1.89467 -1.60611,-2.50989 -1.60611,-2.50989l-1.66328,0s0.06806,0.92283 2.31389,3.5525c-0.72547,0.74317 -1.28761,1.19097 -1.29306,1.19778l-1.98994,-6.19306z"/>
                                    </g>
                                </g>
                            </svg>
                            <div id="zone-preview">

                            </div>
                            <div id="zone-preview-test" style="width:100%; height: 680px">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box data-step">
        <div class="row is-mobile">
            <div class="col-6">
                <h3 class="title is-6">Save</h3>
            </div>
            <div class="col-6">
                <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                    <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-save">
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
    <div class="row data-step" id="step-save">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content data-step" id="step-0">
                    <div class="card-body card-dashboard">
                        <div class="buttons text-center pt-1">
                            <button type="button" class="btn btn-success mb-1" id="enterAction">
                                <i class="feather icon-check"></i>
                                <span>Save</span>
                            </button>
                            <?php if($this->data->setting): ?>
                            <a href="javascript:buildSetting();" class="btn btn-warning mb-1">
                                <i class="feather icon-rotate-ccw"></i>
                                <span>Revert</span>
                            </a>
                            <a href="/zone/detail/<?=$this->data->id?>" class="btn btn-light mb-1">
                                <i class="feather icon-arrow-left"></i>
                                <span>Back</span>
                            </a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal fade text-left" id="helpModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-body">

                    <ul>
                        <li><strong>Floor eCPM:</strong> We will try to keep the average eCPM close to this number. The higher eCPM you set, the less traffic you can sell,
                            so set this feature with care!!!. Using this feature also disable our auto optimization process for this zone. For the impression we can not buy,
                            we will redirect that visitor to your fallback url (if any) or not to display ad at all
                        </li>
                        <li><strong>Frequency:</strong> Limit the number of ads displaying from this zone per time frame per visitor.
                            Eg if you do not want to show more than 10 ads for one visitor within 24hours, set "10 Every 24 Hours".
                            Set 0 - or empty to disable this feature
                        </li>
                        <li><strong>Fallback:</strong> If you use <strong>Floor eCPM</strong>, you should use this feature too. Traffic we can not buy will go to this link</li>
                    </ul>

                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-close">Got It</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?=$this->asset('js/tagsinput.min.js')?>"></script>
<script>
/* global $, __tajs */
var ad_format = <?=$this->data->ad_format?>;
var setting = <?=$this->data->setting??'{}'?>;
var desktop_preview = 1;
function buildSetting() {
    $('#bid').val(<?=$this->data->floor_cpm?:''?>);
    if(setting.fallback) $('#fallback').val(setting.fallback);
    if(setting.frequency) {
        var t = setting.frequency.split(':');
        if(t.length == 2) {
            $('#frequency_number').val(t[0]==0?'':t[0]);
            $('#frequency_time').val(_parseInt(t[1]));
            if(t[1].indexOf('h') != -1) {
                $('#frequency_timetype').val('h');
            } else {
                $('#frequency_timetype').val('m');
            }
        }
    }
    if(setting.excluded_types && setting.excluded_types.length) {
        for(var i=0;i<setting.excluded_types.length;i++) {
            $('.exclude-ad[data-value="'+setting.excluded_types[i]+'"]').addClass('btn-danger');
        }
    }

    if(ad_format == 1) return buildSettingIPP();
    if(ad_format == 2) return buildSettingPOP();
    if(ad_format == 3) return buildSettingVAST();
    if(ad_format == 4) return buildSettingNATIVE();
    if(ad_format == 5) return buildSettingDIRECT();
    if(ad_format == 6) return buildSettingDIALOG();
    $('#zone-build-setting').html('');
    // $('#zone-preview').html('');
    return false;
}
function buildSettingIPP() {
    var html ='',
        ipp_start = setting.ipp_start || 0,
        ipp_total = setting.ipp_total || 3,
        ipp_delay = setting.ipp_delay || 10,
        ipp_label = typeof setting.ipp_label !== 'undefined' ? setting.ipp_label : false;
    ipp_position = setting.ipp_position || 'top-right';
    html += '<div class="form-group">';
    html += '<label class="label">Start Delay</label>';
    html += '<div class="input-group">';
    html += '<input class="input form-control" id="ipp_start" type="number" value="'+ipp_start+'">';
    html += '<div class="input-group-append">';
    html += '<span class="input-group-text" id="basic-addon2">Seconds</span>';
    html += '</div>';
    html += '</div>';
    html += '</div>';

    html += '<div class="form-group">';
    html += '<label class="label">Number of Notifications</label>';
    html += '<input class="input form-control" id="ipp_total" type="number" value="'+ipp_total+'">';
    html += '</div>';

    html += '<div class="form-group">';
    html += '<label class="label">Delay Between Notifications</label>';
    html += '<div class="input-group">';
    html += '<input class="input form-control" id="ipp_delay" type="number" value="'+ipp_delay+'">';
    html += '<div class="input-group-append">';
    html += '<span class="input-group-text" id="basic-addon2">Seconds</span>';
    html += '</div>';
    html += '</div>';
    html += '</div>';

    html += '<div class="form-group">';
    html += '<label class="label">AD Label</label>';
    html += '<div class="buttons are-small has-addons">';
    html += '<button class="button ipp_label mb-1';
    if(ipp_label) html += ' is-selected';
    html += '" data-value="show">Show AD label</button>';
    html += '<button class="button ipp_label mb-1';
    if(!ipp_label) html += ' is-selected';
    html += '" data-value="hide">Hide AD label</button>';
    html += '</div></div>';

    html += '<div class="form-group">';
    html += '<label class="label">AD Position</label>';
    html += '<div class="buttons are-small has-addons">';
    html += '<button class="button ipp_position mb-1';
    if(ipp_position == 'top-right') html += ' is-selected';
    html += '" data-value="top-right">Top-Right</button>';
    html += '<button class="button ipp_position mb-1';
    if(ipp_position == 'top-left') html += ' is-selected';
    html += '" data-value="top-left">Top-Left</button>';
    html += '<button class="button ipp_position mb-1';
    if(ipp_position == 'bottom-right') html += ' is-selected';
    html += '" data-value="bottom-right">Bottom-Right</button>';
    html += '<button class="button ipp_position mb-1';
    if(ipp_position == 'bottom-left') html += ' is-selected';
    html += '" data-value="bottom-left">Bottom-Left</button>';
    html += '</div></div>';
    $('#zone-build-setting').html(html);
}
function buildSettingPOP() {
    var html = '',
        pop_method = setting.pop_method || 'any',
        pop_class = setting.pop_class || [],
        pop_delay = setting.pop_delay || 0;

    html += '<div class="form-group" style="padding-bottom:1rem">';
    html += '<label class="label">Trigger Method</label>';
    html += '<div class="control">';
    html += '<div class="row is-multiline d-flex" id="pop_method">';
    html += '<div class="col-12 mt-1"><div class="flatbox pop_method';
    if(pop_method == 'any') html += ' is-selected';
    html += '" data-value="any"><p>Clicking anywhere on your page</p></div></div>';
    html += '<div class="col-12 mt-1"><div class="flatbox pop_method';
    if(pop_method == 'a') html += ' is-selected';
    html += '" data-value="a"><p>Clicking on links on your page</p></div></div>';
    html += '<div class="col-12 mt-1"><div class="flatbox pop_method';
    if(pop_method == 'class') html += ' is-selected';
    html += '" data-value="class"><p>Clicking on specific class(es)</p></div></div>';
    html += '</div></div></div>';
    html += '<div class="form-group';
    if(pop_method != 'class') html += ' hidden';
    html += '" id="pop_class_wrap">';
    html += '<label class="label">Trigger Class(es)</label>';
    html += '<div class="control">';
    html += '<input id="pop_class" class="input form-control" type="text" data-type="tags" placeholder="Trigger Class" value="">';
    html += '</div><p class="help text-info">class-name-1, class-name-2, class-name-3</p></div>';

    html += '<div class="form-group">';
    html += '<label class="label">Delay</label>';
    html += '<div class="input-group">';
    html += '<input class="input form-control" id="pop_delay" type="number" value="'+pop_delay+'">';
    html += '<div class="input-group-append">';
    html += '<span class="input-group-text">Seconds</span>';
    html += '</div>';
    html += '</div>';
    html += '</div>';

    $('#zone-build-setting').html(html);
    new BulmaTagsInput(document.getElementById('pop_class'), {
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
    if(pop_method == 'class') document.getElementById('pop_class').BulmaTagsInput().add(pop_class.join(','));
}
function buildSettingVAST() {
    var html ='',
    vast_skip = setting.vast_skip || 10,
    vast_impr = setting.vast_impr || '',
    vast_click = setting.vast_click || '';

    html += '<div class="form-group">';
    html += '<label class="label">Skippable after (seconds)</label>';
    html += '<div class="input-group">';
    html += '<input class="input form-control" id="vast_skip" type="number" value="'+vast_skip+'">';
    html += '<div class="input-group-append">';
    html += '<span class="input-group-text">Seconds</span>';
    html += '</div>';
    html += '</div>';
    html += '</div>';

    html += '<div class="form-group">';
    html += '<label class="label">Impression Tracking</label>';
    html += '<div class="control has-icons-left">';
    html += '<input class="input form-control" id="vast_impr" type="text" value="'+vast_impr+'" placeholder="Empty to not set">';
    html += '</div></div>';
    html += '<div class="form-group">';
    html += '<label class="label">Click Tracking</label>';
    html += '<div class="control has-icons-left">';
    html += '<input class="input form-control" id="vast_click" type="text" value="'+vast_click+'" placeholder="Empty to not set">';
    html += '</div></div>';

    $('#zone-build-setting').html(html);
}
function buildSettingNATIVE() {
    var html = '', native_type = setting.native_type || 'classic';
    var desktop_size = setting.desktop_size || '728x90';
    var mobile_size = setting.mobile_size || '300x250';
    var desktop_col = setting.desktop_col || 4;
    var desktop_row = setting.desktop_row || 1;
    var desktop_text_title = setting.desktop_text_title || 1;
    var desktop_text_description = setting.desktop_text_description || 1;
    var desktop_text_position = setting.desktop_text_position || 'bottom';
    var desktop_spacing = setting.desktop_spacing || '10px';
    var desktop_image = setting.desktop_image || '16:9';
    var mobile_breaking = setting.mobile_breaking || '450px';
    var mobile_col = setting.mobile_col || 1;
    var mobile_row = setting.mobile_row || 2;
    var mobile_text_title = setting.mobile_text_title || 1;
    var mobile_text_description = setting.mobile_text_description || 1;
    var mobile_text_position = setting.mobile_text_position || 'right';
    var mobile_spacing = setting.mobile_spacing || '6px';
    var mobile_image = setting.mobile_image || '16:9';
    var native_css = setting.native_css || '';
    var native_font = setting.native_font || 'arial';
    var native_align = setting.native_align || 'left';

    var desktop_image_w = 200, desktop_image_h = 200;
    if(desktop_image.indexOf(':') == -1) {
        desktop_image = desktop_image.split('-');
        desktop_image_w = desktop_image[0].replace('px', '');
        desktop_image_h = desktop_image[1].replace('px', '');
        desktop_image = 'fixed';
    }
    var desktop_spacing_w = _parseInt(desktop_spacing), desktop_spacing_h = desktop_spacing.replace(desktop_spacing_w, '');
    var mobile_image_w = 200, mobile_image_h = 200;
    if(mobile_image.indexOf(':') == -1) {
        mobile_image = mobile_image.split('-');
        mobile_image_w = mobile_image[0].replace('px', '');
        mobile_image_h = mobile_image[1].replace('px', '');
        mobile_image = 'fixed';
    }
    var mobile_spacing_w = _parseInt(mobile_spacing), mobile_spacing_h = mobile_spacing.replace(mobile_spacing_w, '');

    html += '<div class="form-group">';
    html += '<label class="label">Banner Type</label>';
    html += '<div class="control mt-1">';
    html += '<div class="row d-flex" style="margin-left:-.35rem;margin-right:-.35rem;">';
    html += '<div class="col-6">';
    html += '<div class="flatbox native_type';
    if(native_type == 'classic') html += ' is-selected';
    html += '" data-value="classic"><p>Classic</p></div></div>';
    html += '<div class="col-6"><div class="flatbox native_type';
    if(native_type == 'native') html += ' is-selected';
    html += '" data-value="native"><p>Native</p></div></div>';
    html += '</div></div></div>';
    html += '<div id="banner-classic" class="banner-setting-wrap';
    if(native_type != 'classic') html += ' hidden';
    html += '"><div class="form-group"><label class="label">Desktop Size</label>';
    html += '<div class="control"><div class="select is-fullwidth"><select id="desktop_size" class="form-control">';
    html += '<option value="728x90"';
    if(desktop_size == '728x90') html += ' selected';
    html += '>Leaderboard 728x90</option>';
    html += '<option value="300x250"';
    if(desktop_size == '300x250') html += ' selected';
    html += '>Rectangle 300x250</option>';
    html += '<option value="300x100"';
    if(desktop_size == '300x100') html += ' selected';
    html += '>Rectangle 300x100</option>';
    html += '<option value="160x600"';
    if(desktop_size == '160x600') html += ' selected';
    html += '>Vertical Skyscraper 160x600</option>';
    html += '<option value="900x250"';
    if(desktop_size == '900x250') html += ' selected';
    html += '>Banner 900x250</option>';
    html += '</select></div></div></div>';
    html += '<div class="form-group"><label class="label">Mobile Size</label>';
    html += '<div class="control"><div class="select is-fullwidth"><select id="mobile_size" class="form-control">';
    html += '<option value="300x250"';
    if(mobile_size == '300x250') html += ' selected';
    html += '>Rectangle 300x250</option>';
    html += '<option value="300x100"';
    if(mobile_size == '300x100') html += ' selected';
    html += '>Rectangle 300x100</option>';
    html += '<option value="0"';
    if(mobile_size == '0') html += ' selected';
    html += '>Same as Desktop</option>';
    html += '</select></div></div></div></div>';
    html += '<div id="banner-native" class="banner-setting-wrap';
    if(native_type != 'native') html += ' hidden';
    html += '"><article class="message is-orange">';
    html += '<div class="message-header"><p>Desktop</p>';
    html += '<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M7.41,15.41L12,10.83L16.59,15.41L18,14L12,8L6,14L7.41,15.41Z" /></svg></span>';
    html += '</div><div class="message-body">';
    html += '<div class="row is-mobile is-gaplessly">';
    html += '<div class="col-6">';
    html += '<div class="form-group"><label class="label">Columns</label>';
    html += '<div class="control"><div class="select is-fullwidth"><select id="desktop_col" class="form-control">';
    html += '<option value="1"';
    if(desktop_col == 1) html += ' selected';
    html += '>1</option>';
    html += '<option value="2"';
    if(desktop_col == 2) html += ' selected';
    html += '>2</option>';
    html += '<option value="3"';
    if(desktop_col == 3) html += ' selected';
    html += '>3</option>';
    html += '<option value="4"';
    if(desktop_col == 4) html += ' selected';
    html += '>4</option>';
    html += '<option value="5"';
    if(desktop_col == 5) html += ' selected';
    html += '>5</option>';
    html += '<option value="6"';
    if(desktop_col == 6) html += ' selected';
    html += '>6</option>';
    html += '</select></div></div></div>';
    html += '</div><div class="col-6">';
    html += '<div class="form-group"><label class="label">Rows</label>';
    html += '<div class="control"><div class="select is-fullwidth"><select id="desktop_row" class="form-control">';
    html += '<option value="1"';
    if(desktop_row == 1) html += ' selected';
    html += '>1</option>';
    html += '<option value="2"';
    if(desktop_row == 2) html += ' selected';
    html += '>2</option>';
    html += '<option value="3"';
    if(desktop_row == 3) html += ' selected';
    html += '>3</option>';
    html += '</select></div></div></div>';
    html += '</div></div>';

    html += '<div class="form-group" style="margin-bottom:.5em;">';
    html += '<label class="label">Text</label></div>';
    html += '<div class="form-group has-addons input-group">';
    html += '<div class="input-group-append">';
    html += '<div class="button desktop-text';
    if(desktop_text_title == 1) html += ' is-selected';
    html += '" data-value="title">Title</div>';
    html += '<div class="button desktop-text';
    if(desktop_text_description == 1) html += ' is-selected';
    html += '" data-value="description" style="border-left: 1px solid #dbdbdb;">Description</div>';
    html += '</div>';
    html += '<select id="desktop-text" class="form-control">';
    html += '<option value="bottom"';
    if(desktop_text_position == 'bottom') html += ' selected';
    html += '>Position: Bottom</option>';
    html += '<option value="right"';
    if(desktop_text_position == 'right') html += ' selected';
    html += '>Position: Right</option>';
    html += '</select></div>';

    html += '<div class="form-group mt-1" style="margin-bottom:.5em;">';
    html += '<label class="label">Spacing</label></div>';
    html += '<div class="form-group has-addons input-group">';
    html += '<input class="input form-control" type="number" id="desktop-spacing" placeholder="Spacing" value="'+desktop_spacing_w+'">';
    html += '<div class="input-group-append">';
    html += '<button class="button desktop-spacing';
    if(desktop_spacing_h == 'px') html += ' is-selected';
    html += '" data-value="px">Px</button>';
    html += '<button class="button desktop-spacing';
    if(desktop_spacing_h == 'em') html += ' is-selected';
    html += '" data-value="em" style="border-left: 1px solid #dbdbdb;">Em</button>';
    html += '<button class="button desktop-spacing';
    if(desktop_spacing_h == 'rem') html += ' is-selected';
    html += '" data-value="rem" style="border-left: 1px solid #dbdbdb;">Rem</button>';
    html += '</div></div>';

    html += '<div class="form-group mt-1" style="margin-bottom:.5em;">';
    html += '<label class="label">Image</label></div>';
    html += '<div class="control">';
    html += '<div class="row is-mobile is-gapless d-flex" style="margin-left:-.35rem;margin-right:-.35rem;">';
    html += '<div class="col-6">';
    html += '<div class="flatbox desktop-image';
    if(desktop_image != 'fixed') html += ' is-selected';
    html += '" data-value="ratio">Ratio</div>';
    html += '</div>';
    html += '<div class="col-6">';
    html += '<div class="flatbox desktop-image';
    if(desktop_image == 'fixed') html += ' is-selected';
    html += '" data-value="fixed">Fixed</div>';
    html += '</div>';
    html += '<div class="col-12 mt-1">';
    html += '<div class="form-group control is-expanded img-ratio';
    if(desktop_image == 'fixed') html += ' hidden';
    html += '"><div class="select is-fullwidth"><select id="desktop-image" class="form-control">';
    html += '<option value="1:1"';
    if(desktop_image == '1:1') html += ' selected';
    html += '>1:1</option>';
    html += '<option value="3:2"';
    if(desktop_image == '3:2') html += ' selected';
    html += '>3:2</option>';
    html += '<option value="4:3"';
    if(desktop_image == '4:3') html += ' selected';
    html += '>4:3</option>';
    html += '<option value="16:9"';
    if(desktop_image == '16:9') html += ' selected';
    html += '>16:9</option>';
    html += '</select></div>';
    html += '</div>';
    html += '</div>';
    html += '<div class="col-12">';
    html += '<div class="row">';
    html += '<div class="col-6">';
    html += '<div class="form-group control img-fixed';
    if(desktop_image != 'fixed') html += ' hidden';
    html += '"><label class="label">W</label>';
    html += '<input class="input form-control" type="number" id="desktop-image-width" placeholder="Width px" value="'+desktop_image_w+'">';
    html += '</div>';
    html += '</div>';
    html += '<div class="col-6">';
    html += '<div class="form-group control img-fixed';
    if(desktop_image != 'fixed') html += ' hidden';
    html += '"><div class="label">H</div>';
    html += '<input class="input form-control" type="number" id="desktop-image-height" placeholder="Height px" value="'+desktop_image_h+'">';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    html += '</div></div></div>';

    html += '</article>';


    html += '<article class="message is-orange">';
    html += '<div class="message-header"><p>Mobile</p>';
    html += '<span class="icon spin180"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M7.41,15.41L12,10.83L16.59,15.41L18,14L12,8L6,14L7.41,15.41Z" /></svg></span>';
    html += '</div><div class="message-body hidden">';
    html += '<div class="form-group"><label class="label">Breaking Point</label>';
    html += '<div class="control"><div class="select is-fullwidth"><select id="mobile_breaking" class="form-control">';
    html += '<option value="450px"';
    if(mobile_breaking == '450px') html += ' selected';
    html += '>Small 450px</option>';
    html += '<option value="800px"';
    if(mobile_breaking == '800px') html += ' selected';
    html += '>Medium 800px</option>';
    html += '<option value="0"';
    if(mobile_breaking == '0') html += ' selected';
    html += '>Desktop Style Only</option>';
    html += '</select></div></div></div>';
    html += '<div class="row is-mobile is-gaplessly">';
    html += '<div class="col-6">';
    html += '<div class="form-group"><label class="label">Columns</label>';
    html += '<div class="control"><div class="select is-fullwidth"><select id="mobile_col" class="form-control">';
    html += '<option value="1"';
    if(mobile_col == 1) html += ' selected';
    html += '>1</option>';
    html += '<option value="2"';
    if(mobile_col == 2) html += ' selected';
    html += '>2</option>';
    html += '</select></div></div></div>';
    html += '</div><div class="col-6">';
    html += '<div class="form-group"><label class="label">Rows</label>';
    html += '<div class="control"><div class="select is-fullwidth"><select id="mobile_row" class="form-control">';
    html += '<option value="1"';
    if(mobile_row == 1) html += ' selected';
    html += '>1</option>';
    html += '<option value="2"';
    if(mobile_row == 2) html += ' selected';
    html += '>2</option>';
    html += '<option value="3"';
    if(mobile_row == 3) html += ' selected';
    html += '>3</option>';
    html += '<option value="4"';
    if(mobile_row == 4) html += ' selected';
    html += '>4</option>';
    html += '<option value="5"';
    if(mobile_row == 5) html += ' selected';
    html += '>5</option>';
    html += '<option value="6"';
    if(mobile_row == 6) html += ' selected';
    html += '>6</option>';
    html += '</select></div></div></div>';
    html += '</div></div>';

    html += '<div class="form-group" style="margin-bottom:.5em;">';
    html += '<label class="label">Text</label></div>';
    html += '<div class="form-group has-addons input-group">';
    html += '<div class="input-group-append">';
    html += '<div class="button mobile-text';
    if(mobile_text_title == 1) html += ' is-selected';
    html += '" data-value="title">Title</div>';
    html += '<div class="button mobile-text';
    if(mobile_text_description == 1) html += ' is-selected';
    html += '" data-value="description" style="border-left: 1px solid #dbdbdb;">Description</div>';
    html += '</div>';
    html += '<select id="mobile-text" class="form-control">';
    html += '<option value="bottom"';
    if(mobile_text_position == 'bottom') html += ' selected';
    html += '>Position: Bottom</option>';
    html += '<option value="right"';
    if(mobile_text_position == 'right') html += ' selected';
    html += '>Position: Right</option>';
    html += '</select></div>';

    html += '<div class="form-group mt-1" style="margin-bottom:.5em;">';
    html += '<label class="label">Spacing</label></div>';
    html += '<div class="form-group has-addons input-group">';
    html += '<input class="input form-control" type="number" id="mobile-spacing" placeholder="Spacing" value="'+mobile_spacing_w+'">';
    html += '<div class="input-group-append">';
    html += '<button class="button mobile-spacing';
    if(mobile_spacing_h == 'px') html += ' is-selected';
    html += '" data-value="px">Px</button>';
    html += '<button class="button mobile-spacing';
    if(mobile_spacing_h == 'em') html += ' is-selected';
    html += '" data-value="em" style="border-left: 1px solid #dbdbdb;">Em</button>';
    html += '<button class="button mobile-spacing';
    if(mobile_spacing_h == 'rem') html += ' is-selected';
    html += '" data-value="rem" style="border-left: 1px solid #dbdbdb;">Rem</button>';
    html += '</div></div>';

    html += '<div class="form-group mt-1" style="margin-bottom:.5em;">';
    html += '<label class="label">Image</label></div>';
    html += '<div class="control">';
    html += '<div class="row is-mobile is-gapless d-flex" style="margin-left:-.35rem;margin-right:-.35rem;">';
    html += '<div class="col-6">';
    html += '<div class="flatbox mobile-image';
    if(mobile_image != 'fixed') html += ' is-selected';
    html += '" data-value="ratio">Ratio</div>';
    html += '</div>';
    html += '<div class="col-6">';
    html += '<div class="flatbox mobile-image';
    if(mobile_image == 'fixed') html += ' is-selected';
    html += '" data-value="fixed">Fixed</div>';
    html += '</div>';
    html += '<div class="col-12 mt-1">';
    html += '<div class="form-group control is-expanded mobile-img-ratio';
    if(mobile_image == 'fixed') html += ' hidden';
    html += '">';
    html += '<div class="select is-fullwidth"><select id="mobile-image" class="form-control">';
    html += '<option value="1:1"';
    if(mobile_image == '1:1') html += ' selected';
    html += '>1:1</option>';
    html += '<option value="3:2"';
    if(mobile_image == '3:2') html += ' selected';
    html += '>3:2</option>';
    html += '<option value="4:3"';
    if(mobile_image == '4:3') html += ' selected';
    html += '>4:3</option>';
    html += '<option value="16:9"';
    if(mobile_image == '16:9') html += ' selected';
    html += '>16:9</option>';
    html += '</select></div></div></div>';
    html += '<div class="col-12">';
    html += '<div class="row">';
    html += '<div class="col-6">';
    html += '<div class="form-group control mobile-img-fixed';
    if(mobile_image != 'fixed') html += ' hidden';
    html += '"><label class="label">W</label>';
    html += '<input class="input form-control" type="number" id="mobile-image-width" placeholder="Width px" value="'+mobile_image_w+'">';
    html += '</div>';
    html += '</div>';
    html += '<div class="col-6">';
    html += '<div class="form-group control mobile-img-fixed';
    if(mobile_image != 'fixed') html += ' hidden';
    html += '"><div class="label">H</div>';
    html += '<input class="input form-control" type="number" id="mobile-image-height" placeholder="Height px" value="'+mobile_image_h+'">';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    html += '</div></div></div>';

    html += '</article>';

    html += '<article class="message is-orange">';
    html += '<div class="message-header"><p>Custom CSS</p>';
    html += '<span class="icon spin180"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M7.41,15.41L12,10.83L16.59,15.41L18,14L12,8L6,14L7.41,15.41Z" /></svg></span>';
    html += '</div><div class="message-body hidden">';
    html += '<div class="form-group"><div class="control">';
    html += '<textarea class="textarea form-control" placeholder="Custom CSS" id="native_css">'+native_css+'</textarea>';
    html += '</div></div>';
    html += '</div></article>';
    html += '<div class="form-group mt-1" style="margin-bottom:.5em;">';
    html += '<label class="label">Text Formating</label></div>';
    html += '<div class="form-group has-addons input-group">';
    html += '<select id="native_font" class="form-control">';
    html += '<option value="arial"';
    if(native_font == 'arial') html += ' selected';
    html += '>Arial</option>';
    html += '<option value="helvetica"';
    if(native_font == 'helvetica') html += ' selected';
    html += '>Helvetica</option>';
    html += '<option value="verdana"';
    if(native_font == 'verdana') html += ' selected';
    html += '>Verdana</option>';
    html += '<option value="monospace"';
    if(native_font == 'monospace') html += ' selected';
    html += '>Monospace</option>';
    html += '</select>';
    html +=  '<div class="input-group-append">';
    html += '<button class="button native-align';
    if(native_align == 'left') html += ' is-selected';
    html += '" data-value="left"><span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M3,3H21V5H3V3M3,7H15V9H3V7M3,11H21V13H3V11M3,15H15V17H3V15M3,19H21V21H3V19Z" /></svg></span></button>';
    html += '<button class="button native-align';
    if(native_align == 'center') html += ' is-selected';
    html += '" data-value="center" style="border-left: 1px solid #dbdbdb;"><span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M3,3H21V5H3V3M7,7H17V9H7V7M3,11H21V13H3V11M7,15H17V17H7V15M3,19H21V21H3V19Z" /></svg></span></button>';
    html += '<button class="button native-align';
    if(native_align == 'right') html += ' is-selected';
    html += '" data-value="right" style="border-left: 1px solid #dbdbdb;"><span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M3,3H21V5H3V3M9,7H21V9H9V7M3,11H21V13H3V11M9,15H21V17H9V15M3,19H21V21H3V19Z" /></svg></span></button>';
    html += '</div>';
    $('#zone-build-setting').html(html);
}
function buildSettingDIALOG() {
    var html = '',
    dia_method = setting.dia_method || 'close',
    dia_class = setting.dia_class || [],
    dia_delay = setting.dia_delay || 0;

    html += '<div class="form-group">';
    html += '<label class="label">Trigger Method</label>';
    html += '<div class="control">';
    html += '<div class="row is-multiline">';
    html += '<div class="col-12 mt-1"><div class="flatbox dia_method';
    if(dia_method == 'close') html += ' is-selected';
    html += '" data-value="close"><p>Moving mouse off the page (typically to close the tab)</p></div></div>';
    html += '<div class="col-12 mt-1"><div class="flatbox dia_method';
    if(dia_method == 'a') html += ' is-selected';
    html += '" data-value="a"><p>Clicking on links on your page</p></div></div>';
    html += '<div class="col-12 mt-1"><div class="flatbox dia_method';
    if(dia_method == 'class') html += ' is-selected';
    html += '" data-value="class"><p>Clicking on specific class(es)</p></div></div>';
    html += '<div class="col-12 mt-1"><div class="flatbox dia_method';
    if(dia_method == 'auto') html += ' is-selected';
    html += '" data-value="auto"><p>Automatic after some delays</p></div></div>';
    html += '</div></div></div>';

    html += '<div class="form-group';
    if(dia_method != 'class') html += ' hidden';
    html += '" id="dia_class_wrap">';
    html += '<label class="label">Trigger Class(es)</label>';
    html += '<div class="control">';
    html += '<input id="dia_class" class="input form-control" type="text" data-type="tags" placeholder="Trigger Class" value="">';
    html += '</div><p class="help text-info">class-name-1, class-name-2, class-name-3</p></div>';

    html += '<div class="form-group';
    if(dia_method != 'auto') html += ' hidden';
    html += '" id="dia_auto_wrap">';
    html += '<label class="label">Delay</label>';
    html += '<div class="input-group">';
    html += '<input class="input form-control" id="dia_delay" type="number" value="'+dia_delay+'">';
    html += '<div class="input-group-append">';
    html += '<span class="input-group-text">Seconds</span>';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    // html += '<div class="form-group" style="margin-bottom:.5em;">';
    // html += '<label class="label">Start Delay</label>';
    // html += '</div>';
    // html += '<div class="form-group has-addons">';
    // html += '<div class="control is-expanded">';
    // html += '<input class="input form-control" id="dia_start" type="number" value="'+dia_start+'">';
    // html += '</div><div class="control">';
    // html += '<div class="button is-static">Seconds</div></div></div>';

    $('#zone-build-setting').html(html);
    new BulmaTagsInput(document.getElementById('dia_class'), {
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
    	tagClass: 'btn-rounded btn-success',
    	trim: true
    });
    if(dia_method == 'class') document.getElementById('dia_class').BulmaTagsInput().add(dia_class.join(','));
}
function buildSettingDIRECT() {
    $('#zone-build-setting').html('');
}
// function buildPreview() {
//     var device = $('.preview-device.is-selected').attr('data-value');
// }
function generatePreview(code) {

    if(code == 1) return generatePreviewIPP();
    if(code == 4) return generatePreviewNATIVE();
    if(code == 3) return generatePreviewVAST();
    if(code == 6) return generatePreviewDIALOG();
    $('#zone-preview').html('');
    $('#zone-setting').removeClass('col-lg-6');
    $('#zone-setting').addClass('col-lg-12');
    $('#zone-generate-preview').hide();
    return false;
}
function generatePreviewIPP() {
    var title = 'Advertising Title';
    var description = 'Advertising Description';
    var creative_url = '<?=ASSET_URL?>/preview/ipp.png';
    var ipp_position = $('.ipp_position.is-selected').attr('data-value');
    var position = ipp_position.split("-");
    var html = '<style>.preview-animated{transform:translate(0) !important;transition:transform 1s ease;}</style>';
    html += '<div id="preview-ipp" style="display:flex;height:100%;overflow:hidden;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
    html += '<div style="position:relative;width:100%;min-height:200px;">';
    html += '<div id="preview-item" class="preview-animated" style="position:absolute;display:flex;justify-content:flex-start;width:310px;height:60px;background:#fff;box-shadow:0 3px 3px rgba(0,0,0,.25);border-radius:6px;padding:10px;'+position[0]+':18px;'+position[1]+':8px;transform:translate('+(position[1]=='left'?'-':'')+'3700px);">';
    html += '<div style="margin-right:12px;"><img id="preview-image" width="40" height="40" src="'+creative_url+'"></div>';
    html += '<div style="display:flex;flex-direction:column;justify-content:center;">';
    html += '<div id="preview-title" style="max-width:230px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;margin-bottom:4px;font-weight:500;font-size:12px;">'+title+'</div>';
    html += '<div id="preview-description" style="max-width:230px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-size:11px;">'+description+'</div>';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    // $('#zone-preview').html(html);
    $('#zone-setting').removeClass('is-12-desktop');
    $('#zone-setting').addClass('is-6-desktop');
    $('#zone-generate-preview').show();
    // if(window.timers) clearInterval(window.timers);
    // window.timers = setInterval(function(){
    //     $('#preview-item').removeClass('preview-animated');
    //     setTimeout(function(){$('#preview-item').addClass('preview-animated');},500)
    // }, 5000);
    //////////////
    html = '<html style="overflow:auto"><head>' + '<link rel="stylesheet" href="<?=ASSET_URL?>/css/app.css?v=1608426561">'+ '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"><\/script></head><body>'+ html;
    html += '<script>';
    html += 'if(window.timers) clearInterval(window.timers);';
    html += 'window.timers = setInterval(function(){';
    html += ' $("#preview-item").removeClass("preview-animated");';
    html += 'setTimeout(function(){$("#preview-item").addClass("preview-animated");},500)';
    html += '}, 5000);';
    html += '<\/script>';
    html += '</body></html>';
    var iFrame = $('<iframe id="thepage" style="width:100%; height:100%"></iframe>');
    $('#thepage').detach();
    $('#zone-preview-test').append(iFrame);

    var iFrameDoc = iFrame[0].contentDocument || iFrame[0].contentWindow.document;
    iFrameDoc.write(html);
    iFrameDoc.close();
}
function generatePreviewNATIVE() {
    // var size = $('#size').val();
    var native_type = $('.native_type.is-selected').attr('data-value');
    if(desktop_preview){
        var title = $('.desktop-text.is-selected[data-value="title"]').length?'Advertising Title':"";
        var description = $('.desktop-text.is-selected[data-value="description"]').length?'Advertising Description':"";
        var columns = $('#desktop_col').val();
        var rows = $('#desktop_row').val();
        var text_position = $('#desktop-text').val();
    }else{
        var title = $('.mobile-text.is-selected[data-value="title"]').length?'Advertising Title':"";
        var description = $('.mobile-text.is-selected[data-value="description"]').length?'Advertising Description':"";
        var columns = $('#mobile_col').val();
        var rows = $('#mobile_row').val();
        var text_position = $('#mobile-text').val();
    }
    var creative_url = '<?=ASSET_URL?>/preview/ipp.png';
    var align = $('.native-align.is-selected').attr('data-value');
    if(native_type == 'native') {
        var html = '<div id="preview-native" style="display:content;flex-direction:column;align-items:center;justify-content:center;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
        var row;
        for (row = 0; row < rows; row++) {
            html += '<div class="columns is-gapless is-mobile">';
            var column;
            for (column = 0; column < columns; column++) {
                if(columns==5){
                    html += '<div class="column is-one-fifth"><div style="padding:.1rem">';
                }else{
                    html += '<div class="column is-'+12/columns+'"><div style="padding:.1rem">';
                }
                if(text_position=="bottom"){
                    html += '<a style="text-decoration: none;color: #999999;display: flex;position: relative;flex-direction: column;">';
                    html += '<div style="position: relative;float: left;width: 100%;min-width: auto;z-index: 2;flex: initial;height: 100%;">';
                    html += '<div style="background-image:url('+creative_url+');background-size:100% auto;position: absolute;top: 0;left: 0;;width:100%;height:100%;background-repeat:no-repeat;transition: background-size 0.3s;"></div>';
                    html += '<div style="width: 100%;padding-top: 100%;z-index: 1">';
                    html += '</div></div>';
                    html += '<div id="preview-title" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:600;font-size:1.05rem;padding-right:.5rem;text-align:'+align+'">'+title+'</div>';
                    html += '<div id="preview-description" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400;font-size:.80rem;color:#b5b5b5;padding-right:.5rem;text-align:'+align+'">'+description+'</div>';
                    html += '</a>';
                }else{
                    html += '<a style="text-decoration: none;color: #999999;display: flex;position: relative;flex-direction: row;">';
                    html += '<div style="position: relative;float: left;width: calc(100% - 460px);min-width: auto;z-index: 2;flex: 1;height: 100%;">';
                    html += '<div style="background-image:url('+creative_url+');background-size:100% auto;position: absolute;top: 0;left: 0;;width:100%;height:100%;background-repeat:no-repeat;transition: background-size 0.3s;"></div>';
                    html += '<div style="width: 100%;padding-top: 100%;z-index: 1">';
                    html += '</div></div>';
                    html += '<div style="max-width: 460px;max-height: 450px;overflow: hidden;position: initial;right: 0;top: 0;width: 460px;height: auto;padding-left: 10px;padding-right: 0;padding-top: 0px;padding-bottom: 0;display: block;text-align: left;flex: 1;position: relative;">';
                    html += '<div id="preview-title" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:600;font-size:1.05rem;padding-right:.5rem;text-align:'+align+'">'+title+'</div>';
                    html += '<div id="preview-description" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;font-weight:400;font-size:.80rem;color:#b5b5b5;padding-right:.5rem;text-align:'+align+'">'+description+'</div>';
                    html += '</div>';
                    html += '</a>';
                }
                html += '</div></div>';
            }
            html += '</div>';
        }
        html += '</div>';

        html = '<html style="overflow:auto"><head>' + '<link rel="stylesheet" href="<?=ASSET_URL?>/css/app.css?v=1608426561">'+ '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"><\/script></head><body>'+ html;
        html += '</body></html>';
        // $('#zone-preview').html(html);
        $('#zone-setting').removeClass('is-12-desktop');
        $('#zone-setting').addClass('is-6-desktop');
        $('#zone-generate-preview').show();

        var iFrame = $('<iframe id="thepage" style="width:100%; height:100%"></iframe>');
        $('#thepage').detach();
        $('#zone-preview-test').append(iFrame);

        var iFrameDoc = iFrame[0].contentDocument || iFrame[0].contentWindow.document;
        iFrameDoc.write(html);
        iFrameDoc.close();
    } else {
        if(!$('#preview-classic').length) {
            var html = '<div id="preview-classic" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
            html += '<div style="background-image:url(<?=ASSET_URL?>/preview/banner.jpg);background-size:contain;width:100%;min-height:330px;background-repeat:no-repeat;"></div>';
            html += '</div>';
            html = '<html style="overflow:auto"><head>' + '<link rel="stylesheet" href="<?=ASSET_URL?>/css/app.css?v=1608426561">'+ '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"><\/script></head><body>'+ html;
            // $('#zone-preview').html(html);
            $('#zone-setting').removeClass('is-12-desktop');
            $('#zone-setting').addClass('is-6-desktop');
            $('#zone-generate-preview').show();

            html += '</body></html>';
            var iFrame = $('<iframe id="thepage" style="width:100%; height:100%"></iframe>');
            $('#thepage').detach();
            $('#zone-preview-test').append(iFrame);

            var iFrameDoc = iFrame[0].contentDocument || iFrame[0].contentWindow.document;
            iFrameDoc.write(html);
            iFrameDoc.close();
        }
    }
    if(window.timers) clearInterval(window.timers);
}
function generatePreviewVAST() {
    // var creative_url = 'https://content.jwplatform.com/videos/AEhg3fFb-bPwArWA4.mp4';
    // var playerSettings = {
    //     "file": "//content.jwplatform.com/videos/1g8jjku3-cIp6U8lV.mp4",
    //     "image": "//content.jwplatform.com/thumbs/1g8jjku3-720.jpg",
    //     "autostart": false,
    //     "displayPlaybackLabel": true,
    //     "primary": "html5",
    //     "advertising": {
    //         "schedule": [{
    //             "vastxml": '<VAST version="2.0"><Ad id="preroll"><InLine><Creatives><Creative><Linear><MediaFiles><MediaFile height="396" width="600" bitrate="0" type="video/mp4" delivery="progressive"><![CDATA['+creative_url+']]></MediaFile></MediaFiles></Linear></Creative></Creatives></InLine></Ad></VAST>',
    //             "offset": "pre"
    //         }],
    //         "client": "vast"
    //     }
    // };
    var html = '<div id="preview-vast" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
    html += '<div style="width:100%;display:flex;flex-direction:column;align-items:center;justify-content:center;">';
    html += '<div id="preview-player"></div>';
    html += '</div>';
    html += '</div>';
    // $('#zone-preview').html(html);
    $('#zone-setting').removeClass('is-12-desktop');
    $('#zone-setting').addClass('is-6-desktop');
    $('#zone-generate-preview').show();

    html = '<html style="overflow:auto"><head>' + '<link rel="stylesheet" href="<?=ASSET_URL?>/css/app.css?v=1608426561">'+ '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"><\/script></head><body>'+ html;
    html += '<script>';
    html += 'var playerSettings = {';
    html += '    "file": "//content.jwplatform.com/videos/1g8jjku3-cIp6U8lV.mp4",';
    html += '    "image": "//content.jwplatform.com/thumbs/1g8jjku3-720.jpg",';
    html += '    "autostart": false,';
    html += '    "displayPlaybackLabel": true,';
    html += '    "primary": "html5",';
    html += '    "advertising": {';
    html += '        "schedule": [{';
    html += '            "vastxml": \'<VAST version="2.0"><Ad id="preroll"><InLine><Creatives><Creative><Linear><MediaFiles><MediaFile height="396" width="600" bitrate="0" type="video/mp4" delivery="progressive"><![CDATA[https://content.jwplatform.com/videos/AEhg3fFb-bPwArWA4.mp4]]></MediaFile><\/MediaFiles><\/Linear><\/Creative><\/Creatives><\/InLine><\/Ad><\/VAST>\',';
    html += '             "offset": "pre"';
    html += '         }],';
    html += '         "client": "vast"';
    html += '     }';
    html += ' };';

    html += 'if(window.timers) clearInterval(window.timers);';

    html += 'try {';
    html += '    jwplayer().remove();';
    html += '    jwplayer(\'preview-player\').setup(playerSettings);';
    html += '}catch(e) {';
    html += '    $.getScript(\'https://cdn.jwplayer.com/libraries/qWykpG2x.js\', function(){';
    html += '        jwplayer(\'preview-player\').setup(playerSettings);';
    html += '    });';
    html += '}';
    html += '<\/script>';
    html += '</body></html>';

    var iFrame = $('<iframe id="thepage" style="width:100%; height:100%"></iframe>');
    $('#thepage').detach();
    $('#zone-preview-test').append(iFrame);

    var iFrameDoc = iFrame[0].contentDocument || iFrame[0].contentWindow.document;
    iFrameDoc.write(html);
    iFrameDoc.close();
}
function generatePreviewDIALOG() {
    var title = 'Advertising Title';
    var description = 'Advertising Description';
    var creative_url = '<?=ASSET_URL?>/preview/ipp.png';

    var html = '<style>.preview-animated{transform:translate(0,.5rem) !important;}</style>';
    html += '<div id="preview-dialog" style="display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:10px 10px 0 0;background:linear-gradient(180deg,#f2f2f2,hsla(0,0%,94.9%,0));">';
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
    // $('#zone-preview').html(html);
    $('#zone-setting').removeClass('is-12-desktop');
    $('#zone-setting').addClass('is-6-desktop');
    $('#zone-generate-preview').show();
    if(window.timers) clearInterval(window.timers);
    window.timers = setInterval(function(){
        $('#preview-item').toggleClass('preview-animated');
    }, 2000);

    html = '<html style="overflow:auto"><head>' + '<link rel="stylesheet" href="<?=ASSET_URL?>/css/app.css?v=1608426561">'+ '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"><\/script></head><body>'+ html;
    html += '<script>';
    html += 'if(window.timers) clearInterval(window.timers);';
    html += 'window.timers = setInterval(function(){';
    html += '$("#preview-item").toggleClass("preview-animated");';
    html += '}, 2000);';
    html += '<\/script>';
    html += '</body></html>';

    var iFrame = $('<iframe id="thepage" style="width:100%; height:100%"></iframe>');
    $('#thepage').detach();
    $('#zone-preview-test').append(iFrame);

    var iFrameDoc = iFrame[0].contentDocument || iFrame[0].contentWindow.document;
    iFrameDoc.write(html);
    iFrameDoc.close();
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
$(document).ready(function() {
    buildSetting();
    $(document).on('click', '.help-modal', function() {
        $('#'+$(this).attr('data-target')).modal('show');
    });
    $('.preview-device').on('click', function() {
        $('#device-desktop').addClass('hidden');
        $('#device-tablet').addClass('hidden');
        $('#device-mobile').addClass('hidden');
        var $this = $(this), value = $this.attr('data-value');
        value == 'desktop' || value == 'tablet' ?desktop_preview = 1:desktop_preview = 0;
        $('.preview-device').removeClass('is-selected');
        $this.addClass('is-selected');
        $('#device-'+value).removeClass('hidden');
        $(".zone-preview-wrap").removeAttr( 'style' );
        if(value!='desktop'){
            $('.zone-preview-wrap').css({'background-color': '#f7f9fe','border': 'solid #d4d4d4','border-radius': '28px','border-width': '46px 8px 24px','min-height': '300px','border': '2px solid #e1e4eb'});
        }else{
            $('.zone-preview-wrap').css({'border': 'solid #d4d4d4','border-radius': '8px','border-width': '2px','min-height': '300px','border': '2px solid #e1e4eb'});
        }
        if(value=='mobile'){
            $('.zone-preview-wrap').css({'max-width':'376px','margin': '10px auto 0'});
        }
        generatePreview(ad_format);
    });
    $(document).on('click', '.pop_method', function() {
        var $this = $(this), value = $this.attr('data-value');
        $('.pop_method').removeClass('is-selected');
        $this.addClass('is-selected');
        if(value=='class') {
            $('#pop_class_wrap').removeClass('hidden');
        } else {
            $('#pop_class_wrap').addClass('hidden');
        }
    });
    $(document).on('click', '.dia_method', function() {
        var $this = $(this), value = $this.attr('data-value');
        $('.dia_method').removeClass('is-selected');
        $this.addClass('is-selected');
        if(value=='class') {
            $('#dia_class_wrap').removeClass('hidden');
        } else {
            $('#dia_class_wrap').addClass('hidden');
        }
        if(value=='auto') {
            $('#dia_auto_wrap').removeClass('hidden');
        } else {
            $('#dia_auto_wrap').addClass('hidden');
        }

    });
    $(document).on('click', '.native_type', function() {
        var $this = $(this), value = $this.attr('data-value');
        $('.native_type').removeClass('is-selected');
        $this.addClass('is-selected');
        $('.banner-setting-wrap').addClass('hidden');
        $('#banner-'+value).removeClass('hidden');
        generatePreview(ad_format);
    });
    $(document).on('change', '#desktop_col', function() {
        generatePreview(ad_format);
    });
    $(document).on('change', '#desktop_row', function() {
        generatePreview(ad_format);
    });
    $(document).on('change', '#mobile_col', function() {
        generatePreview(ad_format);
    });
    $(document).on('change', '#mobile_row', function() {
        generatePreview(ad_format);
    });
    $(document).on('change', '#desktop-text', function() {
        generatePreview(ad_format);
    });
    $(document).on('change', '#mobile-text', function() {
        generatePreview(ad_format);
    });
    $(document).on('click', '.exclude-ad', function() {
        $(this).toggleClass('btn-danger');
    });
    $(document).on('click', '.message-header', function() {
        var $this = $(this);
        $this.find('.icon').toggleClass('spin180');
        $this.closest('.message').find('.message-body').toggleClass('hidden');
    });
    $(document).on('click', '.desktop-text, .mobile-text', function() {
        $(this).toggleClass('is-selected');
        generatePreview(ad_format);
    });
    $(document).on('click', '.ipp_label', function() {
        $('.ipp_label').removeClass('is-selected');
        $(this).addClass('is-selected');
    });
    $(document).on('click', '.ipp_position', function() {
        $('.ipp_position').removeClass('is-selected');
        $(this).addClass('is-selected');
        generatePreview(ad_format);
    });
    $(document).on('click', '.desktop-spacing', function() {
        $('.desktop-spacing').removeClass('is-selected');
        $(this).addClass('is-selected');
    });
    $(document).on('click', '.mobile-spacing', function() {
        $('.mobile-spacing').removeClass('is-selected');
        $(this).addClass('is-selected');
    });
    $(document).on('click', '.native-align', function() {
        $('.native-align').removeClass('is-selected');
        $(this).addClass('is-selected');
        generatePreview(ad_format);
    });
    $(document).on('click', '.desktop-image', function() {
        var $this = $(this), value = $this.attr('data-value');
        $('.desktop-image').removeClass('is-selected');
        $this.addClass('is-selected');
        if(value == 'ratio') {
            $('.img-ratio').removeClass('hidden');
            $('.img-fixed').addClass('hidden');
        } else {
            $('.img-fixed').removeClass('hidden');
            $('.img-ratio').addClass('hidden');
        }
    });
    $(document).on('click', '.mobile-image', function() {
        var $this = $(this), value = $this.attr('data-value');
        $('.mobile-image').removeClass('is-selected');
        $this.addClass('is-selected');
        if(value == 'ratio') {
            $('.mobile-img-ratio').removeClass('hidden');
            $('.mobile-img-fixed').addClass('hidden');
        } else {
            $('.mobile-img-fixed').removeClass('hidden');
            $('.mobile-img-ratio').addClass('hidden');
        }
    });
    $('#enterAction').click(function() {
        var $this = $(this), data = {}, floor_cpm = _parseFloat($('#bid').val()), id = <?=$this->data->id?>;
        data.fallback = $.trim($('#fallback').val());
        if(data.fallback && data.fallback.indexOf('https://') != 0) {
            __tajs.showAlert('Fallback Url should be start with https');
            return false;
        }
        data.frequency = _parseInt($('#frequency_number').val())+':'+_parseInt($('#frequency_time').val())+$('#frequency_timetype').val();

        if(ad_format == 1) {
            data.ipp_start = _parseInt($('#ipp_start').val());
            data.ipp_total = _parseInt($('#ipp_total').val());
            data.ipp_delay = _parseInt($('#ipp_delay').val());
            data.ipp_label = $('.ipp_label.is-selected').attr('data-value');
            data.ipp_position = $('.ipp_position.is-selected').attr('data-value');
            if(data.ipp_total < 1) {
                __tajs.showAlert('Please allow at least 1 notification');
                return false;
            }
        } else if(ad_format == 2) {
            data.pop_method = $('.pop_method.is-selected').attr('data-value');
            data.pop_class = data.pop_method == 'class' ? document.getElementById('pop_class').BulmaTagsInput().items : [];
            data.pop_delay = _parseInt($('#pop_delay').val());
        } else if(ad_format == 3) {
            data.vast_skip = _parseInt($('#vast_skip').val());
            data.vast_impr = $.trim($('#vast_impr').val());
            data.vast_click = $.trim($('#vast_click').val());
        } else if(ad_format == 4) {
            data.native_type = $('.native_type.is-selected').attr('data-value');
            if(data.native_type == 'classic') {
                data.desktop_size = $('#desktop_size').val();
                data.mobile_size = $('#mobile_size').val();
            } else {
                data.desktop_col = $('#desktop_col').val();
                data.desktop_row = $('#desktop_row').val();
                data.desktop_text_title = $('.desktop-text.is-selected[data-value="title"]').length;
                data.desktop_text_description = $('.desktop-text.is-selected[data-value="description"]').length;
                data.desktop_text_position = $('#desktop-text').val();
                data.desktop_spacing = _parseInt($('#desktop-spacing').val()) + $('.desktop-spacing.is-selected').attr('data-value');
                data.desktop_image = $('.img-ratio.is-hidden').length ? _parseInt($('#desktop-image-width').val())+'px-'+_parseInt($('#desktop-image-height').val())+'px' : $('#desktop-image').val();
                data.mobile_breaking = $('#mobile_breaking').val();
                data.mobile_col = $('#mobile_col').val();
                data.mobile_row = $('#mobile_row').val();
                data.mobile_text_title = $('.mobile-text.is-selected[data-value="title"]').length;
                data.mobile_text_description = $('.mobile-text.is-selected[data-value="description"]').length;
                data.mobile_text_position = $('#mobile-text').val();
                data.mobile_spacing = _parseInt($('#mobile-spacing').val()) + $('.mobile-spacing.is-selected').attr('data-value');
                data.mobile_image = $('.mobile-img-ratio.is-hidden').length ? _parseInt($('#mobile-image-width').val())+'px-'+_parseInt($('#mobile-image-height').val())+'px' : $('#mobile-image').val();
                data.native_css = $.trim($('#native_css').val());
                data.native_font = $('#native_font').val();
                data.native_align = $('.native-align.is-selected').attr('data-value');
            }
        } else if(ad_format == 6) {
            data.dia_method = $('.dia_method.is-selected').attr('data-value');
            data.dia_class = data.dia_method == 'class' ? document.getElementById('dia_class').BulmaTagsInput().items : [];
            data.dia_delay = data.dia_method == 'auto' ? _parseInt($('#dia_delay').val()) : 0;
        }

        data.excluded_types = [];
        $('.exclude-ad.btn-danger').each(function(){
            data.excluded_types.push($(this).attr('data-value'));
        });

        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post(window.location.pathname, {csrf_token: __tajs.csrf, id: id, data: JSON.stringify(data), floor_cpm: floor_cpm}, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (res.success) {
                window.location.replace(res.data);
            }
            else {
                __tajs.showAlert(res.data);
            }
        });
    });
    generatePreview(ad_format);
});
</script>
