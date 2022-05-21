
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">
                        <span class="badge status badge-<?php if($this->data->ticket->status == 'Opening'): ?>info<?php elseif($this->data->ticket->status == 'Replied'): ?>success<?php else: ?>warning<?php endif; ?>"><?=ucwords($this->data->ticket->status)?></span> 
                        <span class="badge status badge-success"><?=ucwords($this->data->ticket->service)?></span> <?=$this->data->ticket->subject?>
          
                    </h4>
                    <div class="dropdown chart-dropdown">
                        
                    </div>
                </div>
                <div class="card-content">
                    
                    <div class="card-body card-dashboard">
                        
                        <div class="media-list">
                            <?php foreach($this->data->message as $item): ?>
                                <div class="media" style="border-top: 1px solid rgba(219,219,219,.5);">
                                    <a class="media-left" href="#">
                                        <img class="rounded-circle" src="<?php if($item->user_id): ?><?=$this->data->avatar?><?php else: ?><?=$this->asset('img/staff.svg')?><?php endif; ?>" alt="avatar" height="64" width="64">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading"><?php if($item->user_id): ?><?=$this->data->name?><?php else: ?><?=SITE_NAME?> Staff<?php endif; ?></strong> <small class="tdate">@<?=$item->created_at?></small></h4>
                                        <?=nl2br(htmlentities($item->message))?>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                            <?php if($this->data->ticket->status != 'Closed'): ?>
                            <div class="media" style="border-top: 1px solid rgba(219,219,219,.5);">
                                <a class="media-left" href="#">
                                    <img class="rounded-circle" src="<?=$this->data->avatar?>" alt="avatar" height="64" width="64">
                                </a>
                                <div class="media-body">
                                    <div class="mb-1">
                                        <textarea class="textarea form-control" id="message" placeholder="add a message..." rows="5"></textarea>
                                    </div>
                                    <div>
                                        <button class="btn btn-primary mb-1" id="ticket_reply">Reply</button>
                                        <button class="btn btn-warning mb-1" id="ticket_close">Close</button>
                                    </div>
                                </div>

                            </div>
                            <?php else: ?>
                            <div class="row">
                                <div class="col-12">
                                    <p class="text-danger">This ticket has been closed</p>
                                </div>
                            </div>
                            <?php endif; ?>
                        </div>
                           
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
        $.post('/support/reply', {
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
                window.location.reload();
            }
        });
    });
    $('#ticket_close').on('click', function() {
        var $this = $(this);
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/support/close', {
            csrf_token: __tajs.csrf,
            ticket_id: ticket_id
        }, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.reload();
            }
        });
    });
});
</script>