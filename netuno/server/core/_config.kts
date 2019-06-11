
_config.set("_lang", _config.get("_lang:default"))

if (_config.getString("_env").equals("development")
    && (_url.equals("/") || _url.equals("/Index.netuno"))) {
    _config.set("_login:user", "dev")
    _config.set("_login:pass", "dev")
    _config.set("_login:auto", !_req.getString("action").equals("logout"))
}

/**
 * DISABLE BROWSER CACHE
 */

if (_url.isDownloadable()) {
    if (_config.getString("env").equals("development") && _url.indexOf("/public/scripts/main.js") > 0) {
        _header.noCache();
    } else {
        _header.cache(2628000);
    }
}
