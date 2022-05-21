<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only results from user #<?=$this->data->user->id?> - <?=$this->data->user->name?>
                            (<?=$this->data->user->email?>)<br>

                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Audiences</h4>
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
                               href="/advertiser/audience/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                    <th>User</th>
                                    <th>Duration</th>
                                    <th>Daily Reach</th>
                                    <th>Total users</th>
                                    <th>Actions</th>
                                    <th><span class="is-pulled-right">Created</span></th>
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
                                    <td><a class=" edit-audience" data-id="<?=$item->id?>"
                                           data-dur="<?=$item->duration?>"><?=$item->name?></a></td>
                                    <td><a href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->
                                            user_name?></a></td>
                                    <td>
                                        <button class="btn btn-light btn-success btn-sm"><?=$item->duration?> days</button>
                                    </td>
                                    <td><a><?=$item->daily_reach?></a></td>
                                    <td><a><?=$item->total_users?></a></td>
                                    <td>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn-delete" data-id="<?=$item->id?>">
                                            <i class="feather icon-trash-2"></i>
                                        </button>
                                    </td>
                                    <td><span class=" is-pulled-right"><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="has-text-centered">
                                    <p>No Audiences!</p>
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

<div class="modal fade text-left" id="audienceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <input id="id" type="hidden" value="0">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Audience</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Audience Name</label>
                        <input class="form-control" id="name" type="text" placeholder="Audience Name">
                    </div>
                    <div class="form-group">
                        <label class="label">Audience Duration</label>
                        <div class="input-group">
                            <input class="form-control" id="duration" type="number" min="1" max="360" placeholder="Amount of time that a visitor remains in this audience" value="90">
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2">Days</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="submit_audience">Submit
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
        try {
            document.execCommand('copy');
            $('#' + id).attr('style', 'display:inline');
            setTimeout(function (){$('#'+id).fadeOut();}, 1000);
        } catch (e){}
    }

    function _parseInt(e) {
        let number = parseInt(e, 10);
        if (number < 0) {
            number = -number;
        }
        return number || 0;
    }

    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('#submit_audience').click(function () {
            var $this = $(this), data = {};
            data.id = $('#id').val();
            data.name = $.trim($('#name').val());
            data.duration = $.trim($('#duration').val());
            data.duration = _parseInt(data.duration);
            if (data.name.length < 3) {
                __tajs.showAlert('Website Name are required');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/advertiser/audience/create', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.reload();
                }
            });
        });
        $('.edit-audience').on('click', function (e) {
            e.preventDefault();
            var $this = $(this), id = $this.attr('data-id'), duration = $this.attr('data-dur'), name = $this.text();
            $('#id').val(id);
            $('#name').val(name);
            $('#duration').val(duration);
            $('#audienceModal').modal('show');
        });
        $('#include-code').on('click', function () {
            $(this).focus().select();
            copy('isaved');
        });
        $('#exclude-code').on('click', function () {
            $(this).focus().select();
            copy('esaved');
        });
        $('.btn-delete').on('click', function () {
            var $this = $(this), id = $this.attr('data-id');
            __tajs.showConfirm('Are you sure? This action can not undo', function (yes) {
                if (yes) {
                    $this.addClass('is-loading');
                    $this.prop('disabled', true);
                    $.post('/advertiser/audience-delete/' + id, {csrf_token: __tajs.csrf}, function (res) {
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
    });
    </script>