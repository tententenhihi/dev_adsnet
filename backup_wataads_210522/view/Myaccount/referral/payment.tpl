<section class="wrapper">
    <div class="content-body">
        <div class="row">
            <div class="col-12">
                <article class="alert alert-info">
                    <p>Detailed earning you got from <strong><?=$this->data->referred_user->name?></strong> - <strong><?=$this->data->referred_user->email?></strong></p>
                </article>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card flatbox">
                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="row">
                                <div class="col-12 mb-1">
                                    <a class="button is-success is-light is-transparent" href="javascript:window.history.back();">
                                        <i class="feather icon-arrow-left"></i>
                                        <span>Go back</span>
                                    </a>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-striped mb-1">
                                    <thead>
                                    <tr>
                                        <th><span class="is-pulled-left">Date</span></th>
                                        <th>Commission</th>
                                        <th>Amount</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach($this->data->data as $item): ?>
                                    <tr>
                                        <td><span class="is-pulled-left"><?=$item->created_at?></span></td>
                                        <td><?=$item->commission*100?>%</td>
                                        <td><?=$this->helper->currencyFormat($item->amount)?></td>
                                    </tr>
                                    <?php endforeach; ?>
                                    </tbody>
                                </table>
                                <?=$this->data->pagination?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>