
// _core : sms
// _core : mail
// _core : results

var valid = false

if (_req.hasKey("title") && _req.hasKey("description")
        && _req.hasKey("phone") && _req.hasKey("mail")
        && _req.hasKey("participants")
        && !_req.getString("title").isEmpty()
        && !_req.getString("description").isEmpty()
        && !_req.getString("phone").isEmpty()
        && !_req.getString("mail").isEmpty()
        && _req.asValues("participants").sizeOfList() > 0
        && _req.asValues("options").sizeOfList() > 0) {
    valid = true
}

if (valid) {
    val randomStrings = _random.initString(10)
    val votingCode = randomStrings.toString()
    val votingId = _db.insert(
            "voting",
            hashMapOf(
                    "title" to _req.get("title"),
                    "description" to _req.get("description"),
                    "code" to votingCode,
                    "valid" to false,
                    "sent" to false
            )
    )

    _db.insert(
            "participant",
            hashMapOf(
                    "voting_id" to votingId,
                    "code" to randomStrings.toString(),
                    "phone" to _req.getString("phone"),
                    "mail" to _req.getString("mail"),
                    "owner" to true,
                    "sent" to false
            )
    )

    _req.asValues("participants").list().forEach {
        val item = _val.cast(it)
        _db.insert(
                "participant",
                hashMapOf(
                        "voting_id" to votingId,
                        "code" to randomStrings.toString(),
                        "phone" to item.getString("phone"),
                        "mail" to item.getString("mail"),
                        "owner" to false,
                        "sent" to false
                )
        )
    }

    _req.asValues("options").list().forEach {
        _db.insert(
                "option",
                hashMapOf(
                        "voting_id" to votingId,
                        "description" to "$it"
                )
        )
    }

    val owner = _db.queryFirst("""
            select * from participant where voting_id = ? and owner = true
            """, votingId)

    Mail(
            owner.getString("mail"),
            "Validation required to: ${ _req.get("title") }",
            """
                <h2>We need to check you are real and then your votation will start.</h2>
                <p>Confirm this mail by clicking in this link below and follow the instructions:</p>
                <p><a href="https://www.revolut.vote/@/~${ votingCode }">Click here to start your votation!</a></p>
                """.trimIndent()
    ).send()

    SMS(
            owner.getString("phone"),
            """
                Your confirmation code is:

                ${ owner.getString("code").substring(0, 2).toUpperCase() }${ owner.getString("code").substring(8).toUpperCase() }

                revolut.vote
            """.trimIndent()
    ).send()

    success()
} else {
    badRequest()
}
