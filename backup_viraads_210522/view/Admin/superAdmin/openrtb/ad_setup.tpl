<style>
.dropdown-menu{z-index:4}
.box-image-ads {
    position: relative;
    display: -webkit-box;
    padding-bottom: 20px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    min-height: 176px;
}
.box-image-ads-svg {
    max-width: 210px;
    width: 100%;
}
.adFormat {
    cursor: pointer;
    height: 100%;
}
.adFormat.is-disabled, .adFormat.is-disabled:hover {
    cursor: not-allowed;
    border: none;
    opacity: 0.4;
}
.adFormat.is-selected, .adFormat:hover {
    border: 2px solid #ae6dad;
}
.pricing {
    margin-left:0.1rem;
    margin-right:0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding-top: 1rem;
    padding-bottom: 1rem;
}
.pricing.is-selected {
    border: 2px solid #ae6dad;
    color: #ae6dad;
}
.pricing p {
    text-transform: uppercase;
    font-weight: 700;
}
.param-type {
    text-transform: capitalize;
    width: 90px;
}
</style>
<section class="wrapper">
    <div class="container">
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-4-tablet is-12-mobile">
                    <h1 class="title is-5">
                        <?php if(isset($this->data->id)): ?>
                        #<?=$this->data->id?> - <?=$this->data->name?>
                        <?php else: ?>
                        <?=$this->data->network->name?>
                        <?php endif; ?>
                    </h1>
                </div>
                <div class="column is-8-tablet is-hidden-mobile">
                    <nav class="breadcrumb has-succeeds-separator is-right" aria-label="breadcrumbs">
                        <ul>
                            <li><a href="/">Admin</a></li>
                            <li class="is-active"><a href="#" aria-current="page">
                                <?php if(isset($this->data->id)): ?>
                                Ad Setup
                                <?php else: ?>
                                Ad Creator
                                <?php endif; ?>
                            </a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">Select Ad Format</h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <button class="button is-light is-info is-transparent collapse" data-action="collapse" data-target="ad-format">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns is-multiline" id="ad-format">
            <?php foreach($this->data->adFormat as $item): ?>
            <div class="column is-6-tablet is-4-desktop">
                <article class="flatbox adFormat is-disabled" data-id="<?=$item->id?>" data-status="<?=$item->status?>" data-pricing="<?=$item->pricing_model?>">
                    <div style="text-align:center;padding-bottom:1rem;">
                        <p class="title is-4 is-5-mobile"><?=$item->name?></p>
                    </div>
                    <div class="box-image-ads">
                        <div class="box-image-ads-svg">
                            <?=$item->svg?>
                        </div>
                    </div>
                    <?php foreach(explode(PHP_EOL,$item->description) as $desc): ?>
                    <div>
                        <span class="icon has-text-info">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
                            </svg>
                        </span>
                        <span><?=$desc?></span>
                    </div>
                    <?php endforeach; ?>
                </article>
            </div>
            <?php endforeach; ?>
        </div>
        <div class="page-title-box data-step is-hidden">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">Basic Information</h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <button class="button is-light is-info is-transparent collapse" data-action="collapse" data-target="basic-info">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns data-step is-hidden" id="basic-info">
            <div class="column is-12">
                <div class="flatbox is-100height">
                    <div class="field">
                        <label class="label">Ad Pricing</label>
                        <div class="control">
                            <div class="columns is-gapless is-mobile" id="pricing_model" style="margin-left:-.35rem;margin-right:-.35rem">
                            </div>
                        </div>
                    </div>
                    <div class="columns">
                        <div class="column is-3">
                            <div class="field">
                                <label class="label">Ad Name</label>
                                <div class="control has-icons-left">
                                    <input class="input" type="text" id="name" placeholder="Should be unique name">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="column is-3">
                            <div class="field">
                                <label class="label">Ad Upstream ID</label>
                                <div class="control has-icons-left">
                                    <input class="input" type="text" id="zone_id" placeholder="Upstream ID from network">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M7 14C5.9 14 5 13.1 5 12S5.9 10 7 10 9 10.9 9 12 8.1 14 7 14M12.6 10C11.8 7.7 9.6 6 7 6C3.7 6 1 8.7 1 12S3.7 18 7 18C9.6 18 11.8 16.3 12.6 14H16V18H20V14H23V10H12.6Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="column is-3">
                            <div class="field">
                                <label class="label">Ad Status</label>
                                <div class="control has-icons-left">
                                    <div class="select is-fullwidth">
                                        <select id="status">
                                            <option value="Active">Enable</option>
                                            <option value="Inactive">Disable</option>
                                        </select>
                                    </div>
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19,19H5V5H15V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V11H19M7.91,10.08L6.5,11.5L11,16L21,6L19.59,4.58L11,13.17L7.91,10.08Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="column is-3">
                            <div class="field">
                                <label class="label">OpenRTB</label>
                                <div class="control has-icons-left">
                                    <div class="select is-fullwidth">
                                        <select id="version">
                                            <?php foreach($this->data->versions as $version): ?>
                                            <option value="<?=$version?>">Version <?=$version?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M19 3H5C3.9 3 3 3.9 3 5V19C3 20.1 3.9 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3M11 8H9V10C9 11.1 8.1 12 7 12C8.1 12 9 12.9 9 14V16H11V18H9C7.9 18 7 17.1 7 16V15C7 13.9 6.1 13 5 13V11C6.1 11 7 10.1 7 9V8C7 6.9 7.9 6 9 6H11V8M19 13C17.9 13 17 13.9 17 15V16C17 17.1 16.1 18 15 18H13V16H15V14C15 12.9 15.9 12 17 12C15.9 12 15 11.1 15 10V8H13V6H15C16.1 6 17 6.9 17 8V9C17 10.1 17.9 11 19 11V13Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box data-step is-hidden">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">RTB Information</h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <button class="button is-light is-info is-transparent collapse" data-action="collapse" data-target="rtb-information">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns data-step is-hidden" id="rtb-information">
            <div class="column is-12">
                <div class="flatbox">
                    <div class="columns">
                        <div class="column is-3">
                            <div class="field">
                                <label class="label">Method</label>
                                <div class="control has-icons-left">
                                    <div class="select is-fullwidth">
                                        <select id="method">
                                            <option value="POST">POST</option>
                                            <option value="GET">GET</option>
                                        </select>
                                    </div>
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M13,19.92C14.8,19.7 16.35,18.95 17.65,17.65C18.95,16.35 19.7,14.8 19.92,13H16.92C16.7,14 16.24,14.84 15.54,15.54C14.84,16.24 14,16.7 13,16.92V19.92M10,8H14L17,11H19.92C19.67,9.05 18.79,7.38 17.27,6C15.76,4.66 14,4 12,4C10,4 8.24,4.66 6.73,6C5.21,7.38 4.33,9.05 4.08,11H7L10,8M11,19.92V16.92C10,16.7 9.16,16.24 8.46,15.54C7.76,14.84 7.3,14 7.08,13H4.08C4.3,14.77 5.05,16.3 6.35,17.6C7.65,18.9 9.2,19.67 11,19.92M12,2C14.75,2 17.1,3 19.05,4.95C21,6.9 22,9.25 22,12C22,14.75 21,17.1 19.05,19.05C17.1,21 14.75,22 12,22C9.25,22 6.9,21 4.95,19.05C3,17.1 2,14.75 2,12C2,9.25 3,6.9 4.95,4.95C6.9,3 9.25,2 12,2Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="column is-9">
                            <div class="field">
                                <label class="label">Endpoint</label>
                                <div class="control has-icons-left">
                                    <input class="input" type="text" id="endpoint" placeholder="RTB endpoint from partner">
                                    <span class="icon is-small is-left">
                                        <svg viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M12,13A5,5 0 0,1 7,8H9A3,3 0 0,0 12,11A3,3 0 0,0 15,8H17A5,5 0 0,1 12,13M12,3A3,3 0 0,1 15,6H9A3,3 0 0,1 12,3M19,6H17A5,5 0 0,0 12,1A5,5 0 0,0 7,6H5C3.89,6 3,6.89 3,8V20A2,2 0 0,0 5,22H19A2,2 0 0,0 21,20V8C21,6.89 20.1,6 19,6Z" />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="param_list">
                        
                    </div>
                    <div class="buttons is-centered" style="margin-top:2rem;">
                        <button class="button is-success" id="add_param">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M20.5,11H19V7C19,5.89 18.1,5 17,5H13V3.5A2.5,2.5 0 0,0 10.5,1A2.5,2.5 0 0,0 8,3.5V5H4A2,2 0 0,0 2,7V10.8H3.5C5,10.8 6.2,12 6.2,13.5C6.2,15 5,16.2 3.5,16.2H2V20A2,2 0 0,0 4,22H7.8V20.5C7.8,19 9,17.8 10.5,17.8C12,17.8 13.2,19 13.2,20.5V22H17A2,2 0 0,0 19,20V16H20.5A2.5,2.5 0 0,0 23,13.5A2.5,2.5 0 0,0 20.5,11Z"></path>
                                </svg>
                            </span>
                            <span>Add Parameters</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box data-step is-hidden">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">
                        <?php if(isset($this->data->id)): ?>
                        Setup Ad
                        <?php else: ?>
                        Create Ad
                        <?php endif; ?>
                    </h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <button class="button is-light is-info is-transparent collapse" data-action="collapse" data-target="create-ad">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns data-step is-hidden" id="create-ad">
            <div class="column is-12">
                <div class="flatbox">
                    <div class="buttons is-centered" style="margin-top:2rem;">
                        <button class="button is-success" id="process">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M19 10V19H5V5H14V3H5C3.92 3 3 3.9 3 5V19C3 20.1 3.92 21 5 21H19C20.12 21 21 20.1 21 19V10H19M17 10L17.94 7.94L20 7L17.94 6.06L17 4L16.06 6.06L14 7L16.06 7.94L17 10M13.25 10.75L12 8L10.75 10.75L8 12L10.75 13.25L12 16L13.25 13.25L16 12L13.25 10.75Z"></path>
                                </svg>
                            </span>
                            <span>Setup</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal" id="addParamModal">
    <div class="modal-background"></div>
    <div class="modal-card">
        <section class="modal-card-body">
            <div class="field">
                <label class="label">Name</label>
                <div class="control">
                    <input class="input" type="text" id="param_name" placeholder="param name">
                </div>
            </div>
            <div class="field">
                <label class="label">Value</label>
                <div class="control">
                    <input class="input" type="text" id="param_value" placeholder="param value">
                </div>
            </div>
            <div class="buttons are-small">
                <?php foreach($this->data->params as $v => $k): ?>
                <button class="button is-info sys_param" data-value="<?=$v?>"><?=$k?></button>
                <?php endforeach; ?>
            </div>
            <div class="buttons is-centered pt-1">
                <button class="button is-success btn-close enterAction" id="submit_param">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z"></path>
                        </svg>
                    </span>
                    <span>Add</span>
                </button>
                <button class="button is-light btn-close">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"></path>
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
function buildPricing(model) {
    model = model.split(',');
    const resposive = 12 / model.length;
    var html = '';
    for(var i = 0;i<model.length;i++) {
        html += '<div class="column is-'+resposive+'">';
        html += '<div class="flatbox pricing';
        if(i==0) html += ' is-selected';
        html += '" data-model="'+model[i]+'"><p>'+model[i]+'</p></div>';                    
        html += '</div>';
    }
    $('#pricing_model').html(html);
}
function addParam(n, v) {
    let html = '<div class="field has-addons param-item">';
    html += '<div class="control"><input class="input param-name" type="text" placeholder="param name" value="'+n+'"></div>';
    html += '<div class="control"><button class="button">=</button></div>';
    html += '<div class="control is-expanded"><input class="input param-value" type="text" placeholder="param value" value="'+v+'"></div>';
    html += '<div class="control"><button class="button is-danger btn-remove">';
    html += '<span class="icon"><svg viewBox="0 0 24 24"><path fill="currentColor" d="M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z"></path></svg></span>';
    html += '</button></div></div>';
    $('#param_list').append(html);
}
function getParam() {
    var params = {};
    $('#param_list').find('.param-item').each(function(){
        const $this = $(this);
        const n = $.trim($this.find('.param-name').val());
        const v = $.trim($this.find('.param-value').val());
        params[n] = v;
    });
    return params;
}
function fillData() {
    <?php if($this->data->network_id??null): ?>
    const data = <?=$this->data->data?>;
    $('.adFormat').removeClass('is-selected').addClass('is-disabled');
    $('.adFormat[data-id="<?=$this->data->ad_format?>"]').removeClass('is-disabled').addClass('is-selected').click();
    $('.pricing').removeClass('is-selected');
    $('.pricing[data-model="<?=$this->data->pricing_model?>"]').click();
    $('#name').val('<?=$this->data->name?>');
    $('#zone_id').val('<?=$this->data->zone_id?>');
    $('#status').val('<?=$this->data->status?>');
    $('#version').val(data.version);
    $('#status').prop('disabled', true);
    $('#method').val(data.method);
    $('#endpoint').val(data.endpoint);
    for(const n in data.param) {
        const v = data.param[n];
        addParam(n, v);
    }
    <?php endif; ?>
}
$(document).ready(function() {
    $('.adFormat[data-status="Active"]').removeClass('is-disabled');
    $('.adFormat').on('click', function() {
        var $this = $(this), collapse = $('.collapse[data-target="ad-format"]');
        if($this.hasClass('is-disabled')) return false;
        $('.adFormat').removeClass('is-selected');
        $this.addClass('is-selected');
        buildPricing($this.attr('data-pricing'))
        $('#ad-format').fadeOut(800);
        collapse.attr('data-action', 'expand');
        collapse.find('.icon').toggleClass('spin90');
        $('.data-step').removeClass('is-hidden');
    });
    $(document).on('click', '.pricing', function() {
        $('.pricing').removeClass('is-selected');
        $(this).addClass('is-selected');
    });
    $('#add_param').on('click', function() {
        $('#param_name').val('');
        $('#param_value').val('');
        $('#addParamModal').toggleClass('is-active');
    });
    $('.sys_param').on('click', function() {
        $('#param_value').val($(this).attr('data-value'));
    });
    $('#submit_param').on('click', function() {
        const n = $('#param_name').val();
        const v = $('#param_value').val();
        if(!n || !v) {
            __tajs.showAlert('Name and/or Value are required!');
            return false;
        }
        addParam(n, v);
        $('#addParamModal').toggleClass('is-active');
    });
    $(document).on('click', '.btn-remove', function() {
        $(this).closest('.field').remove();
    });
    $('#process').on('click', function(){
        var $this = $(this), data = {};
        <?php if($this->data->network_id??null): ?>
        data.id = <?=$this->data->id?>;
        <?php else: ?>
        data.network_id = <?=$this->data->network->id?>;
        <?php endif; ?>
        data.ad_format = $('.adFormat.is-selected').attr('data-id');
        data.pricing_model = $('.pricing.is-selected').attr('data-model');
        data.name = $.trim($('#name').val());
        data.zone_id = $.trim($('#zone_id').val());
        data.status = $('#status').val();
        
        var rtb_data = {};
        rtb_data.method = $('#method').val();
        rtb_data.endpoint = $.trim($('#endpoint').val());
        rtb_data.version = $('#version').val();
        rtb_data.param = getParam();
        
        if(!data.name || data.name.length < 3) {
            __tajs.showAlert('Ad Name is required and minimum 3 characters');
            return false;
        }
        if(!data.zone_id) {
            __tajs.showAlert('Ad Upstream ID is required');
            return false;
        }
        if(!rtb_data.endpoint || rtb_data.endpoint.length < 3) {
            __tajs.showAlert('RTB endpoint is required');
            return false;
        }

        data.data = rtb_data;
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/openrtb/ad/setup', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res){
            if(!res.success) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
                return false;
            }
            __tajs.showAlert('Success! now redirecting...', 'success');
            setTimeout(function(){window.location.replace(res.data)},1000);
        });
    });
    fillData();
});
</script>