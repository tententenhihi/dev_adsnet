<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <?php if($this->data->user): ?>
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Showing only referrals from user #<?=$this->data->user->id?> - <?=$this->data->user->name?> (<?=$this->data->user->email?>)<br>
                    </div>
                </div>
            </div>
            <?php endif; ?>

            <div class="card">
                <div class="card-header d-flex">
                    <div class="d-flex">
                        <h4 class="card-title">User Referrals </h4>
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
                               href="/user/referral/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="ID, Name, Email" aria-label="filter"
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

                        <div class="row" id="results">
                            <div class="col-12">
                                <div class="flatbox">
                                    <?php if($this->data->data): ?>
                                    <div class="table-responsive">
                                        <table class="table table-striped mb-1">
                                            <thead>
                                            <tr>
                                                <th><span>Name</span></th>
                                                <th>Email Address</th>
                                                <th>Signed Up</th>
                                                <th>Description</th>
                                                <th>Status</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach($this->data->data as $item): ?>
                                            <tr>
                                                <td>
                                                    <a id="creative-url" href="/user/profile?user_id=<?=$item->user_id?>">
                                                        <span><?=$item->user_name?></span>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a data-id="<?=$item->user_id?>" data-name="<?=$item->user_name?>">
                                                        <span><?=$item->email?></span>
                                                    </a>
                                                </td>
                                                <td><?=$item->created_at?></td>
                                                <td><?=$item->description?:'Not Available'?></td>
                                                <td><?php if($item->status == 'Pending'): ?><span class="badge badge-warning">Pending</span>
                                                    <?php elseif($item->status == 'Cancelled'): ?><span class="badge badge-danger">Cancelled</span>
                                                    <?php else: ?><span class="badge badge-success">Earning</span>
                                                    <?php endif; ?>
                                                </td>
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
                                                <p>No Records</p>
                                            </div>
                                        </div>
                                    </div>
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
<script>
/* global $, __tajs */
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        if(isNaN(val)) {
            window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
        } else {
            window.location.href = window.location.pathname+'?user_id='+val;
        }
    });
});
</script>