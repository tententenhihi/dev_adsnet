<style>
    .tag.is-default {
        color: #8094ae;
    }
    .is-picked .tag {
        background-color: #007bff;
        /*color: #fff;*/
        color: white !important;
    }
    a.tag:hover {
        text-decoration: none !important;
    }
    .tags {
        align-items: center;
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }

    .field.is-grouped.is-grouped-multiline {
        flex-wrap: wrap;
    }
    .field.is-grouped {
        display: flex;
        justify-content: flex-start;
    }
    .field.is-grouped>.control:not(:last-child) {
        margin-bottom: 0;
        margin-right: 0.75rem;
    }
    .tags.has-addons .tag:not(:last-child) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }

    .tags.has-addons .tag {
        margin-right: 0;
    }

    .tag:not(body).is-large {
        font-size: 1.25rem;
    }
    .tag.is-default {
        color: #8094ae;
    }
    .tags .tag {
        margin-bottom: 0.5rem;
    }
    .text-muted, .navbar-item, .breadcrumb a, .flatbox a, .table tbody td, .table thead th {
        color: #6c757d;
    }
    .tag:not(body) {
        align-items: center;
        background-color: #f5f5f5;
        border-radius: 4px;
        color: #4a4a4a;
        display: inline-flex;
        font-size: .75rem;
        height: 2em;
        justify-content: center;
        line-height: 1.5;
        padding-left: 0.75em;
        padding-right: 0.75em;
        white-space: nowrap;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>To map OSes with Platform, pick only one platform, to map Browsers with OS, pick only one OS</p>

                    </div>
                </div>
            </div>
            <div class="page-title-box mb-1">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Platforms</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons pull-right" style="margin-top: -0.5rem;">
                            <button class="btn btn-outline-primary" id="add_platform">
                                <i class="feather icon-plus "></i>
                                <span>Add Platform</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row is-multiline">
                            <?php if($this->data->platforms): ?>
                            <div class="col-12">
                                <div class="flatbox" data-type="platform">
                                    <div class="field is-grouped is-grouped-multiline">
                                        <?php foreach($this->data->platforms AS $item): ?>
                                        <div class="control" data-id="<?=$item->id?>" data-name="<?=$item->name?>" data-description="<?=$item->description?>">
                                            <div class="tags are-medium has-addons">
                                                <a class="tag is-default is-large btn-pick"><?=$item->name?></a>
                                                <a class="tag is-default is-large btn-edit">
                                                    <i class="feather icon-edit "></i>
                                                </a>
                                            </div>
                                        </div>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                            <?php else: ?>
                            <div class="column is-12">
                                <div class="flatbox">
                                    <div class="hero">
                                        <div class="hero-body">
                                            <div class="has-text-centered">
                                                <p class="title is-6">No Platforms found</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-title-box mb-1">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">OperaSystems</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons pull-right" style="margin-top: -0.5rem;">
                            <button class="btn btn-outline-primary" id="add_os">
                                <i class="feather icon-plus "></i>
                                <span>Add OS</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="columns is-multiline">
                            <?php if($this->data->oses): ?>
                            <div class="column is-12">
                                <div class="flatbox" data-type="os">
                                    <div class="field is-grouped is-grouped-multiline">
                                        <?php foreach($this->data->oses AS $item): ?>
                                        <div class="control" data-id="<?=$item->id?>" data-name="<?=$item->name?>" data-description="<?=$item->description?>">
                                            <div class="tags are-medium has-addons">
                                                <a class="tag is-default is-large btn-pick"><?=$item->name?></a>
                                                <a class="tag is-default is-large btn-edit">
                                                    <i class="feather icon-edit "></i>
                                                </a>
                                            </div>
                                        </div>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                            <?php else: ?>
                            <div class="column is-12">
                                <div class="flatbox">
                                    <div class="hero">
                                        <div class="hero-body">
                                            <div class="has-text-centered">
                                                <p class="title is-6">No OperaSystems found</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>


            <div class="page-title-box mb-1">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Browsers</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons pull-right" style="margin-top: -0.5rem;">
                            <button class="btn btn-outline-primary" id="add_browser">
                                <i class="feather icon-plus "></i>
                                <span>Add Browser</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="columns is-multiline">
                            <?php if($this->data->browsers): ?>
                            <div class="column is-12">
                                <div class="flatbox" data-type="browser">
                                    <div class="field is-grouped is-grouped-multiline">
                                        <?php foreach($this->data->browsers AS $item): ?>
                                        <div class="control" data-id="<?=$item->id?>" data-name="<?=$item->name?>" data-description="<?=$item->description?>">
                                            <div class="tags are-medium has-addons">
                                                <a class="tag is-default is-large btn-pick"><?=$item->name?></a>
                                                <a class="tag is-default is-large btn-edit">
                                                    <i class="feather icon-edit "></i>
                                                </a>
                                            </div>
                                        </div>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                            <?php else: ?>
                            <div class="column is-12">
                                <div class="flatbox">
                                    <div class="hero">
                                        <div class="hero-body">
                                            <div class="has-text-centered">
                                                <p class="title is-6">No browsers found</p>
                                            </div>
                                        </div>
                                    </div>
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
<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Edit</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="type" value="">
                    <input type="hidden" id="id" value="">
                    <div class="form-group">
                        <label class="label">name</label>
                        <input class="form-control" type="text" id="name" value="" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <input class="form-control" type="text" id="description" value="" placeholder="Short description">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="submit">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $, __tajs */
let mapPlatformOs = <?=json_encode($this->data->mapPlatformOs)?>;
let mapOsBrowser = <?=json_encode($this->data->mapOsBrowser)?>;
let platformLock = true, osLock = true;
function pickOsByPlatform() {
    const picked_platform = [];
    $('.flatbox[data-type="platform"]').find('.control.is-picked').each(function(){
        picked_platform.push(parseInt($(this).attr('data-id'),10));
    });
    const cntl = $('.flatbox[data-type="os"]').find('.control');
    cntl.removeClass('is-picked');
    if(!picked_platform.length) return false;
    
    if(picked_platform.length == 1) {
        platformLock = false;
    } else {
        platformLock = true;
    }
    
    const picked_os = [];
    mapPlatformOs.forEach((item) => {
        if (picked_platform.indexOf(item.platform_id) > -1) {
            if (picked_os.indexOf(item.os_id) == -1) picked_os.push(item.os_id)
        }
    });
    if(!picked_os.length) return false;
    
    cntl.each(function(){
        const $this = $(this), id = parseInt($this.attr('data-id'),10);
        if (picked_os.indexOf(id) > -1) $this.addClass('is-picked');
    });
    
    return picked_os;
}
function pickBrowserByOs() {
    const picked_os = [];
    $('.flatbox[data-type="os"]').find('.control.is-picked').each(function(){
        picked_os.push(parseInt($(this).attr('data-id'),10));
    });
    const cntl = $('.flatbox[data-type="browser"]').find('.control');
    cntl.removeClass('is-picked');
    if(!picked_os.length) return false;
    
    if(picked_os.length == 1) {
        osLock = false;
    } else {
        osLock = true;
    }
    
    const picked_browser = [];
    mapOsBrowser.forEach((item) => {
        if (picked_os.indexOf(item.os_id) > -1) {
            if (picked_browser.indexOf(item.browser_id) == -1) picked_browser.push(item.browser_id)
        }
    });
    if(!picked_browser.length) return false;
    
    cntl.each(function(){
        const $this = $(this), id = parseInt($this.attr('data-id'),10);
        if (picked_browser.indexOf(id) > -1) $this.addClass('is-picked');
    });
    
    return picked_browser;
}
function mapOSWithPlatform() {
    if(platformLock) return true;
    const tmp = [], id = parseInt($('.flatbox[data-type="platform"]').find('.control.is-picked').attr('data-id'),10);
    if(!id) return true;
    mapPlatformOs.forEach((item) => {
        if (item.platform_id != id) tmp.push(item);
    });
    
    const oses = [];
    $('.flatbox[data-type="os"]').find('.control.is-picked').each(function(){
        oses.push(parseInt($(this).attr('data-id'),10));
    });
    oses.forEach((os_id) => {
        tmp.push({os_id: os_id, platform_id: id});
    });
    
    mapPlatformOs = tmp;
    
    __tajs.showLoading();
    $.post('/system/dimension/mapos', {csrf_token: __tajs.csrf, id: id, data: JSON.stringify(oses)}, function(res) {
        __tajs.showLoading(false);
        if (!res.success) {
            __tajs.showAlert(res.data);
            window.location.reload();
        }
    });
}
function mapBrowserWithOs() {
    if(osLock) return true;
    const tmp = [], id = parseInt($('.flatbox[data-type="os"]').find('.control.is-picked').attr('data-id'),10);
    if(!id) return true;
    mapOsBrowser.forEach((item) => {
        if (item.os_id != id) tmp.push(item);
    });
    
    const browsers = [];
    $('.flatbox[data-type="browser"]').find('.control.is-picked').each(function(){
        browsers.push(parseInt($(this).attr('data-id'),10));
    });
    browsers.forEach((browser_id) => {
        tmp.push({browser_id: browser_id, os_id: id});
    });
    
    mapOsBrowser = tmp;
    
    __tajs.showLoading();
    $.post('/system/dimension/mapbrowser', {csrf_token: __tajs.csrf, id: id, data: JSON.stringify(browsers)}, function(res) {
        __tajs.showLoading(false);
        if (!res.success) {
            __tajs.showAlert(res.data);
            window.location.reload();
        }
    });
}
$(document).ready(function() {
    $('#add_platform').on('click', function() {
        $('#type').val('platform');
        $('#id').val('');
        $('#name').val('');
        $('#description').val('');
        $('#editModal').modal('show');
    });
    $('#add_os').on('click', function() {
        $('#type').val('os');
        $('#id').val('');
        $('#name').val('');
        $('#description').val('');
        $('#editModal').modal('show');
    });
    $('#add_browser').on('click', function() {
        $('#type').val('browser');
        $('#id').val('');
        $('#name').val('');
        $('#description').val('');
        $('#editModal').modal('show');
    });
    $('.btn-edit').on('click', function(e) {
        e.preventDefault();
        var cntl = $(this).closest('.control');
        $('#type').val(cntl.closest('.flatbox').attr('data-type'));
        $('#id').val(cntl.attr('data-id'));
        $('#name').val(cntl.attr('data-name'));
        $('#description').val(cntl.attr('data-description'));
        $('#editModal').modal('show');
    });
    $('.btn-pick').on('click', function(e) {
        e.preventDefault();
        const $this = $(this), type = $this.closest('.flatbox').attr('data-type');
        $this.closest('.control').toggleClass('is-picked');
        
        switch(type) {
            case "platform":
                pickOsByPlatform();
                pickBrowserByOs();
                break;
                
            case "os":
                pickBrowserByOs();
                mapOSWithPlatform();
                break;
                
            case "browser":
                mapBrowserWithOs();
                break;
        }
    });
    $('#submit').click(function() {
        var $this = $(this), data = {}, type = $('#type').val();
        data.id = parseInt($('#id').val(),10) || null
        data.name = $.trim($('#name').val()) || null;
        data.description = $.trim($('#description').val()) || null;
        
        if(!data.name) {
            __tajs.showAlert('name is required!');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/system/dimension/'+type, {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                if(data.id) {
                    const elm = $('.flatbox[data-type="'+type+'"]').find('.control[data-id="'+data.id+'"]')
                    elm.attr('data-name', data.name);
                    elm.attr('data-description', data.description);
                    elm.find('.btn-pick').html(data.name);
                    $this.prop('disabled', false);
                    $('#editModal').modal('show');
                    window.location.reload();
                } else {
                    window.location.reload();
                }
            }
        });
    });
});
</script>