<style>
    .loading, .loading:after {
        /*border-radius: 50%;width: 10em;height: 10em;*/
    }
    .loading {
        /*margin:20px auto;font-size: 10px;position: relative;text-indent: -9999em;border-top:1.1em solid rgba(174, 109, 173, 0.1);border-right:1.1em solid rgba(174, 109, 173, 0.1);border-bottom:1.1em solid rgba(174, 109, 173, 0.1);border-left:1.1em solid #006ed6;transform:translateZ(0);animation:a 1.1s infinite linear;*/
    }
    .is-more {padding-top:0;padding-right:0;margin-top:-.5rem;background-color:transparent;border:none;color: #6c757d;}
    .is-more:focus{box-shadow:none !important;}


    .tag:not(body).is-rounded {
        border-radius: 290486px;
    }
    .tag:not(body).is-success {
        background-color: #009dff;
        color: #fff;
    }

    .tags-input .tag {
        font-size: 1rem;
        margin: 0.1rem;
    }
    .tag:not(body) {
        align-items: center;
        background-color: #f5f5f5;
        border-radius: 4px;
        color: #4a4a4a;
        display: inline-flex;
        font-size: .75rem;
        height: 2em;
        justify-content: center;
        line-height: 1.5;
        padding-left: 0.75em;
        padding-right: 0.75em;
        white-space: nowrap;
    }

    .tag:not(body) .delete {
        margin-left: 0.25rem;
        margin-right: -0.375rem;
    }
    .is-small.delete, .is-small.modal-close {
        height: 16px;
        max-height: 16px;
        max-width: 16px;
        min-height: 16px;
        min-width: 16px;
        width: 16px;
    }
    .delete, .modal-close {
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        -moz-appearance: none;
        -webkit-appearance: none;
        background-color: rgba(10,10,10,.2);
        border: none;
        border-radius: 290486px;
        cursor: pointer;
        pointer-events: auto;
        display: inline-block;
        flex-grow: 0;
        flex-shrink: 0;
        font-size: 0;
        height: 20px;
        max-height: 20px;
        max-width: 20px;
        min-height: 20px;
        min-width: 20px;
        outline: 0;
        position: relative;
        vertical-align: top;
        width: 20px;
    }
    .delete::before, .modal-close::before {
        height: 2px;
        width: 50%;
    }
    .delete::after, .delete::before {
        background-color: #fff;
        content: "";
        display: block;
        left: 50%;
        position: absolute;
        top: 50%;
        transform: translateX(-50%) translateY(-50%) rotate(45deg);
        transform-origin: center center;
    }
    .delete::after, .modal-close::after {
        height: 50%;
        width: 2px;
    }
    .delete::after, .delete::before{
        background-color: #fff;
        content: "";
        display: block;
        left: 50%;
        position: absolute;
        top: 50%;
        transform: translateX(-50%) translateY(-50%) rotate(45deg);
        transform-origin: center center;
    }

    .collapse:not(.show) {
        display: inline;
    }

    .field.has-addons .control.is-expanded {
        flex-grow: 1;
        flex-shrink: 1;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="page-title-box">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Schedule Time</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                            <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-0">
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
            <div class="card">
                <div class="card-content data-step" id="step-0">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <div class="form-group">
                                        <label>Report Name</label>
                                        <input class="form-control input" type="text" id="name" placeholder="Report Name" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Date Range</label>
                                        <select id="date-range" class="form-control input">
                                            <option value="yesterday">Yesterday</option>
                                            <option value="lastweek">Last Week</option>
                                            <option value="lastmonth">Last Month</option>
                                            <option value="last7days">Last 7 Days</option>
                                            <option value="last30days">Last 30 Days</option>
                                        </select>

                                        <p class="help text-warning">Date Range is relative to the date that report will be sent</p>
                                    </div>

                                    <div class="form-group">
                                        <label><span id="frequency">Daily</span> Report will be sent at</label>
                                        <div class="field has-addons input-group">
                                            <div class="control" id="select-weekday" style="display:none">
                                                <div class="select is-fullwidth">
                                                    <select id="day-report" style="min-width:200px;" class="form-control input">
                                                        <option value="1">Monday</option>
                                                        <option value="2">Tuesday</option>
                                                        <option value="3">Wednesday</option>
                                                        <option value="4">Thursday</option>
                                                        <option value="5">Friday</option>
                                                        <option value="6">Saturday</option>
                                                        <option value="0">Sunday</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="control" id="select-monthdate" style="display:none">
                                                <div class="select is-fullwidth">
                                                    <select id="date-report" style="min-width:200px;" class="form-control input">
                                                        <?php for($i=1;$i<32;$i++): ?>
                                                        <?php $e = $i; if($i<10){$e = '0'.$i;} ?>
                                                        <option value="<?=$i?>"><?=$e?></option>
                                                        <?php endfor; ?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="control is-expanded has-icons-left">
                                                <div class="select is-fullwidth">
                                                    <select id="day-hour" class="form-control input">
                                                        <?php for($i=0;$i<24;$i++): ?>
                                                        <?php $e = $i.':00'; if($i<10){$e = '0'.$i.':00';} ?>
                                                        <option value="<?=$i?>"><?=$e?></option>
                                                        <?php endfor; ?>
                                                    </select>
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

            <div class="page-title-box">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Simple Filter</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                            <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-1">
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

            <div class="card">
                <div class="card-content data-step" id="step-1">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <div class="form-group">
                                        <label class="label">Campaign</label>
                                        <select id="campaign_id" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Campaign">
                                            <?php foreach($this->data->campaigns as $campaign): ?>
                                            <option value="<?=$campaign->id?>"><?=$campaign->name?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <p class="help text-warning">Leave empty to not filter by campaigns</p>
                                    </div>
                                    <div class="form-group">
                                        <label class="label">Ad</label>
                                        <select id="ad_id" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Ad"></select>
                                        <p class="help text-warning">Leave empty to not filter by Ads</p>
                                    </div>
                                    <div class="form-group">
                                        <label>Country</label>
                                        <select id="country" class="form-control input" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Country">
                                            <?php foreach($this->data->countries as $country): ?>
                                            <option value="<?=$country->code?>"><?=$country->name?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <p class="help text-warning">Leave empty to not filter by countries</p>
                                    </div>
                                    <div class="buttons text-center is-generate" style="margin-top:2rem;">
                                        <?php if($this->data->data): ?>
                                        <button class="btn btn-success btn-generate">
                                            <i class="feather icon-bar-chart-2"></i>
                                            <span>Update Report</span>
                                        </button>
                                        <button class="btn btn-danger btn-delete">
                                            <i class="feather icon-trash-2"></i>
                                            <span>Delete Report</span>
                                        </button>


                                        <?php else: ?>
                                        <button class="btn btn-success btn-generate">
                                            <i class="feather icon-bar-chart-2"></i>
                                            <span>Schedule Report</span>
                                        </button>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-title-box">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Advanced Filter</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                            <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-2">
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

            <div class="card">
                <div class="card-content data-step" id="step-2" style="display: none;">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <div class="form-group">
                                        <label class="label">Audience</label>

                                        <select id="audience_id" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Audience">
                                            <?php foreach($this->data->audiences as $audience): ?>
                                            <option value="<?=$audience->id?>"><?=$audience->name?> (<?=$audience->daily_reach?> daily - <?=$audience->total_users?> total)</option>
                                            <?php endforeach; ?>
                                        </select>

                                        <p class="help text-warning">Leave empty to not filter by audiences</p>
                                    </div>
                                    <div class="form-group">
                                        <label>Platform</label>

                                        <select id="platform" class="form-control input" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Platform">
                                            <?php foreach($this->data->platforms as $item): ?>
                                            <option value="<?=$item->name?>"><?=$item->name?></option>
                                            <?php endforeach; ?>
                                        </select>

                                        <p class="help text-warning">Leave empty to not filter by platforms</p>
                                    </div>
                                    <div class="form-group">
                                        <label>Operating System</label>

                                        <select id="os" class="form-control input" multiple data-type="tags" autocomplete="off" data-placeholder="Choose OS">
                                            <?php foreach($this->data->oses as $item): ?>
                                            <option value="<?=$item->name?>"><?=$item->name?></option>
                                            <?php endforeach; ?>
                                        </select>

                                        <p class="help text-warning">Leave empty to not filter by OSes</p>
                                    </div>
                                    <div class="form-group">
                                        <label>Browser</label>

                                        <select id="browser" class="form-control input" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Browser">
                                            <?php foreach($this->data->browsers as $item): ?>
                                            <option value="<?=$item->name?>"><?=$item->name?></option>
                                            <?php endforeach; ?>
                                        </select>

                                        <p class="help text-warning">Leave empty to not filter by browsers</p>
                                    </div>
                                    <div class="buttons text-center is-generate hidden" style="margin-top:2rem;">
                                        <?php if($this->data->data): ?>
                                        <button class="btn btn-success btn-generate">
                                            <i class="feather icon-bar-chart-2"></i>
                                            <span>Update Report</span>
                                        </button>
                                        <button class="btn btn-danger btn-delete">
                                            <i class="feather icon-trash-2"></i>
                                            <span>Delete Report</span>
                                        </button>
                                        <?php else: ?>
                                        <button class="btn btn-success btn-generate">
                                            <i class="feather icon-bar-chart-2"></i>
                                            <span>Schedule Report</span>
                                        </button>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-title-box">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Group & Order</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                            <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="step-3">
                            <span class="icon spin90">
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

            <div class="card">
                <div class="card-content data-step" id="step-3" style="display: none;">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <div class="form-group">
                                        <label>Group By</label>

                                        <select id="group_by" class="form-control input" data-type="tags" data-placeholder="Group By">
                                            <?php foreach($this->data->group_by as $item): ?>
                                            <option value="<?=$item?>"><?=$item?></option>
                                            <?php endforeach; ?>
                                        </select>

                                        <p class="help text-warning">Leave empty to group by Date</p>

                                    </div>
                                    <div class="form-group">
                                        <label>Order By</label>

                                        <select id="order_by" class="form-control input" data-type="tags" data-placeholder="Order By">
                                            <?php foreach($this->data->order_by as $item): ?>
                                            <option value="<?=$item?>"><?=$item?></option>
                                            <?php endforeach; ?>
                                        </select>

                                        <p class="help text-warning">Leave empty to order by Date</p>

                                    </div>
                                    <div class="buttons text-center" style="margin-top:2rem;">
                                        <?php if($this->data->data): ?>
                                        <button class="btn btn-success btn-generate">
                                            <i class="feather icon-bar-chart-2"></i>
                                            <span>Update Report</span>
                                        </button>
                                        <button class="btn btn-danger btn-delete">
                                            <i class="feather icon-trash-2"></i>
                                            <span>Delete Report</span>
                                        </button>
                                        <?php else: ?>
                                        <button class="btn btn-success btn-generate">
                                            <i class="feather icon-bar-chart-2"></i>
                                            <span>Schedule Report</span>
                                        </button>
                                        <?php endif; ?>
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
<script src="<?=$this->asset('js/tagsinput.min.js')?>"></script>
<script>
/* global $, __tajs, BulmaTagsInput */
var platforms = <?=json_encode($this->data->platforms)?>;
var oses = <?=json_encode($this->data->oses)?>;
var browsers = <?=json_encode($this->data->browsers)?>;
var mapPlatformOs = <?=json_encode($this->data->mapPlatformOs)?>;
var mapOsBrowser = <?=json_encode($this->data->mapOsBrowser)?>;
var campaigns = <?=json_encode($this->data->ads)?>;
var report_id = null;
BulmaTagsInput.attach('[data-type="tags"]', {
    allowDuplicates: false,
	caseSensitive: false,
	clearSelectionOnTyping: false,
	closeDropdownOnItemSelect: true,
	delimiter: ',',
	freeInput: true,
	highlightDuplicate: true,
	highlightMatchesString: true,
	itemValue: undefined,
  	itemText: undefined,
	maxTags: undefined,
	maxChars: undefined,
	minChars: 1,
	noResultsLabel: 'No results found',
	placeholder: '',
	removable: true,
	searchMinChars: 2,
	searchOn: 'text',
	selectable: false,
	source: undefined,
	tagClass: 'is-rounded is-success',
	trim: true
});
var platform_tags = document.getElementById('platform').BulmaTagsInput(),
    os_tags = document.getElementById('os').BulmaTagsInput(),
    country_tags = document.getElementById('country').BulmaTagsInput(),
    browser_tags = document.getElementById('browser').BulmaTagsInput(),
    campaign_tags = document.getElementById('campaign_id').BulmaTagsInput(),
    ad_tags = document.getElementById('ad_id').BulmaTagsInput(),
    audience_tags = document.getElementById('audience_id').BulmaTagsInput(),
    group_by = document.getElementById('group_by').BulmaTagsInput(),
    order_by = document.getElementById('order_by').BulmaTagsInput();
platform_tags.on('after.add', function(data) {
    buildOsSelection();
});
platform_tags.on('after.remove', function(data) {
    buildOsSelection();
});
os_tags.on('after.add', function(data) {
    buildBrowserSelection();
});
os_tags.on('after.remove', function(data) {
    buildBrowserSelection();
});
campaign_tags.on('after.add', function(data) {
    if(campaigns[data.item.value]) {
        for(var i=0;i<campaigns[data.item.value].length;i++) {
            ad_tags._createDropdownItem(campaigns[data.item.value][i]);
        }
    }
    adjustGroupByCampaign()
});
campaign_tags.on('after.remove', function(data) {
    if(campaigns[data.value]) {
        ad_tags.remove(campaigns[data.value]);
        for(var i=0;i<campaigns[data.value].length;i++) {
            Array.from(ad_tags.dropdown.children).some(function(a){
                if(a.dataset.value==campaigns[data.value][i].value) {
                    a.remove();
                    return true;
                }
            })
        }
    }
    adjustGroupByCampaign()
});
ad_tags.on('after.add', function(data) {
    adjustGroupByAd()
});
ad_tags.on('after.remove', function(data) {
    adjustGroupByAd()
});
group_by.on('after.add', function(data) {
    order_by._createDropdownItem({text: data.item.text, value: data.item.value});
    order_by.add({text: data.item.text, value: data.item.value});
});
group_by.on('after.remove', function(data) {
    order_by.remove({text: data.text, value: data.value});
    Array.from(order_by.dropdown.children).some(function(a){
        if(a.dataset.value==data.value) {
            a.remove();
            return true;
        }
    })
});
function adjustGroupByCampaign() {
    if(campaign_tags.value.length == 1) {
        group_by.remove({text: 'Campaign ID', value: 'Campaign ID'});
        Array.from(group_by.dropdown.children).some(function(a){
            if(a.dataset.value=='Campaign ID') {
                a.remove();
                return true;
            }
        })
    } else {
        group_by._createDropdownItem({text: 'Campaign ID', value: 'Campaign ID'});
    }
}
function adjustGroupByAd() {
    if(ad_tags.value.length == 1) {
        group_by.remove({text: 'Ad ID', value: 'Ad ID'});
        Array.from(group_by.dropdown.children).some(function(a){
            if(a.dataset.value=='Ad ID') {
                a.remove();
                return true;
            }
        })
    } else {
        group_by._createDropdownItem({text: 'Ad ID', value: 'Ad ID'});
    }
}
function buildOsSelection() {
    os_tags.removeAll();
    os_tags._emptyDropdown();
    let selected = platform_tags.value;
    if(!selected.length) {
        oses.forEach((item) => {
            os_tags._createDropdownItem({text: item.name, value: item.name});
        })
        buildBrowserSelection();
        return true;
    }
    let p_ids = [];
    platforms.forEach((item) => {
        if(selected.indexOf(item.name) > -1) p_ids.push(item.id)
    })
    let o_ids = [];
    p_ids.forEach((id) => {
        mapPlatformOs.forEach((item) => {
            if(id == item.platform_id) o_ids.push(item.os_id)
        })
    })
    oses.forEach((item) => {
        if(o_ids.indexOf(item.id) > -1) {
            os_tags._createDropdownItem({text: item.name, value: item.name});
        }
    })
    buildBrowserSelection();
}
function buildBrowserSelection() {
    browser_tags.removeAll();
    browser_tags._emptyDropdown();
    let selected = os_tags.value;
    if(!selected.length) {
        Array.from(os_tags.dropdown.children).some(function(a){
            selected.push(a.dataset.value)
        })
    }
    let p_ids = [];
    oses.forEach((item) => {
        if(selected.indexOf(item.name) > -1) p_ids.push(item.id)
    })
    let o_ids = [];
    p_ids.forEach((id) => {
        mapOsBrowser.forEach((item) => {
            if(id == item.os_id) o_ids.push(item.browser_id)
        })
    })
    browsers.forEach((item) => {
        if(o_ids.indexOf(item.id) > -1) {
            browser_tags._createDropdownItem({text: item.name, value: item.name});
        }
    })
}
function showButtons(action, step) {
    if (step == 'step-3') {
        if (action == 'collapse') {
            if (!$('#step-2').is(':hidden')) {
                $('#step-2').find('.buttons').removeClass('hidden');
                $('#step-1').find('.buttons').addClass('hidden');
            } else if(!$('#step-1').is(':hidden')) {
                $('#step-1').find('.buttons').removeClass('hidden');
            }
        } else {
            $('.buttons.is-generate').addClass('hidden');
        }
    } else if(step == 'step-2') {
        if (action == 'collapse') {
            if ($('#step-3').is(':hidden')) {
                $('#step-1').find('.buttons').removeClass('hidden');
            }
        } else {
            if ($('#step-3').is(':hidden')) {
                $('#step-2').find('.buttons').removeClass('hidden');
                $('#step-1').find('.buttons').addClass('hidden');
            }
        }
    } else if(step == 'step-1') {
        if (action == 'collapse') {
            if ($('#step-3').is(':hidden')) {
                $('#step-2').find('.buttons').removeClass('hidden');
            }
        } else {
            if ($('#step-3').is(':hidden') && $('.data-step-2').is(':hidden')) {
                $('#step-1').find('.buttons').removeClass('hidden');
            }
        }
    }
}
function ucwords(str) {
    return (str + '').replace(/^([a-z])|\s+([a-z])/g, function (c) {
        return c.toUpperCase();
    });
}
function fillData() {
    <?php if($this->data->data): ?>
    report_id = <?=$this->data->data->id?>;
    var date_range = '<?=$this->data->data->date_range?>';
    $('#name').val('<?=$this->data->data->name?>');
    $('#date-range').val(date_range);
    $('#day-report').val('<?=$this->data->data->week_day?>');
    $('#date-report').val('<?=$this->data->data->month_date?>');
    $('#day-hour').val('<?=$this->data->data->hour?>');
    
    var frequency = $('#frequency'), weekday = $('#select-weekday'), monthdate = $('#select-monthdate');
    if(date_range == 'yesterday') {
        frequency.html('Daily');
        weekday.hide();
        monthdate.hide();
    } else if(date_range == 'lastweek' || date_range == 'last7days') {
        frequency.html('Weekly');
        weekday.show();
        monthdate.hide();
    } else if(date_range == 'lastmonth' || date_range == 'last30days') {
        frequency.html('Monthly');
        weekday.hide();
        monthdate.show();
    }
    
    var filter = <?=$this->data->data->filter?>;
    if(filter.campaign_id && filter.campaign_id.length) {
        var arr = [];
        for(var i = 0;i<filter.campaign_id.length;i++) {
            arr.push({text: $('#campaign_id option[value="'+filter.campaign_id[i]+'"]').text(), value: filter.campaign_id[i]});
        }
        if(arr.length) campaign_tags.add(arr);
    }
    if(filter.ad_id && filter.ad_id.length) {
        for(var i = 0;i<filter.ad_id.length;i++) {
            Array.from(ad_tags.dropdown.children).some(function(a){
                if(a.dataset.value==filter.ad_id[i]) {
                    ad_tags.add({text: a.dataset.text, value: a.dataset.value});
                    return true;
                }
            });
        }
    }
    if(filter.audience_id && filter.audience_id.length) {
        for(var i = 0;i<filter.audience_id.length;i++) {
            if ($('#audience_id option[value="'+filter.audience_id[i]+'"]').length) {
                audience_tags.add({text: $('#audience_id option[value="'+filter.audience_id[i]+'"]').text(), value: filter.audience_id[i]});
            }
        }
    }
    if(filter.country && filter.country.length) {
        var arr = [];
        for(var i = 0;i<filter.country.length;i++) {
            arr.push({text: $('#country option[value="'+filter.country[i]+'"]').text(), value: filter.country[i]});
        }
        if(arr.length) country_tags.add(arr);
    }
    if(filter.browser && filter.browser.length) {
        var arr = [];
        for(var i = 0;i<filter.browser.length;i++) {
            arr.push({text: $('#browser option[value="'+filter.browser[i]+'"]').text(), value: filter.browser[i]});
        }
        if(arr.length) browser_tags.add(arr);
    }
    if(filter.platform && filter.platform.length) {
        var arr = [];
        for(var i = 0;i<filter.platform.length;i++) {
            arr.push({text: $('#platform option[value="'+filter.platform[i]+'"]').text(), value: filter.platform[i]});
        }
        if(arr.length) platform_tags.add(arr);
    }
    if(filter.os && filter.os.length) {
        for(var i = 0;i<filter.os.length;i++) {
            Array.from(os_tags.dropdown.children).some(function(a){
                if(a.dataset.value==filter.os[i]) {
                    os_tags.add({text: a.dataset.text, value: a.dataset.value});
                    return true;
                }
            });
        }
    }
    if(filter.group_by == "created_at"){
        filter.group_by = "Date";
    } else if(filter.group_by == "campaign_id"){
        filter.group_by = "Campaign ID";
    } else if(filter.group_by == "ad_id"){
        filter.group_by = "Ad ID";
    } else {
        filter.group_by = ucwords(filter.group_by)
    }
    group_by.add({text: filter.group_by, value: filter.group_by});
    if(filter.order_by == "created_at"){
        filter.order_by = "Date";
    } else if(filter.order_by == "campaign_id"){
        filter.order_by = "Campaign ID";
    } else if(filter.order_by == "ad_id"){
        filter.order_by = "Ad ID";
    } else {
        filter.order_by = ucwords(filter.order_by)
    }
    order_by.add({text: filter.order_by, value: filter.order_by});
    <?php endif; ?>
}
$(document).ready(function() {
    $('.collapse').on('click', function() {
        var $this = $(this);
        showButtons($this.attr('data-action'), $this.attr('data-target'));
    });
    $('#date-range').on('change', function(){
        var v = $('#date-range').val(), frequency = $('#frequency'), weekday = $('#select-weekday'), monthdate = $('#select-monthdate');
        if(v == 'yesterday') {
            frequency.html('Daily');
            weekday.hide();
            monthdate.hide();
        } else if(v == 'lastweek' || v == 'last7days') {
            frequency.html('Weekly');
            weekday.show();
            monthdate.hide();
        } else if(v == 'lastmonth' || v == 'last30days') {
            frequency.html('Monthly');
            weekday.hide();
            monthdate.show();
        }
    });
    $('.btn-generate').on('click', function(){
        var $this = $(this), data = {id: report_id};
        data.name = $('#name').val();
        data.date_range = $('#date-range').val();
        data.hour = $('#day-hour').val();
        data.campaign_id = campaign_tags.value;
        data.ad_id = ad_tags.value;
        data.audience_id = audience_tags.value;
        data.country = country_tags.value;
        data.browser = browser_tags.value;
        data.platform = platform_tags.value;
        data.os = os_tags.value;
        data.group_by = Array.isArray(group_by.value) ? group_by.value[0] : group_by.value;
        data.order_by = Array.isArray(order_by.value) ? order_by.value[0] : order_by.value;
        if(data.date_range == 'lastweek' || data.date_range == 'last7days') {
            data.week_day = $('#day-report').val();
            data.month_date = null;
        } else if(data.date_range == 'lastmonth' || data.date_range == 'last30days') {
            data.month_date = $('#date-report').val();
            data.week_day = null;
        }
        
        if(!data.name || data.name.length < 3) {
            __tajs.showAlert('Report Name is required!!!');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/report/schedule', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res){
            if(!res.success) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
                return false;
            } else {
                __tajs.showAlert('Success! now redirecting...', 'success');
                setTimeout(function(){window.location.replace(res.data)},1000);
            }
        });
    });
    $('.btn-delete').on('click', function(){
        var $this = $(this);
        __tajs.showConfirm('Are you sure? This action can not undo', function(yes) {
            if (yes && report_id) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/report/delete/'+report_id, {csrf_token: __tajs.csrf}, function(res) {
                    if (!res.success) {
                        $this.removeClass('is-loading');
                        $this.prop('disabled', false);
                        __tajs.showAlert(res.data);
                    }
                    else {
                        window.location.replace(res.data);
                    }
                });
            }
        });
    });
    fillData();
});
</script>