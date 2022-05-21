<style>
    .lib-thumb {
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
        height: 70px;
    }

    #uploader-selector, #uploader-process {
        background-color: #fff;
    }

    #uploader-selector.dropactive {
        background-color: #f5f5f5;
    }

    .open-selector {
        color: #006ed6 !important;
        margin-top: 1.5rem;
    }

    .open-selector svg {
        height: 144px;
    }

    #progress-name {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    #progress-status {
        margin-top: -1.3rem;
    }

    .progress-detail:not(:last-child) {
        margin-right: 1rem;
    }

    .creativename {
        cursor: pointer;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only results from user #<?=$this->data->user->id?> - <?=$this->data->user->name?>
                            (<?=$this->data->user->email?>)<br>

                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Creative</h4>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->type?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->types as $type): ?>
                            <a class="dropdown-item"
                               href="/advertiser/creative/<?=strtolower($type)?><?=$this->arg?>"><?=$type?></a>
                            <?php endforeach; ?>
                        </div>
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
                                                       placeholder="Creative Name" aria-label="filter"
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
                                    <th>Thumb</th>
                                    <th>Name</th>
                                    <th>User</th>
                                    <th>Type</th>
                                    <th>Size</th>
                                    <th>Actions</th>
                                    <th><span class="is-pulled-right">Created</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr data-id="<?=$item->id?>">
                                    <td>
                                        <a href="<?=$item->url?>" target="_blank">
                                            <div class="lib-thumb"
                                                 style="background-image: url('<?=$item->thumb?>');"></div>
                                        </a>
                                    </td>
                                    <td><a class="name creativename"><?=$item->name?></a></td>
                                    <td><a href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->
                                            user_name?></a></td>
                                    <td><a><?=ucwords($item->type)?></a></td>
                                    <td><a><?=ucwords($item->size)?></a></td>
                                    <td>
                                        <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger waves-effect waves-light btn-delete" data-id="<?=$item->id?>">
                                            <i class="feather icon-trash"></i>
                                        </button>
                                        <a type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-success waves-effect waves-light"
                                           id="creative-url" href="<?=$item->url?>" target="_blank">
                                            <i class="feather icon-eye"></i>
                                        </a>
                                    </td>
                                    <td><span class=" is-pulled-right"><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="has-text-centered">
                                    <p>No Creatives!</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        </br>

                        <?=$this->data->pagination?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="creativeName">
    <div class="modal-background"></div>
    <div class="modal-card">
        <section class="modal-card-body">
            <div class="field">
                <label class="label">Creative Name</label>
                <div class="control has-icons-left">
                    <input class="input" id="name" placeholder="creative name">
                    <span class="icon is-left">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor"
                                  d="M5.5,7A1.5,1.5 0 0,1 4,5.5A1.5,1.5 0 0,1 5.5,4A1.5,1.5 0 0,1 7,5.5A1.5,1.5 0 0,1 5.5,7M21.41,11.58L12.41,2.58C12.05,2.22 11.55,2 11,2H4C2.89,2 2,2.89 2,4V11C2,11.55 2.22,12.05 2.59,12.41L11.58,21.41C11.95,21.77 12.45,22 13,22C13.55,22 14.05,21.77 14.41,21.41L21.41,14.41C21.78,14.05 22,13.55 22,13C22,12.44 21.77,11.94 21.41,11.58Z"/>
                        </svg>
                    </span>
                </div>
            </div>
            <div class="buttons is-centered pt-1">
                <button class="button is-success enterAction" id="name_submit" data-id="0">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z"/>
                        </svg>
                    </span>
                    <span>Save</span>
                </button>
                <button class="button is-light btn-close">
                    <span class="icon">
                        <svg viewBox="0 0 24 24">
                            <path fill="currentColor"
                                  d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"/>
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
    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('.creativename').click(function () {
            var $this = $(this).closest('tr');
            $('#name').val($this.find('.name').text());
            $('#name_submit').attr('data-id', $this.attr('data-id'));
            $('#creativeName').toggleClass('is-active');
        });
        $('#name_submit').click(function () {
            var $this = $(this), name = $.trim($('#name').val()) || null, id = $this.attr('data-id');
            if (!name || name.length < 3) {
                __tajs.showAlert('Name is required at least 3 characters');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/advertiser/creative/rename/' + id, {csrf_token: __tajs.csrf, name: name}, function (res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.reload();
                }
            });
        });
        $('.btn-delete').click(function () {
            var $this = $(this), id = $this.attr('data-id');
            __tajs.showConfirm('Are you sure to delete this Creative ?', function (yes) {
                if (yes) {
                    $this.addClass('is-loading');
                    $this.prop('disabled', true);
                    $.post('/advertiser/creative/delete/' + id, {csrf_token: __tajs.csrf}, function (res) {
                        if (!res.success) {
                            $this.removeClass('is-loading');
                            $this.prop('disabled', false);
                            __tajs.showAlert(res.data);
                        } else {
                            window.location.replace(res.data);
                        }
                    });
                }
            });
        });
    });
</script>