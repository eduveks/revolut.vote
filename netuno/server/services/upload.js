
try {
    if (_req.hasKey('ficheiro')) {
        var file = _req.getFile('ficheiro')
        var storage = _storage.filesystem('serverXXX', file.getName())
        file.save(storage)
        _out.json({ result: true })
    } else {
        _out.json({ result: false })
    }
} catch (e) {
    _logger.error(e);
    _out.json({ result: false });
}
