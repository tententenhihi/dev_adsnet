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
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->pub_balance)?></h2>
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
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->pub_pending*$this->data->revshare)?></h2>
                        <p>Pending</p>
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
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->currencyFormat($this->data->balance->withdraw_value)?></h2>
                        <p>Withdrawn</p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-credit-card text-danger font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0"><?=$this->helper->numberFormat($this->data->balance->withdraw_count)?></h2>
                        <p>Invoices</p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-file-text-o text-warning font-medium-5"></i>
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
                        <div class="d-flex align-items-center ">
                            <h3 class="text-bold-700 mb-0">Withdraw</h3>
                            <a href="/billing/withdraw-history" class="btn btn-outline-primary ml-1">
                                <i class="fa fa-history"></i>
                                <span>Withdraw history</span>
                            </a>
                        </div>
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
                                    <a class="btn-outline-primary nav-link d-flex py-75 paygate" title="<?=$paygate->name?>" data-id="<?=$paygate->id?>" data-min="<?=$paygate->min_value?>" data-max="<?=$paygate->max_value?>" data-desc="<?=$paygate->description?>" data-form='<?=htmlentities($paygate->information)?>'>
                                        <div class="abc">
                                            <img height="20" src="<?=$this->asset('img/paygate/'.str_replace(' ', '', strtolower($paygate->name)).'.png')?>" />
                                        </div>
                                        
                                    </a>
                                </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <div class="col-md-9 mb-2 mb-md-0">
                            <div class="row">
                                <div class="col-12">
                                    <p id="description"></p>
                                </div>
                            </div>
                            <div class="row 2nd-step hidden" >
                                <div class="col-12 text-danger hidden" id="alert">
                                    <p id="alert_description"></p>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label for="amount">Amount to withdraw</label>
                                            <div class="button-groups mb-1">
                                                <button class="btn btn-info is-small btn_amount btn_min" data-amount="">Min</button>
                                                <button class="btn btn-info is-small btn_amount btn_max" data-amount="">Max</button>
                                                <button class="btn btn-info is-small btn_amount" data-amount="">Custom</button>
                                            </div>
                                            <input type="text" class="form-control" id="amount" placeholder="Amount" value="" required="">
                                            <div class="buttons is-centered pt-1" id="gen_button"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden 3rd-step">
                                <div class="col-12">
                                    <h3>Required Infomations</h3>
                                    <div id="add_forms"></div>
                                    <div class="button-groups">
                                        <button class="btn btn-primary submit">Submit</button>
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
var balance = parseFloat('<?=$this->data->balance->pub_balance?>'), min = 0, max = 0, user_payinfo = <?=json_encode($this->data->user_payinfo)?>;
function currencyFormat(n) {
    n = n || 0.00;
    return '$'+n.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
}
function createButton(str, paygate_id) {
    var html = '';
    switch(str) {
        case 'submit':
            html += '<input class="hidden data_form" name="paygate_id" value="'+paygate_id+'">';
            html += '<button class="btn btn-success submit">';
            html += '<i class="feather icon-check"></i>';
            html += '<span> Submit</span>';
            html += '</button>';
            break;
        
        case 'next_step':
            html += '<button class="btn btn-success" id="next_step">';
            html += '<span>Next Step </span>';
            html += '<i class="feather icon-arrow-right"></i>';
            html += '</button>';
            break;
            
        default:
            break;
    }
    return html;
}
function buildForm(paygate_id, payInformations) {
    var current_form = {};
    if(user_payinfo) {
        $.each(user_payinfo, function(k,v){
            if(v.paygate_id == paygate_id) {
                current_form = JSON.parse(v.information);
                return false;
            }
        });
    }
    payInformations = JSON.parse(payInformations);
    var html = '<input class="hidden data_form" type="hidden" name="paygate_id" value="'+paygate_id+'" pattern="/[0-9]+/">';
    $.each(payInformations, function(k,v){
        html += '<div class="field">';
        html += '<label class="label">'+v.placeholder+'</label>';
        html += '<div class="form-controls mb-1">';
        if(v.type == 'textarea') {
            html += '<textarea class="form-control data_form" name="'+v.name+'" pattern="'+v.pattern+'" required="'+v.required+'" placeholder="'+v.placeholder+'">';
            if(current_form[v.name]) html += current_form[v.name];
            html += '</textarea>';
        } else {
            html += '<input class="form-control data_form" name="'+v.name+'" type="'+v.type+'" ';
            if(current_form[v.name]) html += 'value="'+current_form[v.name]+'" ';
            html += 'pattern="'+v.pattern+'" required="'+v.required+'" placeholder="'+v.placeholder+'">';
        }
        html += '</div></div>';
    });
    $('#add_forms').html(html);
}
function colorAmount() {
    var v = $('#amount').val();
    if(v > max || v < min) {
        $('#amount').addClass('is-danger');
    } else {
        $('#amount').removeClass('is-danger');
    }
}
$(document).ready(function() {
    $('.paygate').click(function(e){
        e.preventDefault();
        var $this = $(this),
            description = $this.attr('data-desc'),
            paygate_id = $this.attr('data-id'),
            payInformations = $this.attr('data-form');
        min = parseFloat($this.attr('data-min'));
        max = parseFloat($this.attr('data-max'));
        
        $('.paygate').removeClass('active');
        $this.addClass('active');
        
        $('.3rd-step').addClass('hidden');
        $('#alert').addClass('hidden');
        $('.btn_amount').prop('disabled', false);
        
        $('#description').html(description.replace(/\n/g,"<br>"));
        $('#minmax').html('Minimum: '+currencyFormat(min)+', maximum: '+currencyFormat(max));
        $('.2nd-step').removeClass('hidden');
        //$('body,html').animate({scrollTop: $(document).height()-$(window).height()}, 1000);
        
        min = min;
        max = balance > max ? max : balance;
        if(max < min) {
            $('.btn_amount').prop('disabled', true);
            $('#alert_description').html('You have insufficient balance to withdraw by this method!');
            $('#alert').removeClass('hidden');
            $('#gen_button').addClass('hidden');
            return false;
        }
        
        $('.btn_min').attr('data-amount', min);
        $('.btn_max').attr('data-amount', max);
        $('#amount').val(max);
        colorAmount();
        
        if(payInformations) {
            $('#gen_button').html(createButton('next_step'));
            buildForm(paygate_id, payInformations);
        } else {
            $('#gen_button').html(createButton('submit', paygate_id));
            $('#add_forms').html('');
        }
        $('#gen_button').removeClass('hidden');
    });
    $('#amount').on('input',function(){
        colorAmount();
    });
    $('.btn_amount').on('click', function(){
        $('#amount').val($(this).attr('data-amount'));
        $('#amount').focus();
        colorAmount();
    });
    $(document).on('click', '#next_step', function(){
        var amount = parseInt($('#amount').val(),10);
        if(amount < min) {
            __tajs.showAlert('Amount to withdraw should be more than $'+min);
            return false;
        }
        if(amount > max) {
            __tajs.showAlert('Amount to withdraw should be less than $'+max);
            return false;
        }
        $('#gen_button').addClass('hidden');
        $('.3rd-step').removeClass('hidden');
        //$('body,html').animate({scrollTop: $(document).height()-$(window).height()}, 1000);
    });
    $(document).on('click', '.submit', function() {
        var $this = $(this), data = {}, okay = true;
        data.amount = parseInt($('#amount').val(),10);
        $('.data_form').each(function(){
            var $this = $(this), n = $this.attr('name'), v = $this.val();
            if($this.attr('required')) {
                if(!v || !(new RegExp($this.attr('pattern'),'i')).test(v)) {
                    okay = false;
                    __tajs.showAlert($this.attr('placeholder')+' is invalid, please check again!');
                    return false;
                }
            }
            data[n] = v;
        });
        if(!okay) return false;
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post(window.location.pathname, {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
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