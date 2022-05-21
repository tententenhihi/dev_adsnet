<style>
    .sumbox {
        display: flex;
        /*background-color: #fff;*/
        border-radius: 0.25rem;
        padding: 25px;
        border: none;
        /*-webkit-box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);*/
        /*box-shadow: 0 0 24px 0 rgb(0 0 0 / 6%), 0 1px 0 0 rgb(0 0 0 / 2%);*/
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
    .subtitle.is-2 {
        font-size: 2.5rem;
    }
    .title-1:not(:last-child) {
        margin-bottom: 1.5rem;
    }
    .subtitle.is-1 {
        font-size: 3rem;
    }
</style>
<div class="content-body">
    
    <div class="row is-multiline" style="flex-wrap: wrap">
        <div class="col-lg-3 col-md-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <a class="sumbox" href="/ad/pending">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->pendingAd)?></p>
                        <p class="subtitle is-6 text-muted">Pending Ads</p>
                    </div>
                    <div class="sumbox-icon text-success">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                        </svg>
                    </span>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <a class="sumbox" href="/website/pending">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->pendingWebsite)?></p>
                        <p class="subtitle is-6 text-muted">Pending Websites</p>
                    </div>
                    <div class="sumbox-icon text-info">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2M12,4A8,8 0 0,0 4,12C4,14.09 4.8,16 6.11,17.41L9.88,9.88L17.41,6.11C16,4.8 14.09,4 12,4M12,20A8,8 0 0,0 20,12C20,9.91 19.2,8 17.89,6.59L14.12,14.12L6.59,17.89C8,19.2 9.91,20 12,20M12,12L11.23,11.23L9.7,14.3L12.77,12.77L12,12M12,17.5H13V19H12V17.5M15.88,15.89L16.59,15.18L17.65,16.24L16.94,16.95L15.88,15.89M17.5,12V11H19V12H17.5M12,6.5H11V5H12V6.5M8.12,8.11L7.41,8.82L6.35,7.76L7.06,7.05L8.12,8.11M6.5,12V13H5V12H6.5Z" />
                        </svg>
                    </span>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <a class="sumbox" href="/support/opening">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->openingTicket)?></p>
                        <p class="subtitle is-6 text-muted">Opening Tickets</p>
                    </div>
                    <div class="sumbox-icon text-danger">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M19.79,15.41C20.74,13.24 20.74,10.75 19.79,8.59L17.05,9.83C17.65,11.21 17.65,12.78 17.06,14.17L19.79,15.41M15.42,4.21C13.25,3.26 10.76,3.26 8.59,4.21L9.83,6.94C11.22,6.35 12.79,6.35 14.18,6.95L15.42,4.21M4.21,8.58C3.26,10.76 3.26,13.24 4.21,15.42L6.95,14.17C6.35,12.79 6.35,11.21 6.95,9.82L4.21,8.58M8.59,19.79C10.76,20.74 13.25,20.74 15.42,19.78L14.18,17.05C12.8,17.65 11.22,17.65 9.84,17.06L8.59,19.79M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2M12,8A4,4 0 0,0 8,12A4,4 0 0,0 12,16A4,4 0 0,0 16,12A4,4 0 0,0 12,8Z" />
                        </svg>
                    </span>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-12 mb-2">
            <div class="card h-100 mb-0">
                <a class="sumbox" href="/withdraw/pending">
                    <div class="sumbox-text">
                        <p class="title is-4"><?=$this->helper->numberFormat($this->data->pendingWithdraw)?></p>
                        <p class="subtitle is-6 text-muted">Pending Withdraw</p>
                    </div>
                    <div class="sumbox-icon text-warning">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M21,18V19A2,2 0 0,1 19,21H5C3.89,21 3,20.1 3,19V5A2,2 0 0,1 5,3H19A2,2 0 0,1 21,5V6H12C10.89,6 10,6.9 10,8V16A2,2 0 0,0 12,18M12,16H22V8H12M16,13.5A1.5,1.5 0 0,1 14.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 17.5,12A1.5,1.5 0 0,1 16,13.5Z" />
                        </svg>
                    </span>
                    </div>
                </a>
            </div>
        </div>
    </div>
    
</div>
<script>
/* global $, __tajs */
</script>