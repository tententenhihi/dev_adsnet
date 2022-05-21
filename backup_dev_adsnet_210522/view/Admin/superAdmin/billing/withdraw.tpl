<style>
    table .badge{
        min-width: 70px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only withdraws from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex ">
                    <div class="d-flex">
                        <h4 class="card-title">Withdraw</h4>
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
                               href="/billing/withdraw/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                    <th>Status</th>
                                    <th>ID</th>
                                    <th>User</th>
                                    <th>Method</th>
                                    <th>Payout</th>
                                    <th>Transaction ID</th>
                                    <th>Description</th>
                                    <th>Created Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <?php if($item->status == 'Paid'): ?>
                                        <span class="badge badge-success">Paid</span>
                                        <?php elseif($item->status == 'Pending'): ?>
                                        <span class="badge badge-warning">Pending</span>
                                        <?php else: ?>
                                        <span class="badge badge-danger">Cancelled</span>
                                        <?php endif; ?>
                                    </td>
                                    <?php if($item->status == 'Pending'): ?>
                                    <td><a class="btn-pay" data-id="<?=$item->id?>" data-amount="<?=$item->amount?>" data-user="<?=$item->user_id?>" data-paygate="<?=$item->paygate_id?>" data-method="<?=$item->method?>">#<?=$item->id?></a></td>
                                    <?php else: ?>
                                    <td>#<?=$item->id?></td>
                                    <?php endif; ?>

                                    <td><a class="badge badge-link" href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->user_name?></a></td>
                                    <td><span class="badge badge-info"><?=$item->method?:'Internal'?></span></td>
                                    <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                    <td><?=$item->transaction?:'Not Available'?></td>
                                    <td><?=$item->description?:'Not Available'?></td>
                                    <td><?=$item->created_at?></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>You did not withdraw any money</p>
                                    <p>Want to get some cash? <a href="/billing/withdraw">Withdraw Now</a></p>
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
<div class="modal fade text-left" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <section class="modal-body">
                    <input class="hidden" id="id" type="hidden" value="">
                    <div class="" id="payinfo"></div>
                    <div class="form-group">
                        <label class="label">Transaction</label>
                        <input class="input form-control" id="transaction" type="text"  placeholder="Transaction ID" value="">
                    </div>
                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="textarea form-control" id="description" placeholder="Description"></textarea>
                    </div>
                </section>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success waves-effect waves-light enterAction" id="submit">
                        <i class="feather icon-check"></i> Paid This
                    </button>
                    <button type="button" class="btn btn-danger waves-effect waves-light" id="cancel">
                        <i class="feather icon-slash"></i> Cancel This
                    </button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    /* global $, __tajs */
    var payInfo = {};
    function selectText(node) {
        if (document.body.createTextRange) {
            const range = document.body.createTextRange();
            range.moveToElementText(node);
            range.select();
        } else if (window.getSelection) {
            const selection = window.getSelection();
            const range = document.createRange();
            range.selectNodeContents(node);
            selection.removeAllRanges();
            selection.addRange(range);
        }
    }
    function showPayInfo(user_id, paygate_id, amount, method) {
        if (payInfo[user_id] && payInfo[user_id][paygate_id]) {
            return renderPayInfo(payInfo[user_id][paygate_id], amount, method);
        }
        renderPayInfo(false, false, false);
        $.post('/billing/payinfo', {csrf_token: __tajs.csrf, user_id: user_id, paygate_id: paygate_id}, function(res) {
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            if(!payInfo[user_id]) payInfo[user_id] = {};
            payInfo[user_id][paygate_id] = JSON.parse(res.data);
            renderPayInfo(payInfo[user_id][paygate_id], amount, method);
        });
    }
    function renderPayInfo(data, amount, method) {
        let html = '';
        if (!data) {
            html += '<p class="has-text-info has-text-centered">Loading User payment information...</p>';
            $('#payinfo').html(html);
            return true;
        }

        html += '<p>Please make payment as bellow:</p>';
        html += '<ul>';
        html += '<li><code>Method</code> <span class="selectAll">'+method+'</span></li>';
        html += '<li><code>Amount $</code><span class="selectAll">'+amount+'</span></li>';
        for(const i in data) {
            html += '<li><code>'+i+'</code> <span class="selectAll">'+data[i]+'</span></li>';
        }
        html += '</ul>';
        $('#payinfo').html(html);
    }
    $(document).ready(function() {
        $('#enterAction').on('click', function() {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        });
        $('.btn-pay').on('click', function() {
            let $this = $(this), id = $this.attr('data-id'), amount = $this.attr('data-amount'),
                user_id = $this.attr('data-user'), paygate_id = $this.attr('data-paygate'),
                method = $this.attr('data-method');
            showPayInfo(user_id, paygate_id, amount, method);
            $('#id').val(id);
            $('#transaction').val('');
            $('#description').val('');
            $('#payModal').modal('show');
        });
        $('#submit').on('click', function() {
            let $this = $(this), data = {};
            data.id = $('#id').val();
            data.transaction = $('#transaction').val();
            data.description = $('#description').val();
            if(!data.transaction || data.transaction.length < 5) {
                __tajs.showAlert('Transaction ID is required!');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/billing/withdraw', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
                if (!res.success) {
                    $this.removeClass('is-loading');
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                    return false;
                }
                __tajs.showAlert('Saved Successfully!', 'success');
                window.location.reload();
            });
        });
        $(document).on('click', '.selectAll', function(){
            selectText(this);
        });
    });
</script>
