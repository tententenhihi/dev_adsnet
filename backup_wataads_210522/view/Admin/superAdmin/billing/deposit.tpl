<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only Deposits from user #<?=$this->data->user->id?> - <?=$this->data->user->name?>
                            (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Deposit</h4>
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
                               href="/billing/deposit/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Transaction ID" aria-label="filter"
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
                                    <th style="width:100px"><span class="is-pulled-left">ID</span></th>
                                    <th>User</th>
                                    <th>Method</th>
                                    <th>Amount</th>
                                    <th>Transaction ID</th>
                                    <th>Status</th>
                                    <th>Description</th>
                                    <th><span class="is-pulled-right">Created Date</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td><a class="is-pulled-left btn-edit" href="javascript:void();"
                                           data-item='<?=json_encode($item)?>'>#<?=$item->id?></a></td>
                                    <td><a class="badge badge-link" href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?>
                                            - <?=$item->user_name?></a></td>
                                    <td><span class="badge badge-info"><?=$item->method?></span></td>
                                    <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                    <td><?=$item->transaction?:'Not Available'?></td>
                                    <td>
                                        <?php if($item->status == 'Paid'): ?>
                                        <span class="badge badge-success">Paid</span>
                                        <?php elseif($item->status == 'Unpaid'): ?>
                                        <span class="badge badge-warning">Unpaid</span>
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
                                    <p class="title is-6">You did not deposit any money</p>
                                    <p class="subtitle is-6">Ready to run first advertising campaign? <a
                                                href="/billing/deposit">Deposit Now</a></p>
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
                    <h4 class="modal-title" id="myModalLabel33">Deposit</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input id="id" type="hidden" value="">
                    <div class="form-group">
                        <label class="label">Amount</label>
                        <input class="form-control" id="amount" type="text" placeholder="Received Amount">
                    </div>
                    <div class="form-group">
                        <label class="label">Transaction</label>
                        <input class="form-control" id="transaction" type="text" placeholder="Transaction ID" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <input class="form-control" id="description" type="text" placeholder="Description" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Status</label>
                        <select id="status"class="form-control">
                            <?php foreach($this->data->statuses as $item): ?>
                            <?php if($item != 'All'): ?>
                            <option value="<?=$item?>"><?=$item?></option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="submit">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $, __tajs */
    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            let val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('.btn-edit').on('click', function () {
            let item = JSON.parse($(this).attr('data-item'));
            $('#id').val(item.id);
            $('#amount').val(item.amount);
            $('#transaction').val(item.transaction);
            $('#description').val(item.description);
            $('#status').val(item.status);
            $('#editModal').modal('show');
        });
        $('#submit').on('click', function () {
            let $this = $(this), data = {};
            data.id = $('#id').val();
            data.amount = $('#amount').val();
            data.transaction = $('#transaction').val();
            data.description = $('#description').val();
            data.status = $('#status').val();

            if (!data.amount || data.amount <= 0) {
                __tajs.showAlert('Amount is invalid!');
                return false;
            }

            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/billing/deposit', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                if (!res.success) {
                    $this.removeClass('is-loading');
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                    return false;
                }
                __tajs.showAlert('Created Successfully!', 'success');
                window.location.reload();
            });
        });
    });
</script>