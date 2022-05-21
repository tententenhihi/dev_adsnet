<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Announcement</h4>
                        <a class="btn btn-icon btn-outline-primary btn-header" href="javascript:announcementModal(null);">
                            <span><i class="feather icon-plus"></i> Create Announcement</span></a>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->type?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach(['All', 'Success', 'Info', 'Warning'] as $type): ?>
                            <a class="dropdown-item"
                               href="/announcement/<?=strtolower($type)?><?=$this->arg?>"><?=$type?></a>
                            <?php endforeach; ?>

                        </div>
                    </div>
                </div>

                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="ag-grid-btns d-flex justify-content-between flex-wrap mb-1">
                                    <div class="ag-btns d-flex flex-wrap">
                                        <fieldset>
                                            <div class="input-group">
                                                <input id="search" type="text" class="form-control"
                                                       placeholder="Service or Subject" aria-label="filter"
                                                       value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light"
                                                            type="button" id="search-btn"><i
                                                                class="feather icon-search"></i> Search
                                                    </button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <?php if($this->data->data): ?>
                                    <?php foreach($this->data->data as $item): ?>
                                    <div class="media mb-2">
                                        <div class="media-body" style="background-color: antiquewhite">
                                            <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                                                <article class="row message is-<?=$item->type?>" data-data='<?=htmlentities(json_encode($item), ENT_QUOTES)?>'>
                                                    <div class="message-body col-lg-9 col-12">
                                                        <strong><?=ucwords($item->service)?>: <?=$item->subject?></strong>
                                                        <?php if($item->is_shown): ?>
                                                        <span class="badge badge-success badge-rounded">Shown</span>
                                                        <?php endif; ?>
                                                        <?php if($item->is_sticky): ?>
                                                        <span class="badge badge-warning badge-rounded">Sticky</span>
                                                        <?php endif; ?>

                                                        <p><i><?=$item->created_at?></i></p>
                                                        <p><?=nl2br($item->description)?></p>
                                                        <?php if($item->is_long): ?>
                                                        <p class="read_full">
                                                            <button class="btn btn-<?=$item->type?> round btn-sm read_more">
                                                                <span class="icon">
                                                                    <svg viewBox="0 0 24 24">
                                                                        <path fill="currentColor" d="M7,10L12,15L17,10H7Z" />
                                                                    </svg>
                                                                </span>
                                                                <span>Read More</span>
                                                            </button>
                                                        </p>
                                                        <?php endif; ?>
                                                    </div>
                                                    <div class="col-lg-3 col-12 pull-right" style="justify-content: end;align-items: center;display: flex;">
                                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn_edit">
                                                            <i class="feather icon-edit"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn_remove">
                                                            <i class="feather icon-trash"></i>
                                                        </button>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                    </div>
                                    <?php endforeach; ?>
                                    <?php else: ?>
                                    <div class="hero mt-2">
                                        <div class="hero-body">
                                            <div class="text-center">
                                                <p class="title is-6">No results found</p>
                                                <p class="subtitle is-6">You can <a href="javascript:announcementModal(null);">Create new announcement</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                        <?=$this->data->pagination?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="announcementModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Announcement</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id">
                    <div class="form-group">
                        <label class="label">Subject</label>
                        <input class="form-control" type="text" id="subject" placeholder="Announcement Subject">
                    </div>
                    <div class="form-group">
                        <label class="label">Service</label>

                        <select id="service" class="form-control">
                            <option value="global">Global</option>
                            <option value="publisher">Publisher</option>
                            <option value="advertiser">Advertiser</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <label class="label">Type</label>

                        <select id="type" class="form-control">
                            <option value="info">Info</option>
                            <option value="success">Success</option>
                            <option value="warning">Warning</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>

                        <textarea id="description" rows="3" class="form-control" placeholder="Announcement Short Description"></textarea>

                    </div>
                    <div class="form-group">
                        <label class="label">Message</label>
                        <div class="control">
                            <textarea id="message" rows="6" class="form-control" placeholder="Announcement Long Message"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="label">Show on Dashboard?</label>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" checked="" name="customCheck" id="is_shown">
                            <label class="custom-control-label" for="is_shown">Yes, show this on member's dashboard</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="label">Stick?</label>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" checked="" name="customCheck" id="is_sticky">
                            <label class="custom-control-label" for="is_sticky">Yes, show it on top of others on Dashboard</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="btn_submit">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $, __tajs */
function announcementModal(data) {
    if(!data) {
        data = {"id": 0, "subject": "", "service": "global", "type": "info", "description": "", "message": "", "is_shown": 0, "is_sticky": 0};
    }
    $('#id').val(data.id);
    $('#subject').val(data.subject);
    $('#type').val(data.type);
    $('#service').val(data.service);
    $('#description').val(data.description);
    $('#message').val(data.message);
    $('#is_shown').prop('checked', parseInt(data.is_shown,10));
    $('#is_sticky').prop('checked', parseInt(data.is_sticky,10));
    $('#announcementModal').modal('show');
}
$(document).ready(function() {
    $(document).keypress(function(e) {
        if(e.which == 13) {
            $('#search-btn').click();
        }
    });
    $('#search-btn').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('.read_more').on('click', function() {
        var $this = $(this), data = JSON.parse($this.closest('article').attr('data-data'));
        $this.parent().html(data.message.replace(/\n/g,"<br>"));
    });
    $('.btn_remove').on('click', function() {
        var $this = $(this), mess = $this.closest('article'), data = JSON.parse(mess.attr('data-data'));
        __tajs.showConfirm('Are you sure? this action can not undo', function(yes){
           if(yes) {
                $this.prop('disabled', true);
                $this.addClass('is-loading');
                $.post('/announcement/remove', {csrf_token: __tajs.csrf, id: data.id}, function(res) {
                    if (!res.success) {
                        __tajs.showAlert(res.data);
                    }
                    else {
                        window.location.reload();
                    }
                });
           } 
        });
    });
    $('.btn_edit').on('click', function() {
        var $this = $(this), data = JSON.parse($this.closest('article').attr('data-data'));
        announcementModal(data);
    });
    $('#btn_submit').on('click', function() {
        var $this = $(this), data = {};
        data.id = parseInt($('#id').val(),10);
        data.subject = $.trim($('#subject').val());
        data.description = $.trim($('#description').val());
        data.message = $.trim($('#message').val());
        data.type = $('#type').val();
        data.service = $('#service').val();
        data.is_shown = $('#is_shown').is(':checked') ? 1 : 0;
        data.is_sticky = $('#is_sticky').is(':checked') ? 1 : 0;
        if(!data.message) {
            data.is_long = 1;
        } else {
            data.is_long = 0;
        }
        if(!data.subject || data.subject.length < 10) {
            __tajs.showAlert('Subject is too short, min 10 characters');
            return false;
        }
        if(!data.description || data.description.length < 20) {
            __tajs.showAlert('Description is too short, min 20 characters');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/announcement', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res){
            $this.removeClass('is-loading');
            if(!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            } else {
                window.location.reload();
            }
        });
    });
});
</script>