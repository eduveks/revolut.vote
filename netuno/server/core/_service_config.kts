
// _core : results

if (_service.path == "create"
        || _service.path == "vote"
        || _service.path == "result"
        || _service.path == "confirmation") {
    if (_header.isOptions()) {
        _service.cancel()
        success()
    } else {
        _service.allow()
    }
}

/**
 * Cron Jobs
 */
if (_service.path.startsWith("jobs/")
        && _config.asValues("_cron:jobs")
                .find("name", _service.path.substring("jobs/".length))
                .asValues("params")
                .has("secret", _req.getString("secret"))) {
    _service.allow();
}
