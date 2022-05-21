<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Your account has been banned - <?=SITE_NAME?></title>
<link rel="shortcut icon" href="<?=$this->asset('img/favicon.ico')?>">
<link rel="stylesheet" href="<?=$this->asset('css/app.css')?>">
</head>
<body>
    <section class="hero is-fullheight is-bold">
        <div class="hero-body">
            <div class="container has-text-centered">
                <h1 class="title is-1 text-muted">Account banned</h1>
                <h2 class="subtitle is-6 text-muted">You have been banned with reason: <strong><?=$this->getSession('ban_reason')?></strong></h2>
                <p>
                    <a href="https://www.google.com" class="button is-success">
                        <span class="icon">
                            <svg viewBox="0 0 24 24">
                                <path fill="currentColor" d="M21.35,11.1H12.18V13.83H18.69C18.36,17.64 15.19,19.27 12.19,19.27C8.36,19.27 5,16.25 5,12C5,7.9 8.2,4.73 12.2,4.73C15.29,4.73 17.1,6.7 17.1,6.7L19,4.72C19,4.72 16.56,2 12.1,2C6.42,2 2.03,6.8 2.03,12C2.03,17.05 6.16,22 12.25,22C17.6,22 21.5,18.33 21.5,12.91C21.5,11.76 21.35,11.1 21.35,11.1V11.1Z" />
                            </svg>
                        </span>
                        <span>Google</span>
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
