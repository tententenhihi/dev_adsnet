<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error!!! Resource not found - <?=SITE_NAME?></title>
<link rel="shortcut icon" href="<?=$this->asset('img/favicon.ico')?>">
<link rel="stylesheet" href="<?=$this->asset('css/app.css')?>">
</head>
<body>
    <section class="hero is-fullheight is-bold">
        <div class="hero-body">
            <div class="container has-text-centered">
                <h1 class="title is-1 text-muted">Error!!! 404</h1><p></p>
                <h2 class="subtitle is-6 text-muted">The resource you are requesting does not exist or not yours, please check and try again.</h2>
                <p>
                    <a href="<?=FRONTEND_URL?>" class="button is-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M10,20V14H14V20H19V12H22L12,3L2,12H5V20H10Z" />
                            </svg>
                        </span>
                        <span>Home</span>
                    </a> 
                    <a href="javascript:history.back();" class="button is-info">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
                            </svg>
                        </span>
                        <span>Back</span>
                    </a> 
                </p>
            </div>
        </div>
    </section>
</body>
</html>
