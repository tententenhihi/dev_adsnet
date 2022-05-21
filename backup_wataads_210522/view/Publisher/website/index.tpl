<style>
    .item-name {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        display: block;
        max-width: 28ch;
    }

    .buttons.is-gapless .button {
        margin-right: 0 !important;
    }
    .table-responsive .badge{
        width: 70px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Websites</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="add-website" tabindex="0">
                            <span><i class="feather icon-plus"></i> Add Website</span></button>
                    </div>
                    <div class="dropdown chart-dropdown">
                        Filter by:
                        <button class="btn border-0 dropdown-toggle px-50" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?=$this->data->status?>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                             x-placement="bottom-end"
                             style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                            <?php foreach($this->data->statuses as $status): ?>
                            <a class="dropdown-item"
                               href="/website/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Website Domain" aria-label="filter"
                                                       value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary"
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
                                    <th>Domain Name</th>
                                    <th>Zone</th>
                                    <th>Summary</th>
                                    <th>Action</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <?php if($item->status=='Pending'): ?>
                                        <span class="badge badge-warning mb-1">Pending</span>
                                        <?php elseif($item->status=='Rejected'): ?>
                                        <span class="badge badge-danger mb-1">Rejected</span>
                                        <?php else: ?>
                                        <span class="badge badge-success mb-1">Active</span>
                                        <?php endif; ?>
                                    </td>
                                    <td><a class="item-name mb-1" href="/website/detail/<?=$item->id?>"><?=$item->
                                            domain?></a></td>
                                    <td>
                                        <div>
                                            <a class="btn btn-success btn-light btn-sm mb-1"
                                               href="/zone/active?website_id=<?=$item->id?>"><?=$item->active_zone?>
                                                Active</a>
                                            <a class="btn btn-info btn-light btn-sm mb-1"
                                               href="/zone/all?website_id=<?=$item->id?>"><?=$item->total_zone?>
                                                Total</a>
                                        </div>
                                    </td>
                                    <td>
                                        <?php if($item->status=='Active'): ?>
                                        <a
                                           href="/report?start_date=<?=$this->data->weekAgo?>&end_date=<?=$this->data->today?>&website_id=<?=$item->id?>&zone_id=&country=&browser=&platform=&os=&group_by=Date&order_by=Date">
                                            <button type="button" class="btn btn-success mb-1">
                                                <i class="fa fa-money"></i>
                                                <span><?=$this->helper->currencyFormat($item->revenue)?></span>
                                            </button>
                                            <button type="button" class="btn btn-info mb-1">
                                                <i class="feather icon-eye"></i>
                                                <span><?=$this->helper->numberFormat($item->impression)?></span>
                                            </button>
                                            <button type="button" class="btn btn-danger mb-1">
                                                <i class="feather icon-briefcase"></i>
                                                <span><?=$item->impression?$this->helper->currencyFormat($item->revenue*1000/$item->impression):'$0.00'?></span>
                                            </button>
                                        </a>
                                        <?php else: ?>
                                        <div class="mb-1">No data available</div>
                                        <?php endif; ?>
                                    <td>
                                        <div>
                                            <button type="button" class="btn btn-info mb-1 btn-edit"
                                                    data-id="<?=$item->id?>"
                                                    data-domain="<?=$item->domain?>"
                                                    data-desc="<?=htmlentities($item->description)?>"
                                                    data-cat="<?=$item->category_id?>">
                                                <i class="feather icon-edit"></i>
                                                <span>Edit</span>
                                            </button>

                                            <?php if($item->status=='Pending' && !$item->is_verified): ?>
                                            <a type="button" class="btn btn-success mb-1" href="/website/verify/<?=$item->id?>">
                                                <i class="feather icon-check"></i>
                                                <span>Verify</span>
                                            </a>
                                            <?php endif; ?>
                                            <?php if($item->status=='Active'): ?>
                                            <a type="button" class="btn btn-success mb-1" href="/zone/create?website_id=<?=$item->id?>">
                                                <i class="feather icon-plus"></i>
                                                <span>Add Zone</span>
                                            </a>
                                            
                                            <?php endif; ?>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="mb-1">
                                            <?=$item->created_at?>
                                        </div>
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

<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <input id="id" type="hidden" value="0">
                <div class="modal-body">

                    <label>Website Domain: </label>
                    <div class="form-group">
                        <input class="form-control" id="domain" type="text" placeholder="www.abc.com">
                    </div>


                    <label>Description</label>
                    <div class="form-group">
                        <textarea class="form-control" id="description" placeholder="Website Description"></textarea>
                    </div>


                    <label>Category</label>
                    <div class="form-group">
                        <select id="category_id" class="form-control">
                            <?php foreach($this->data->categories as $item): ?>
                            <option value="<?=$item->id?>"><?=ucwords($item->name)?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="save">
                        <i class="feather icon-check"></i> Save
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close
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
        $('.btn-edit').on('click', function () {
            var $this = $(this),
                id = $this.attr('data-id'),
                domain = $this.attr('data-domain'),
                description = $this.attr('data-desc'),
                category_id = $this.attr('data-cat');
            $('#id').val(id);
            $('#domain').val(domain);
            $('#description').val(description);
            $('#category_id').val(category_id);
            $('#domain').prop('disabled', true);
            $('#editModal').modal('show');
        });
        $('#save').click(function () {
            var $this = $(this), data = {};
            data.id = parseInt($('#id').val(), 10);
            data.domain = 'https://' + $.trim($('#domain').val()).replace('http://', '').replace('https://', '');
            data.description = $.trim($('#description').val());
            data.category_id = $('#category_id').val();
            if (data.domain.length < 11) {
                __tajs.showAlert('Website Name and Domain are required');
                return false;
            }
            if (!data.description || data.description.length < 5) {
                __tajs.showAlert('Description is required and minimum 5 characters');
                return false;
            }
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/website', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function (res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.reload();
                }
            });
        });
        $('#add-website').click(function () {
            $('#id').val('0');
            $('#domain').val('');
            $('#description').val('');
            $('#domain').prop('disabled', false);
            $('#editModal').modal('show');
        });
    });
</script>