<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only Domains from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Anti-Adblock Domains</h4>
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
                               href="/publisher/domain/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                    <th>User</th>
                                    <th>Default</th>
                                    <th>Actions</th>
                                    <th><span>Created</span></th>
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
                                    <td><a href="https://<?=$item->name?>" target="_blank"><?=$item->name?></a></td>
                                    <td><a href="/user?id=<?=$item->user_id?>">#<?=$item->user_id?> - <?=$item->user_name?></a></td>
                                    <td>
                                        <?php if(!$item->is_default): ?>
                                        <span class="badge badge-warning">No</span>
                                        <?php else: ?>
                                        <span class="badge badge-success">Yes</span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <div class="buttons">
                                            <button class="btn btn-danger btn-delete mb-1" data-id="<?=$item->id?>">
                                                <i class="feather icon-trash-2"></i>
                                                <span>Delete</span>
                                            </button>
                                            <?php if($item->status=='Pending'): ?>
                                            <button class="btn btn-success btn-verify mb-1" data-id="<?=$item->id?>">
                                                <i class="feather icon-check-circle"></i>
                                                <span>Verify</span>
                                            </button>
                                            <?php endif; ?>
                                        </div>
                                    </td>
                                    <td><span class=" is-pulled-right"><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
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

                        <?=$this->data->pagination?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $, __tajs */
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('.btn-delete').click(function() {
        var $this = $(this), id = $this.attr('data-id');
        __tajs.showConfirm('Are you sure? If you are using this domain for any ad tags, they will be broken', function(yes) {
            if (yes) {
                $this.addClass('is-loading');
                $this.prop('disabled', true);
                $.post('/publisher/domain/cancel/'+id, {csrf_token: __tajs.csrf}, function(res) {
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
    $('.btn-verify').click(function() {
        var $this = $(this), id = $this.attr('data-id');
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/publisher/domain/verify/'+id, {csrf_token: __tajs.csrf, id: id}, function(res) {
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