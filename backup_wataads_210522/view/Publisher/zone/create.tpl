<style>
    .box-image-ads {
        position: relative;
        display: -webkit-box;
        padding-bottom: 20px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        min-height: 176px;
    }
    
    .box-image-ads-svg {
        max-width: 210px;
        width: 100%;
    }
    
    .adFormat {
        cursor: pointer;
        height: 100%;
    }
    
    .adFormat.disabled,
    .adFormat.disabled:hover {
        cursor: not-allowed;
        border: none;
        opacity: 0.4;
    }

    .disabled{
        cursor: not-allowed;
        border: none;
        opacity: 0.4;
    }
    
    .adFormat:hover {
        /*border: 2px solid #006ed6;*/
    }
    
    .collapse:not(.show) {
        display: inline;
    }
    
    .adFormat {
        margin-left: 0.1rem;
        margin-right: 0.1rem;
        cursor: pointer;
        border-radius: 33px;
        padding-top: 1rem;
        padding-bottom: 1rem;
    }
    
    .is-selected {
        border: 2px solid #006ed6;
        color: #006ed6;
    }
    
    .adFormat {
        box-shadow: 0 0 16px 3px rgb(128 128 128 / 13%);
        margin-left: 0.1rem;
        margin-right: 0.1rem;
        cursor: pointer;
        border-radius: 33px;
        padding: 12px 15px 1px 15px;
    }
    
    .app-content .wizard.wizard-circle>.steps>ul>li:before {
        /*background-color: #006ED6 !important;*/
    }
    
    .app-content .wizard>.steps>ul>li.current .step {
        /*border-color: #006ED6 !important;*/
        /*background-color: #006ED6;*/
    }
    .box-image-ads {
        position: relative;
        display: -webkit-box;
        padding-bottom: 20px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        min-height: 176px;
    }
</style>
<div class="content-body">

    <!-- Form wizard with number tabs section start -->
    <section id="number-tabs">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <form action="#" class="number-tab-steps wizard-circle">

                                <!-- Step 1 -->
                                <h6>Select Ad Form</h6>
                                <fieldset>
                                    <div class="row is-multiline" id="step-ad-format" style="flex-wrap: wrap">
                                        <?php foreach($this->data->adFormat as $item): ?>
                                        <div class="col-lg-4 col-md-6 col-12 mb-2">
                                            <div class="h-100 mb-0 flatbox adFormat<?php if($item->status == 'Inactive'): ?> disabled<?php endif; ?>" data-id="<?=$item->id?>">
                                                <div class="card-content data-step" id="step-ad-format">
                                                    <div class="card-body card-dashboard">
                                                        <div style="text-align:center;padding-bottom:1rem;">
                                                            <h2 class="title is-4 is-5-mobile">
                                                                <?=$item->name?>
                                                            </h2>
                                                        </div>
                                                        <div class="box-image-ads">
                                                            <div class="box-image-ads-svg">
                                                                <?=$item->svg?>
                                                            </div>
                                                        </div>
                                                        <?php foreach(explode(PHP_EOL,$item->description) as $desc): ?>
                                                        <div>
                                                            <span class="icon text-info">
                                                                <i class="feather icon-check"></i>
                                                            </span>
                                                            <span><?=$desc?></span>
                                                        </div>
                                                        <?php endforeach; ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <?php endforeach; ?>
                                    </div>
                                </fieldset>

                                <!-- Step 2 -->
                                <h6>Basic Information</h6>
                                <fieldset>
                                    <div class="row data-step hidden" id="step-basic-info">
                                        <div class="col-12">
                                            <div class="card flatbox">
                                                <div class="card-content ">
                                                    <div class="card-body card-dashboard">
                                                        <div class="form-group">
                                                            <label class="label">Zone name</label>
                                                            <input class="input form-control" type="text" id="name" placeholder="Zone name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="label">Description</label>
                                                            <textarea class="textarea form-control" id="description" placeholder="Zone Description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Form wizard with number tabs section end -->
</div>
<script>
    /* global $, __tajs */
    $(document).ready(function() {
        $(".number-tab-steps").steps({
            headerTag: "h6",
            bodyTag: "fieldset",
            transitionEffect: "fade",
            titleTemplate: '<span class="step">#index#</span> #title#',
            labels: {
                finish: 'Setup'
            },
            onFinished: function (event, currentIndex) {
                // alert("Form submitted.");
            }
        });
        $('.actions').find('ul').find($('li:odd')).addClass('disabled');
        $('.actions').find('ul').find($('li:last')).find('a').attr('id', 'enterAction');


        $('.adFormat').on('click', function() {
            $('.actions').find('ul').find($('li:even')).removeClass('disabled');
            var $this = $(this),
                collapse = $('.collapse[data-target="step-ad-format"]');
            if ($this.hasClass('disabled')) return false;
            $('.adFormat').removeClass('is-selected');
            $this.addClass('is-selected');
            // $('#step-ad-format').fadeOut(800);
            // collapse.attr('data-action', 'expand');
            // collapse.find('.icon').toggleClass('spin90');
            $('.data-step').removeClass('hidden');

        });


        $('#enterAction').click(function() {
            var $this = $(this),
                data = {};
            data.ad_format = $('.adFormat.is-selected').attr('data-id');
            data.name = $.trim($('#name').val());
            data.description = $.trim($('#description').val());
            if (!data.name || data.name.length < 3) {
                __tajs.showAlert('Zone Name is required and minimum 3 characters');
                return false;
            }
            if (!data.description || data.description.length < 5) {
                __tajs.showAlert('Description is required and minimum 5 characters');
                return false;
            }

            $this.addClass('is-loading');
            $this.prop('disabled', true);
            $.post(window.location.href, {
                csrf_token: __tajs.csrf,
                data: JSON.stringify(data)
            }, function(res) {
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