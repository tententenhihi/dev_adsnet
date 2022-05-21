<style>
    .lib-thumb {
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
        height: 70px;
    }

    #uploader-selector, #uploader-process {
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

    .creativename {
        cursor: pointer;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Creatives</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="upload" data-type="image"
                                tabindex="0">
                            <span><i class="feather icon-plus"></i> Upload Creative</span></button>
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
                            <?php foreach($this->data->types as $type): ?>
                            <a class="dropdown-item"
                               href="/creative/<?=strtolower($type)?><?=$this->arg?>"><?=$type?></a>
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
                                                       placeholder="Creative Name" aria-label="filter"
                                                       value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light"
                                                            type="button" id="enterAction"><i
                                                                class="feather icon-search"></i> Search
                                                    </button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <?php if($this->data->data): ?>
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th>Thumb</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Size</th>
                                    <th>Actions</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr data-id="<?=$item->id?>">
                                    <td>
                                        <a href="<?=$item->url?>" target="_blank">
                                            <div class="lib-thumb"
                                                 style="background-image: url('<?=$item->thumb?>');"></div>
                                        </a>
                                    </td>
                                    <td><a class="name creativename"><?=$item->name?></a></td>
                                    <td><a><?=ucwords($item->type)?></a></td>
                                    <td><a><?=ucwords($item->size)?></a></td>
                                    <td>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn-delete"
                                                data-id="<?=$item->id?>">
                                            <i class="feather icon-trash"></i>
                                        </button>
                                        <a type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-info waves-effect waves-light"
                                           id="creative-url" href="<?=$item->url?>" target="_blank">
                                            <i class="feather icon-eye"></i>
                                        </a>

                                    </td>
                                    <td><span><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>You do not have any Ad Creatives!</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        </br>

                        <?=$this->data->pagination?>
                    </div>
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
                        <input type="file" id="upload_file" class="hidden"/>
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
                                <h1 class="title is-6 text-center text-danger">Uploading Your File, please
                                    keep
                                    this page open.</h1>
                                <div><h2 class="title is-6" id="progress-name"></h2></div>
                                <h3 class="subtitle is-6" style="margin-bottom: 0.2rem;">
                                    <span class="progress-detail" id="progress-size"></span>
                                    <span class="progress-detail" id="progress-percent"></span>
                                    <span class="progress-detail" id="progress-time"></span>
                                </h3>
                                <progress id="progress" class="progress is-large is-success" max="100"></progress>
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

<div class="modal fade text-left" id="creativeName" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
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
                    <div class="form-group">
                        <label class="label">Creative Name</label>
                        <input class="input form-control" id="name" placeholder="creative name">
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="name_submit" data-id="0">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?=$this->asset('js/tus.min.js')?>"></script>
<script src="<?=$this->asset('js/dnd.min.js')?>"></script>
<script>
    /* global $, __tajs, tus, Image, DragAndDrop */
    var uploader, allow_extensions = {jpg: 'image', jpeg: 'image', png: 'image', mp4: 'video'};

    function sizeFormat(bytes) {
        if (parseInt(bytes, 10) == 0) return '0 Byte';
        var i = Math.floor(Math.log(bytes) / Math.log(1024));
        return (bytes / Math.pow(1024, i)).toFixed(2) * 1 + ['B', 'K', 'M', 'G', 'T'][i];
    }

    function timeFormat(seconds) {
        var hours = Math.floor(seconds / 3600), minutes;
        seconds %= 3600;
        minutes = Math.floor(seconds / 60), seconds = seconds % 60;
        return ('0' + hours).slice(-2) + ':' + ('0' + minutes).slice(-2) + ':' + ('0' + seconds).slice(-2);
    }

    function initUploader() {
        if (!tus.isSupported || !tus.canStoreURLs) {
            var html = '<div class="hero is-medium">';
            html += '<div class="hero-body"><div class="container has-text-centered">';
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
                processingDroppedFilesComplete: function (files, dropTarget) {
                    processFile(files[0]);
                }
            }
        });
    }

    function processFile(file) {
        var fileSize = sizeFormat(file.size), minSizeLimit = 1024, maxSizeLimit = 20 * 1024 * 1024;
        var file_extension = $.trim(file.name.split('.').pop().toLowerCase());
        var file_type = allow_extensions[file_extension];
        if (!file_type) {
            __tajs.showAlert('Not a valid ' + Object.keys(allow_extensions).join(', ') + ' file, upload rejected');
            return false;
        }
        if (maxSizeLimit < file.size) {
            __tajs.showAlert('This file is too big, should be less than ' + sizeFormat(maxSizeLimit) + ', upload rejected');
            return false;
        }
        if (minSizeLimit > file.size) {
            __tajs.showAlert('This file is too small, should be from ' + sizeFormat(minSizeLimit) + ', upload rejected');
            return false;
        }
        if (file_type == 'image') {
            var f = new FileReader();
            f.onload = function (e) {
                var img = new Image();
                img.src = e.target.result;
                img.onload = function () {
                    fileSize = this.width + 'x' + this.height;
                }
            };
            f.readAsDataURL(file);
        }
        var options = {
            resume: true,
            removeFingerprintOnSuccess: true,
            chunkSize: 3 * 1024 * 1024,
            retryDelays: [0, 1000, 3000, 5000],
            onError: function (e) {
                $('#progress-status').html('<span class="text-danger">' + e + '</span>');
                if (e.originalRequest) {
                    $('#upload_control').html('<button class="btn btn-info mr-1 mb-1 waves-effect waves-light upload_control" data-action="retry">Retry</button><button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                } else {
                    $('#upload_control').html('<button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                }
            },
            onProgress: function (uploadedBytes, totalBytes) {
                var ps = ((uploadedBytes / totalBytes) * 100).toFixed(2),
                    seconds = (((new Date()) - uploader.startedAt) / 1000),
                    speed = (uploadedBytes / seconds).toFixed(2),
                    time = Math.floor((totalBytes - uploadedBytes) / speed);
                $('#progress').attr('value', ps);
                $('#progress-percent').html(ps + '% uploaded');
                $('#progress-time').html(timeFormat(time) + ' remaining');
                $('#progress-status').html('Uploading ' + sizeFormat(uploadedBytes) + '/' + sizeFormat(totalBytes) + ' . Speed ' + sizeFormat(speed * 8) + 'bps');
            },
            onSuccess: function () {
                $('#progress-percent').html('0% processed');
                $('#progress-time').html('Calculating time...');
                $('#progress-status').html('<span class="has-text-info">Adding file to your Creative Library...</span>');
                $('#upload_control').html('');
                $.post('/creative/create', {csrf_token: __tajs.csrf, type: file_type, url: uploader.url, name: file.name, size: fileSize}, function (res) {
                    if (!res.success) {
                        $('#progress-status').html('<span class="text-danger">' + res.data + '</span>');
                        $('#upload_control').html('<button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
                        return false;
                    }
                    window.location.reload();
                });
            }
        };
        $('#progress-name').html(file.name);
        $('#progress-size').html(sizeFormat(file.size));
        $('#progress-percent').html('0% uploaded');
        $('#progress-time').html('Calculating time...');
        $('#progress-status').html('<span>Validating...</span>');
        $('#upload_control').html('<button class="btn btn-warning mr-1 mb-1 waves-effect waves-light upload_control" data-action="pause">Pause</button><button class="btn btn-danger mr-1 mb-1 waves-effect waves-light upload_control" data-action="cancel">Cancel</button>');
        $.post('/creative/upload', {csrf_token: __tajs.csrf, name: file.name}, function (res) {
            if (!res.success) {
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

    $(document).ready(function () {
        initUploader();
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('.creativename').click(function () {
            var $this = $(this).closest('tr');

            $('#name').val($this.find('.name').text());
            $('#name_submit').attr('data-id', $this.attr('data-id'));
            $('#creativeName').modal('show');
        });
        $('#name_submit').click(function () {
            var $this = $(this), data = {};
            data.name = $.trim($('#name').val()) || null;
            data.id = $this.attr('data-id');
            if (!data.name || data.name.length < 3) {
                __tajs.showAlert('Name is required at least 3 characters');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/creative/rename', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.reload();
                }
            });
        });
        $('.btn-delete').click(function () {
            var $this = $(this), id = $this.attr('data-id');
            __tajs.showConfirm('Are you sure to delete this Creative ?', function (yes) {
                if (yes) {
                    $this.addClass('is-loading');
                    $this.prop('disabled', true);
                    $.post('/creative/delete/' + id, {csrf_token: __tajs.csrf}, function (res) {
                        if (!res.success) {
                            $this.removeClass('is-loading');
                            $this.prop('disabled', false);
                            __tajs.showAlert(res.data);
                        } else {
                            window.location.replace(res.data);
                        }
                    });
                }
            });
        });
        $('#upload').on('click', function () {
            $('#uploadModal').modal('show');
        });
        $('.open-selector').on('click', function () {
            $('#upload_file').val('');
            $('#upload_file').click();
        });
        $('#upload_file').on('change', function (e) {
            processFile(e.target.files[0]);
        });
        $(document).on('click', '.upload_control', function () {
            var act = $(this).attr('data-action');
            switch (act) {
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
                    __tajs.showConfirm('Are you sure? this upload will be canceled', function (res) {
                        if (res) {
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
    });
</script>