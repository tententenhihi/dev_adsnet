<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><?=$this->title?></title>
<link rel="stylesheet" type="text/css" href="<?=$this->asset('api/swagger-ui.css')?>" >
<link rel="shortcut icon" href="<?=$this->asset('img/favicon.png')?>">
<style>
html {
    box-sizing: border-box;
    overflow: -moz-scrollbars-vertical;
    overflow-y: scroll;
}

*,*:before,*:after {
    box-sizing: inherit;
}

body{
    margin:0;
    background: #fafafa;
}
</style>
</head>
<body>
<div id="swagger-ui"></div>

<script src="<?=$this->asset('api/swagger-ui-bundle.js')?>"> </script>
<script src="<?=$this->asset('api/swagger-ui-standalone-preset.js')?>"> </script>
<script>
/* global SwaggerUIBundle, SwaggerUIStandalonePreset */
window.onload = function() {
    const ui = SwaggerUIBundle({
        url: "<?=API_URL?>/structure",
        dom_id: '#swagger-ui',
        deepLinking: true,
        defaultModelsExpandDepth: -1,
        presets: [
            SwaggerUIBundle.presets.apis,
            SwaggerUIStandalonePreset
        ],
        plugins: [
            SwaggerUIBundle.plugins.DownloadUrl
        ],
        // requestInterceptor: (req) => {
        //     if (req.loadSpec) {
        //         let hash = btoa("fgfgfggfdgdf5464564thgrth");
        //         req.headers.Authorization = "Bearer " + hash;
        //     }
        //     return req
        //  },
        // onComplete: () => {
        //     ui.preauthorizeApiKey('bearerAuth', 'rthgrthrthrt34563456')
        // },
        
        layout: "BaseLayout"
    });
    
    window.ui = ui
};

</script>
</body>
</html>