<style>
.button.is-selected{background-color:#006ed6;border-color:transparent;color:#fff;}
.mode-toggle{
    /*margin-top:0;margin-bottom:-2.1rem!important;margin-right:0.1rem;*/
}
.country-toggle, .platform-toggle, .browser-toggle, .os-toggle, .time-toggle{
    border: none;
    padding: 3px 10px 3px 10px;
}
.dropdown-menu{z-index:4}
.create-ad {
    margin-left:0.1rem;
    margin-right:0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding-top: 1rem;
    padding-bottom: 1rem;
}
.create-ad.is-selected {
    border: 2px solid #006ed6;
    color: #006ed6;
}
.create-ad p {
    font-weight: 500;
}
.button.is-static {
    padding-left: 0.7rem !important;
    padding-right: 0.7rem !important;
}
.include-toggle {
    border-top-left-radius: 13px !important;
    border-bottom-left-radius: 13px !important;
}
.exclude-toggle {
    border-top-right-radius: 13px !important;
    border-bottom-right-radius: 13px !important;
}
table td, .table th {
    border: 1px solid #006ed6 !important;
}
th.tid, th.tid-title {
    padding:0!important;
    background-color: #006ed6;
    color: #fff;
}
th.tid-title {
    background-color: #7d7d7d;
    text-transform: uppercase;
    font-size: 14px;
}
th.tid .tid-hour {
    text-align: center;
    padding-top: .2rem;
    padding-bottom: .3rem;
    cursor: pointer;
}
td.tid-day {
    background-color: #006ed6;
    color: #fff !important;
    font-weight: bold;
    cursor: pointer;
}
.tid-select {
    padding:0!important;
    cursor: pointer;
    min-width: 30px;
}
.tid-select.is-selected, .tid-day.is-selected {
    background-color: #006ed691 !important;
}
.create-ad {
    margin-left:0.1rem;
    margin-right:0.1rem;
    cursor: pointer;
    border-radius: 33px;
    padding-top: 1rem;
    padding-bottom: 1rem;
}
.create-ad.is-selected {
    border: 2px solid #006ed6;
    color: #006ed6;
}



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
<div class="content-body">
    <div class="row">
        <div class="col-12">
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
                    <div class="card h-100 mb-0 flatbox adFormat disabled" data-id="<?=$item->id?>" data-status="<?=$item->status?>" data-creative="<?=$item->creative_required?>" data-extension="<?=$item->extension?>">
                        <div class="card-content data-step" id="ad-format">
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
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
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
                <div class="col-lg-6 col-md-12 col-12 mb-2">
                    <div class="card flatbox is-100height h-100 mb-0">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="form-group">
                                    <label class="label">Ad Name</label>
                                    <input class="input form-control" type="text" id="name" placeholder="Should be unique name">
                                </div>
                                <div class="form-group">
                                    <label class="label" id="url_label">Direct Link</label>
                                    <input class="input form-control" id="url" placeholder="Direct link from Exchange Network">
                                </div>
                                <div class="form-group">
                                    <label class="label">Ad Type</label>
                                    <select id="ad_type" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Assign Ad Types">
                                        <option value="new">Create New Type</option>
                                        <?php foreach($this->data->adType as $ad_type): ?>
                                        <option value="<?=$ad_type->id?>"><?=$ad_type->name?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12 mb-2">
                    <div class="card flatbox is-100height h-100 mb-0">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="form-group">
                                    <label class="label">Average eCPM</label>
                                    <input class="input form-control" id="bidding" type="number" min="0" step="0.001" placeholder="Required, overrided by per country eCPM">
                                </div>
                                <div class="form-group" style="margin-bottom: 25px;">
                                    <label class="label">Module Data</label>
                                    <textarea class="textarea form-control" id="module_data" placeholder="Json Data to use in Module" rows="4"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="page-title-box data-step hidden">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Standard Targeting</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                            <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="standard-targeting">
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
            <div class="row data-step hidden" id="standard-targeting">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="card flatbox">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="form-group">
                                    <div class="buttons has-addons pull-right mode-toggle d-flex">
                                        <button class="button is-small country-toggle include-toggle is-selected">Include</button>
                                        <button class="button is-small country-toggle exclude-toggle">Exclude</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="label">Country</label>
                                    <div class="control">
                                        <select id="country" class="input" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Country">
                                            <?php foreach($this->data->country as $country): ?>
                                            <option value="<?=$country->code?>"><?=$country->name?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <p class="text-warning">Leave empty to accept all countries</p>
                                </div>
                                <div class="form-group">
                                    <label class="label">Country eCPM</label>
                                    <div class="control">
                                        <select id="country_bid" class="input" multiple data-type="tags" autocomplete="off" data-placeholder="Optional, Country eCPM">
                                            <?php foreach($this->data->country as $country): ?>
                                            <option value="<?=$country->code?>"><?=$country->name?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <p class="text-warning">Overide eCPM for selected countries</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="page-title-box data-step hidden">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6">Advanced Targeting</h3>
                    </div>
                    <div class="col-6">
                        <div class="buttons is-right" style="margin-top: -0.5rem; float: right">
                            <button class="btn btn-default btn-transparent collapse" data-action="collapse" data-target="advanced-targeting">
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
            <div class="row data-step hidden" id="advanced-targeting">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="card flatbox">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <div class="form-group">
                                    <div class="buttons has-addons pull-right mode-toggle d-flex">
                                        <button class="button is-small platform-toggle include-toggle is-selected">Include</button>
                                        <button class="button is-small platform-toggle exclude-toggle">Exclude</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="label">Platform</label>
                                    <select id="platform" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Platform">
                                        <?php foreach($this->data->platforms as $item): ?>
                                        <option value="<?=$item->name?>"><?=$item->name?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <p class="text-warning">Leave empty to accept all platforms</p>
                                </div>
                                <div class="form-group mb-3">
                                    <div class="buttons has-addons pull-right mode-toggle d-flex">
                                        <button class="button is-small os-toggle include-toggle is-selected">Include</button>
                                        <button class="button is-small os-toggle exclude-toggle">Exclude</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="label">OperaSystem</label>
                                    <select id="os" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose OS">
                                        <?php foreach($this->data->oses as $item): ?>
                                        <option value="<?=$item->name?>"><?=$item->name?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <p class="text-warning">Leave empty to accept all OSes</p>
                                </div>
                                <div class="form-group mb-3">
                                    <div class="buttons has-addons pull-right mode-toggle d-flex">
                                        <button class="button is-small browser-toggle include-toggle is-selected">Include</button>
                                        <button class="button is-small browser-toggle exclude-toggle">Exclude</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="label">Browser</label>
                                    <select id="browser" class="input form-control" multiple data-type="tags" autocomplete="off" data-placeholder="Choose Browser">
                                        <?php foreach($this->data->browsers as $item): ?>
                                        <option value="<?=$item->name?>"><?=$item->name?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <p class="text-warning">Leave empty to accept all browsers</p>
                                </div>
                                <div class="form-group mb-3">
                                    <div class="buttons has-addons pull-right mode-toggle">
                                        <button class="button is-small time-toggle include-toggle is-selected">Include</button>
                                        <button class="button is-small time-toggle exclude-toggle">Exclude</button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="label">Advanced Time</label>
                                    <div class="table-responsive">
                                        <table class="table table-striped mb-1">
                                            <tbody>
                                                <tr>
                                                    <th class="tid-title"><div class="hidden-touch" style="text-align:center;padding-top:.2rem">Day\Hour</div></th>
                                                    <th class="tid" data-hour="00"><div class="tid-hour">00</div></th>
                                                    <th class="tid" data-hour="01"><div class="tid-hour">01</div></th>
                                                    <th class="tid" data-hour="02"><div class="tid-hour">02</div></th>
                                                    <th class="tid" data-hour="03"><div class="tid-hour">03</div></th>
                                                    <th class="tid" data-hour="04"><div class="tid-hour">04</div></th>
                                                    <th class="tid" data-hour="05"><div class="tid-hour">05</div></th>
                                                    <th class="tid" data-hour="06"><div class="tid-hour">06</div></th>
                                                    <th class="tid" data-hour="07"><div class="tid-hour">07</div></th>
                                                    <th class="tid" data-hour="08"><div class="tid-hour">08</div></th>
                                                    <th class="tid" data-hour="09"><div class="tid-hour">09</div></th>
                                                    <th class="tid" data-hour="10"><div class="tid-hour">10</div></th>
                                                    <th class="tid" data-hour="11"><div class="tid-hour">11</div></th>
                                                    <th class="tid" data-hour="12"><div class="tid-hour">12</div></th>
                                                    <th class="tid" data-hour="13"><div class="tid-hour">13</div></th>
                                                    <th class="tid" data-hour="14"><div class="tid-hour">14</div></th>
                                                    <th class="tid" data-hour="15"><div class="tid-hour">15</div></th>
                                                    <th class="tid" data-hour="16"><div class="tid-hour">16</div></th>
                                                    <th class="tid" data-hour="17"><div class="tid-hour">17</div></th>
                                                    <th class="tid" data-hour="18"><div class="tid-hour">18</div></th>
                                                    <th class="tid" data-hour="19"><div class="tid-hour">19</div></th>
                                                    <th class="tid" data-hour="20"><div class="tid-hour">20</div></th>
                                                    <th class="tid" data-hour="21"><div class="tid-hour">21</div></th>
                                                    <th class="tid" data-hour="22"><div class="tid-hour">22</div></th>
                                                    <th class="tid" data-hour="23"><div class="tid-hour">23</div></th>
                                                </tr>
                                                <tr>
                                                    <td class="tid-day" data-weekday="1">Mon</td>
                                                    <td class="tid tid-select tid-hour-00 tid-day-1" id="100"></td>
                                                    <td class="tid tid-select tid-hour-01 tid-day-1" id="101"></td>
                                                    <td class="tid tid-select tid-hour-02 tid-day-1" id="102"></td>
                                                    <td class="tid tid-select tid-hour-03 tid-day-1" id="103"></td>
                                                    <td class="tid tid-select tid-hour-04 tid-day-1" id="104"></td>
                                                    <td class="tid tid-select tid-hour-05 tid-day-1" id="105"></td>
                                                    <td class="tid tid-select tid-hour-06 tid-day-1" id="106"></td>
                                                    <td class="tid tid-select tid-hour-07 tid-day-1" id="107"></td>
                                                    <td class="tid tid-select tid-hour-08 tid-day-1" id="108"></td>
                                                    <td class="tid tid-select tid-hour-09 tid-day-1" id="109"></td>
                                                    <td class="tid tid-select tid-hour-10 tid-day-1" id="110"></td>
                                                    <td class="tid tid-select tid-hour-11 tid-day-1" id="111"></td>
                                                    <td class="tid tid-select tid-hour-12 tid-day-1" id="112"></td>
                                                    <td class="tid tid-select tid-hour-13 tid-day-1" id="113"></td>
                                                    <td class="tid tid-select tid-hour-14 tid-day-1" id="114"></td>
                                                    <td class="tid tid-select tid-hour-15 tid-day-1" id="115"></td>
                                                    <td class="tid tid-select tid-hour-16 tid-day-1" id="116"></td>
                                                    <td class="tid tid-select tid-hour-17 tid-day-1" id="117"></td>
                                                    <td class="tid tid-select tid-hour-18 tid-day-1" id="118"></td>
                                                    <td class="tid tid-select tid-hour-19 tid-day-1" id="119"></td>
                                                    <td class="tid tid-select tid-hour-20 tid-day-1" id="120"></td>
                                                    <td class="tid tid-select tid-hour-21 tid-day-1" id="121"></td>
                                                    <td class="tid tid-select tid-hour-22 tid-day-1" id="122"></td>
                                                    <td class="tid tid-select tid-hour-23 tid-day-1" id="123"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tid-day" data-weekday="2">Tue</td>
                                                    <td class="tid tid-select tid-hour-00 tid-day-2" id="200"></td>
                                                    <td class="tid tid-select tid-hour-01 tid-day-2" id="201"></td>
                                                    <td class="tid tid-select tid-hour-02 tid-day-2" id="202"></td>
                                                    <td class="tid tid-select tid-hour-03 tid-day-2" id="203"></td>
                                                    <td class="tid tid-select tid-hour-04 tid-day-2" id="204"></td>
                                                    <td class="tid tid-select tid-hour-05 tid-day-2" id="205"></td>
                                                    <td class="tid tid-select tid-hour-06 tid-day-2" id="206"></td>
                                                    <td class="tid tid-select tid-hour-07 tid-day-2" id="207"></td>
                                                    <td class="tid tid-select tid-hour-08 tid-day-2" id="208"></td>
                                                    <td class="tid tid-select tid-hour-09 tid-day-2" id="209"></td>
                                                    <td class="tid tid-select tid-hour-10 tid-day-2" id="210"></td>
                                                    <td class="tid tid-select tid-hour-11 tid-day-2" id="211"></td>
                                                    <td class="tid tid-select tid-hour-12 tid-day-2" id="212"></td>
                                                    <td class="tid tid-select tid-hour-13 tid-day-2" id="213"></td>
                                                    <td class="tid tid-select tid-hour-14 tid-day-2" id="214"></td>
                                                    <td class="tid tid-select tid-hour-15 tid-day-2" id="215"></td>
                                                    <td class="tid tid-select tid-hour-16 tid-day-2" id="216"></td>
                                                    <td class="tid tid-select tid-hour-17 tid-day-2" id="217"></td>
                                                    <td class="tid tid-select tid-hour-18 tid-day-2" id="218"></td>
                                                    <td class="tid tid-select tid-hour-19 tid-day-2" id="219"></td>
                                                    <td class="tid tid-select tid-hour-20 tid-day-2" id="220"></td>
                                                    <td class="tid tid-select tid-hour-21 tid-day-2" id="221"></td>
                                                    <td class="tid tid-select tid-hour-22 tid-day-2" id="222"></td>
                                                    <td class="tid tid-select tid-hour-23 tid-day-2" id="223"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tid-day" data-weekday="3">Wed</td>
                                                    <td class="tid tid-select tid-hour-00 tid-day-3" id="300"></td>
                                                    <td class="tid tid-select tid-hour-01 tid-day-3" id="301"></td>
                                                    <td class="tid tid-select tid-hour-02 tid-day-3" id="302"></td>
                                                    <td class="tid tid-select tid-hour-03 tid-day-3" id="303"></td>
                                                    <td class="tid tid-select tid-hour-04 tid-day-3" id="304"></td>
                                                    <td class="tid tid-select tid-hour-05 tid-day-3" id="305"></td>
                                                    <td class="tid tid-select tid-hour-06 tid-day-3" id="306"></td>
                                                    <td class="tid tid-select tid-hour-07 tid-day-3" id="307"></td>
                                                    <td class="tid tid-select tid-hour-08 tid-day-3" id="308"></td>
                                                    <td class="tid tid-select tid-hour-09 tid-day-3" id="309"></td>
                                                    <td class="tid tid-select tid-hour-10 tid-day-3" id="310"></td>
                                                    <td class="tid tid-select tid-hour-11 tid-day-3" id="311"></td>
                                                    <td class="tid tid-select tid-hour-12 tid-day-3" id="312"></td>
                                                    <td class="tid tid-select tid-hour-13 tid-day-3" id="313"></td>
                                                    <td class="tid tid-select tid-hour-14 tid-day-3" id="314"></td>
                                                    <td class="tid tid-select tid-hour-15 tid-day-3" id="315"></td>
                                                    <td class="tid tid-select tid-hour-16 tid-day-3" id="316"></td>
                                                    <td class="tid tid-select tid-hour-17 tid-day-3" id="317"></td>
                                                    <td class="tid tid-select tid-hour-18 tid-day-3" id="318"></td>
                                                    <td class="tid tid-select tid-hour-19 tid-day-3" id="319"></td>
                                                    <td class="tid tid-select tid-hour-20 tid-day-3" id="320"></td>
                                                    <td class="tid tid-select tid-hour-21 tid-day-3" id="321"></td>
                                                    <td class="tid tid-select tid-hour-22 tid-day-3" id="322"></td>
                                                    <td class="tid tid-select tid-hour-23 tid-day-3" id="323"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tid-day" data-weekday="4">Thu</td>
                                                    <td class="tid tid-select tid-hour-00 tid-day-4" id="400"></td>
                                                    <td class="tid tid-select tid-hour-01 tid-day-4" id="401"></td>
                                                    <td class="tid tid-select tid-hour-02 tid-day-4" id="402"></td>
                                                    <td class="tid tid-select tid-hour-03 tid-day-4" id="403"></td>
                                                    <td class="tid tid-select tid-hour-04 tid-day-4" id="404"></td>
                                                    <td class="tid tid-select tid-hour-05 tid-day-4" id="405"></td>
                                                    <td class="tid tid-select tid-hour-06 tid-day-4" id="406"></td>
                                                    <td class="tid tid-select tid-hour-07 tid-day-4" id="407"></td>
                                                    <td class="tid tid-select tid-hour-08 tid-day-4" id="408"></td>
                                                    <td class="tid tid-select tid-hour-09 tid-day-4" id="409"></td>
                                                    <td class="tid tid-select tid-hour-10 tid-day-4" id="410"></td>
                                                    <td class="tid tid-select tid-hour-11 tid-day-4" id="411"></td>
                                                    <td class="tid tid-select tid-hour-12 tid-day-4" id="412"></td>
                                                    <td class="tid tid-select tid-hour-13 tid-day-4" id="413"></td>
                                                    <td class="tid tid-select tid-hour-14 tid-day-4" id="414"></td>
                                                    <td class="tid tid-select tid-hour-15 tid-day-4" id="415"></td>
                                                    <td class="tid tid-select tid-hour-16 tid-day-4" id="416"></td>
                                                    <td class="tid tid-select tid-hour-17 tid-day-4" id="417"></td>
                                                    <td class="tid tid-select tid-hour-18 tid-day-4" id="418"></td>
                                                    <td class="tid tid-select tid-hour-19 tid-day-4" id="419"></td>
                                                    <td class="tid tid-select tid-hour-20 tid-day-4" id="420"></td>
                                                    <td class="tid tid-select tid-hour-21 tid-day-4" id="421"></td>
                                                    <td class="tid tid-select tid-hour-22 tid-day-4" id="422"></td>
                                                    <td class="tid tid-select tid-hour-23 tid-day-4" id="423"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tid-day" data-weekday="5">Fri</td>
                                                    <td class="tid tid-select tid-hour-00 tid-day-5" id="500"></td>
                                                    <td class="tid tid-select tid-hour-01 tid-day-5" id="501"></td>
                                                    <td class="tid tid-select tid-hour-02 tid-day-5" id="502"></td>
                                                    <td class="tid tid-select tid-hour-03 tid-day-5" id="503"></td>
                                                    <td class="tid tid-select tid-hour-04 tid-day-5" id="504"></td>
                                                    <td class="tid tid-select tid-hour-05 tid-day-5" id="505"></td>
                                                    <td class="tid tid-select tid-hour-06 tid-day-5" id="506"></td>
                                                    <td class="tid tid-select tid-hour-07 tid-day-5" id="507"></td>
                                                    <td class="tid tid-select tid-hour-08 tid-day-5" id="508"></td>
                                                    <td class="tid tid-select tid-hour-09 tid-day-5" id="509"></td>
                                                    <td class="tid tid-select tid-hour-10 tid-day-5" id="510"></td>
                                                    <td class="tid tid-select tid-hour-11 tid-day-5" id="511"></td>
                                                    <td class="tid tid-select tid-hour-12 tid-day-5" id="512"></td>
                                                    <td class="tid tid-select tid-hour-13 tid-day-5" id="513"></td>
                                                    <td class="tid tid-select tid-hour-14 tid-day-5" id="514"></td>
                                                    <td class="tid tid-select tid-hour-15 tid-day-5" id="515"></td>
                                                    <td class="tid tid-select tid-hour-16 tid-day-5" id="516"></td>
                                                    <td class="tid tid-select tid-hour-17 tid-day-5" id="517"></td>
                                                    <td class="tid tid-select tid-hour-18 tid-day-5" id="518"></td>
                                                    <td class="tid tid-select tid-hour-19 tid-day-5" id="519"></td>
                                                    <td class="tid tid-select tid-hour-20 tid-day-5" id="520"></td>
                                                    <td class="tid tid-select tid-hour-21 tid-day-5" id="521"></td>
                                                    <td class="tid tid-select tid-hour-22 tid-day-5" id="522"></td>
                                                    <td class="tid tid-select tid-hour-23 tid-day-5" id="523"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tid-day" data-weekday="6">Sat</td>
                                                    <td class="tid tid-select tid-hour-00 tid-day-6" id="600"></td>
                                                    <td class="tid tid-select tid-hour-01 tid-day-6" id="601"></td>
                                                    <td class="tid tid-select tid-hour-02 tid-day-6" id="602"></td>
                                                    <td class="tid tid-select tid-hour-03 tid-day-6" id="603"></td>
                                                    <td class="tid tid-select tid-hour-04 tid-day-6" id="604"></td>
                                                    <td class="tid tid-select tid-hour-05 tid-day-6" id="605"></td>
                                                    <td class="tid tid-select tid-hour-06 tid-day-6" id="606"></td>
                                                    <td class="tid tid-select tid-hour-07 tid-day-6" id="607"></td>
                                                    <td class="tid tid-select tid-hour-08 tid-day-6" id="608"></td>
                                                    <td class="tid tid-select tid-hour-09 tid-day-6" id="609"></td>
                                                    <td class="tid tid-select tid-hour-10 tid-day-6" id="610"></td>
                                                    <td class="tid tid-select tid-hour-11 tid-day-6" id="611"></td>
                                                    <td class="tid tid-select tid-hour-12 tid-day-6" id="612"></td>
                                                    <td class="tid tid-select tid-hour-13 tid-day-6" id="613"></td>
                                                    <td class="tid tid-select tid-hour-14 tid-day-6" id="614"></td>
                                                    <td class="tid tid-select tid-hour-15 tid-day-6" id="615"></td>
                                                    <td class="tid tid-select tid-hour-16 tid-day-6" id="616"></td>
                                                    <td class="tid tid-select tid-hour-17 tid-day-6" id="617"></td>
                                                    <td class="tid tid-select tid-hour-18 tid-day-6" id="618"></td>
                                                    <td class="tid tid-select tid-hour-19 tid-day-6" id="619"></td>
                                                    <td class="tid tid-select tid-hour-20 tid-day-6" id="620"></td>
                                                    <td class="tid tid-select tid-hour-21 tid-day-6" id="621"></td>
                                                    <td class="tid tid-select tid-hour-22 tid-day-6" id="622"></td>
                                                    <td class="tid tid-select tid-hour-23 tid-day-6" id="623"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tid-day" data-weekday="0">Sun</td>
                                                    <td class="tid tid-select tid-hour-00 tid-day-0" id="000"></td>
                                                    <td class="tid tid-select tid-hour-01 tid-day-0" id="001"></td>
                                                    <td class="tid tid-select tid-hour-02 tid-day-0" id="002"></td>
                                                    <td class="tid tid-select tid-hour-03 tid-day-0" id="003"></td>
                                                    <td class="tid tid-select tid-hour-04 tid-day-0" id="004"></td>
                                                    <td class="tid tid-select tid-hour-05 tid-day-0" id="005"></td>
                                                    <td class="tid tid-select tid-hour-06 tid-day-0" id="006"></td>
                                                    <td class="tid tid-select tid-hour-07 tid-day-0" id="007"></td>
                                                    <td class="tid tid-select tid-hour-08 tid-day-0" id="008"></td>
                                                    <td class="tid tid-select tid-hour-09 tid-day-0" id="009"></td>
                                                    <td class="tid tid-select tid-hour-10 tid-day-0" id="010"></td>
                                                    <td class="tid tid-select tid-hour-11 tid-day-0" id="011"></td>
                                                    <td class="tid tid-select tid-hour-12 tid-day-0" id="012"></td>
                                                    <td class="tid tid-select tid-hour-13 tid-day-0" id="013"></td>
                                                    <td class="tid tid-select tid-hour-14 tid-day-0" id="014"></td>
                                                    <td class="tid tid-select tid-hour-15 tid-day-0" id="015"></td>
                                                    <td class="tid tid-select tid-hour-16 tid-day-0" id="016"></td>
                                                    <td class="tid tid-select tid-hour-17 tid-day-0" id="017"></td>
                                                    <td class="tid tid-select tid-hour-18 tid-day-0" id="018"></td>
                                                    <td class="tid tid-select tid-hour-19 tid-day-0" id="019"></td>
                                                    <td class="tid tid-select tid-hour-20 tid-day-0" id="020"></td>
                                                    <td class="tid tid-select tid-hour-21 tid-day-0" id="021"></td>
                                                    <td class="tid tid-select tid-hour-22 tid-day-0" id="022"></td>
                                                    <td class="tid tid-select tid-hour-23 tid-day-0" id="023"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <p class="text-warning">Leave empty to accept all hours and days</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="page-title-box data-step hidden">
                <div class="row is-mobile">
                    <div class="col-6">
                        <h3 class="title is-6"><?php if(isset($this->data->id)): ?>Update Ad<?php else: ?>Create Ad<?php endif; ?></h3>
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
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="card flatbox">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <?php if(!isset($this->data->id)): ?>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="flatbox create-ad" data-type="Inactive" style="box-shadow: 0 0 16px 3px rgba(128,128,128,0.13);">
                                                <p class="text-info" style="padding-left: 40px; padding-right: 40px; margin-bottom: 0;">
                                                    <span class="icon">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M19.03 7.39L20.45 5.97C20 5.46 19.55 5 19.04 4.56L17.62 6C16.07 4.74 14.12 4 12 4C7.03 4 3 8.03 3 13S7.03 22 12 22C17 22 21 17.97 21 13C21 10.88 20.26 8.93 19.03 7.39M13 14H11V7H13V14M15 1H9V3H15V1Z"></path>
                                                        </svg>
                                                    </span>
                                                    Inactive, can activate later
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="flatbox create-ad is-selected" data-type="Active" style="box-shadow: 0 0 16px 3px rgba(128,128,128,0.13);">
                                                <p class="text-success" style="padding-left: 40px; padding-right: 40px; margin-bottom: 0;">
                                                    <span class="icon">
                                                        <svg viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M13.13 22.19L11.5 18.36C13.07 17.78 14.54 17 15.9 16.09L13.13 22.19M5.64 12.5L1.81 10.87L7.91 8.1C7 9.46 6.22 10.93 5.64 12.5M21.61 2.39C21.61 2.39 16.66 .269 11 5.93C8.81 8.12 7.5 10.53 6.65 12.64C6.37 13.39 6.56 14.21 7.11 14.77L9.24 16.89C9.79 17.45 10.61 17.63 11.36 17.35C13.5 16.53 15.88 15.19 18.07 13C23.73 7.34 21.61 2.39 21.61 2.39M14.54 9.46C13.76 8.68 13.76 7.41 14.54 6.63S16.59 5.85 17.37 6.63C18.14 7.41 18.15 8.68 17.37 9.46C16.59 10.24 15.32 10.24 14.54 9.46M8.88 16.53L7.47 15.12L8.88 16.53M6.24 22L9.88 18.36C9.54 18.27 9.21 18.12 8.91 17.91L4.83 22H6.24M2 22H3.41L8.18 17.24L6.76 15.83L2 20.59V22M2 19.17L6.09 15.09C5.88 14.79 5.73 14.47 5.64 14.12L2 17.76V19.17Z"></path>
                                                        </svg>
                                                    </span>
                                                    Active, available for ad serving immediately
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                <?php endif; ?>
                                <div class="buttons text-center" style="margin-top:2rem;">
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
    </div>
</div>

<div class="modal fade text-left" id="countryBidModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Country eCPM</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>You are bidding for <strong class="goal_type"></strong> for traffic from <strong id="your_bid_countrycode"></strong> - <strong id="your_bid_country"></strong></p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">$</span>
                        </div>
                        <input id="your_bid" class="input form-control" type="number" min="0" step="0.0001" placeholder="Your bidding" value="" aria-describedby="basic-addon1">
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="your_bid_submit">Submit</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="createAdTypeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Ad Type</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="collect-type" value="none" />
                    <div class="form-group">
                        <label class="label">Ad Type Name</label>
                        <input id="ad-type-name" class="input form-control" type="text" placeholder="Unique Type Name" value="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="create-ad-type">Create and Pick</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">Close</button>
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
    var country_bid = {};
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
        browser_tags = document.getElementById('browser').BulmaTagsInput(),
        country_tags = document.getElementById('country').BulmaTagsInput(),
        bidding_tags = document.getElementById('country_bid').BulmaTagsInput();
    adtype_tags = document.getElementById('ad_type').BulmaTagsInput();
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
    country_tags.on('after.add', function(data) {
        buildBiddingFromCountry();
    });
    country_tags.on('after.remove', function(data) {
        buildBiddingFromCountry();
    });
    bidding_tags.on('before.add', function(data) {
        if(data.value.indexOf(':') == -1) {
            $('#your_bid_country').html(data.text);
            $('#your_bid_countrycode').html(data.value);
            $('#your_bid').val(_parseFloat($('#bidding').val()));
            $('#countryBidModal').modal('show');
            setTimeout(function(){$('#your_bid').focus()},100);
            return false;
        }
        var bid = data.value.split(':');
        data.value = bid[0];
        bid = bid[1];
        if(country_bid[data.value]) return false;
        country_bid[data.value] = bid;
        Array.from(bidding_tags.dropdown.children).some(function(a){
            if(a.dataset.value==data.value) {
                a.remove();
                return true;
            }
        });
        return data;
    });
    bidding_tags.on('after.remove', function(data) {
        let text = $("#country option[value='"+data.value+"']").text();
        bidding_tags._createDropdownItem({text: text, value: data.value});
        delete country_bid[data.value];
    });
    adtype_tags.on('before.add', function(data) {
        if(data.value == "new") {
            $('#ad_type').val('');
            $('#createAdTypeModal').modal('show');
            setTimeout(function(){$('#ad_type').focus()},100);
            return false;
        }
        return data;
    });
    adtype_tags.flush();
    function buildBiddingFromCountry() {
        bidding_tags.removeAll();
        bidding_tags._emptyDropdown();
        country_bid = [];
        var cv = country_tags.value;
        if(!cv.length) {
            $("#country option").each(function(){
                var $this = $(this);
                bidding_tags._createDropdownItem({text: $this.text(), value: $this.val()});
            });
            return true;
        }
        var isInclude = $('.country-toggle.is-selected').hasClass('include-toggle');
        $("#country option").each(function(){
            var $this = $(this), text = $this.text(), val = $this.val();
            if(isInclude) {
                if(cv.indexOf(val) != -1) {
                    bidding_tags._createDropdownItem({text: text, value: val});
                }
            } else {
                if(cv.indexOf($this.val()) == -1) {
                    bidding_tags._createDropdownItem({text: text, value: val});
                }
            }
        });
    }
    function buildOsSelection() {
        os_tags.removeAll();
        os_tags._emptyDropdown();
        let selected = platform_tags.value;
        let isInclude = $('.platform-toggle.is-selected').hasClass('include-toggle');
        if(!selected.length) {
            oses.forEach((item) => {
                os_tags._createDropdownItem({text: item.name, value: item.name});
            })
            buildBrowserSelection();
            return true;
        }
        let p_ids = [];
        platforms.forEach((item) => {
            if(isInclude) {
                if(selected.indexOf(item.name) > -1) p_ids.push(item.id)
            } else {
                if(selected.indexOf(item.name) == -1) p_ids.push(item.id)
            }
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
        let isInclude = $('.os-toggle.is-selected').hasClass('include-toggle');
        let available = []
        Array.from(os_tags.dropdown.children).some(function(a){
            available.push(a.dataset.value)
        })
        let p_names = [];
        available.forEach((name) => {
            if(!selected.length) {
                p_names.push(name)
            } else {
                if(isInclude) {
                    if(selected.indexOf(name) > -1) p_names.push(name)
                } else {
                    if(selected.indexOf(name) == -1) p_names.push(name)
                }
            }
        })
        let p_ids = [];
        oses.forEach((item) => {
            if(p_names.indexOf(item.name) > -1) p_ids.push(item.id)
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
    function _parseFloat(e) {
        let number = parseFloat(e);
        if(number<0){
            number = -number;
        }
        return number || 0;
    }
    function _parseInt(e) {
        let number = parseInt(e,10);
        if(number<0){
            number = -number;
        }
        return number || 0;
    }
    function fillData() {
        <?php if(isset($this->data->id)): ?>
        var data = <?=$this->data->data?>;
        var adTypeData = <?=json_encode($this->data->adTypeData)?>;
        var moduleData = '<?=$this->data->module_data?>';
        $('.adFormat').removeClass('is-selected').addClass('is-disabled');
        $('.adFormat[data-id="<?=$this->data->ad_format?>"]').removeClass('is-disabled').addClass('is-selected').click();
        var url = '<?=$this->data->url?>';
        $('#name').val('<?=$this->data->name?>');
        $('#module_data').val(moduleData);
        $('#url').val('<?=$this->data->url?>');
        $('#bidding').val('<?=$this->data->bidding?>');
        var selected, arr;
        if(adTypeData.length) {
            arr = [];
            for(var i = 0;i<adTypeData.length;i++) {
                arr.push({text: $('#ad_type option[value="'+adTypeData[i]['type_id']+'"]').text(), value: adTypeData[i]['type_id']});
            }
            if(arr.length) adtype_tags.add(arr);
        }
        $('.country-toggle').removeClass('is-selected');
        if(data.country_include !== undefined) {
            $('.country-toggle.include-toggle').addClass('is-selected');
            selected = data.country_include;
        } else {
            $('.country-toggle.exclude-toggle').addClass('is-selected');
            selected = data.country_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: $('#country option[value="'+selected[i]+'"]').text(), value: selected[i]});
            }
            if(arr.length) country_tags.add(arr);
        }
        if(!$.isEmptyObject(data.country_bidding)) {
            arr = [];
            for(var i in data.country_bidding) {
                var b = data.country_bidding[i];
                arr.push({text: $('#country option[value="'+i+'"]').text()+': $'+b, value: i+':'+b});
            }
            if(arr.length) bidding_tags.add(arr);
        }
        $('.platform-toggle').removeClass('is-selected');
        if(data.platform_include !== undefined) {
            $('.platform-toggle.include-toggle').addClass('is-selected');
            selected = data.platform_include;
        } else {
            $('.platform-toggle.exclude-toggle').addClass('is-selected');
            selected = data.platform_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: $('#platform option[value="'+selected[i]+'"]').text(), value: selected[i]});
            }
            if(arr.length) platform_tags.add(arr);
        }
        $('.os-toggle').removeClass('is-selected');
        if(data.os_include !== undefined) {
            $('.os-toggle.include-toggle').addClass('is-selected');
            selected = data.os_include;
        } else {
            $('.os-toggle.exclude-toggle').addClass('is-selected');
            selected = data.os_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: selected[i], value: selected[i]});
            }
            if(arr.length) os_tags.add(arr);
        }
        $('.browser-toggle').removeClass('is-selected');
        if(data.browser_include !== undefined) {
            $('.browser-toggle.include-toggle').addClass('is-selected');
            selected = data.browser_include;
        } else {
            $('.browser-toggle.exclude-toggle').addClass('is-selected');
            selected = data.browser_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                arr.push({text: $('#browser option[value="'+selected[i]+'"]').text(), value: selected[i]});
            }
            if(arr.length) browser_tags.add(arr);
        }
        $('.time-toggle').removeClass('is-selected');
        if(data.time_include !== undefined) {
            $('.time-toggle.include-toggle').addClass('is-selected');
            selected = data.time_include;
        } else {
            $('.time-toggle.exclude-toggle').addClass('is-selected');
            selected = data.time_exclude || [];
        }
        if(selected.length) {
            arr = [];
            for(var i = 0;i<selected.length;i++) {
                $('.tid-select[id="'+selected[i]+'"]').addClass('is-selected');
            }
        }
        <?php endif; ?>
    }
    $(document).ready(function() {
        buildBiddingFromCountry();
        $('.adFormat[data-status="Active"]').removeClass('is-disabled');
        $('.adFormat').on('click', function() {
            var $this = $(this), collapse = $('.collapse[data-target="ad-format"]');
            if($this.hasClass('is-disabled')) return false;
            $('.adFormat').removeClass('is-selected');
            $this.addClass('is-selected');
            var creative = parseInt($this.attr('data-creative'),10), extension = $this.attr('data-extension').toUpperCase();
            if (!creative) {
                $('#url_label').html('Direct Link');
                $('#url').attr('placeholder', 'Direct link from Exchange Network');
            } else {
                $('#url_label').html(extension+' Tag');
                $('#url').attr('placeholder', extension+' tag url from Exchange Network');
            }
            $('#ad-format').fadeOut(800);
            collapse.attr('data-action', 'expand');
            collapse.find('.icon').toggleClass('spin90');
            $('.data-step').removeClass('hidden');
        });
        $('.bidding').on('click', function() {
            $('.bidding').toggleClass('is-selected');
        });
        $('#your_bid_submit').on('click', function() {
            var b = _parseFloat($('#your_bid').val()), c = $('#your_bid_countrycode').text(), d = $('#your_bid_country').text();
            if(!b) {
                $('#countryBidModal').toggleClass('is-active');
                return false;
            }
            bidding_tags.add({text: d+': $'+b, value: c+':'+b});
            $('#countryBidModal').toggleClass('is-active');
        });
        $('.country-toggle').on('click', function() {
            $('.country-toggle').toggleClass('is-selected');
            buildBiddingFromCountry();
        });
        $('.platform-toggle').on('click', function() {
            $('.platform-toggle').toggleClass('is-selected');
            buildOsSelection();
        });
        $('.os-toggle').on('click', function() {
            $('.os-toggle').toggleClass('is-selected');
            buildBrowserSelection();
        });
        $('.browser-toggle').on('click', function() {
            $('.browser-toggle').toggleClass('is-selected');
        });
        $('.time-toggle').on('click', function() {
            $('.time-toggle').toggleClass('is-selected');
        });
        $('.tid-select').on('click', function() {
            $(this).toggleClass('is-selected');
        });
        $('.tid-hour').on('click', function() {
            var $this = $(this), h = $.trim($this.text());
            $this.toggleClass('is-selected');
            if($this.hasClass('is-selected')) {
                $('.tid-hour-'+h).addClass('is-selected');
            } else {
                $('.tid-hour-'+h).removeClass('is-selected');
            }
        });
        $('.tid-day').on('click', function() {
            var $this = $(this), d = $this.attr('data-weekday');
            $this.toggleClass('is-selected');
            if($this.hasClass('is-selected')) {
                $('.tid-day-'+d).addClass('is-selected');
            } else {
                $('.tid-day-'+d).removeClass('is-selected');
            }
        });
        $('.create-ad').on('click', function() {
            var $this = $(this);
            $('.create-ad').removeClass('is-selected');
            $this.addClass('is-selected');
        });
        $('#create-ad-type').on('click', function() {
            var $this = $(this), name = $.trim($('#ad-type-name').val());
            if(!name || name.length < 3) {
                __tajs.showAlert('ad type name is required');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/advertiser/ad-type', {csrf_token: __tajs.csrf, name: name}, function(res) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                if (!res.success) {
                    __tajs.showAlert(res.data);
                    return false;
                }
                var aitem = {text: name, value: res.data};
                adtype_tags._createDropdownItem(aitem);
                adtype_tags.add(aitem);
                $('#createAdTypeModal').modal('show');
            });
        });
        $('#process').on('click', function() {
            var $this = $(this), data = {<?php if(isset($this->data->id)): ?>id: <?=$this->data->id?><?php endif; ?>};
            data.ad_format = $('.adFormat.is-selected').attr('data-id');
            data.name = $.trim($('#name').val());
            if(!data.name || data.name.length < 3) {
                __tajs.showAlert('Ad Name is required and minimum 3 characters');
                return false;
            }
            data.url = $.trim($('#url').val());
            if(!data.url || data.url.indexOf('https://') != 0) {
                __tajs.showAlert('URL is required, please use valid https url');
                return false;
            }
            data.module_data = $.trim($('#module_data').val());
            if(!data.module_data) {
                __tajs.showAlert('Module Data is required');
                return false;
            }
            data.bidding = _parseFloat($('#bidding').val());
            if(!data.bidding) {
                __tajs.showAlert('Average eCPM is required');
                return false;
            }
            data.ad_type = adtype_tags.value;
            data.country_bidding = country_bid;

            if($('.country-toggle.is-selected').hasClass('include-toggle')) {
                data.country_include = country_tags.value;
            } else {
                data.country_exclude = country_tags.value;
            }
            if($('.browser-toggle.is-selected').hasClass('include-toggle')) {
                data.browser_include = browser_tags.value;
            } else {
                data.browser_exclude = browser_tags.value;
            }
            if($('.os-toggle.is-selected').hasClass('include-toggle')) {
                data.platform_include = platform_tags.value;
                data.os_include = os_tags.value;
            } else {
                data.platform_exclude = platform_tags.value;
                data.os_exclude = os_tags.value;
            }
            if($('.time-toggle.is-selected').hasClass('include-toggle')) {
                data.time_include = $('.tid-select.is-selected').map(function(){return this.id}).get();
            } else {
                data.time_exclude = $('.tid-select.is-selected').map(function(){return this.id}).get();
            }
            <?php if(!isset($this->data->id)): ?>
            data.status = $('.create-ad.is-selected').attr('data-type');
            <?php endif; ?>

            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post(window.location.href, {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res){
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