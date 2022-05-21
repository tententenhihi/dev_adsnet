<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <h4 class="card-title">Log</h4>
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
                                                       placeholder="Message" aria-label="filter"
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

                        <div class="columns">
                            <div class="column">
                                <div class="flatbox">
                                    <?php if($this->data->data): ?>
                                    <?php foreach($this->data->data as $item): ?>
                                    <article class="message is-info" data-data='<?=htmlentities(json_encode($item), ENT_QUOTES)?>'>
                                        <div class="message-header">
                                            <p>Log (<i><?=$item->created_at?></i>)</p>
                                            <button class="btn btn-danger btn-small btn_remove">
                                                <span class="icon">
                                                    <svg viewBox="0 0 24 24">
                                                        <path fill="currentColor" d="M13.46,12L19,17.54V19H17.54L12,13.46L6.46,19H5V17.54L10.54,12L5,6.46V5H6.46L12,10.54L17.54,5H19V6.46L13.46,12Z" />
                                                    </svg>
                                                </span>
                                            </button>
                                        </div>
                                        <div class="message-body">
                                            <p style="word-break: break-all;">-> <?=nl2br($item->message)?></p>
                                        </div>
                                    </article>
                                    <?php endforeach; ?>
                                    <?php else: ?>
                                    <div class="hero mt-2">
                                        <div class="hero-body">
                                            <div class="text-center">
                                                <p class="title is-6">No results found</p>
                                                <p class="subtitle is-6">Don't have Log to show</p>
                                            </div>
                                        </div>
                                    </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
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
    $('.btn_remove').on('click', function() {
        var $this = $(this), mess = $this.closest('article'), data = JSON.parse(mess.attr('data-data'));
        __tajs.showConfirm('Are you sure? this action can not undo', function(yes){
            if(!yes) return false;
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/system/log/remove', {csrf_token: __tajs.csrf, id: data.id}, function(res) {
                $this.removeClass('is-loading');
                if (!res.success) {
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                }
                else {
                    mess.remove();
                }
            });
        });
    });
});
</script>