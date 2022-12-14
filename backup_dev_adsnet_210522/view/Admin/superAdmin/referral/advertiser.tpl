<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-end">
                    <h4 class="card-title">List of Referral</h4>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex justify-content-between flex-wrap mb-1">
                                    <div class="d-flex flex-wrap">
                                        <fieldset>
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Name or Email" aria-label="filter" value="<?=$this->data->key?>">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="button" id="btn-filter"><i class="feather icon-search"></i> Search</button>
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
                                    <th>Email</th>
                                    <th>Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <span><?= $item->name ?></span>
                                    </td>
                                    <td>
                                        <span><?= $item->email ?></span>
                                    </td>
                                    <td>
                                        <span><?= $this->helper->currencyFormat($item->amount) ?></span>
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