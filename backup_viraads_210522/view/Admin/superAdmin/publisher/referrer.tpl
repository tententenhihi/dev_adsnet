<section class="wrapper">
    <div class="content-body">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-12">
                <?php if($this->data->zone): ?>
                <div class="media mb-2">
                    <div class="media-body" style="background-color: antiquewhite">
                        <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                            <p>Showing only referrers from zone #<?=$this->data->zone->id?>
                                (<?=$this->data->zone->name?>) -- <a
                                    href="/publisher/referrer/realtime?zone_id=<?=$this->data->zone->id?>">Monitor in
                                    realtime</a></p>
                        </div>
                    </div>
                </div>
                <?php elseif($this->data->website): ?>
                <div class="media mb-2">
                    <div class="media-body" style="background-color: antiquewhite">
                        <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                            <p>Showing only referrers from website #<?=$this->data->website->id?> -
                                <?=$this->data->website->domain?></p>
                        </div>
                    </div>
                </div>
                <?php elseif($this->data->user): ?>
                <div class="media mb-2">
                    <div class="media-body" style="background-color: antiquewhite">
                        <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                            <p>Showing only referrers from user #<?=$this->data->user->id?> -
                                <?=$this->data->user->name?> (<?=$this->data->user->email?>)</p>
                        </div>
                    </div>
                </div>
                <?php endif; ?>
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-end">
                        <h4 class="card-title">Referrer</h4>
                        <div class="dropdown chart-dropdown">
                            Filter by:
                            <button class="btn border-0 dropdown-toggle px-50 waves-effect waves-light" type="button"
                                id="dropdownItem3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <?=$this->data->action?>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownItem3"
                                x-placement="bottom-end"
                                style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(92px, 25px, 0px);">
                                <?php foreach($this->data->actions as $action): ?>
                                <?php if($action == $this->data->action): ?>
                                <a class="dropdown-item"><?=$action?></a>
                                <?php else: ?>
                                <a class="dropdown-item"
                                    href="/publisher/referrer/<?=strtolower($action)?><?=$this->arg?>"><?=$action?></a>
                                <?php endif; ?>
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
                                                    <input id="search" class="input" type="text"
                                                        placeholder="Domain Name" value="<?=$this->data->key?>">
                                                    <div class="input-group-append">
                                                        <button class=" btn btn-primary waves-effect waves-light"
                                                            type="button" id="enterAction">
                                                            <i class="feather icon-search"></i>
                                                            <span>Search</span>
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
                                    <article class="flatbox">
                                        <?php if($this->data->data): ?>
                                        <div class="table-responsive">
                                            <table class="table table-striped mb-1">
                                                <thead>
                                                    <tr>
                                                        <th>User</th>
                                                        <th>Website</th>
                                                        <th>Zone</th>
                                                        <th>Action</th>
                                                        <th>Referrer</th>
                                                        <th><span class="is-pulled-right">Count</span></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php foreach($this->data->data as $item): ?>
                                                    <tr>
                                                        <td><a class="text-muted" href="/user?id=<?=$item->user_id?>"
                                                                target="_blank"><?=$item->user_name?></a></td>
                                                        <td><a
                                                                href="/publisher/website/detail?id=<?=$item->website_id?>">#<?=$item->website_id?>
                                                                - <?=$item->website_domain?></a></td>
                                                        <td><a href="/publisher/zone/detail?id=<?=$item->zone_id?>">#<?=$item->zone_id?>
                                                                - <?=$item->zone_name?></a></td>
                                                        <td>
                                                            <?php if($item->action=='Impression'): ?>
                                                            <span class="tag is-info">Impression</span>
                                                            <?php elseif($item->action=='Click'): ?>
                                                            <span class="tag is-success">Click</span>
                                                            <?php else: ?>
                                                            <span class="tag is-danger">Conversion</span>
                                                            <?php endif; ?>
                                                        </td>
                                                        <td><a href="//<?=$item->domain?>"
                                                                target="_blank"><?=$item->domain?></a>
                                                        </td>
                                                        <td><span
                                                                class="text-muted is-pulled-right"><?=$this->helper->numberFormat($item->time_count)?></span>
                                                        </td>
                                                    </tr>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                        <?php else: ?>
                                        <div class="hero mt-2">
                                            <div class="hero-body">
                                                <div class="text-center">
                                                    <p>We do not have any referrers!</p>
                                                </div>
                                            </div>
                                        </div>
                                        <?php endif; ?>
                                        </br>
                                    </article>
                                </div>
                            </div>
                            <?=$this->data->pagination?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">Results</h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <button class="button is-info is-light is-transparent collapse" data-action="collapse"
                            data-target="results">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor"
                                        d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"></path>
                                </svg>
                            </span>
                            <span>Collapse</span>
                        </button>
                    </div>
                </div>
            </div>
        </div> -->

    </div>
</section>
<script>
/* global $, __tajs */
$(document).ready(function() {
    $('#enterAction').on('click', function() {
        var val = $.trim($('#search').val());
        if (val.length < 2) return false;
        window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
    });
});
</script>