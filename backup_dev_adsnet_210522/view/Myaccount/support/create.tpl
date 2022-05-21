

<div class="content-body">
    <div class="row">
        <div class="col-12">

        <blockquote class="blockquote pl-2 border-left-warning border-left-3 text-warning font-medium-1">
            Before opening new ticket, please check <a href="/announcement">Announcements</a> first, then <a href="<?=BLOG_URL?>">Knowledge Blog</a><br>
            Please allow us up to 24hours in some rare cases, to answer your ticket
        </blockquote>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                
                <div class="card-content">
                    
                    <div class="card-body card-dashboard">
                        
                        <div class="row">
                            <div class="col-12 media-list">
                                <div class="media">
                                    <div class="media-left">
                                        <img class="media-object rounded-circle" src="https://www.gravatar.com/avatar/<?=md5(strtolower(trim($this->getSession('email'))))?>" alt="Generic placeholder image" height="64" width="64">
                                    </div>
                                    <div class="media-body">
                                        <form class="form form-vertical">
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-label-group">
                                                            <select id="service" class="form-control">
                                                                <option value="0">Please select service</option>
                                                                <?php foreach($this->services as $service): ?>
                                                                <option value="<?=$service?>"><?=$service?></option>
                                                                <?php endforeach; ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-label-group">
                                                            <input class="form-control" id="subject" placeholder="Your Subject">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-label-group">
                                                            <textarea class="textarea form-control" id="message" placeholder="Your Message..."></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <button class="btn btn-primary" id="ticket_submit">
                                                            Send Ticket
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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

<script>
/* global $, __tajs */
$(document).ready(function() {
    $('#ticket_submit').on('click', function() {
        var $this = $(this), subject = $.trim($('#subject').val()), message = $.trim($('#message').val()), service = $('#service').val();
        if(!service || service == '0') {
            __tajs.showAlert('Invalid service!');
            return false;
        }
        if (subject.length < 10) {
            __tajs.showAlert('Your subject is too short');
            return false;
        }
        if (message.length < 10) {
            __tajs.showAlert('Your message is too short');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/support/create', {
            csrf_token: __tajs.csrf,
            service: service,
            subject: subject,
            message: message
        }, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                __tajs.showAlert(res.data);
                $this.prop('disabled', false);
            }
            else {
                window.location.replace('/support');
            }
        });
    });
});
</script>