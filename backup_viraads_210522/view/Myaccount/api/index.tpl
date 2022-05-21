<style>
    table .badge{
        min-width: 70px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Activities</h4> 
                        <button class="btn btn-icon btn-outline-primary btn-header" id="create_api" tabindex="0"><span><i class="feather icon-plus"></i> Create Access Token</span></button>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by: <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button" id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                                <a class="dropdown-item" href="/api/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                <input id="search" type="text" class="form-control" placeholder="Token" aria-label="filter" value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary waves-effect waves-light" type="button" id="enterAction"><i class="feather icon-search"></i> Search</button>
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
                                        <th scope="col">Service</th>
                                        <th scope="col">Access Token</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Created at</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                    <tr data-id="<?=$item->id?>">
                                        <td>
                                            <span class="badge badge-<?=$item->service?>"><?=$item->service?></span>
                                        </td>
                                        <td><?=$item->api_token?></td>
                                        <td class="api_status"><?php if($item->status == 'Active'): ?>
                                            <span class="badge badge-success">Active</span>
                                            <?php else: ?>
                                            <span class="badge badge-warning">Inactive</span>
                                            <?php endif; ?>
                                        </td>
                                        <td class="api_description"><?=$item->description?></td>
                                        <td><?=$item->created_at?></td>
                                        <td>
                                            <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn-edit"><i class="feather icon-edit"></i></button>
                                            <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn-delete"><i class="feather icon-trash"></i></button>
                                        </td>
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

    
</div>

<div class="modal fade text-left" id="apiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div id="only-create">
                    <label>Service: </label>
                    <div class="form-group">
                        <select class="form-control" id="service">
                            <?php foreach($this->services as $service => $desc): ?>
                                <option value="<?=$service?>"><?=$service?> - <?=$desc?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <label>Description: </label>
                <div class="form-group">
                    <textarea id="description" type="text" placeholder="Your Token Description" class="form-control"></textarea>
                </div>
                <label>Status: </label>
                <div class="form-group">
                    <select class="form-control" id="status">
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <p class="help text-danger hidden" id="only-edit">Deactivate In-use token may breaks your application, carefully!</p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-success" id="submit">
                    <i class="feather icon-check"></i> Submit
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    <i class="feather icon-x"></i> Close
                </button>
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
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('#create_api').click(function() {
        $('#only-create').removeClass('hidden');
        $('#only-edit').addClass('hidden');
        $('#status').off('change');
        $('#description').val('');
        $('#submit').attr('data-id', '0');
        //$('#apiModal').toggleClass('active');
        $('#apiModal').modal('show')
    });
    $('.btn-edit').on('click', function(){
        var $item = $(this).closest('tr'), id = $item.attr('data-id'), status = $.trim($item.find('.api_status').text()), description = $.trim($item.find('.api_description').text());
        $('#only-create').addClass('hidden');
        $('#only-edit').addClass('hidden');
        $('#status').val(status);
        $('#description').val(description);
        $('#submit').attr('data-id', id);
        $('#apiModal').modal('show')
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
        data.service = $('#service').val();
        data.description = $.trim($('#description').val()) || null;
        data.status = $('#status').val();
        if(!data.description || data.description.length < 5) {
            __tajs.showAlert('Description is required at least 5 characters');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/api', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
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
    $('.btn-delete').on('click', function(){
        var $this = $(this), $item = $this.closest('tr'), id = $item.attr('data-id'), status = $.trim($item.find('.api_status').text());
        if(status == 'Active') {
            __tajs.showConfirm('Delete in-use api token may breaks your application, sure?', function(yes){
                if(yes) {
                    $this.prop('disabled', true);
                    $this.addClass('is-loading');
                    $.post('/api/delete/'+id, {csrf_token: __tajs.csrf}, function(res) {
                        $this.removeClass('is-loading');
                        $this.prop('disabled', false);
                        if (!res.success) {
                            __tajs.showAlert(res.data);
                        }
                        else {
                            $item.remove();
                        }
                    });
                }
            });
        } else {
            $this.prop('disabled', true);
            $this.addClass('is-loading');
            $.post('/api/delete/'+id, {csrf_token: __tajs.csrf}, function(res) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                if (!res.success) {
                    __tajs.showAlert(res.data);
                }
                else {
                    $item.remove();
                }
            });
        }
    });
});
</script>