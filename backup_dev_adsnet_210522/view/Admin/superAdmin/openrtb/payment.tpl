<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->network): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <?php if($this->data->network): ?>
                        <p>Showing only payments from network #<?=$this->data->network->id?> - <?=$this->
                            data->network->name?></p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Exchange Payments</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="add" tabindex="0">
                            <span><i class="feather icon-plus"></i> Add Payment</span></button>
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
                        <div class="table-responsive mb-1">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th style="width:100px"><span class="is-pulled-left">ID</span></th>
                                    <th>Network</th>
                                    <th>Method</th>
                                    <th>Amount</th>
                                    <th>Transaction ID</th>
                                    <th>Description</th>
                                    <th><span class="is-pulled-right">Created Date</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>#<?=$item->id?></td>
                                    <td><a class="badge badge-primary"
                                           href="/exchange/network?id=<?=$item->network_id?>">#<?=$item->network_id?>
                                            - <?=$this->data->networks[$item->network_id]?></a></td>
                                    <td><span class="badge badge-success"><?=$item->method?></span></td>
                                    <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                    <td><?=$item->transaction_id?:'Not Available'?></td>
                                    <td><?=$item->description?:'Not Available'?></td>
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
                                    <p class="title is-6">You don't have any openrtb payments yet</p>
                                    <p class="subtitle is-6">Manually add payments that you received from ad networks
                                        here</p>
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
                <div class="modal-body">
                    <input id="id" type="hidden" value="">
                    <div class="form-group">
                        <label class="label">Network</label>
                        <select id="network_id" class="form-control">
                            <?php foreach($this->data->networks as $id => $name): ?>
                            <option value="<?=$id?>"><?=$name?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">Transaction ID</label>
                        <input class="form-control" id="transaction_id" type="text" placeholder="Transaction ID">
                    </div>
                    <div class="form-group">
                        <label class="label">Method</label>
                        <input class="form-control" id="method" type="text" placeholder="Payment Method" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Amount</label>
                        <input class="form-control" id="amount" type="number" step="0.01" placeholder="Payment amount" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="form-control" id="description"
                                  placeholder="Some descriptions about this payment"></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="save">
                        <i class="feather icon-check"></i> Submit</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close</button>
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
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('#add').on('click', function(){
        $('#id').val('');
        $('#transaction_id').val('');
        $('#method').val('');
        $('#description').val('');
        $('#editModal').modal('show');
    });
    $('#save').on('click', function() {
        const data = {}, $this = $(this);
        data.network_id = parseInt($('#network_id').val(),10);
        data.transaction_id = $('#transaction_id').val();
        data.method = $('#method').val();
        data.description = $('#description').val();
        data.amount = parseFloat($('#amount').val());

        if(!data.transaction_id) {
            __tajs.showAlert('Transaction ID is required');
            return false;
        }
        if(!data.method) {
            __tajs.showAlert('Method is required');
            return false;
        }
        if(!data.description) {
            __tajs.showAlert('Description is required');
            return false;
        }
        if(!data.amount) {
            __tajs.showAlert('Payment amount is required');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/openrtb/payment', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            __tajs.showAlert('Added Successfully!', 'success');
            window.location.reload();
        });
    });
});
</script>