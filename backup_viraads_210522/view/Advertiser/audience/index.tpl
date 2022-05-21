<style>
    .table-responsive .badge{
        width: 70px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">My Audiences</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="add-audience" tabindex="0">
                            <span><i class="feather icon-plus"></i> Add Audience</span></button>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                            <a class="dropdown-item"
                               href="/audience/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Audience Name" aria-label="filter"
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
                                    <th>Status</th>
                                    <th>Name</th>
                                    <th>Duration</th>
                                    <th>Daily Reach</th>
                                    <th>Total users</th>
                                    <th>Actions</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <?php if($item->status=='Active'): ?>
                                        <span class="badge badge-success">Active</span>
                                        <?php else: ?>
                                        <span class="badge badge-danger">Inactive</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><a class="edit-audience" data-id="<?=$item->id?>"
                                           data-dur="<?=$item->duration?>"><?=$item->name?></a></td>
                                    <td>
                                        <button class="btn btn-light btn-success btn-sm"><?=$item->duration?>
                                            days
                                        </button>
                                    </td>
                                    <td><a><?=$item->daily_reach?></a></td>
                                    <td><a><?=$item->total_users?></a></td>
                                    <td>
                                        <div class="buttons">
                                            <button type="button" class="btn btn-light waves-effect waves-light mb-1 btn-tag"
                                                    data-id="<?=$item->id?>"
                                                    data-dur="<?=$item->duration?>">
                                                <i class="feather icon-chevron-left"></i>
                                                <i class="feather icon-chevron-right"></i>
                                                <span>Get Tag</span>
                                            </button>

                                            <button type="button" class="btn btn-danger waves-effect waves-light mb-1 btn-archive"
                                                    data-id="<?=$item->id?>">
                                                <i class="feather icon-trash-2"></i>
                                                <span>Archive</span>
                                            </button>
                                            
                                        </div>
                                    </td>
                                    <td><span><?=$item->
                                            created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                            <?=$this->data->pagination?>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>You do not have any Audience!</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        </br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="audienceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <input id="id" type="hidden" value="0">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Add Audience</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>

                <div class="modal-body">

                    <label>Audience Name: </label>
                    <div class="form-group">
                        <input class="form-control" id="name" type="text" placeholder="Audience Name">
                    </div>

                    <label>Audience Duration: </label>
                    <div class="input-group">
                        <input class="form-control" id="duration" type="number" min="1" max="360">
                        <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">Days</span>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="submit_audience">Save
                    </button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">
                        Close
                    </button>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="tagModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-card">

                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Get Tag</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>

                <div class="modal-body">

                    <div class="media mb-2">
                        <div class="media-body" style="background-color: antiquewhite">
                            <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                                <p>Place the code between the HTML body tags (&lt;body&gt;&lt;/body&gt;) on the page(s) you
                                    want to
                                    collect (or remove) visitor to/from this audience.</p>
                            </div>
                        </div>
                    </div>

                    <label>Include visitor: </label> <small class="text-success" id="isaved"
                                                            style="display:none">Copied!</small>
                    <div class="form-group">
                        <textarea class="form-control" id="include-code" placeholder="Tag code" readonly></textarea>
                    </div>

                    <label>AExclude visitor: </label> <small class="text-success" id="esaved"
                                                             style="display:none">Copied!</small>
                    <div class="form-group">
                        <textarea class="form-control" id="exclude-code" placeholder="Tag code" readonly></textarea>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" data-dismiss="modal">Okay
                    </button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $, __tajs */
    var tag = '<script src="<?=ADSERVER_URL?>/audience?id={id}&a={action}&d={duration} defer>< /script>';
    function copy(id) {
        try{
            document.execCommand('copy');
            $('#'+id).attr('style', 'display:inline');
            setTimeout(function(){$('#'+id).fadeOut();},1000);
        }catch(e){}
    }
    function _parseInt(e) {
        let number = parseInt(e,10);
        if(number<0){
            number = -number;
        }
        return number || 0;
    }
    $(document).ready(function() {
        $('#enterAction').on('click', function() {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        });
        $('#submit_audience').click(function() {
            var $this = $(this), data = {};
            data.id = $('#id').val();
            data.name = $.trim($('#name').val());
            data.duration = $.trim($('#duration').val());
            data.duration = _parseInt(data.duration);
            if(data.name.length < 3) {
                __tajs.showAlert('Website Name are required');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/audience/create', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
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
        $('#add-audience').click(function() {
            $('#id').val('0');
            $('#name').val('');
            $('#duration').val(90);
            $('#audienceModal').modal('show');
        });
        $('.edit-audience').on('click', function(e){
            e.preventDefault();
            var $this = $(this), id = $this.attr('data-id'), duration = $this.attr('data-dur'), name = $this.text();
            $('#id').val(id);
            $('#name').val(name);
            $('#duration').val(duration);
            $('#audienceModal').modal('show');
        });
        $('#include-code').on('click', function() {
            $(this).focus().select();
            copy('isaved');
        });
        $('#exclude-code').on('click', function() {
            $(this).focus().select();
            copy('esaved');
        });
        $('.btn-tag').on('click', function() {
            var $this = $(this), id = $this.attr('data-id'), duration = $this.attr('data-dur');
            $('#include-code').val(tag.replace('{id}', id).replace('{action}', 'on').replace('{duration}', duration));
            $('#exclude-code').val(tag.replace('{id}', id).replace('{action}', 'off').replace('{duration}', duration));
            $('#tagModal').modal('show');
        });
        $('.btn-archive').on('click', function(){
            var $this = $(this), id = $this.attr('data-id');
            __tajs.showConfirm('Are you sure? This action can not undo', function(yes) {
                if (yes) {
                    $this.addClass('is-loading');
                    $this.prop('disabled', true);
                    $.post('/audience/archive/'+id, {csrf_token: __tajs.csrf}, function(res) {
                        if (!res.success) {
                            $this.removeClass('is-loading');
                            $this.prop('disabled', false);
                            __tajs.showAlert(res.data);
                        }
                        else {
                            window.location.replace(res.data);
                        }
                    });
                }
            });
        });
    });
    </script>