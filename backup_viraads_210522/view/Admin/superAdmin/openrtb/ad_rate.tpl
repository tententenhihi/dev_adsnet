<style>
.country {
    padding-left: 2em;
    padding-right: 2em;
}

.label strong {
    color: #cc0f35;
}
</style>
<section class="wrapper">
    <div class="content-body">
        <div class="row">
            <div class="col-md-12 col-12 col-">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-end">
                        <div class="d-flex">
                            <h4 class="card-title">
                                Ad #<?=$this->data->id?> rate
                            </h4>
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
                                                        placeholder="Ad Name" aria-label="filter"
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
                                        
                                        <div class="subtitle is-5">
                                            <strong><?=number_format($this->data->total)?></strong> Records
                                        </div>
                                    </div>
                                    <div class="ag-grid-btns justify-content-between flex-wrap">
                                            <button class="btn btn-info btn-light btn-transparent"
                                                id="btn-adjust">Adjust:
                                                <strong><?=$this->data->adjust?></strong></button>
                                            <button class="btn btn-primary btn-light btn-transparent"
                                                id="btn-default">Default Rate:
                                                <strong><?=$this->data->default*100?>%</strong></button>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">Results</h1>
                </div>
            </div>
        </div>
        <div class="flatbox">
            <div class="buttons are-transparent">
                <?php foreach($this->data->data as $code => $rate): ?>
                <button class="button is-success is-light country" data-code="<?=$code?>" data-rate="<?=$rate?>">
                    <span><?=$code?>: <?=$rate*100?>%</span>
                </button>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>
<div class="modal" id="editRateModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <section class="modal-card-body">
            <div class="field">
                <label class="label">Rate for <strong id="name"></strong></label>
                <div class="control">
                    <input class="input" id="rate" type="number" placeholder="Ad rate" value="">
                </div>
            </div>
            <div class="buttons is-centered pt-4">
                <button class="button is-success enterAction" id="submit">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                        </svg>
                    </span>
                    <span>Submit</span>
                </button>
                <button class="button is-light btn-close">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor"
                                d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                        </svg>
                    </span>
                    <span>Close</span>
                </button>
            </div>
        </section>
    </div>
    <button class="modal-close is-large"></button>
</div>
<div class="modal" id="editAdjustModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <section class="modal-card-body">
            <div class="field">
                <label class="label">Bid Adjust</label>
                <div class="control">
                    <input class="input" id="adjust" type="number" placeholder="Bid adjust" value="">
                </div>
            </div>
            <div class="buttons is-centered pt-4">
                <button class="button is-success enterAction" id="submit2">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                        </svg>
                    </span>
                    <span>Submit</span>
                </button>
                <button class="button is-light btn-close">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor"
                                d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
                        </svg>
                    </span>
                    <span>Close</span>
                </button>
            </div>
        </section>
    </div>
    <button class="modal-close is-large"></button>
</div>
<script>
/* global $, __tajs */
var default_rate = <?=$this->data->default?>,
    id = <?=$this->data->id?>;

function colorItem() {
    $('.country').each(function() {
        const $this = $(this);
        const rate = parseFloat($this.attr('data-rate'));
        if (rate < default_rate) {
            $this.removeClass('is-success').addClass('is-danger');
        }
    });
}

function filterByCode(code) {
    $('.country').removeClass('is-hidden');
    if (!code) return false;
    code = code.toUpperCase();
    $('.country').each(function() {
        const $this = $(this);
        const v = $this.attr('data-code');
        if (v.indexOf(code) == -1) $this.addClass('is-hidden');
    });
}
$(document).ready(function() {
    $('#search').on('input', function() {
        const v = $.trim($(this).val());
        if (v.length > 2) return false;
        filterByCode(v);
    });
    $('#btn-default').on('click', function() {
        $('#rate').val(default_rate);
        $('#name').html('default');
        $('#editRateModal').toggleClass('is-active');
    });
    $('#btn-adjust').on('click', function() {
        $('#adjust').val(parseFloat($(this).find('strong').text()));
        $('#editAdjustModal').toggleClass('is-active');
    });
    $('.country').on('click', function() {
        const $this = $(this);
        $('#rate').val($this.attr('data-rate'));
        $('#name').html($this.attr('data-code'));
        $('#editRateModal').toggleClass('is-active');
    });
    $('#submit').on('click', function() {
        const $this = $(this),
            rate = parseFloat($('#rate').val());
        const code = $.trim($('#name').text());
        if (!rate) {
            __tajs.showAlert('Rate is required!');
            return false;
        }

        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/openrtb/rate', {
            csrf_token: __tajs.csrf,
            id: id,
            code: code,
            rate: rate
        }, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            if (code == 'default') {
                default_rate = rate;
                $('#btn-default').find('strong').html(parseFloat((rate * 100).toFixed(7)) +
                    '%');
                colorItem();
            } else {
                const $item = $('.country[data-code="' + code + '"]');
                $item.attr('data-rate', rate);
                $item.find('span').html(code + ': ' + parseFloat((rate * 100).toFixed(7)) +
                    '%');
            }
            $('#editRateModal').toggleClass('is-active');
        });
    });
    $('#submit2').on('click', function() {
        const $this = $(this),
            adjust = parseFloat($('#adjust').val());
        if (!adjust) {
            __tajs.showAlert('Bid adjust is required!');
            return false;
        }

        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/openrtb/adjust', {
            csrf_token: __tajs.csrf,
            id: id,
            adjust: adjust
        }, function(res) {
            $this.removeClass('is-loading');
            $this.prop('disabled', false);
            if (!res.success) {
                __tajs.showAlert(res.data);
                return false;
            }
            $('#btn-adjust').find('strong').html(adjust);
            $('#editAdjustModal').toggleClass('is-active');
        });
    });
    colorItem();
});
</script>