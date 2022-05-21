<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Statistics shows inventory data based on last 24hours sales history.
                            That means only sold traffic is included, we may have a lot more traffic and/or
                            countries</p>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <div class="d-flex">
                        <a class="btn btn-icon btn-outline-primary btn-header" href="/campaign/create">
                            <span><i class="feather icon-plus"></i> Create Campaign</span></a>
                    </div>
                </div>

                <div class="card-content">
                    <div class="card-body card-dashboard">

                        <?php if($this->data->data): ?>
                        <div class="table-responsive">
                            <table class="table table-striped mb-1">
                                <thead>
                                <tr>
                                    <th>Country</th>
                                    <th>Impression</th>
                                    <th>Click</th>
                                    <th>Conversion</th>
                                    <th>Reach</th>
                                    <th>Optimal eCPM</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td><?=$item->country?></td>
                                    <td><?=$this->helper->numberFormat($item->impression)?></td>
                                    <td><?=$this->helper->numberFormat($item->click)?></td>
                                    <td><?=$this->helper->numberFormat($item->conversion)?></td>
                                    <td><?=$this->helper->numberFormat($item->reach)?></td>
                                    <td><span class="is-pulled-right has-text-success"><?=$this->
                                            helper->currencyFormat(($item->cost*1000/$item->impression)+0.25)?></span>
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
                                    <p class="title is-6">No statistics available!</p>
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