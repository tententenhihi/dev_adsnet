<style>
    .card p {
        color: #626262 !important;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mt-0"><?= $this->helper->numberFormat($this->data->total_referral)
                            ?></h2>
                        <p>Total Referral</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather icon-users text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mt-0"><?= $this->helper->currencyFormat($this->data->total_amount)
                            ?></h2>
                        <p>Total Amount</p>
                    </div>
                    <div class="avatar bg-rgba-success p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-usd text-success font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <a class="card-header d-flex align-items-start pb-0" href="/referral/publisher">
                    <div>
                        <h2 class="text-bold-700 mt-0"><?= $this->
                            helper->currencyFormat($this->data->total_publisher_amount) ?></h2>
                        <p>Total Publisher Amount </p>
                    </div>
                    <div class="avatar bg-rgba-danger p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-usd text-danger font-medium-5"></i>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6 col-12">
            <div class="card">
                <a class="card-header d-flex align-items-start pb-0" href="/referral/advertiser">
                    <div>
                        <h2 class="text-bold-700 mt-0"><?= $this->
                            helper->currencyFormat($this->data->total_advertiser_amount) ?></h2>
                        <p>Total Advertiser Amount </p>
                    </div>
                    <div class="avatar bg-rgba-warning p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-usd text-warning font-medium-5"></i>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="d-flex justify-content-between flex-wrap mb-1">
                                    <div class="d-flex flex-wrap">
                                        <fieldset>
                                            <div class="input-group">
                                                <input id="search" type="text" class="form-control"
                                                       placeholder="Name or Email" aria-label="filter"
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
                                    <th>Email</th>
                                    <th>Total Referral</th>
                                    <th>Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach($this->data->data as $item): ?>
                                <tr>
                                    <td>
                                        <a href="/referral/detail?id=<?= $item->id ?>"><?= $item->name ?></a>
                                    </td>
                                    <td>
                                        <span><?= $item->email ?></span>
                                    </td>
                                    <td>
                                        <span><?= $item->total_referral ?></span>
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

<script>
    $(document).ready(function () {
        $('#enterAction').on('click', function () {
            var val = $.trim($('#search').val());
            if (val.length === 0) {
                window.location.href = window.location.pathname + '?q=';
            }
            window.location.href = window.location.pathname + '?q=' + encodeURIComponent(val);
        });
    });
</script>