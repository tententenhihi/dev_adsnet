<style>
.loading, .loading:after {
    /*border-radius: 50%;width: 10em;height: 10em;*/
}
.loading {
    /*margin:20px auto;font-size: 10px;position: relative;text-indent: -9999em;border-top:1.1em solid rgba(174, 109, 173, 0.1);border-right:1.1em solid rgba(174, 109, 173, 0.1);border-bottom:1.1em solid rgba(174, 109, 173, 0.1);border-left:1.1em solid #ae6dad;transform:translateZ(0);animation:a 1.1s infinite linear;*/
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
.collapse:not(.show) {
    display: inline;
}
.table th{
    font-size: 16px;
}
</style>
<section class="wrapper">
    <div class="content-body">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-12">
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
                                            <label class="label">Date Range</label>
                                            <input class="form-control" type="text" id="date-range">
                                            <p class="help text-warning">Advanced filter is not available before <?=$this->data->min_date?></p>
                                        </div>
                                        <div class="form-group">
                                            <label class="label">Networks</label>
                                            <select id="network_id" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose network">
                                                <?php foreach($this->data->networks as $network): ?>
                                                <option value="<?=$network->id?>"><?=$network->name?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <p class="help text-warning">Leave empty to not filter by networks</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="label">Ad</label>
                                            <select id="ad_id" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Ad"></select>
                                            <p class="help text-warning">Leave empty to not filter by Ads</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="label">Country</label>

                                            <select id="country" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Country">
                                                <?php foreach($this->data->countries as $country): ?>
                                                <option value="<?=$country->code?>"><?=$country->name?></option>
                                                <?php endforeach; ?>
                                            </select>

                                            <p class="help text-warning">Leave empty to not filter by countries</p>
                                        </div>
                                        <div class="buttons text-center is-generate" style="margin-top:2rem;">
                                            <button class="btn btn-success btn-generate">
                                                <i class="feather icon-bar-chart-2"></i>
                                                <span>Generate Report</span>
                                            </button>
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
                                <button class="btn btn-default btn-transparent collapse" data-action="expand" data-target="step-2">
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
                    <div class="card-content data-step" id="step-2" style="display: none;">
                        <div class="card-body card-dashboard">
                            <div class="row">
                                <div class="col-12">
                                    <div class="flatbox">
                                        <div class="form-group">
                                            <label class="label">Platform</label>
                                            <select id="platform" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Platform">
                                                <?php foreach($this->data->platforms as $item): ?>
                                                <option value="<?=$item->name?>"><?=$item->name?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <p class="help text-warning">Leave empty to not filter by platforms</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="label">Operating System</label>
                                            <select id="os" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose OS">
                                                <?php foreach($this->data->oses as $item): ?>
                                                <option value="<?=$item->name?>"><?=$item->name?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <p class="help text-warning">Leave empty to not filter by OSes</p>
                                        </div>
                                        <div class="form-group">
                                            <label class="label">Browser</label>
                                            <select id="browser" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Browser">
                                                <?php foreach($this->data->browsers as $item): ?>
                                                <option value="<?=$item->name?>"><?=$item->name?></option>
                                                <?php endforeach; ?>
                                            </select>
                                            <p class="help text-warning">Leave empty to not filter by browsers</p>
                                        </div>
                                        <div class="buttons text-center is-generate hidden" style="margin-top:2rem;">
                                            <button class="btn btn-success btn-generate">
                                                <i class="feather icon-bar-chart-2"></i>
                                                <span>Generate Report</span>
                                            </button>
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
                                <button class="btn btn-default btn-transparent collapse" data-action="expand" data-target="step-3">
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
                                            <label class="label">Group By</label>

                                            <select id="group_by" class="input form-control" data-type="tags" data-placeholder="Group By">
                                                <?php foreach($this->data->group_by as $item): ?>
                                                <option value="<?=$item?>"><?=$item?></option>
                                                <?php endforeach; ?>
                                            </select>

                                            <p class="help text-warning">Leave empty to group by Date</p>

                                        </div>
                                        <div class="form-group">
                                            <label class="label">Order By</label>

                                            <select id="order_by" class="input form-control" data-type="tags" data-placeholder="Order By">
                                                <?php foreach($this->data->order_by as $item): ?>
                                                <option value="<?=$item?>"><?=$item?></option>
                                                <?php endforeach; ?>
                                            </select>

                                            <p class="help text-warning">Leave empty to order by Date</p>

                                        </div>
                                        <div class="buttons text-center" style="margin-top:2rem;">
                                            <button class="btn btn-success btn-generate">
                                                <i class="feather icon-bar-chart-2"></i>
                                                <span>Generate Report</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="page-title-box result-required" style="display: none;">
                    <div class="row is-mobile">
                        <div class="col-6">
                            <h3 class="title is-6">Result</h3>
                        </div>
                        <div class="col-6">
                            <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                                <button class="btn btn-default btn-transparent collapse" data-action="expand" data-target="step-result">
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
                    <div class="card-content data-step" id="step-result" style="display: none;">
                        <div class="card-body card-dashboard">
                            <div class="row">
                                <div class="col-12">
                                    <div class="flatbox">
                                        <div id="result"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade text-left" id="needMoreTime" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Result</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="text-center title h5">Your report is being generated</p>
                    <p class="text-center subtitle is-6" style="margin-top:1.3rem">It took more time than we expected, but leave this page does not break the report generation,
                        so you can revisit this report url later. In case leaving, we will send you an email with report url when it ready</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn-close enterAction">Got It</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?=$this->asset('js/litepicker.js')?>"></script>
<script src="<?=$this->asset('js/tagsinput.min.js')?>"></script>
<script>
/* global $, Litepicker, __tajs , BulmaTagsInput */
var picker = new Litepicker({
    element: document.getElementById('date-range'),
    singleMode: false,
    selectForward: true,
    format: 'YYYY-MM-DD',
    delimiter: ' => ',
    maxDate: '<?=$this->data->max_date?>',
    minDays: 1,
    maxDays: 90,
    numberOfMonths: 2,
    numberOfColumns: 2,
    startDate: '<?=$this->data->max_date?>',
    endDate: '<?=$this->data->max_date?>'
});
var platforms = <?=json_encode($this->data->platforms)?>;
var oses = <?=json_encode($this->data->oses)?>;
var browsers = <?=json_encode($this->data->browsers)?>;
var mapPlatformOs = <?=json_encode($this->data->mapPlatformOs)?>;
var mapOsBrowser = <?=json_encode($this->data->mapOsBrowser)?>;
var networks = <?=json_encode($this->data->ads)?>;
var waiting = 0, stopped = 0;
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
    network_tags = document.getElementById('network_id').BulmaTagsInput(),
    ad_tags = document.getElementById('ad_id').BulmaTagsInput(),
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
network_tags.on('after.add', function(data) {
    if(networks[data.item.value]) {
        for(var i=0;i<networks[data.item.value].length;i++) {
            ad_tags._createDropdownItem(networks[data.item.value][i]);
        }
    }
    adjustGroupByNetwork()
});
network_tags.on('after.remove', function(data) {
    if(networks[data.value]) {
        ad_tags.remove(networks[data.value]);
        for(var i=0;i<networks[data.value].length;i++) {
            Array.from(ad_tags.dropdown.children).some(function(a){
                if(a.dataset.value==networks[data.value][i].value) {
                    a.remove();
                    return true;
                }
            })
        }
    }
    adjustGroupByNetwork()
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
function adjustGroupByNetwork() {
    if(network_tags.value.length == 1) {
        group_by.remove({text: 'Network ID', value: 'Network ID'});
        Array.from(group_by.dropdown.children).some(function(a){
            if(a.dataset.value=='Network ID') {
                a.remove();
                return true;
            }
        })
    } else {
        group_by._createDropdownItem({text: 'Network ID', value: 'Network ID'});
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
            if ($('#step-3').is(':hidden') && $('#step-2').is(':hidden')) {
                $('#step-1').find('.buttons').removeClass('hidden');
            }
        }
    }
}
function formatDate(d) {
    var month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
function isHotDataRange(startDate) {
    const minHotDataDate = new Date('<?=$this->data->min_date?>');
    startDate = new Date(startDate)
    
    if(minHotDataDate <= startDate) return true;
    return false;
}
function fillData() {
    var query_string = window.location.search.substring(1);
    if(!query_string) return false;
    query_string = decodeURIComponent(query_string).split('&');
    var param, params = {};
    for(var i=0;i<query_string.length;i++) {
        if(query_string[i].indexOf('=') > -1) {
            param = query_string[i].split('=');
            if(param[0] == 'start_date' && param[1].length == 10) {
                params.start_date = param[1];
            } else if(param[0] == 'end_date' && param[1].length == 10) {
                params.end_date = param[1];
            } else if(param[0] == 'network_id' && param[1].length) {
                params.network_id = param[1].split(',');
            } else if(param[0] == 'ad_id' && param[1].length) {
                params.ad_id = param[1].split(',');
            } else if(param[0] == 'country' && param[1].length) {
                params.country = param[1].split(',');
            } else if(param[0] == 'browser' && param[1].length) {
                params.browser = param[1].split(',');
            } else if(param[0] == 'platform' && param[1].length) {
                params.platform = param[1].split(',');
            } else if(param[0] == 'os' && param[1].length) {
                params.os = param[1].split(',');
            } else if(param[0] == 'group_by' && param[1].length) {
                params.group_by = param[1];
            } else if(param[0] == 'order_by' && param[1].length) {
                params.order_by = param[1];
            }
        }
    }
    if(!params.start_date || !params.end_date) return false;

    picker.setDateRange(params.start_date, params.end_date);
    if(params.country && params.country.length) {
        for(var i = 0;i<params.country.length;i++) {
            if ($('#country option[value="'+params.country[i]+'"]').length) {
                country_tags.add({text: $('#country option[value="'+params.country[i]+'"]').text(), value: params.country[i]});
            }
        }
    }
    if(params.network_id && params.network_id.length) {
        for(var i = 0;i<params.network_id.length;i++) {
            if ($('#network_id option[value="'+params.network_id[i]+'"]').length) {
                network_tags.add({text: $('#network_id option[value="'+params.network_id[i]+'"]').text(), value: params.network_id[i]});
            }
        }
    }
    if(params.ad_id && params.ad_id.length) {
        for(var i = 0;i<params.ad_id.length;i++) {
            Array.from(ad_tags.dropdown.children).some(function(a){
                if(a.dataset.value==params.ad_id[i]) {
                    ad_tags.add({text: a.dataset.text, value: a.dataset.value});
                    return true;
                }
            });
        }
    }
    
    if(isHotDataRange(params.start_date)) {
        $('#hotDataRange').hide();
        if(params.browser && params.browser.length) {
            for(var i = 0;i<params.browser.length;i++) {
                if ($('#browser option[value="'+params.browser[i]+'"]').length) {
                    browser_tags.add({text: $('#browser option[value="'+params.browser[i]+'"]').text(), value: params.browser[i]});
                }
            }
        }
        if(params.platform && params.platform.length) {
            for(var i = 0;i<params.platform.length;i++) {
                if ($('#platform option[value="'+params.platform[i]+'"]').length) {
                    platform_tags.add({text: $('#platform option[value="'+params.platform[i]+'"]').text(), value: params.platform[i]});
                }
            }
        }
        if(params.os && params.os.length) {
            for(var i = 0;i<params.os.length;i++) {
                Array.from(os_tags.dropdown.children).some(function(a){
                    if(a.dataset.value==params.os[i]) {
                        os_tags.add({text: a.dataset.text, value: a.dataset.value});
                        return true;
                    }
                });
            }
        }
    } else {
        $('#hotDataRange').show();
        group_by.remove({text: 'Browser', value: 'Browser'});
        group_by.remove({text: 'Platform', value: 'Platform'});
        group_by.remove({text: 'OS', value: 'OS'});
        Array.from(group_by.dropdown.children).some(function(a){
            if(a.dataset.value=='Browser') a.remove();
            if(a.dataset.value=='Platform') a.remove();
            if(a.dataset.value=='OS') a.remove();
        });
    }
        
    if(params.group_by && Array.from(group_by.dropdown.children).some(function(a){if(a.dataset.value==params.group_by) return true})) {
        group_by.add({text: params.group_by, value: params.group_by});
    }
    if(params.order_by && Array.from(order_by.dropdown.children).some(function(a){if(a.dataset.value==params.order_by) return true})) {
        order_by.add({text: params.order_by, value: params.order_by});
    }
    
    $('.collapse').attr('data-action', 'expand');
    $('.collapse').find('.icon').addClass('spin90');
    $('[data-target="step-result"]').attr('data-action', 'collapse');
    $('[data-target="step-result"]').find('.icon').removeClass('spin90');
    $('.data-step').hide();
    $('.result-required').show();
    $('#step-result').show();
    $('#result').html('<div class="loading"></div><p class="text-center">Generating report, please wait....</p>');
    $('body,html').animate({scrollTop: $('#step-result').offset().top - 200}, 1000);
    getResult();
    countSecond();
}
function getResult() {
    $.post(window.location.href, {csrf_token: __tajs .csrf}, function(res){
        if(!res.success) {
            $('#result').html('<p class="text-danger text-center">Please try again</p>');
            __tajs .showAlert(res.data);
            return false;
        }
        if(res.data == 'Processing') {
            setTimeout(getResult,2000);
            if (waiting > <?=$this->max_waiting?>*1000) {
                stopped = 1;
                waiting = 0;
                $('#needMoreTime').addClass('is-active');
            }
        } else {
            stopped = 1;
            $('#needMoreTime').removeClass('is-active');
            generateResult(res.data);
        }
    });
}
function countSecond() {
    if (stopped) return false;
    waiting = waiting + 1000;
    setTimeout(countSecond, 1000);
}
function formatNumber(num) {
  return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
}
function generateResult(obj) {
    var groupBy = group_by.value;
    var html = '<div class="table-container">';
    html += '<table class="table is-striped is-fullwidth" style="min-height: 250px;">';
    html += '<thead><tr>';
    html += '<th><span class="is-pulled-left">'+groupBy+'</span></th>';
    html += '<th><span class="icon"><i class="feather icon-eye"></i></span></th>';
    html += '<th><span class="icon"><i class="fa fa-mouse-pointer"></i></span></th>';
    html += '<th>CTR</th>';
    html += '<th><span class="icon"><i class="feather icon-users"></i></span></th>';
    html += '<th><span class="icon"><i class="feather icon-shopping-cart"></i></span></th>';
    html += '<th>CR</th>';
    html += '<th>Revenue</th>';
    html += '<th>eCPM</th>';
    html += '</tr></thead>';
    html += '<tbody>';
    let rows = 0, sum_impression = 0, sum_click = 0, sum_conversion = 0, sum_reach = 0, sum_revenue = 0;
    let sum = '', data = '';
    for(var i in obj) {
        rows++;
        const impression = parseInt(obj[i].impression, 10)
        const click = parseInt(obj[i].click, 10)
        const conversion = parseInt(obj[i].conversion, 10)
        const reach = parseInt(obj[i].reach, 10)
        const revenue = parseFloat(obj[i].revenue)
        
        sum_impression = sum_impression + impression
        sum_click = sum_click + click
        sum_conversion = sum_conversion + conversion
        sum_reach = sum_reach + reach
        sum_revenue = sum_revenue + revenue
        
        data += '<tr><td><span class="is-pulled-left">'+i+'</span></td>';
        data += '<td>'+formatNumber(impression)+'</td>';
        data += '<td>'+formatNumber(click)+'</td>';
        data += '<td>'+(impression ? Math.round(click*1000/impression)/10 : '0.00')+'%</td>';
        data += '<td>'+formatNumber(reach)+'</td>';
        data += '<td>'+formatNumber(conversion)+'</td>';
        data += '<td>'+(impression ? Math.round(conversion*1000/impression)/10 : '0.00')+'%</td>';
        data += '<td>$'+formatNumber(revenue ? Math.round(revenue*1000)/1000 : '0.00')+'</td>';
        data += '<td>$'+(impression ? Math.round(revenue*1000000/impression)/1000 : '0.00')+'</td>';
        data += '</tr>';
    }
    if(rows > 1) {
        sum += '<tr><td><span class="is-pulled-left"><strong>Sum</strong></span></td>';
        sum += '<td><strong>'+formatNumber(sum_impression)+'</strong></td>';
        sum += '<td><strong>'+formatNumber(sum_click)+'</strong></td>';
        sum += '<td>'+(sum_impression ? Math.round(sum_click*1000/sum_impression)/10 : '0.00')+'%</td>';
        sum += '<td><strong>'+formatNumber(sum_reach)+'</strong></td>';
        sum += '<td><strong>'+formatNumber(sum_conversion)+'</strong></td>';
        sum += '<td>'+(sum_impression ? Math.round(sum_conversion*1000/sum_impression)/10 : '0.00')+'%</td>';
        sum += '<td><strong>$'+formatNumber(sum_revenue ? Math.round(sum_revenue*1000)/1000 : '0.00')+'</strong></td>';
        sum += '<td><strong>$'+(sum_impression ? Math.round(sum_revenue*1000000/sum_impression)/1000 : '0.00')+'</strong></td>';
        sum += '</tr>';
    }
    html += sum;
    html += data;
    html += '<tbody>';
    html += '</table></div>';
    
    $('#result').html(html);
}
$(document).ready(function() {
    fillData();
    $('.collapse').on('click', function() {
        var $this = $(this);
        showButtons($this.attr('data-action'), $this.attr('data-target'));
    });
    $('.btn-generate').on('click', function(){
        var $this = $(this), url = window.location.pathname+'?';
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        url = url + 'start_date='+formatDate(picker.getStartDate())+'&';
        url = url + 'end_date='+formatDate(picker.getEndDate())+'&';
        url = url + 'network_id='+network_tags.value.join(',')+'&';
        url = url + 'ad_id='+ad_tags.value.join(',')+'&';
        url = url + 'country='+country_tags.value.join(',')+'&';
        url = url + 'browser='+browser_tags.value.join(',')+'&';
        url = url + 'platform='+platform_tags.value.join(',')+'&';
        url = url + 'os='+os_tags.value.join(',')+'&';
        url = url + 'group_by='+group_by.value+'&';
        url = url + 'order_by='+order_by.value;
        window.location.replace(url);
    });
});
</script>