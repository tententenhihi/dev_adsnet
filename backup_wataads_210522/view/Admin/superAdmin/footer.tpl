</div>
</div>
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<!-- BEGIN: Footer-->
<footer class="footer footer-static footer-light">
    <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2020 <?=SITE_NAME?>, All rights Reserved</span>
	<!--<span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i class="feather icon-heart pink"></i></span>-->
        <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
    </p>
</footer>
<!-- END: Footer-->




<!-- BEGIN: Page Vendor JS-->
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="<?=$this->asset2('app-assets/js/core/app-menu.js')?>"></script>
<script src="<?=$this->asset2('app-assets/js/core/app.js')?>"></script>
<script src="<?=$this->asset2('app-assets/js/scripts/components.js')?>"></script>
<script src="<?=$this->asset2('app-assets/vendors/js/forms/select/select2.full.min.js')?>"></script>
<script src="<?=$this->asset2('app-assets/js/scripts/forms/select/form-select2.js')?>"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<!-- END: Page JS-->



<script>
    /* global $, __tajs */
    $(document).ready(function(){
        __tajs.renderTime();

        var path = location.pathname.replace(/^(\/[^\/]+\/[^\/]+).*$/,'$1');
        console.log(path);
        $('#main-menu-navigation .nav-item a').each(function (){
            if($(this).attr('href') === path){
                $(this).parent().addClass('active');
            }else if(path === '/' && $(this).attr('href') === '/dashboard'){
                $(this).parent().addClass('active');
            }
        })
    });
</script>
</body>
<!-- END: Body-->
</html>
