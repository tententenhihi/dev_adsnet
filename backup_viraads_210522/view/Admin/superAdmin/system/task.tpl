<style>
.system-status {
    border-radius: 20px;
    border-color: transparent;
    background-color: #586e75;
    height: 20px;
    width: 20px;
    transition: background-color .5s linear;
}
.system-status.is-warning {
    background-color: #ffdd57;
}
.system-status.is-danger {
    background-color: #e88f9d;
}
.system-status.is-success {
    background-color: #48c774;
}
.system-status.is-info {
    background-color: #3298dc;
}
.system-item {
    margin-left: 20px;
}
.system-title, .system-title a {
    font-size: 1rem;
    font-weight: 600;
    line-height: 1.2;
    color: #364a63;
}
.system-title span {
    padding-right: 1rem;
}
.system-meta {
    display: inline-block;
    margin-right: 1.5rem;
    line-height: 1.2;
    padding: 0.25rem 0;
    color: #526484;
    font-size: 14px;
}
.meta-text {
    color: #8094ae;
}
.wrap-data {
    display: inline-flex;
    white-space: nowrap; 
    width: 300px; 
    min-width: 0;
}
.show-data {
    cursor: pointer;
    overflow: hidden;
    text-overflow: ellipsis;
}
.level {
    display: flex;
}
.level {
    align-items: center;
    justify-content: space-between;
}
.level-left {
    display: flex;
}

.level-left {
    align-items: center;
    justify-content: flex-start;
}
.level-left, .level-right {
    flex-basis: auto;
    flex-grow: 0;
    flex-shrink: 0;
}
.level-item {
    align-items: center;
    display: flex;
    flex-basis: auto;
    flex-grow: 0;
    flex-shrink: 0;
    justify-content: center;
}
@media screen and (min-width: 769px), print
    .level {
        display: flex;
    }

@media screen and (min-width: 769px), print
    .level-left {
        display: flex;
    }

</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Task</h4>
                        <a class="btn btn-icon btn-outline-primary btn-header" href="javascript:taskModal(null);"
                            <span><i class="feather icon-plus"></i> Create Task</span></a>
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
                               href="/system/task/<?=strtolower($status)?><?=$this->arg?>"><?=$status?></a>
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
                                                       placeholder="Task Name" aria-label="filter"
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

                        <div class="columns is-multiline mb-1">
                            <?php if($this->data->data): ?>
                            <div class="activity">
                                <ul class="list-group list-group-flush">
                                    <?php foreach($this->data->data as $item): ?>
                                    <li class="list-group-item mt-1" style="border: 1px solid rgba(128,128,128,0.42); border-radius: 10px">
                                        <div class="d-flex justify-content-between flex-wrap mb-1">
                                            <div>
                                                <span class="mr-1 badge badge-<?php if($item->status == 'Finished'): ?>success<?php endif; ?><?php if($item->status == 'Failed'): ?>danger<?php endif; ?><?php if($item->status == 'Processing'): ?>info<?php endif; ?><?php if($item->status == 'Pending'): ?>warning<?php endif; ?>"><?=$item->status?></span>
                                                <span class="mr-1"><strong><?=$item->task_name?></span> <span><?=$item->task_pid?></strong></span>
                                                <span class="mr-1">Message: <?=$item->message?$item->message:'None'?></span>
                                                <span class="mr-1">Created: <?=$item->created_at?></span>
                                                <span class="mr-1">Updated: <?=$item->updated_at??'Not Available'?></span>

                                                <br>

                                                <span class="meta-text">Data: </span>
                                                <span class="meta-status wrap-data"><span class="show-data"><?=$item->task_data?$item->task_data:''?></span></span>
                                            </div>
                                            <div>
                                                <div class="level-item" data-data='<?=htmlentities(json_encode($item), ENT_QUOTES)?>'>
                                                    <button type="button" class="btn btn-icon btn-icon rounded-circle btn-flat-danger btn_remove">
                                                        <i class="feather icon-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                            <?php else: ?>

                                <div class="hero mt-2">
                                    <div class="hero-body">
                                        <div class="text-center">
                                            <p class="title is-6">No results found</p>
                                            <p class="subtitle is-6">You can <a href="javascript:taskModal(null);">Create new task</a></p>
                                        </div>
                                    </div>
                                </div>

                            <?php endif; ?>
                        </div>
                        <?=$this->data->pagination?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade text-left" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Task Name</label>
                        <input class="form-control" type="text" id="task_name" placeholder="Name of Task">
                    </div>
                    <div class="form-group">
                        <label class="label">Task Data</label>
                        <textarea id="task_data" rows="6" class="form-control" placeholder="Data of Task"></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="btn_submit">
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
<div class="modal fade text-left" id="taskData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33"
     style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-card">

                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">Data</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="label">Task Data</label>
                        <textarea id="task_show_data" rows="8" class="form-control" placeholder="None"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-close" >OK</button>
                    <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/* global $, __tajs */
function taskModal(data) {
    if(!data) {
        data = {"task_name": "", "task_data": ""};
    }
    $('#task_name').val(data.task_name);
    $('#task_data').val(data.task_data);
    $('#taskModal').modal('show');
}
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname+'?q='+encodeURIComponent(val);
    });
    $('.show-data').on('click', function() {
        const data = $(this).text();
        $('#task_show_data').val(data);
        $('#taskData').modal('show');
    });
    $('.btn_remove').on('click', function() {
        var $this = $(this), mess = $this.closest('div'), data = JSON.parse(mess.attr('data-data'));
        __tajs.showConfirm('Are you sure? this action can not undo', function(yes){
            if(!yes) return false;
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/system/task/remove', {csrf_token: __tajs.csrf, id: data.id}, function(res) {
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
    });
    $('#btn_submit').on('click', function() {
        var $this = $(this), data = {};
        data.task_name = $.trim($('#task_name').val());
        data.task_data = $.trim($('#task_data').val());
        
        if(!data.task_name || data.task_name.length < 2) {
            __tajs.showAlert('Task Name is too short, min 2 characters');
            return false;
        }
        if(!data.task_data || data.task_data.length < 2) {
            __tajs.showAlert('Task Data is too short, min 2 characters');
            return false;
        }
        
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/system/task/create', {csrf_token: __tajs.csrf, data: JSON.stringify(data)}, function(res){
            $this.removeClass('is-loading');
            if(!res.success) {
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            } else {
                window.location.reload();
            }
        });
    });
});
</script>