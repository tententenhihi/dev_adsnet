<style>
.input_code{
    width: 450px;
    height: 33px;
    background: #fafafa!important;
    border: none;
}
.input_code:focus{
    border: none;
}
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="colums">
                            <div class="column">
                                <article class="flatbox">
                                    <h1 class="title is-5">
                                        Verifying <?=$this->data->name?>
                                    </h1>
                                    <p class="subtitle is-6">Before you can use this domain to serve anti-adblock ad tags, you have to complete your nameserver setup</p>

                                    <div style="margin-top:3rem">
                                        <h2 class="title is-6">1. Log in to your registrar account</h2>
                                        <p class="subtitle is-6">If you do not remember, determine your registrar via <a href="https://whois.icann.org/en/lookup?name=<?=$this->data->name?>" target="_blank">WHOIS</a>. Then remove all existing nameservers</p>
                                    </div>

                                    <div style="margin-top:3rem">
                                        <h2 class="title is-6">2. Replace with these nameservers</h2>
                                        <p class="subtitle is-6">We use <a href="https://www.cloudflare.com/dns/" target="_blank">Cloudflare service</a> to offer you anti-adblock solution, so if you use cloudflare before, you should familiar with them</p>

                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" style="width:130px; justify-content: center">NS: </span>
                                            </div>
                                            <input type="text" class="form-control click-to-copy" value="<?=$this->data->cf->nsFirstServer?>">
                                        </div>

                                        <br>

                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" style="width:130px; justify-content: center">NS: </span>
                                            </div>
                                            <input type="text" class="form-control click-to-copy" value="<?=$this->data->cf->nsSecondServer?>">
                                        </div>
                                    </div>

                                    <div style="margin-top:3rem">
                                        <h2 class="title is-6">3. Verify your setup</h2>
                                        <p class="subtitle is-6">Registrars typically process nameserver updates within 24 hours. If you think your nameservers are updated correctly, click <strong>Verify Button</strong> below to finish setup and activate your domain</p>
                                    </div>

                                    <div style="margin-top:3rem; text-align: center">
                                        <div class="buttons is-centered">
                                            <button class="btn btn-success btn-medium" id="verify">
                                                <i class="feather icon-check-circle"></i>
                                                <span>Verify</span>
                                            </button>
                                            <button class="btn btn-danger btn-medium" id="cancel">
                                                <i class="feather icon-x"></i>
                                                <span>Cancel & Remove</span>
                                            </button>
                                        </div>
                                    </div>
                                </article>
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
$(document).ready(function() {
    $('.click-to-copy').on('click', function() {
        $(this).focus().select();
        document.execCommand('copy');
    });
    $('#verify').click(function() {
        var $this = $(this);
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post(window.location.pathname, {csrf_token: __tajs.csrf}, function(res) {
            if (!res.success) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.replace(res.data);
            }
        });
    });
    $('#cancel').click(function() {
        var $this = $(this);
        $this.addClass('is-loading');
        $this.prop('disabled', true);
        $.post('/domain/cancel/<?=$this->data->id?>', {csrf_token: __tajs.csrf}, function(res) {
            if (!res.success) {
                $this.removeClass('is-loading');
                $this.prop('disabled', false);
                __tajs.showAlert(res.data);
            }
            else {
                window.location.replace(res.data);
            }
        });
    });
});
</script>