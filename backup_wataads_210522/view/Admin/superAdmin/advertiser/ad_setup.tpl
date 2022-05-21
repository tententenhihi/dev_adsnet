<style>
    span.icon svg {
        width: 16px;
    }
    pre {
        background-color: #f5f5f5;
        color: #4a4a4a;
        font-size: .875em;
        overflow-x: auto;
        padding: 1.25rem 1.5rem;
        white-space: pre;
        word-wrap: normal;
    }
    h3.subtitle span.badge{
        padding: 6px 10px 6px 10px;
    }
</style>
<div class="content-body">
    <div class="row">

        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <h2 class="title is-5">
                            <span><?=$this->data->name?></span>
                        </h2>
                        <h3 class="subtitle is-6">
                            <?php if($this->data->status=='Active'): ?>
                            <span class="badge badge-success">
                                            <i class="fa fa-check-circle"></i>
                                        </span>
                            <?php elseif($this->data->status=='Stopped'): ?>
                            <span class="badge badge-info">
                                            <i class="fa fa-times-circle"></i>
                                        </span>
                            <?php elseif($this->data->status=='Paused'): ?>
                            <span class="badge badge-light">
                                            <i class="fa fa-pause-circle-o"></i>
                                        </span>
                            <?php elseif($this->data->status=='Rejected'): ?>
                            <span class="badge badge-danger">
                                            <i class="fa fa-ban"></i>
                                        </span>
                            <?php else: ?>
                            <span class="badge badge-warning">
                                            <i class="fa fa-minus-circle"></i>
                                        </span>
                            <?php endif; ?>
                            <span class="badge badge-info mb-1"><?=$this->data->format_name?></span>
                            <span class="badge badge-danger mb-1"><?=strtoupper($this->data->pricing_model)?></span>
                            <a class="badge badge-success mb-1" href="/advertiser/campaign/detail/<?=$this->data->campaign_id?>">Campaign #<?=$this->data->campaign_id?></a>
                            <a class="badge badge-primary mb-1" href="/user?id=<?=$this->data->user_id?>">User #<?=$this->data->user_id?> - <?=$this->data->user_name?></a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="card flatbox">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <pre>
                            <?=var_dump($this->data)?>
                        </pre>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>