
// _core : mail
// _core : sms

_log.info("Launch")

val voting = _db.queryFirst("select * from voting where valid = true and sent = false limit 1")

if (voting != null) {
    _log.info("Sending votation ${ voting.getInt("id") }")
    val participants = _db.query("""
            select * from participant where voting_id = ? and sent = false
            """, voting.getInt("id"))
    participants.forEach {
        val participant = _val.cast(it)
        _log.info("Sending to participant ${ participant.getInt("id") } - ${ participant.getString("mail") }")
        Mail(
                participant.getString("mail"),
                "Vote now to: ".plus(voting.getString("title")),
                """
                <h2>Your vote is required to:</h2>
                <p>${ voting.getString("title") }</p>
                <p>${ voting.getString("description") }</p>
                <p>You can vote with this link below:</p>
                <p><a href="https://www.revolut.vote/@/${ voting.getString("code") }@${ participant.getString("code") }">Click here to vote!</a></p>
                """.trimIndent()
        ).send()
        SMS(
                participant.getString("phone"),
                """
                You are invited to vote in:
                https://www.revolut.vote/@/${ voting.getString("code") }@${ participant.getString("code") }
            """.trimIndent()
        ).send()
        _db.update("participant", participant.getInt("id"), hashMapOf(
                "sent" to true
        ))
        "".toString()
    }
    _db.update("voting", voting.getInt("id"), hashMapOf(
            "sent" to true
    ))
}
