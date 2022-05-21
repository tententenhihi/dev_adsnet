<section class="wrapper">
    <div class="container">
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-4-tablet is-12-mobile">
                    <h1 class="title is-5">
                        My Referral Payments
                    </h1>
                </div>
                <div class="column is-8-tablet is-hidden-mobile">
                    <nav class="breadcrumb has-succeeds-separator is-right" aria-label="breadcrumbs">
                        <ul>
                            <li><a href="/"><?=SITE_NAME?></a></li>
                            <li class="is-active"><a href="#" aria-current="page">Referrals</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <article class="message is-info">
                    <div class="message-body">
                        <p>Detailed earning you got from <strong><?=$this->data->referred_user->name?></strong> - <strong><?=$this->data->referred_user->email?></strong></p>
                    </div>
                </article>
            </div>
        </div>
        <div class="page-title-box">
            <div class="columns is-mobile">
                <div class="column is-6">
                    <h1 class="title is-6">Results</h1>
                </div>
                <div class="column is-6">
                    <div class="buttons is-right" style="margin-top: -0.5rem;">
                        <a class="button is-success is-light is-transparent" href="javascript:window.history.back();">
                            <span class="icon">
                                <svg viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M20,10V14H11L14.5,17.5L12.08,19.92L4.16,12L12.08,4.08L14.5,6.5L11,10H20Z" />
                                </svg>
                            </span>
                            <span>Go back</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <div class="flatbox">
                    <div class="table-container">
                        <table class="table is-striped is-fullwidth">
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
                    </div>
                </div>
            </div>
        </div>
        <?=$this->data->pagination?>
    </div>
</section>