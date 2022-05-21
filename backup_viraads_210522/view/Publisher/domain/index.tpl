<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="alert alert-success">
                <p>Ad monetization relies on ads being shown and tracked.
                    Ad blockers prevent ad and tracking from loading - meaning you’d make no ad revenue for
                    that user’s session</p>
                <p>The best and easiest way to fight with adblockers: use the domain that does not appear on
                    their list - your own ones.
                    So you just have to monitor ads on your websites. If they get blocked, change ad tag to
                    new domain to make it works fine again!</p>
                <p>Our solution relies on Cloudflare DNS, so you should prepare new domain that dedicated
                    for ad serving, not possible to use it somehow else,
                    and of course you have to be able to manage domain (change Nameservers)</p>
            </div>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <button class="btn btn-icon btn-outline-primary btn-header" id="add-domain" tabindex="0">
                            <span><i class="feather icon-plus"></i> Add domain</span></button>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                            <a class="dropdown-item"
                               href="/domain/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Domain Name" aria-label="filter"
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
                                    <th>Status</th>
                                    <th>Name</th>
                                    <th>Default</th>
                                    <th>Actions</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <?php if($item->status=='Pending'): ?>
                                        <span class="badge badge-warning">Pending</span>
                                        <?php else: ?>
                                        <span class="badge badge-success">Active</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><a class="text-muted" href="https://<?=$item->name?>"
                                           target="_blank"><?=$item->
                                            name?></a></td>
                                    <td>
                                        <?php if(!$item->is_default): ?>
                                        <span class="badge badge-warning">No</span>
                                        <?php else: ?>
                                        <span class="badge badge-success">Yes</span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <div>
                                            <button class="btn btn-danger btn-delete btn-sm mb-1" data-id="<?=$item->id?>">
                                                <span class="icon">
                                                    <svg viewBox="0 0 24 24">
                                                         <path fill="currentColor"
                                                               d="M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z"/>
                                                    </svg>
                                                </span>
                                                <span>Delete</span>
                                            </button>
                                            <?php if($item->status=='Pending'): ?>
                                            <a class="btn btn-success btn-sm mb-1" href="/domain/verify/<?=$item->id?>">
                                                <span class="icon">
                                                    <svg viewBox="0 0 24 24">
                                                        <path fill="currentColor"
                                                              d="M19 18H6C3.79 18 2 16.21 2 14S3.79 10 6 10H6.71C7.37 7.69 9.5 6 12 6C15.04 6 17.5 8.46 17.5 11.5V12H19C20.66 12 22 13.34 22 15S20.66 18 19 18M19.35 10.03C18.67 6.59 15.64 4 12 4C9.11 4 6.6 5.64 5.35 8.03C2.34 8.36 0 10.9 0 14C0 17.31 2.69 20 6 20H19C21.76 20 24 17.76 24 15C24 12.36 21.95 10.22 19.35 10.03M10 17L6.5 13.5L7.91 12.08L10 14.17L14.59 9.59L16 11"/>
                                                    </svg>
                                                </span>
                                                <span>Verify</span>
                                            </a>
                                            <?php elseif(!$item->is_default): ?>
                                            <button class="btn btn-success btn-default btn-sm mb-1" data-id="<?=$item->id?>">
                                                <span class="icon">
                                                    <svg viewBox="0 0 24 24">
                                                         <path fill="currentColor"
                                                               d="M5.5,7A1.5,1.5 0 0,1 4,5.5A1.5,1.5 0 0,1 5.5,4A1.5,1.5 0 0,1 7,5.5A1.5,1.5 0 0,1 5.5,7M21.41,11.58L12.41,2.58C12.05,2.22 11.55,2 11,2H4C2.89,2 2,2.89 2,4V11C2,11.55 2.22,12.05 2.59,12.41L11.58,21.41C11.95,21.77 12.45,22 13,22C13.55,22 14.05,21.77 14.41,21.41L21.41,14.41C21.78,14.05 22,13.55 22,13C22,12.44 21.77,11.94 21.41,11.58Z"/>
                                                    </svg>
                                                </span>
                                                <span>Make Default</span>
                                            </button>
                                            <?php endif; ?>
                                        </div>
                                    </td>
                                    <td><span class="text-muted is-pulled-right"><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                            <?=$this->data->pagination?>
                        </div>
                        <?php else: ?>
                        <div class="hero mt-2">
                            <div class="hero-body">
                                <div class="text-center">
                                    <p>You do not have any anti-adblock domains!</p>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        </br>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="addDomainModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Add Domain</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">

                    <label>Domain Name: </label>
                    <div class="form-group">
                        <input class="form-control" id="name" type="text" placeholder="mydomain.com">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect waves-light" id="add_domain">Save</button>
                    <button type="button" class="btn btn-secondary waves-effect waves-light" data-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $, __tajs */
    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length < 2) return false;
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
        $('#add_domain').click(function () {
            var $this = $(this), name = $.trim($('#name').val());
            if (!name || name.length < 4) {
                __tajs.showAlert('Domain Name is required');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/domain', {csrf_token: __tajs.csrf, name: name}, function (res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.replace(res.data);
                }
            });
        });
        $('#add-domain').click(function () {
            $('#addDomainModal').modal('show');
        });
        $('.btn-delete').click(function () {
            var $this = $(this), id = $this.attr('data-id');
            __tajs.showConfirm('Are you sure? If you are using this domain for any ad tags, they will be broken', function (yes) {
                if (yes) {
                    $this.addClass('is-loading');
                    $this.prop('disabled', true);
                    $.post('/domain/cancel/' + id, {csrf_token: __tajs.csrf}, function (res) {
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
        $('.btn-default').click(function () {
            var $this = $(this), id = $this.attr('data-id');
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/domain/default/' + id, {csrf_token: __tajs.csrf}, function (res) {
                if (!res.success) {
                    $this.removeClass('is-loading');
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.replace(res.data);
                }
            });
        });
    });
</script>