<style>
.paygate {
    display: block;
    padding-top: 1.5rem;
    padding-bottom: 1rem;
    padding-left: 2rem;
    padding-right: 2rem;
}
.paygate.is-selected, .paygate:hover {
    background: #f7f9ff;
}
.paygate img {
    width: 100%;
    height: 100%;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->adv_balance)?></h2>
                        <p>Available</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-check-square-o text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->adv_pending)?></h2>
                        <p>Spending</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-money text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->receipt_value)?></h2>
                        <p>Spent</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-money text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->deposit_value)?></h2>
                        <p>Deposited</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-money text-warning font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h5 class="text-bold-700 mb-0">Deposit</h5>
                        <p>Select payment method below and enter amount to deposit.</p>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <!-- left menu section -->
                        <div class="col-md-3 mb-2 mb-md-0">
                            <ul class="nav nav-pills flex-column mt-md-0 mt-1">
                                <?php foreach($this->data->paygate as $paygate): ?>
                                <li class="nav-item mb-1">
                                    <a class="btn-outline-primary nav-link d-flex py-75 paygate paymethod" title="<?=$paygate->name?>" data-id="<?=$paygate->id?>" data-min="<?=$paygate->min_value?>" data-max="<?=$paygate->max_value?>" data-desc="<?=$paygate->description?>">
                                        <div class="abc">
                                            <img height="20" src="<?=$this->asset('img/paygate/'.str_replace(' ', '', strtolower($paygate->name)).'.png')?>" />
                                        </div>
                                        
                                    </a>
                                </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <!-- right content section -->
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="tab-content 2nd-step hidden">
                                            <div role="tabpanel" class="tab-pane active" id="account-vertical-general1" aria-labelledby="account-pill-general" aria-expanded="true">
                                                <div class=" mb-1">Choose amount you want to deposit.</div>
                                                <div class=" mb-1"><span id="minmax"></span></div>
                                                <div class="mb-1">
                                                    <button class="btn btn-info btn_amount btn_min mb-1" data-amount="">Min</button>
                                                    <button class="btn btn-info btn_amount btn_max mb-1" data-amount="">Max</button>
                                                    <button class="btn btn-info btn_amount mb-1" data-amount="100">$100</button>
                                                    <button class="btn btn-info btn_amount mb-1" data-amount="200">$200</button>
                                                    <button class="btn btn-info btn_amount mb-1" data-amount="500">$500</button>
                                                    <button class="btn btn-info btn_amount mb-1" data-amount="1000">$1000</button>
                                                    <button class="btn btn-info btn_amount mb-1" data-amount="2000">$2000</button>
                                                    <button class="btn btn-info btn_amount mb-1" data-amount="5000">$5000</button>
                                                    <button class="btn btn-info btn_amount mb-1" data-amount="">Custom</button>
                                                </div>
                                                <div class="mb-1">
                                                    <input type="hidden" id="paygate_id">
                                                    <input class="form-control input" id="amount" placeholder="Amount to deposit">
                                                </div>
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <button class="btn btn-primary mr-1" id="submit">Deposit</button>
                                                    <a href="javascript:window.history.back();" class="btn btn-danger" >Back</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
/* global $, __tajs */
var min = 0, max = 0;
function currencyFormat(n) {
    n = n || 0.00;
    return '$'+n.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
}
$(document).ready(function() {
    $('.paygate').click(function(e){
        e.preventDefault();
        var $this = $(this), id = parseInt($this.attr('data-id'),10);
        min = parseFloat($this.attr('data-min'));
        max = parseFloat($this.attr('data-max'));
        $('.paygate').removeClass('active');
        $this.addClass('active');
        $('#description').html($this.attr('data-desc').replace(/\n/g,"<br>"));
        $('#minmax').html('Minimum: '+currencyFormat(min)+', maximum: '+currencyFormat(max));
        $('.btn_min').attr('data-amount', min);
        $('.btn_max').attr('data-amount', max);
        $('#amount').val(max);
        $('#paygate_id').val(id);
        $('.2nd-step').removeClass('hidden');
        $('body,html').animate({scrollTop: $(document).height()-$(window).height()}, 1000);
    });
    $('.btn_amount').on('click', function(){
        $('#amount').val($(this).attr('data-amount'));
        $('#amount').focus();
    });
    $('#submit').on('click', function() {
        var $this = $(this), amount = parseInt($('#amount').val(),10), paygate_id = parseInt($('#paygate_id').val(),10);
        if(!amount || amount < min || amount > max) {
            __tajs.showAlert('Invalid deposit amount, please correct it!');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post(window.location.pathname, {csrf_token: __tajs.csrf, paygate_id: paygate_id, amount: amount}, function(res) {
            if (!res.success) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.replace(res.data);
            }
        });
    });
});
</script>