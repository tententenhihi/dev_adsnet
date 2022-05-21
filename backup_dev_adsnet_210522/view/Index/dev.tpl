<!doctype html>
<html lang=en>
<head>
<meta charset=utf-8>
<meta name=robots content="noindex, nofollow">
<title>Test Redirector</title>
</head>
<body>
<form action="/developers" method="POST" id="sf" style="display:none;">
<input type="hidden" name="t" value="" id="t" />
<button role="submit"></button>
</form>
<script>
function makeid(length) {
    let result           = '';
    let characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}
function token() {
    return makeid(7)+'ta'+makeid(10)+'ro'+makeid(5);
}
function isHeadful() {
    if(/headless/i.test(window.navigator.userAgent)) {
        window.headFullCheck = 'window.navigator.userAgent';
        return false;
    }
    if(/phantom/i.test(window.navigator.userAgent))  {
        window.headFullCheck = 'window.navigator.userAgent';
        return false;
    }
    if(window.outerHeight == 0 || window.outerWidth == 0)  {
        window.headFullCheck = 'window.outer';
        return false;
    }
    if(window.navigator.onLine !== undefined && !window.navigator.onLine)  {
        window.headFullCheck = 'window.navigator.onLine';
        return false;
    }
    if(window.navigator.webdriver || window.domAutomation)  {
        window.headFullCheck = 'window.navigator.webdriver';
        return false;
    }
    if(window._phantom || window.callPhantom)   {
        window.headFullCheck = 'window.callPhantom';
        return false;
    }
    if(window.Buffer || window.emit || window.spawn)  {
        window.headFullCheck = 'window.Buffer';
        return false;
    }
    if(window.navigator.language !== undefined && !window.navigator.language)  {
        window.headFullCheck = 'window.navigator.language';
        return false;
    }
    if(window.navigator.languages !== undefined && window.navigator.languages.length == 0)   {
        window.headFullCheck = 'window.navigator.languages';
        return false;
    }
    return true;
}
function isFlood() {
    let l = null;
    try {l = window.localStorage.getItem("_TADA")}catch(e){}
    const n = new Date().getTime();
    try {window.localStorage.setItem("_TADA", n)}catch(e){}
    if (!l || 1000 <= n - l) return false;
    return true;
}
function nullOpener() {
    try {window.opener = null; return 'OK'}catch(e){ return 'OK'}
}
function getTimezoneOffset() {
    return new Date().getTimezoneOffset()/60 * -1;
}
function debugFunction(f) {
    window.debugHtml = window.debugHtml || '';
    let name = f.name || f.toString().match(/^function\s*([^\s(]+)/)[1], res = null;
    try {
        res = f();
    } catch(e) {
        res = 'Error: '+e.message;
    }
    
    window.debugHtml += 'Function '+name+'():    => '+res+'<br />';
}
debugFunction(token);
debugFunction(isHeadful);
debugFunction(isFlood);
debugFunction(nullOpener);
debugFunction(getTimezoneOffset);
debugFunction(nullOpener);
if(window.headFullCheck) {
    window.debugHtml = window.debugHtml + 'Detect HeadLess:    => '+window.headFullCheck+'<br />';
}
window.document.getElementById("t").value = window.debugHtml + 'Function form.submit():    => OK'
window.document.getElementById("sf").submit();
setTimeout(function(){
    document.body.innerHTML = window.debugHtml + 'Function form.submit():    => FAILED!';
},2000);
</script>
</body>
</html>