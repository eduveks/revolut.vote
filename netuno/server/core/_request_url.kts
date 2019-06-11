
// _out.println(_request_url);


/**
 *  ALLOW CORS
 */

if (_config.getString("_env").equals("development")) {
    _header.response.set("Access-Control-Allow-Origin", "http://localhost:8099")
} else {
    _header.response.set("Access-Control-Allow-Origin", "https://www.revolut.vote")
}
_header.response.set("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS")
_header.response.set("Access-Control-Allow-Headers", "content-type,x-requested-with")
//_header.response.set("Access-Control-Allow-Credentials", true)

_exec.bind("request_url", _request_url)
