<style>
    .vendor {cursor: pointer; transition: .5s} #tracking-list > div {
        padding: 0.75rem;
    }

    #tracking-list > div > article {
        padding: 20px;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Set up S2S tracking to see conversions in your statistics. The S2S Postback URL generated
                            here can be used for all your campaigns.</p>
                    </div>
                </div>
            </div>
            <div class="page-title-box">
                <div class="row">
                    <div class="col-12">
                        <h2 class="title is-5">Select a tracker or a CPA network</h2>
                    </div>
                </div>
            </div>


            <div class="row" id="tracking-list">
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="appsflyer" data-c="{clickid}"
                             data-p="{af_cost_value}" data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/appsflyer.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="bemob" data-c="{externalId}" data-p="{payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/bemob.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="keitaro" data-c="{external_id}"
                             data-p="{conversion_revenue}" data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/keitaro.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="voluum" data-c="{externalid}" data-p="{payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/voluum.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="binom" data-c="{externalid}" data-p="{payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/binom.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="thrivetracker" data-c="{externalid}"
                             data-p="{amount}" data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/thrivetracker.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="peerclick" data-c="{external_id}" data-p="{payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/peerclick.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="redtrack" data-c="{ref_id}" data-p="{offer_payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/redtrack.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="funnelflux" data-c="{sid2}" data-p="{payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/funnelflux.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="landingtrack" data-c="{{PID}}" data-p="{{PAYOUT}}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/landingtrack.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="kintura" data-c="{externalid}" data-p="{payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/kintura.png')?>"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card" data-name="other tracker" data-c="{clickid}" data-p="{payout}"
                             data-h="<?=BLOG_URL?>">
                        <img src="<?=$this->asset2('app-assets/images/tracking/others.png')?>"/>
                    </article>
                </div>
            </div>

            <div class="row hidden" id="tracking-item" style="align-items: center;">
                <div class="col-lg-3 col-md-6 col-12">
                    <article class="flatbox vendor card">
                        <img src="" id="vendor-selected"/>
                    </article>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <a class="text-info" id="another-vendor">Select another vendor</a>
                </div>
            </div>

            <div class="page-title-box hidden postback">
                <div class="row">
                    <div class="col-12">
                        <h2 class="title is-5">Postback Url</h2>
                    </div>
                </div>
            </div>

            <div class="card hidden postback">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <p class="subtitle is-6" id="postback-title"></p>

                                    <div class="input-group">
                                        <input type="text" class="form-control click-to-copy" id="postback-url" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary waves-effect waves-light click-to-copy" >Copy</button>
                                        </div>
                                    </div>

                                    <br>
                                    <a class="help has-text-info" id="postback-help" target="_blank" href="#">Read
                                        <span></span> integration help</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-title-box hidden test-tracking">
                <div class="row">
                    <div class="col-12">
                        <h2 class="title is-5">Test your implementation</h2>
                    </div>
                </div>
            </div>

            <div class="card hidden is-multiline test-tracking">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <div class="field">
                                        <p class="subtitle is-6">Enter the target URL used in the campaign you want to test</p>

                                        <fieldset class="form-group">
                                            <input type="text" class="form-control tracking-url" placeholder="Your target url">
                                        </fieldset>
                                    </div>
                                    <div class="field is-grouped">
                                        <div class="control">
                                            <button class="btn btn-warning" id="test">
                                                <span class="icon">
                                                    <svg viewBox="0 0 24 24">
                                                        <path fill="currentColor"
                                                              d="M7.5,5.6L5,7L6.4,4.5L5,2L7.5,3.4L10,2L8.6,4.5L10,7L7.5,5.6M19.5,15.4L22,14L20.6,16.5L22,19L19.5,17.6L17,19L18.4,16.5L17,14L19.5,15.4M22,2L20.6,4.5L22,7L19.5,5.6L17,7L18.4,4.5L17,2L19.5,3.4L22,2M13.34,12.78L15.78,10.34L13.66,8.22L11.22,10.66L13.34,12.78M14.37,7.29L16.71,9.63C17.1,10 17.1,10.65 16.71,11.04L5.04,22.71C4.65,23.1 4,23.1 3.63,22.71L1.29,20.37C0.9,20 0.9,19.35 1.29,18.96L12.96,7.29C13.35,6.9 14,6.9 14.37,7.29Z"></path>
                                                    </svg>
                                                </span>
                                                <span>Test conversion tracking</span>
                                            </button>
                                        </div>
                                    </div>
                                    <br>
                                    <span class="has-text-success-dark">
                                        1. Our system will generate a testing banner with your target URL. Click on banner.<br>
                                        2. Go to your landing and complete a conversion.<br>
                                        3. If the S2S postback settings are correct, our system will soon register a conversion.
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* global $, __tajs */
    $(document).ready(function () {
        $('.vendor').on('click', function () {
            var $this = $(this), name = $this.attr('data-name'), c = $this.attr('data-c'), p = $this.attr('data-p'),
                h = $this.attr('data-h');
            $('#tracking-list').addClass('hidden');
            $('#tracking-item').removeClass('hidden');
            $('#vendor-selected').attr('src', $this.find('img').attr('src'));

            $('.postback').removeClass('hidden');
            $('#postback-title').html('Copy this S2S Postback URL and paste to the relevant field in your <strong>' + name + ' account</strong>');
            $('#postback-url').val('<?=ADSERVER_URL?>/conversion?clickid=' + c + '&payout=' + p);
            $('#postback-help').attr('href', h).find('span').text(name);

            $('.test-tracking').removeClass('hidden');
        });
        $('#another-vendor').on('click', function () {
            $('#tracking-list').removeClass('hidden');
            $('#tracking-item').addClass('hidden');
            $('.postback, .test-tracking').addClass('hidden');
        });
        $('.click-to-copy').on('click', function () {
            $('#postback-url').focus().select();
            document.execCommand('copy');
        });
    });
</script>