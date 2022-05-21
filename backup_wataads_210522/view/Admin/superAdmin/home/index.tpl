<style>
    span.icon svg {
        width: 50px;
    }

    .title{
        font-size: 1.5rem;
    }
    .btn-default:hover{
        background-color: rgba(128, 128, 128, 0.2);
    }
    .page-title-box {
        padding: 1rem 0;
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
        padding: 3rem 1.5rem;
    }

    .title-dashboard-admin {
        flex: 1;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

</style>
<div class="content-body">

    <div class="row is-multiline">
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/advertiser/ad/pending">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-dashboard-admin">
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->ad->Pending??0)?></h2>
                        <p style="color: #626262">Pending Ads</p>
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
            <a class="card" href="/publisher/website/pending">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-dashboard-admin" >
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->website->Pending??0)?></h2>
                        <p style="color: #626262">Pending Websites</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-globe text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/support/opening">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-dashboard-admin" >
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->openingTicket)?></h2>
                        <p style="color: #626262">Opening Tickets</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-ticket text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6 col-12">
            <a class="card" href="/billing/withdraw/pending">
                <div class="card-header d-flex align-items-start pb-0">
                    <div class="title-dashboard-admin" >
                        <h2 class="text-bold-700 mt-0"><?=$this->helper->numberFormat($this->data->withdraw->Pending??0)?></h2>
                        <p style="color: #626262">Pending Withdraw</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-credit-card text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="page-title-box">
        <div class="row is-mobile">
            <div class="col-6">
                <h1 class="title is-6">Billing</h1>
            </div>
            <div class="col-6">
                <div class="buttons pull-right">
                    <a href="/billing" class="btn btn-default text-primary" target="_blank">
                        <span>More</span>
                        <span class="icon">
                            <svg viewBox="0 0 24 24" style="width: 24px;">
                                <path fill="currentColor" d="M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M6,13H14L10.5,16.5L11.92,17.92L17.84,12L11.92,6.08L10.5,7.5L14,11H6V13Z"></path>
                            </svg>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row is-multiline"></div>

    <div class="page-title-box">
        <div class="row is-mobile">
            <div class="col-6">
                <h1 class="title is-6">My Activities</h1>
            </div>
            <div class="col-6">
                <div class="buttons pull-right">
                    <a href="/user/activity" class="btn btn-default text-primary">
                        <span>More</span>
                        <span class="icon">
                            <svg viewBox="0 0 24 24" style="width: 24px;">
                                <path fill="currentColor" d="M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M6,13H14L10.5,16.5L11.92,17.92L17.84,12L11.92,6.08L10.5,7.5L14,11H6V13Z"></path>
                            </svg>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card flatbox is-100height">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <?php if($this->data->activity): ?>
                        <div class="activity">
                            <ul>
                                <?php foreach($this->data->activity as $item): ?>
                                <li>
                                    <span class="adate"><?=$item->created_at?></span>
                                    <span class="badge <?php if($item->type == 'Account'): ?>badge-info<?php else: ?>badge-success<?php endif; ?> atype"><?=$item->type?></span>
                                    <a href="/activity?q=<?=urlencode($item->ip_address)?>" class="text-info aip"><?=$item->ip_address?></a>
                                    <span class="text-muted"><?=$item->message?></span>
                                </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>No Records</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-title-box">
        <div class="row is-mobile">
            <div class="col-12">
                <h1 class="title is-6">My Note</h1>
            </div>

        </div>
    </div>
    <div class="row" id="my_note">
        <div class="col-12">
            <article class="card flatbox is-100height">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="form-group">
                            <textarea class="textarea form-control" id="user_note" placeholder="Write something you want to remember" rows="10"><?=$this->data->user_note?></textarea>
                            <p class="text-info d-none d-md-block" id="note_count"></p>
                        </div>
                        <div class="text-center">
                            <button type="button" class="btn btn-success mr-1 mb-1 waves-effect waves-light" id="save_note" disabled>
                                <i class="fa fa-check"></i> Save Note
                            </button>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </div>

</div>
<script>
/* global $, __tajs */
function count_note() {
    var max = 9999, current = $.trim($('#user_note').val()).length, count = $('#note_count');
    var left = max - current;
    if (left < 20) {
        count.removeClass('text-info').addClass('text-danger');
    } else {
        count.removeClass('text-danger').addClass('text-info');
    }
    count.html('Max '+max+' characters, used: '+current+', left: '+left);
}
$(document).ready(function(){
    count_note();
    $('#user_note').on('input', function(){
        count_note();
        $('#save_note').prop('disabled', false);
    });
    $('#save_note').on('click', function(){
        var $this = $(this);
        $this.prop('disabled', true);
        $this.addClass('is-loading');
        $.post('/note', {csrf_token: __tajs.csrf, data: $.trim($('#user_note').val())}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            $this.html('<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" /></svg></span><span>Saved!</span>');
        });
    });
    $(document).on('click', '.read_more', function() {
        var $this = $(this), id = $this.attr('data-id');
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/announcement/content/'+id, {csrf_token: __tajs.csrf}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                $this.parent().html(res.data.replace(/\n/g,"<br>"));
            }
        });
    });
});
</script>