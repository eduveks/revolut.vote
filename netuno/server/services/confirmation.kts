
// _core : mail
// _core : results

var valid = false

if (_req.hasKey("voting") && !_req.getString("voting").isEmpty()
        && _req.hasKey("locker") && !_req.getString("locker").isEmpty()) {
    valid = true
}

if (valid) {
    val voting = _db.queryFirst("""
        select * from voting where code = ?
        """, _req.getString("voting"))
    var locker = _req.getString("locker").toUpperCase();
    if (voting != null && locker.length == 4) {
        val owner = _db.queryFirst("""
            select * from participant where voting_id = ? and owner = true
            """, voting.getInt("id"))
        val ownerCode = owner.getString("code").toUpperCase()
        if (ownerCode.substring(0, 2) == locker.substring(0, 2)
                && ownerCode.substring(8) == locker.substring(2)) {
            _db.update("voting", voting.getInt("id"), hashMapOf(
                    "valid" to true
            ))
            Mail(
                    owner.getString("mail"),
                    "Votation Started: ".plus(voting.getString("title")),
                    """
                <h2>Your votation is ongoing.</h2>
                <p>Validated with success and the votation already started.</p>
                <p>All participants will be notified to vote.</p>
                <p>You can follow the results with this link:</p>
                <p><a href="https://www.revolut.vote/@/!${voting.getString("code")}">Click here to see the results!</a></p>
                """.trimIndent()
            ).send()
            success()
        } else {
            invalidDataOwner()
        }
    } else {
        invalidData()
    }
} else {
    badRequest()
}