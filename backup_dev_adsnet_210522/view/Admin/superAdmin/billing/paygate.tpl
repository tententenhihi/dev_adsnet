<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Paygate</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header btn-add" tabindex="0">
                            <span><i class="feather icon-plus"></i> New Paygate</span></button>
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
                               href="/billing/paygate/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Name" aria-label="filter"
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
                        <div class="table-responsive mb-1">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th style="width:100px"><span class="is-pulled-left">ID</span></th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Min</th>
                                    <th>Max</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                    <th>Description</th>
                                    <th><span class="is-pulled-right">Created Date</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr data-item='<?=htmlentities(json_encode($item))?>'>
                                    <td><a class="is-pulled-left btn-edit"><?=$item->id?></a></td>
                                    <td><a class="btn-edit"><?=$item->name?></a></td>
                                    <td>
                                        <?php if($item->type == 'Deposit'): ?>
                                        <span class="badge badge-success">Deposit</span>
                                        <?php else: ?>
                                        <span class="badge badge-warning"><?=$item->type?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td><?=$this->helper->currencyFormat($item->min_value)?></td>
                                    <td><?=$this->helper->currencyFormat($item->max_value)?></td>
                                    <td><span class="badge badge-info"><?=$item->priority?></span></td>
                                    <td>
                                        <?php if($item->status == 'Active'): ?>
                                        <span class="badge badge-success">Active</span>
                                        <?php else: ?>
                                        <span class="badge badge-danger"><?=$item->status?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td><?=$item->description?:'Not Available'?></td>
                                    <td><span class="is-pulled-right"><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="has-text-centered">
                                    <p class="title is-6">You don't have any paygates</p>
                                    <p class="subtitle is-6">Ready to add first one? <a href="javascript:void();"
                                                                                        class="btn-add">Add now</a></p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        <?=$this->data->pagination?>
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
                    <h4 class="modal-title" id="myModalLabel33">Paygate</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input id="id" type="hidden" value="">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="form-control" id="name" type="text" placeholder="Paygate Name">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="form-control" id="description" placeholder="Paygate Description"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="label">Information</label>
                        <textarea class="form-control" id="information" placeholder="Paygate Information"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="label">Type</label>
                        <select id="type" class="form-control">
                            <?php foreach($this->paygateType as $item): ?>
                            <option value="<?=$item?>"><?=$item?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Min Amount</label>
                        <input class="form-control" id="min_value" type="number" placeholder="Min Amount" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Max Amount</label>
                        <input class="form-control" id="max_value" type="number" placeholder="Max Amount" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Status</label>
                        <select id="status" class="form-control">
                            <?php foreach($this->data->statuses as $item): ?>
                            <?php if($item != 'All'): ?>
                            <option value="<?=$item?>"><?=$item?></option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Priority</label>
                        <input class="form-control" id="priority" type="number" placeholder="Priority" value="">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary waves-effect waves-light enterAction" id="btn-save">Submit</button>
                        <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $, __tajs */
    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('.btn-add').on('click', function () {
            $('#id').val('');
            $('#name').val('');
            $('#description').val('');
            $('#information').val('');
            $('#min_value').val('');
            $('#max_value').val('');
            $('#priority').val('0');
            $('#editModal').modal('show');
        });
        $('.btn-edit').on('click', function (e) {
            e.preventDefault();
            const data = JSON.parse($(this).closest('tr').attr('data-item'));
            $('#id').val(data.id);
            $('#name').val(data.name);
            $('#description').val(data.description);
            $('#information').val(data.information);
            $('#type').val(data.type);
            $('#min_value').val(data.min_value);
            $('#max_value').val(data.max_value);
            $('#status').val(data.status);
            $('#priority').val(data.priority);
            $('#editModal').modal('show');
        });
        $('#btn-save').on('click', function () {
            var $this = $(this), id = parseInt($('#id').val(), 10), data = {id: id};
            data.name = $.trim($('#name').val());
            data.description = $.trim($('#description').val());
            data.information = $.trim($('#information').val());
            data.type = $('#type').val();
            data.min_value = parseFloat($('#min_value').val());
            data.max_value = parseFloat($('#max_value').val());
            data.status = $('#status').val();
            data.priority = parseInt($('#priority').val(), 10);
            if (data.name.length < 3) {
                __tajs.showAlert('Paygate name is required');
                return false;
            }
            if (data.description.length < 10) {
                __tajs.showAlert('description is required');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post(window.location.pathname, {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                if (!res.success) {
                    __tajs.showAlert(res.data);
                    return false;
                }
                if (!id) __tajs.showAlert('Created Successfully!', 'success');
                window.location.reload();
            });
        });
    });
</script>