<style>
    .svg {
        width: 220px;
        height: 176px;
        position: relative;
        margin-top: .5rem;
        margin-bottom: .5rem;
        justify-content: center;
    }

    .tag:not(body).is-rounded {
        border-radius: 290486px;
    }
    .tag:not(body).is-success {
        background-color: #48c774;
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
        /*font-size: 0;*/
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
    .delete::before {
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
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Ad Formats</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="add_dimension" tabindex="0">
                            <span><i class="feather icon-plus"></i> Add Format</span></button>
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
                                                       placeholder="Search" aria-label="filter"
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
                                    <th style="width:200px">Preview</th>
                                    <th>Ad</th>
                                    <th>Publisher Description</th>
                                    <th>Advertiser Description</th>
                                    <th>Creative</th>
                                    <th>Status</th>
                                    <th><span class="is-pulled-right">Action</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr data-item="<?=htmlspecialchars(json_encode($item))?>">
                                    <td>
                                        <div class="svg">
                                            <?=$item->svg?>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="min-width:100px">
                                            <h4 class="title is-6 name"><?=$item->name?></h4>
                                            <h4 class="subtitle is-6 pricing_model"><?=$item->
                                                pricing_model?></h4>
                                            <span class="badge badge-info extension"><?=$item->extension?></span>
                                        </div>
                                    </td>
                                    <td>
                                        <?php foreach(explode(PHP_EOL,$item->description) as $desc): ?>
                                        <div>
                                            <span class="icon text-info">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor"
                                                          d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z"/>
                                                </svg>
                                            </span>
                                            <span class=" description"><?=$desc?></span>
                                        </div>
                                        <?php endforeach; ?>
                                    </td>
                                    <td>
                                        <?php foreach(explode(PHP_EOL,$item->adv_description) as $desc): ?>
                                        <div>
                                            <span class="icon text-info">
                                                <svg viewBox="0 0 24 24">
                                                    <path fill="currentColor"
                                                          d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z"/>
                                                </svg>
                                            </span>
                                            <span class=" adv_description"><?=$desc?></span>
                                        </div>
                                        <?php endforeach; ?>
                                    </td>
                                    <td>
                                        <?php if($item->creative_required): ?>
                                        <span class="badge badge-danger creative_required">Required</span>
                                        <?php else: ?>
                                        <span class="badge badge-default creative_required">None</span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php if($item->status == 'Active'): ?>
                                        <span class="badge badge-success status">Active</span>
                                        <?php else: ?>
                                        <span class="badge badge-warning status">Inactive</span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light btn-edit">
                                            <i class="feather icon-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn-delete">
                                            <i class="feather icon-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="has-text-centered">
                                    <p class="title is-6">No ad formats found</p>
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

<div class="modal fade show" id="modalDimension" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-modal="true" style="padding-right: 17px; display: none;">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalScrollableTitle">Ad Format</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="id" value="">
                <div class="form-group">
                    <label class="label">Name</label>
                    <input class="form-control" type="text" id="name" value="" placeholder="Format Name">
                </div>

                <div class="form-group">
                    <label class="label">Pricing Model</label>
                    <select id="pricing_model" class="form-control input" multiple data-type="tags" autocomplete="off"
                            data-placeholder="Choose Pricing Model">
                        <?php foreach($this->pricingModel as $item): ?>
                        <option value="<?=$item?>"><?=$item?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group">
                    <label class="label">Publisher Description</label>
                    <textarea class="form-control" id="description" placeholder="Description shown for Publisher"
                              rows="2"></textarea>
                </div>
                <div class="form-group">
                    <label class="label">Advertiser Description</label>
                    <textarea class="form-control" id="adv_description" placeholder="Description shown for Advertiser"
                              rows="2"></textarea>
                </div>
                <div class="form-group">
                    <label class="label">HTML5 SVG Preview</label>
                    <textarea class="form-control" id="svg" placeholder="Ad Preview Code"></textarea>
                </div>
                <div class="form-group">
                    <label class="label">Tag Guide</label>
                    <textarea class="form-control" id="tag_guide" placeholder="Tag Guide"></textarea>
                </div>
                <div class="form-group">
                    <label class="label">Tag Script</label>
                    <textarea class="form-control" id="tag_script" placeholder="Tag Script"></textarea>
                </div>
                <div class="form-group">
                    <label class="label">Template Extension</label>

                    <select id="extension" class="form-control">
                        <?php foreach($this->templateExtension as $name => $title): ?>
                        <option value="<?=$name?>"><?=$title?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group">
                    <label class="label">Creative Required?</label>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" checked="" name="customCheck" id="creative_required">
                        <label class="custom-control-label" for="creative_required">Yes, Ad Creative is always required</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label">Enable?</label>
                    <select id="status" class="form-control">
                        <option value="Active">Yes, enable this Ad Format</option>
                        <option value="Inactive">No, disable it</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary waves-effect waves-light" id="submit_dimension">Submit</button>
                <button type="button" class="btn btn-secondary waves-effect waves-light btn-close" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="<?=$this->asset('js/tagsinput.min.js')?>"></script>
<script>
    /* global $, __tajs, BulmaTagsInput */
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
    var pricing_tags = document.getElementById('pricing_model').BulmaTagsInput();
    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('#add_dimension').on('click', function () {
            $('#id').val('');
            $('#name').val('');
            $('#description').val('');
            $('#adv_description').val('');
            $('#tag_guide').val('');
            $('#tag_script').val('');
            $('#svg').val('');
            $('#pricing_model').val();
            $('#creative_required').prop('checked', false);
            pricing_tags.flush();
            $('#modalDimension').modal('show');
        });
        $('.btn-edit').on('click', function () {
            var $item = $(this).closest('tr'), data = JSON.parse($item.attr('data-item'));
            $('#id').val(data.id);
            $('#name').val(data.name);
            $('#description').val(data.description); //.map(function(k,e){return $.trim($(e).text())}).get().join("\n")
            $('#adv_description').val(data.adv_description);
            $('#svg').val(data.svg);
            $('#tag_guide').val(data.tag_guide);
            $('#tag_script').val(data.tag_script);
            $('#creative_required').prop('checked', data.creative_required == 1 ? true : false);
            $('#status').val(data.status);
            $('#extension').val(data.extension);
            var arr = data.pricing_model.split(',');
            pricing_tags.flush();
            for (var i = 0; i < arr.length; i++) {
                pricing_tags.add({text: arr[i], value: arr[i]});
            }
            $('#modalDimension').modal('show');
        });
        $('.btn-delete').on('click', function () {
            var $this = $(this), $item = $this.closest('tr'), data = $item.attr('data-item');
            __tajs.showConfirm('Are you sure to delete ' + data.name + ' ?', function (yes) {
                if (yes) {
                    $this.addClass('is-loading');
                    $this.prop('disabled', true);
                    $.post('/system/adformat/remove', {csrf_token: __tajs.csrf, data: data}, function (res) {
                        if (!res.success) {
                            $this.removeClass('is-loading');
                            $this.prop('disabled', false);
                            __tajs.showAlert(res.data);
                        } else {
                            $item.remove();
                        }
                    });
                }
            });
        });
        $('#submit_dimension').click(function () {
            var $this = $(this), data = {};
            data.id = $('#id').val() || null;
            data.name = $.trim($('#name').val()) || null;
            data.pricing_model = pricing_tags.value || null;
            data.description = $.trim($('#description').val()) || null;
            data.adv_description = $.trim($('#adv_description').val()) || null;
            data.svg = $.trim($('#svg').val()) || null;
            data.tag_guide = $.trim($('#tag_guide').val()) || null;
            data.tag_script = $.trim($('#tag_script').val()) || null;
            data.creative_required = $('#creative_required').is(':checked') ? 1 : 0;
            data.extension = $('#extension').val();
            data.status = $('#status').val();
            if (!data.name.length || !data.pricing_model.length || !data.description.length || !data.adv_description.length || !data.svg.length || !data.tag_guide.length || !data.tag_script.length) {
                __tajs.showAlert('Missing required fields!!!');
                return false;
            }
            var url = '/system/adformat/add';
            if (data.id) url = '/system/adformat/update';
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post(url, {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.reload();
                }
            });
        });
    });
</script>