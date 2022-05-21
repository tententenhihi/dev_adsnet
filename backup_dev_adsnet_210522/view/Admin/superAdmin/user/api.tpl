
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only APIs from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>

            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">User APIs</h4>
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
                               href="/user/api/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="User ID or Token" aria-label="filter"
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

                        <div class="row" id="results">
                            <div class="col-12">
                                <div class="flatbox">
                                    <?php if($this->data->data): ?>
                                    <div class="table-responsive">
                                        <table class="table table-striped mb-1">
                                            <thead>
                                            <tr>
                                                <th>Service</th>
                                                <th>API Token</th>
                                                <th>Status</th>
                                                <th>User</th>
                                                <th>Description</th>
                                                <th>Added Date</th>
                                                <th><span>Action</span></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach($this->data->data as $item): ?>
                                            <tr data-id="<?=$item->id?>">
                                                <td><span style="width: 80px" class="badge badge-<?=$item->service?>"><?=$item->service?></span></td>
                                                <td><?=$item->api_token?></td>
                                                <td class="api_status">
                                                    <?php if($item->status == 'Active'): ?>
                                                    <span class="badge badge-success" style="width: 70px">Active</span>
                                                    <?php else: ?>
                                                    <span class="badge badge-danger" style="width: 70px">Inactive</span>
                                                    <?php endif; ?>
                                                </td>
                                                <td><a href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->user_name?></a></td>
                                                <td class="api_description"><?=$item->description?></td>
                                                <td><?=$item->created_at?></td>
                                                <td>
                                                    <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn-edit">
                                                        <i class="feather icon-edit"></i>
                                                    </button>

                                                </td>
                                            </tr>
                                            <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                        <?=$this->data->pagination?>
                                    </div>
                                    <?php else: ?>
                                    <div class="hero">
                                        <div class="hero-body">
                                            <div class="text-center">
                                                <p >You do not have any API Token</p>
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
    </div>
</div>

<div class="modal fade text-left" id="apiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">User APIs</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Description</label>

                        <textarea class="form-control" id="description" placeholder="API Description"></textarea>

                    </div>
                    <div class="form-group">
                        <label class="label">Status</label>

                        <select id="status" class="form-control">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>

                        <p class="help text-danger hidden" id="only-edit">Deactivate In-use token may breaks user's application, carefully!</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="submit">Submit</button>
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
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        if(isNaN(val)) {
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        } else {
            window.location.href = window.location.pathname+'?user_id='+val;
        }
    });
    $('.btn-edit').on('click', function(){
        var $item = $(this).closest('tr'), id = $item.attr('data-id'), status = $.trim($item.find('.api_status').text()), description = $.trim($item.find('.api_description').text());
        $('#only-edit').addClass('hidden');
        $('#status').val(status);
        $('#description').val(description);
        $('#submit').attr('data-id', id);
        $('#apiModal').modal('show');
        if(status == 'Active') {
            $('#status').on('change', function(){
                if($(this).val() == 'Inactive') {
                    $('#only-edit').removeClass('hidden');
                } else {
                    $('#only-edit').addClass('hidden');
                }
            });
        }
    });
    $('#submit').click(function() {
        var $this = $(this), data = {};
        data.id = parseInt($this.attr('data-id'),10);
        data.description = $.trim($('#description').val()) || null;
        data.status = $('#status').val();
        if(!data.description || data.description.length < 5) {
            __tajs.showAlert('Description is required at least 5 characters');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/user/api', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
            }
            else {
                window.location.reload();
            }
        });
    });
});
</script>