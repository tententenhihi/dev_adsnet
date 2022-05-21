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
                        <h4 class="card-title">Receipt</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="create_receipt" tabindex="0">
                        <span><i class="feather icon-plus"></i> Create Receipt</span></button>
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
                            <?php foreach($this->data->types as $type): ?>
                            <a class="dropdown-item"
                               href="/billing/receipt/<?=strtolower($type)?><?=$this->arg?>"><?=$type?></a>
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
                                                       placeholder="campaign id, ad id" aria-label="filter"
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
                                    <th>Type</th>
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th><span class="is-pulled-right">Action</span></th>
                                    <th><span class="is-pulled-right">Created Date</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr data-id="<?=$item->id?>" data-user_id="<?=$item->user_id?>"
                                    data-campaign_id="<?=$item->campaign_id?>" data-ad_id="<?=$item->ad_id?>"
                                    data-amount="<?=$item->amount?>" data-description="<?=$item->description?>">
                                    <td><span class="is-pulled-left"><?=$item->id?></span></td>
                                    <td><a class="badge badge-link" href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?>
                                            - <?=$item->user_name?></a></td>
                                    <td>
                                        <?php if($item->type == 'Automatic'): ?>
                                        <span class="badge badge-success">Automatic</span>
                                        <?php else: ?>
                                        <span class="badge badge-warning">Manual</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                    <td><?=$item->description?:'Not Available'?></td>
                                    <td>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn-edit">
                                            <i class="feather icon-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn-delete">
                                            <i class="feather icon-trash"></i>
                                        </button>
                                    </td>
                                    <td><span class="is-pulled-right"><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>No receipts found</p>
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

<div class="modal fade text-left" id="receiptModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Receipt</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">User Id</label>
                        <input class="form-control" id="user_id" placeholder="Please Input User Id">
                    </div>
                    <div class="form-group">
                        <label class="label">Campaign Id</label>
                        <input class="form-control" id="campaign_id" placeholder="Please Input Campaign Id">
                    </div>
                    <div class="form-group">
                        <label class="label">Ad Id</label>
                        <input class="form-control" id="ad_id" placeholder="Please Input Ad Id">
                    </div>
                    <div class="form-group">
                        <label class="label">Amount</label>
                        <input class="form-control" id="amount" placeholder="Please Input Amount">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="form-control" id="description" placeholder="Your API Description"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="submit" data-id="0">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $ __tajs*/
    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 1) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('#create_receipt').on('click', function () {
            $('#user_id').val('');
            $('#campaign_id').val('');
            $('#ad_id').val('');
            $('#amount').val('');
            $('#description').val('');
            $('#submit').attr('data-id', '0');
            $('#receiptModal').modal('show');
        });
        $('.btn-edit').on('click', function () {
            var $item = $(this).closest('tr'), id = $item.attr('data-id'), user_id = $item.attr('data-user_id'),
                campaign_id = $item.attr('data-campaign_id'), ad_id = $item.attr('data-ad_id'),
                amount = $item.attr('data-amount'), description = $.trim($item.attr('data-description'));
            $('#user_id').val(user_id);
            $('#campaign_id').val(campaign_id);
            $('#ad_id').val(ad_id);
            $('#amount').val(amount);
            $('#description').val(description);
            $('#submit').attr('data-id', id);
            $('#receiptModal').modal('show');
        });
        $('#submit').click(function () {
            var $this = $(this), data = {};
            data.id = parseInt($this.attr('data-id'), 10);
            data.user_id = parseInt($('#user_id').val(), 10);
            data.description = $.trim($('#description').val()) || null;
            data.campaign_id = parseInt($('#campaign_id').val(), 10);
            data.ad_id = parseInt($('#ad_id').val(), 10);
            data.amount = parseFloat($('#amount').val());
            if (!data.user_id) {
                __tajs.showAlert('User id is required');
                return false;
            }
            if (!data.campaign_id) {
                __tajs.showAlert('Campaign id is required');
                return false;
            }
            if (!data.ad_id) {
                __tajs.showAlert('Ad id is required');
                return false;
            }
            if (!data.amount) {
                __tajs.showAlert('Amount id is required');
                return false;
            }
            if (!data.description || data.description.length < 5) {
                __tajs.showAlert('Description is required at least 5 characters');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/billing/receipt', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                if (!res.success) {
                    __tajs.showAlert(res.data);
                } else {
                    window.location.reload();
                }
            });
        });
        $('.btn-delete').on('click', function () {
            var $this = $(this), $item = $this.closest('tr'), id = $item.attr('data-id');
            __tajs.showConfirm("Delete receipt can't be undo, are you sure?", function (yes) {
                if (yes) {
                    $this.prop('disabled', true);
                    $this.addClass('is-loading');
                    $.post('/billing/receipt-delete/' + id, {csrf_token: __tajs.csrf}, function (res) {
                        $this.removeClass('is-loading');
                        $this.prop('disabled', false);
                        if (!res.success) {
                            __tajs.showAlert(res.data);
                        } else {
                            $item.remove();
                        }
                    });
                }
            });

        });
    });
</script>