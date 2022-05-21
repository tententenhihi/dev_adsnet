<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Invoice #<?=$this->data->id?> - <?=SITE_NAME?></title>
<link rel="shortcut icon" href="<?=$this->asset('img/favicon.png')?>">
<link rel="stylesheet" href="<?=$this->asset('css/app.css')?>">
<script src="<?=$this->asset('js/app.js')?>"></script>
<style>
.buttons {
    margin-top: 2rem;
}
@media screen and (max-width: 768px) {
    .pt-2-mobile {
        padding-top: 2rem;
    }
}
</style>
</head>
<body>
    <section class="hero is-fullheight is-bold">
        <div class="hero-body">
            <div class="container">
                <div class="columns is-mobile">
                    <div class="column is-6">
                        <img src="<?=$this->asset('img/logo.png')?>" style="max-height: 1.75rem;">
                    </div>
                    <div class="column is-6">
                        <div class="buttons is-right">
                            <a class="button is-info is-small" href="javascript:window.print();">Print</a>
                            <a class="button is-link is-small" href="javascript:window.print();">Export as PDF</a>
                        </div>
                    </div>
                </div>
                <div class="flatbox">
                    <div class="columns is-mobile">
                        <div class="column is-7">
                            <p>Invoice: <strong>#<?=$this->data->id?></strong></p>
                            <p>Date: <strong><?=$this->data->created_at?></strong></p>
                            <p>Method: <strong><?=$this->data->paygate_name?></strong></p>
                        </div>
                        <div class="column is-5">
                            <p class="is-size-1-tablet is-size-2-mobile has-text-weight-medium has-text-right <?php if($this->data->status == 'Paid'): ?>has-text-success<?php elseif($this->data->status == 'Unpaid'): ?>has-text-danger<?php else: ?>has-text-grey<?php endif; ?>"><?=$this->data->status?></p>
                        </div>
                    </div>
                    <div class="columns is-multiline">
                        <div class="column is-12">
                            <hr />
                        </div>
                        <div class="column is-6">
                            <h3 class="title is-6 has-text-centered-mobile">Pay to:</h3>
                            <p class="has-text-centered-mobile"><?=SITE_NAME?></p>
                            <p class="has-text-centered-mobile"><?=EMAIL_CONTACTUS?></p>
                            <p class="has-text-centered-mobile"><?=FRONTEND_URL?></p>
                        </div>
                        <div class="column is-6">
                            <h3 class="title is-6 has-text-right-tablet has-text-centered-mobile pt-2-mobile">Invoice to:</h3>
                            <p class="has-text-right-tablet has-text-centered-mobile"><?=$this->data->user->name?></p>
                            <p class="has-text-right-tablet has-text-centered-mobile"><?=$this->data->user->phone?></p>
                            <p class="has-text-right-tablet has-text-centered-mobile"><?=$this->data->user->email?></p>
                            <p class="has-text-right-tablet has-text-centered-mobile"><?=$this->data->user->address?></p>
                        </div>
                    </div>
                    <div class="columns">
                        <div class="column is-12">
                            <div style="margin-top:1rem;">
                                <table class="table is-striped is-fullwidth">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Units</th>
                                            <th>Amount</th>
                                            <th><span class="is-pulled-right">Total</span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Prepaid Ad Balance</td>
                                            <td>1</td>
                                            <td><?=$this->helper->currencyFormat($this->data->amount)?></td>
                                            <td><span class="is-pulled-right"><?=$this->helper->currencyFormat($this->data->amount)?></span></td>
                                        </tr>
                                        <tr>
                                            <td style="border:none"></td>
                                            <td style="border:none"></td>
                                            <td><span class="has-text-grey">Subtotal</span></td>
                                            <td><span class="has-text-grey is-pulled-right"><?=$this->helper->currencyFormat($this->data->amount)?></span></td>
                                        </tr>
                                        <tr>
                                            <td style="border:none"></td>
                                            <td style="border:none"></td>
                                            <td><span class="has-text-grey">Fees *</span></td>
                                            <td><span class="has-text-grey is-pulled-right">
                                                <?php if($this->data->status == 'Unpaid'): ?>
                                                N/A yet
                                                <?php elseif($this->data->status == 'Cancelled'): ?>
                                                N/A
                                                <?php else: ?>
                                                <?=$this->helper->currencyFormat($this->data->fees)?>
                                                <?php endif; ?>
                                            </span></td>
                                        </tr>
                                        <tr>
                                            <td style="border:none"></td>
                                            <td style="border:none"></td>
                                            <td><span class="has-text-dark is-size-4">Net.</span></td>
                                            <td><span class="has-text-dark is-size-4 is-pulled-right">
                                                <?php if($this->data->status == 'Unpaid'): ?>
                                                N/A
                                                <?php else: ?>
                                                <?=$this->helper->currencyFormat($this->data->net_amount)?>
                                                <?php endif; ?>
                                            </span></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <?php if($this->data->status == 'Unpaid'): ?><small class="has-text-grey has-text-right" style="display: block;">* We do not charge fees, but the paygate may do that. We only consider net amount we receive</small><?php endif; ?>
                            </div>
                        </div>
                    </div>
                    <div class="columns">
                        <div class="column">
                            <?php if($this->data->status == 'Paid'): ?>
                            <p class="has-text-success is-size-5 is-size-6-mobile">Thank you for your payment and the opportunity to serve you as our valuable customer. We appreciate your ongoing business</p>
                            <div class="buttons is-centered">
                                <a class="button is-light" href="/billing/deposit/history">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
                                        </svg>
                                    </span>
                                    <span>Back</span>
                                </a>
                            </div>
                            <?php elseif($this->data->status == 'Cancelled'): ?>
                            <div class="buttons is-centered">
                                <a class="button is-light" href="/billing/deposit/history">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
                                        </svg>
                                    </span>
                                    <span>Back</span>
                                </a>
                            </div>
                            <?php else: ?>
                            <?php if($this->data->module == 'Paypal' || $this->data->module == 'CreditCard'): ?>
                            <div id="smart-button-container">
                                <div style="text-align: center;">
                                    <div id="paypal-button-container"></div>
                                </div>
                            </div>
                            <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD&intent=capture" data-sdk-integration-source="button-factory"></script>
                            <?php if($this->data->module == 'CreditCard'): ?>
                            <style>.paypal-button-number-0 {display: none !important;}</style>
                            <?php endif; ?>
                            <script>
                                function initPayPalButton() {
                                    paypal.Buttons({
                                        <?php if($this->data->module == 'Paypal'): ?>fundingSource: paypal.FUNDING.PAYPAL,<?php endif; ?>
                                        style: {shape: 'pill', color: 'blue', layout: 'vertical', label: 'pay'},
                                        createOrder: function() {
                                            return fetch('/billing/paypal/create/<?=$this->data->id?>', {
                                                method: 'post',
                                                credentials: 'same-origin',
                                                headers: {'Content-type': 'application/x-www-form-urlencoded; charset=UTF-8'},
                                                body: 'csrf_token=<?=$this->csrf()?>'
                                            }).then(function(res) {
                                                return res.json();
                                            }).then(function(res) {
                                                if(res.success) return res.data;
                                                return null;
                                            });
                                        },
                                        onApprove: function(data) {
                                            __tajs.showLoading();
                                            return fetch('/billing/paypal/capture/<?=$this->data->id?>', {
                                                method: 'post',
                                                credentials: 'same-origin',
                                                headers: {'Content-type': 'application/x-www-form-urlencoded; charset=UTF-8'},
                                                body: 'csrf_token=<?=$this->csrf()?>'
                                            }).then(function(res) {
                                                return res.json();
                                            }).then(function(res) {
                                                if(res.success) {
                                                    window.location.replace(window.location.pathname+'?status=success');
                                                } else {
                                                    window.location.replace(window.location.pathname+'?status=failed');
                                                }
                                            });
                                        },
                                        onError: function(err) {
                                            __tajs.showAlert(err);
                                        }
                                    }).render('#paypal-button-container');
                                }
                                initPayPalButton();
                            </script>
                            <?php endif; ?>
                            <div class="buttons is-centered">
                                <button class="button is-danger" id="cancel">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M3,4.27L4.28,3L21,19.72L19.73,21L16.06,17.33C15.44,18 14.54,18.55 13.5,18.82V21H10.5V18.82C8.47,18.31 7,16.79 7,15H9C9,16.08 10.37,17 12,17C13.13,17 14.14,16.56 14.65,15.92L11.68,12.95C9.58,12.42 7,11.75 7,9C7,8.77 7,8.55 7.07,8.34L3,4.27M10.5,5.18V3H13.5V5.18C15.53,5.69 17,7.21 17,9H15C15,7.92 13.63,7 12,7C11.63,7 11.28,7.05 10.95,7.13L9.4,5.58L10.5,5.18Z" />
                                        </svg>
                                    </span>
                                    <span>Cancel This Invoice</span>
                                </button>
                                <a class="button is-light" href="/billing/deposit/history">
                                    <span class="icon">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
                                        </svg>
                                    </span>
                                    <span>Back</span>
                                </a>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<script>
/* global $, __tajs */
$(document).ready(function() {
    $('#cancel').click(function() {
        var $this = $(this);
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post(window.location.pathname, {csrf_token: '<?=$this->csrf()?>', act: 'cancel'}, function(res) {
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
</body>
</html>
