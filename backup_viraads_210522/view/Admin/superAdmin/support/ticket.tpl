<style>
.media-content .title {
    margin-bottom: 0 !important;
}
.has- {
    color: #b5b5c3 !important;
}
.media-left .tag {
    width: 4rem;
    /*height: 2rem;*/
}
.media-left svg {
    width: 40px;
    height: 40px;
}
.media-right .icon, .button .icon {
    vertical-align: bottom;
}
.buttons.are-transparent {
    margin-bottom: 0 !important;
}
.buttons.are-transparent .button {
    background-color: transparent;
    margin-bottom: 0;
}
.buttons.are-transparent .button:focus {
    box-shadow: none;
}
.button.is-muted {
    background-color: #ebebf5c2;
    color: #b5b5c3;
    border: none;
    height: 2rem;
}
.button.is-muted:hover {
    background-color: #ebebf5;
    color: #7E8299;
}
.button.is-muted.is-right {
    background-color: transparent;
    width: 100%;
    justify-content: flex-end;
    padding-right: 0;
}
.button.is-muted.is-right:hover {
    background-color: transparent;
}
hr {
    margin: 0.5rem 0px .5rem 0px;
}
@media screen and (max-width: 768px) {
    .media-content {
        overflow-x: unset;
    }
}

.stars:not(.is-disabled):hover > .star {
    color: #ffdd57;
}
.stars:not(.is-disabled) > .star:hover ~ .star {
    color: #8094ae;
}
.stars:not(.is-disabled) .star {
    cursor: pointer;
}
.stars.is-disabled .star {
    cursor: not-allowed;
}
.star {
    color: #8094ae;
    margin-right: -.3rem;
}
.star.is-active {
    color: #ffdd57 !important;
}


.media-left {
    margin-right: 1rem;
}

.media-left, .media-right {
    flex-basis: auto;
    flex-grow: 0;
    flex-shrink: 0;
}
.field.is-grouped {
    display: flex;
    justify-content: flex-start;
}
.tags:last-child {
    margin-bottom: -0.5rem;
}
.tags {
    align-items: center;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    margin-right: 15px;
}


.media {
    align-items: flex-start;
    display: flex;
    text-align: inherit;
}
.media-content {
    flex-basis: auto;
    flex-grow: 1;
    flex-shrink: 1;
    text-align: inherit;
}
.media+.media {
    border-top: 1px solid rgba(219,219,219,.5);
    margin-top: 1rem;
    padding-top: 2rem;
}
.is-64x64{
    height: 80px;
    width: 80px;
}
.is-64x64 img{
    border-radius: 50%;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <div class="media" style="flex-wrap: wrap">
                                        <div class="media-left mb-2">
                                            <div class="field is-grouped is-grouped-multiline">
                                                <?php if($this->data->ticket->is_escalated): ?>
                                                <div class="control">
                                                    <div class="tags has-addons">
                                                        <span class="badge badge-dark" style="width: 3rem;">
                                                            <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                                                                <path fill="currentColor" d="M20 8H18.95L6.95 20H4C2.9 20 2 19.11 2 18C2 16.9 2.9 16 4 16H5.29L7 14.29V10C7 9.45 7.45 9 8 9H9C9.55 9 10 9.45 10 10V11.29L17.29 4H20C21.11 4 22 4.89 22 6C22 7.11 21.11 8 20 8M8.5 5C9.33 5 10 5.67 10 6.5C10 7.33 9.33 8 8.5 8C7.67 8 7 7.33 7 6.5C7 5.67 7.67 5 8.5 5M20.17 15.66L14.66 21.17L12.83 19.34L18.34 13.83L16.5 12H22V17.5L20.17 15.66Z" />
                                                            </svg>
                                                        </span>
                                                        <span class="badge badge-danger" style="padding-bottom: 8px;padding-top: 8px;">
                                                            Escalated
                                                        </span>
                                                    </div>
                                                </div>
                                                <?php endif; ?>
                                                <?php if($this->data->ticket->status == 'Replied'): ?>
                                                <div class="control">
                                                    <div class="tags has-addons">
                                                        <span class="badge badge-dark" style="width: 3rem;">
                                                            <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                                                                <path fill="currentColor" d="M10,9V5L3,12L10,19V14.9C15,14.9 18.5,16.5 21,20C20,15 17,10 10,9Z" />
                                                            </svg>
                                                        </span>
                                                        <span class="badge badge-success" style="padding-bottom: 8px;padding-top: 8px;">>
                                                            <?=ucwords($this->data->ticket->status)?>
                                                        </span>
                                                    </div>
                                                </div>
                                                <?php elseif($this->data->ticket->status == 'Opening'): ?>
                                                <div class="control">
                                                    <div class="tags has-addons">
                                                        <span class="badge badge-dark" style="width: 3rem;">
                                                            <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                                                                <path fill="currentColor" d="M8,4A5,5 0 0,0 3,9V18H1V20H21A2,2 0 0,0 23,18V9A5,5 0 0,0 18,4H8M8,6A3,3 0 0,1 11,9V18H5V9A3,3 0 0,1 8,6M14,11H20V15H18V13H14V11Z" />
                                                            </svg>
                                                        </span>
                                                        <span class="badge badge-info" style="padding-bottom: 8px;padding-top: 8px;">
                                                            <?=ucwords($this->data->ticket->status)?>
                                                        </span>
                                                    </div>
                                                </div>
                                                <?php else: ?>
                                                <div class="control">
                                                    <div class="tags has-addons">
                                                        <span class="badge badge-dark" style="width: 3rem;">
                                                            <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                                                                <path fill="currentColor" d="M13,13H11V7H13M13,17H11V15H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                                            </svg>
                                                        </span>
                                                        <span class="badge badge-warning" style="padding-bottom: 8px;padding-top: 8px;">
                                                            <?=ucwords($this->data->ticket->status)?>
                                                        </span>
                                                    </div>
                                                </div>
                                                <?php endif; ?>
                                                <div class="control">
                                                    <div class="tags has-addons">
                                                        <span class="badge badge-dark" style="width: 3rem;">
                                                            <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                                                                <path fill="currentColor" d="M12 3C14.21 3 16 4.79 16 7S14.21 11 12 11 8 9.21 8 7 9.79 3 12 3M16 13.54C16 14.6 15.72 17.07 13.81 19.83L13 15L13.94 13.12C13.32 13.05 12.67 13 12 13S10.68 13.05 10.06 13.12L11 15L10.19 19.83C8.28 17.07 8 14.6 8 13.54C5.61 14.24 4 15.5 4 17V21H20V17C20 15.5 18.4 14.24 16 13.54Z" />
                                                            </svg>
                                                        </span>
                                                        <span class="badge badge-info" style="padding-bottom: 8px;padding-top: 8px;">
                                                            <?=ucwords($this->data->ticket->service)?>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="media-content">
                                            <h2 class="title is-5">
                                                <span id="camp-name"><?=htmlentities($this->data->ticket->subject)?></span>
                                            </h2>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="mt-4">
                                            <div class="buttons are-transparent">
                                                <button class="btn btn-success waves-effect waves-light mb-1">
                                                    <i class="fa fa-credit-card-alt"></i>
                                                    <span>Adv Balance: <?=$this->currencyFormat($this->data->user->adv_balance)?></span>
                                                </button>
                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="fa fa-credit-card-alt"></i>
                                                    <span>Adv Payments: <?=$this->numberFormat($this->data->user->deposit_count)?></span>
                                                </button>
                                                <button class="btn btn-success waves-effect waves-light mb-1">
                                                    <i class="fa fa-university"></i>
                                                    <span>Adv Paid: <?=$this->currencyFormat($this->data->user->deposit_value)?></span>
                                                </button>
                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="fa fa-money"></i>
                                                    <span>Adv Receipts: <?=$this->numberFormat($this->data->user->receipt_count)?></span>
                                                </button>
                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="fa fa-usd"></i>
                                                    <span>Adv Spent: <?=$this->numberFormat($this->data->user->receipt_value)?></span>
                                                </button>
                                                <span class="btn btn-success waves-effect waves-light mb-1">Adv Rank: </span>
                                                <span class="stars adv is-disabled">
                                                    <span class="icon star<?php if($this->data->user->adv_rank > 0): ?> is-active<?php endif;?>" data-rank="1">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->adv_rank > 1): ?> is-active<?php endif;?>" data-rank="2">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->adv_rank > 2): ?> is-active<?php endif;?>" data-rank="3">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->adv_rank > 3): ?> is-active<?php endif;?>" data-rank="4">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->adv_rank > 4): ?> is-active<?php endif;?>" data-rank="5">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="mt-2">
                                            <div class="buttons are-transparent">
                                                <button class="btn btn-success waves-effect waves-light mb-1">
                                                    <i class="fa fa-credit-card-alt"></i>
                                                    <span>Pub Balance: <?=$this->currencyFormat($this->data->user->pub_balance + $this->data->user->pub_pending)?></span>
                                                </button>
                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="fa fa-usd"></i>
                                                    <span>Pub Withdraw: <?=$this->numberFormat($this->data->user->withdraw_count)?></span>
                                                </button>
                                                <button class="btn btn-success waves-effect waves-light mb-1">
                                                    <i class="fa fa-money"></i>
                                                    <span>Pub Earned: <?=$this->currencyFormat($this->data->user->withdraw_value)?></span>
                                                </button>
                                                </button>
                                                <span class="btn btn-success waves-effect waves-light mb-1">Pub Rank:</span>
                                                <span class="stars pub is-disabled">
                                                    <span class="icon star<?php if($this->data->user->pub_rank > 0): ?> is-active<?php endif;?>" data-rank="1">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->pub_rank > 1): ?> is-active<?php endif;?>" data-rank="2">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->pub_rank > 2): ?> is-active<?php endif;?>" data-rank="3">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->pub_rank > 3): ?> is-active<?php endif;?>" data-rank="4">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="icon star<?php if($this->data->user->pub_rank > 4): ?> is-active<?php endif;?>" data-rank="5">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z"></path>
                                                        </svg>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="mt-2">
                                            <div class="buttons are-transparent">
                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="feather icon-mail"></i>
                                                    <span>User Email: <?=$this->data->user->email?></span>
                                                </button>

                                                <?php if($this->data->user->phone): ?>
                                                <a class="btn btn-info waves-effect waves-light mb-1" href="tel:<?=str_replace(' ', '', $this->data->user->phone)?>">
                                                    <i class="feather icon-smartphone"></i>
                                                    <span><?=$this->data->user->phone?></span>
                                                </a>
                                                <?php else: ?>
                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="feather icon-smartphone"></i>
                                                    <span>Phone: Not available</span>
                                                </button>
                                                <?php endif; ?>

                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="fa fa-birthday-cake"></i>
                                                    <span>Birthday: <?=$this->data->user->birthday?:'Not available'?></span>
                                                </button>
                                                <button class="btn btn-info waves-effect waves-light mb-1">
                                                    <i class="fa fa-calendar"></i>
                                                    <span>Join: <?=$this->data->user->created_at?></span>
                                                </button>
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
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <?php foreach($this->data->message as $item): ?>
                        <article class="media">
                            <figure class="media-left">
                                <p class="image is-64x64">
                                    <img src="<?php if($item->user_id): ?><?=$this->data->user->avatar?><?php else: ?><?=$this->asset('img/staff.svg')?><?php endif; ?>">
                                </p>
                            </figure>
                            <div class="media-content">
                                <div class="content" style="margin-left: 10px;">
                                    <p>
                                        <strong><?php if($item->user_id): ?><a href="/user/<?=$item->user_id?>" target="_blank"><?=$this->data->user->name?></a><?php else: ?><?=SITE_NAME?> Staff<?php endif; ?></strong> <small>@<?=$item->created_at?></small></strong>
                                        <small class="pull-right">
                                            <a type="button" class="text-success btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn_edit"
                                               data-id="<?=$item->id?>">
                                                <i class="feather icon-edit"></i>
                                            </a>
                                            <a type="button" class="text-danger btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn_remove"
                                               data-id="<?=$item->id?>">
                                                <i class="feather icon-trash"></i>
                                            </a>
                                        </small>
                                        <br>
                                    </p>
                                    <p class=" ticket-message">
                                        <?=nl2br(htmlentities($item->message))?>
                                    </p>
                                </div>
                            </div>
                        </article>
                        <?php endforeach; ?>
                        <article class="media">
                            <figure class="media-left">
                                <p class="image is-64x64">
                                    <img src="<?=$this->asset('img/staff.svg')?>">
                                </p>
                            </figure>
                            <div class="media-content">
                                <div class="form-group">
                                    <textarea class="textarea form-control" id="message" placeholder="Add a message..." rows="5"></textarea>
                                </div>
                                <div class="buttons text-center pt-1 pb-1">
                                    <button class="btn btn-primary mb-1" id="ticket_reply">
                                        <i class="fa fa-reply"></i>
                                        <span>Reply</span>
                                    </button>
                                    <?php if(!$this->data->ticket->is_escalated): ?>
                                    <button class="btn btn-danger mb-1" id="ticket_escalate">
                                        <i class="feather icon-trending-up"></i>
                                        <span>Escalate</span>
                                    </button>
                                    <?php endif; ?>
                                    <button class="btn btn-warning mb-1" id="ticket_close">
                                        <i class="feather icon-x"></i>
                                        <span>Close</span>
                                    </button>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
/* global $, __tajs */
$(document).ready(function() {
    var ticket_id = <?=$this->data->ticket->id?>;
    $('#ticket_reply').on('click', function() {
        var $this = $(this), message = $.trim($('#message').val());
        if (!message.length) {
            __tajs.showAlert('Your message is empty');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/support/ticket', {
            csrf_token: __tajs.csrf,
            ticket_id: ticket_id,
            message: message
        }, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.replace('/support/opening');
            }
        });
    });
    $('#ticket_escalate').on('click', function() {
        var $this = $(this);
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/support/ticket', {
            csrf_token: __tajs.csrf,
            ticket_id: ticket_id,
            escalate: true
        }, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.replace('/support/opening');
            }
        });
    });
    $('#ticket_close').on('click', function() {
        var $this = $(this);
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/support/ticket', {
            csrf_token: __tajs.csrf,
            ticket_id: ticket_id,
            close: true
        }, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.replace('/support/opening');
            }
        });
    });
    $('.btn_remove').click(function(){
        var $this = $(this), id = parseInt($this.attr('data-id'),10);
        __tajs.showConfirm('Are you sure want to delete this message ?', function(yes){
            if(yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/support/ticket', {csrf_token: __tajs.csrf, ticket_id: ticket_id, remove: id}, function(res){
                    if(res.success) {
                        $this.closest('.media').remove();
                    } else {
                        $this.prop('disabled', false);
                        $this.removeClass('is-loading');
                        __tajs.showAlert(res.data);
                    }
                });
            }
        });
    });
    $('.btn_edit').click(function(){
        var $this = $(this), id = parseInt($this.attr('data-id'),10), messagewrap = $this.closest('.content').find('.ticket-message');
        $this.replaceWith('<a class="text-success btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn_editsave" data-id="'+id+'"><i class="feather icon-check"></i></a>');
        messagewrap.replaceWith($(document.createElement('textarea')).attr('class', 'textarea form-control').attr('rows', '5').val($.trim(messagewrap.html().replace(/<br>/gim, ""))));
    });
    $(document).on('click', '.btn_editsave', function(){
        var $this = $(this), id = parseInt($this.attr('data-id'),10), textarea = $this.closest('.content').find('.textarea'), message = textarea.val();
        console.log($this)
        $this.addClass('is-loading');
        $.post('/support/ticket', {
            csrf_token: __tajs.csrf,
            ticket_id: ticket_id,
            message_id: id,
            message: message
        }, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                __tajs.showAlert(res.data);
            }
            else {
                $this.replaceWith('<a type="button" class="text-success btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn_edit" data-id="'+id+'"><i class="feather icon-edit"></i></a>');
                $this.remove();
                textarea.replaceWith($(document.createElement('p')).attr('class', ' ticket-message').html(message.replace(/\n/g,"<br>")));
                window.location.reload();
            }
        });
    });
});
</script>