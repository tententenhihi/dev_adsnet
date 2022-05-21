<style>
    .input_code {
        width: 450px;
        height: 33px;
        background: #fafafa !important;
        border: none;
    }

    .input_code:focus {
        border: none;
    }
</style>
<div class="content-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="media mb-2">
                <div class="media-body" style="background-color: antiquewhite">
                    <div style="border-left: 4px solid #48c774; padding: 1.25em 1.5em;">
                        <p>Verifying <?=$this->data->domain?></p>
                        <p>Pick your most convenience way to verify your website</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <h2 class="title is-5">Upload file to your server</h2>
                                    <p class="subtitle is-6">Download our txt file and upload it to your <strong>webserver
                                            root
                                            folder</strong>.
                                        Make sure filename is <a class="has-text-link"
                                                                 href="javascript:exportFile();"><?=$this->
                                            data->verify_token?>.txt</a> exactly and you can access it from the
                                        Internet.
                                        Do not modify it's content. Once your website get verified, you are free to
                                        remove it
                                    </p>

                                    <div class="buttons">
                                        <button type="button" class="btn btn-success mb-1 waves-effect waves-light" id="download">
                                            <i class="feather icon-download"></i>
                                            <span>Download File</span>
                                        </button>
                                        <a type="button" class="btn btn-info mb-1 waves-effect waves-light"
                                           href="https://<?=$this->data->domain?>/<?=$this->data->verify_token?>.txt"
                                           target="_blank">
                                            <i class="feather icon-eye"></i>
                                            <span>Check on your Website</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <h2 class="title is-5 ">Add meta tag to your Website</h2>
                                    <p class="subtitle is-6">Add bellow meta tag before
                                        your <?=htmlspecialchars('</head>')?>
                                        tag. Do not modify, once your website get verified, you are free to remove
                                        it</p>
                                    <div class="input-group">
                                        <input class="form-control" id="meta_tag" type="text"
                                               value="<?=htmlspecialchars('<meta name="'.$this->data->verify_name.'" content="'.$this->data->verify_token.'" />')?>" readonly>
                                        <div class="input-group-append" id="button-addon2">
                                            <button class="btn btn-primary waves-effect waves-light" id="copy">Copy to
                                                Clipboard
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12">
                                <div class="flatbox">
                                    <h2 class="title is-5 ">Add DNS record to your Domain</h2>
                                    <p class="subtitle is-6">Login to your domain control panel, add bellow DNS record. Keep in
                                        mind changing DNS may need up to 48hours to take effect, depend on your provider</p>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="width:130px;">Record Type: </span>
                                        </div>
                                        <input type="text" class="form-control click-to-copy" value="TXT">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="width:130px;">Record Name: </span>
                                        </div>
                                        <input type="text" class="form-control click-to-copy" value="<?=$this->data->verify_name?>.<?=$this->data->domain?>">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="width:130px;">Record Value: </span>
                                        </div>
                                        <input type="text" class="form-control click-to-copy" value="<?=$this->data->verify_token?>">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="row">
                            <div class="col-12" style="text-align: center">
                                <div class="flatbox">
                                    <div class="buttons is-centered">
                                        <button type="button" class="btn btn-success mb-1 waves-effect waves-light" id="verify">
                                            <i class="feather icon-check"></i>
                                            <span>Verify</span>
                                        </button>
                                        <button type="button" class="btn btn-danger mb-1 waves-effect waves-light" id="cancel">
                                            <i class="feather icon-x"></i>
                                            <span>Cancel & Remove</span>
                                        </button>
                                    </div>
                                </div>
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
    /* global $, Blob, URL, __tajs */
    function exportFile() {
        const token = '<?=$this->data->verify_token?>';
        const a = document.createElement('a');
        const file = new Blob([token], {type: 'text/plain'});
        a.href = URL.createObjectURL(file);
        a.download = token + ".txt";
        a.click();
        URL.revokeObjectURL(a.href);
    }

    $(document).ready(function () {
        $('.click-to-copy').on('click', function () {
            $(this).focus().select();
            document.execCommand('copy');
        });
        $('#copy').on('click', function () {
            $('#meta_tag').focus().select();
            document.execCommand('copy');
        });
        $('#download').on('click', function () {
            exportFile();
        });
        $('#verify').click(function () {
            var $this = $(this);
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post(window.location.pathname, {csrf_token: __tajs.csrf}, function (res) {
                if (!res.success) {
                    $this.removeClass('is-loading');
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.replace(res.data);
                }
            });
        });
        $('#cancel').click(function () {
            var $this = $(this);
            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post('/website/cancel/<?=$this->data->id?>', {csrf_token: __tajs.csrf}, function (res) {
                if (!res.success) {
                    $this.removeClass('is-loading');
                    $this.prop('disabled', false);
                    __tajs.showAlert(res.data);
                } else {
                    window.location.replace(res.data);
                }
            });
        });
    });
</script>