
// _core : results
// _core : mail

var valid = false
var validVoting = false

if (_req.hasKey("voting") && !_req.getString("voting").isEmpty()
        && _req.hasKey("participant") && !_req.getString("participant").isEmpty()
        && _req.hasKey("option") && !_req.getString("option").isEmpty()) {
    valid = true
} else if (_req.hasKey("voting") && !_req.getString("voting").isEmpty()) {
    validVoting = true
}

if (valid) {
    val voting = _db.queryFirst("select * from voting where code = ?", listOf(
            _req.getString("voting")
    ))
    val option = _db.queryFirst("select * from option where voting_id = ? and uid = ?::uuid", listOf(
            voting.getInt("id"),
            _req.getString("option")
    ))
    val participant = _db.queryFirst("select * from participant where voting_id = ? and code = ?", listOf(
            voting.getInt("id"),
            _req.getString("participant")
    ))
    if (voting != null && option != null && participant != null) {
        val vote = _db.queryFirst("""
            select * from vote
            where voting_id = ? and participant_id = ?
            """, listOf(
                voting.getInt("id"),
                participant.getInt("id")
                ))
        if (vote == null) {
            val votingId = _db.insert(
                    "vote",
                    hashMapOf(
                            "voting_id" to voting.getInt("id"),
                            "option_id" to option.getInt("id"),
                            "participant_id" to participant.getInt("id")
                    )
            )
            Mail(
                    participant.getString("mail"),
                    "Your vote to: ".plus(voting.getString("title")),
                    """
                <h2>Your vote has been registered successfully.</h2>
                <p>You can follow the results with this link:</p>
                <p><a href="https://www.revolut.vote/@/!${voting.getString("code")}">Click here to see the results!</a></p>
                <p>Thank you.</p>
                """.trimIndent()
            ).send()
            success()
        } else {
            alreadyVoted()
        }
    } else {
        invalidData()
    }
} else if (validVoting) {
    val voting = _db.queryFirst("select * from voting where code = ?", listOf(
            _req.getString("voting")
    ))
    if (voting != null) {
        val dbOptions = _db.query("select * from option where voting_id = ?", listOf(
                voting.getInt("id")
        ))
        val options = _val.init()
        dbOptions.forEach {
            var option = _val.cast(it)
            options.add(_val.init()
                    .set("uid", option.getString("uid"))
                    .set("description", option.getString("description"))
            )
        }
        _out.json(hashMapOf(
                "title" to voting.getString("title"),
                "description" to voting.getString("description"),
                "options" to options
        ))
    } else {
        invalidData()
    }
} else {
    badRequest()
}
