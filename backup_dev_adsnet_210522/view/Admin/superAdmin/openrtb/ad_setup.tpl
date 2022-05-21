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
.adFormat.disabled, .adFormat.disabled:hover {
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
.pricing{
    box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding: 12px 15px 1px 15px;
}
.pricing p {
    text-transform: uppercase;
    font-weight: 700;
}
.param-type {
    text-transform: capitalize;
    width: 90px;
}


.collapse:not(.show) {
    display: inline;
}

.form-group.has-addons .control.is-expanded {
    flex-grow: 1;
    flex-shrink: 1;
}
.adFormat {
    margin-left:0.1rem;
    margin-right:0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding-top: 1rem;
    padding-bottom: 1rem;
}
.is-selected {
    border: 2px solid #006ed6;
    color: #006ed6;
}
.adFormat{
    box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
    margin-left: 0.1rem;
    margin-right: 0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding: 12px 15px 1px 15px;
}
.box-image-ads {
    position: relative;
    display: -webkit-box;
    padding-bottom: 20px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    min-height: 176px;
}
</style>
<section class="wrapper">
    <div class="content-body">
        <div class="page-title-box">
            <div class="row is-mobile">
                <div class="col-6">
                    <h3 class="title is-6">Select Ad Format</h3>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="ad-format">
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
        <div class="row is-multiline" id="ad-format" style="flex-wrap: wrap">
            <?php foreach($this->data->adFormat as $item): ?>
            <div class="col-lg-4 col-md-6 col-12 mb-2">
                <article class="card flatbox adFormat disabled" data-id="<?=$item->id?>" data-status="<?=$item->status?>" data-pricing="<?=$item->pricing_model?>">
                    <div class="card-content data-step">
                        <div class="card-body card-dashboard">
                            <div style="text-align:center;padding-bottom:1rem;">
                                <h2 class="title is-4 is-5-mobile"><?=$item->name?></h2>
                            </div>
                            <div class="box-image-ads">
                                <div class="box-image-ads-svg">
                                    <?=$item->svg?>
                                </div>
                            </div>
                            <?php foreach(explode(PHP_EOL,$item->description) as $desc): ?>
                            <div>
                                <span class="icon text-info">
                                    <i class="feather icon-check"></i>
                                </span>
                                <span><?=$desc?></span>
                            </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </article>
            </div>
            <?php endforeach; ?>
        </div>
        <div class="page-title-box data-step hidden">
            <div class="row is-mobile">
                <div class="col-6">
                    <h3 class="title is-6">Basic Information</h3>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="basic-info">
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
        <div class="row data-step hidden" id="basic-info" style="flex-wrap: wrap;">
            <div class="col-12 mb-2">
                <div class="card flatbox h-100 mb-0">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="form-group">
                                <label class="label">Ad Pricing</label>
                                <div class="control">
                                    <div class="row" id="pricing_model" style="margin-left:-.35rem;margin-right:-.35rem">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="label">Ad Name</label>
                                        <input class="input form-control" type="text" id="name" placeholder="Should be unique name">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="label">Ad Upstream ID</label>
                                        <input class="input form-control" type="text" id="zone_id" placeholder="Upstream ID from network">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="label">Ad Status</label>
                                        <select id="status" class="form-control">
                                            <option value="Active">Enable</option>
                                            <option value="Inactive">Disable</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="label">OpenRTB</label>
                                        <select id="version" class="form-control">
                                            <?php foreach($this->data->versions as $version): ?>
                                            <option value="<?=$version?>">Version <?=$version?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box data-step hidden">
            <div class="row is-mobile">
                <div class="col-6">
                    <h3 class="title is-6">RTB Information</h3>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="rtb-information">
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
        <div class="row data-step hidden" id="rtb-information">
            <div class="col-12">
                <div class="card flatbox">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="row">
                                <div class="col-3">
                                    <div class="form-group">
                                        <label class="label">Method</label>
                                        <select id="method" class="form-control">
                                            <option value="POST">POST</option>
                                            <option value="GET">GET</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-9">
                                    <div class="form-group">
                                        <label class="label">Endpoint</label>
                                        <input class="input form-control" type="text" id="endpoint" placeholder="RTB endpoint from partner">
                                    </div>
                                </div>
                            </div>
                            <div id="param_list">

                            </div>
                            <div class="text-center" style="margin-top:2rem;">
                                <button class="btn btn-success" id="add_param">
                                    <i class="feather icon-plus"></i>
                                    <span>Add Parameters</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-title-box data-step hidden">
            <div class="row is-mobile">
                <div class="col-6">
                    <h3 class="title is-6">
                        <?php if(isset($this->data->id)): ?>
                        Setup Ad
                        <?php else: ?>
                        Create Ad
                        <?php endif; ?>
                    </h3>
                </div>
                <div class="col-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                        <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="create-ad">
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
        <div class="row data-step hidden" id="create-ad">
            <div class="col-12">
                <div class="card flatbox">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="text-center">
                                <button class="btn btn-success" id="process">
                                    <i class="fa fa-cogs"></i>
                                    <span>Setup</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade text-left" id="addParamModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <section class="modal-body">
                    <div class="form-group">
                        <label class="label">Name</label>
                        <input class="input form-control" type="text" id="param_name" placeholder="param name">
                    </div>
                    <div class="form-group">
                        <label class="label">Value</label>
                        <input class="input form-control" type="text" id="param_value" placeholder="param value">
                    </div>
                    <div class="buttons are-small">
                        <?php foreach($this->data->params as $v => $k): ?>
                        <button class="btn btn-info sys_param mb-1" data-value="<?=$v?>"><?=$k?></button>
                        <?php endforeach; ?>
                    </div>
                </section>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="submit_param">
                        <i class="feather icon-plus"></i> Add</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $, __tajs */
function buildPricing(model) {
    model = model.split(',');
    const resposive = 12 / model.length;
    var html = '';
    for(var i = 0;i<model.length;i++) {
        html += '<div class="col-lg-4 col-md-4 col-12 mt-1">';
        html += '<div class="flatbox pricing';
        if(i==0) html += ' is-selected';
        html += '" data-model="'+model[i]+'"><p>'+model[i]+'</p></div>';
        html += '</div>';
    }
    $('#pricing_model').html(html);
}
function addParam(n, v) {

    let html = '<div class="input-group param-item mb-1">';
    html += '<input class="input form-control param-name" type="text" placeholder="param name" value="'+n+'">';
    html += '<div class="input-group-append"><button class="btn btn-primary">=</button></div>';
    html += '<input class="input form-control param-value" type="text" placeholder="param value" value="'+v+'">';
    html += '<div class="input-group-append"><button class="btn btn-danger btn-remove">';
    html += '<i class="feather icon-trash-2"></i>';
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
    $('.adFormat').removeClass('is-selected').addClass('disabled');
    $('.adFormat[data-id="<?=$this->data->ad_format?>"]').removeClass('disabled').addClass('is-selected').click();
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
    $('.adFormat[data-status="Active"]').removeClass('disabled');
    $('.adFormat').on('click', function() {
        var $this = $(this), collapse = $('.collapse[data-target="ad-format"]');
        if($this.hasClass('disabled')) return false;
        $('.adFormat').removeClass('is-selected');
        $this.addClass('is-selected');
        buildPricing($this.attr('data-pricing'))
        $('#ad-format').fadeOut(800);
        collapse.attr('data-action', 'expand');
        collapse.find('.icon').toggleClass('spin90');
        $('.data-step').removeClass('hidden');
    });
    $(document).on('click', '.pricing', function() {
        $('.pricing').removeClass('is-selected');
        $(this).addClass('is-selected');
    });
    $('#add_param').on('click', function() {
        $('#param_name').val('');
        $('#param_value').val('');
        $('#addParamModal').modal('show');
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
        $('#addParamModal').modal('hide');
    });
    $(document).on('click', '.btn-remove', function() {
        $(this).closest('.input-group').remove();
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