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
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Category</h4>
                        <button class="btn btn-icon btn-outline-primary btn-header" id="add-category" tabindex="0">
                            <span><i class="feather icon-plus"></i> Add Category</span></button>
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
                                                       placeholder="Category Name" aria-label="filter"
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
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Action</th>
                                    <th><span class="is-pulled-right">Created</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td><a class="item-name"><?=$item->name?></a></td>
                                    <td><a class="item-name"><?=$item->description?></a></td>
                                    <td>
                                        <div class="buttons">
                                            <button class="btn btn-info btn-edit" data-id="<?=$item->id?>" data-name="<?=$item->name?>" data-desc="<?=htmlentities($item->description)?>">
                                                <i class="feather icon-check"></i>
                                                <span>Edit</span>
                                            </button>
                                        </div>
                                    </td>
                                    <td><span><?=$item->created_at?></span></td>
                                </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php else: ?>
                        <div class="hero">
                            <div class="hero-body">
                                <div class="has-text-centered">
                                    <p class="text-muted">You do not have any category!</p>
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
<div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <input id="id" type="hidden" value="0">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Category Name</label>
                        <input class="input form-control" id="name" type="text" placeholder="Category Name">
                    </div>

                    <div class="form-group">
                        <label class="label">Description</label>
                        <textarea class="textarea form-control" id="description" placeholder="Category Description"></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-primary" id="save">
                        <i class="feather icon-check"></i> Save</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="feather icon-x"></i> Close</button>
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
    $('.btn-edit').on('click', function() {
        var $this = $(this),
            id = $this.attr('data-id'),
            name = $this.attr('data-name'),
            description = $this.attr('data-desc');
        $('#id').val(id);
        $('#name').val(name);
        $('#description').val(description);
        $('#editModal').modal('show');
    });
    $('#save').click(function() {
        var $this = $(this), data = {};
        data.id = parseInt($('#id').val(),10);
        data.name = $.trim($('#name').val());
        data.description = $.trim($('#description').val());
        if(!data.name ||data.name.length < 3) {
            __tajs.showAlert('Category Name are required and minimum 3 characters');
            return false;
        }
        if(!data.description || data.description.length < 5) {
            __tajs.showAlert('Description is required and minimum 5 characters');
            return false;
        }
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/publisher/category', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res) {
            $this.removeClass('is-loading');
            if (!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.reload();
            }
        });
    });
    $('#add-category').click(function() {
        $('#id').val('0');
        $('#name').val('');
        $('#description').val('');
        $('#editModal').modal('show');
    });
});
</script>