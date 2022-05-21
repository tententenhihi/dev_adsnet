<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>403 Forbidden - <?=SITE_NAME?></title>
<link rel="shortcut icon" href="<?=$this->asset('img/favicon.ico')?>">
<link rel="stylesheet" href="<?=$this->asset('css/app.css')?>">
</head>
<body>
    <section class="hero is-fullheight is-bold">
        <div class="hero-body">
            <div class="container has-text-centered">
                <h1 class="title is-1 text-muted">403 Forbidden</h1>
                <h2 class="subtitle is-6 text-muted">You do not have the permission to access this page</h2>
                <p>
                    <a href="<?=FRONTEND_URL?>" class="button is-success">
                        <i class="fa fa-home" aria-hidden="true"></i>
                        <span>Home</span>
                    </a> 
                    <a href="javascript:history.back();" class="button is-info">
                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                        <span>Back</span>
                    </a> 
                </p>
            </div>
        </div>
    </section>
</body>
</html>
