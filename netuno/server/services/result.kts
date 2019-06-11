
// core : results

var valid = false

if (_req.hasKey("voting") && !_req.getString("voting").isEmpty()) {
    valid = true
}

if (valid) {
    val dbVoting = _db.queryFirst("select * from voting where code = ?", listOf(
            _req.getString("voting")
    ))
    if (dbVoting != null) {
        val dbOptions = _db.query("""
            select *, (
                select count(vote.id) from vote where vote.option_id = option.id
            ) as total
            from option where voting_id = ?
            order by total desc
            """, listOf(
                dbVoting.getInt("id")
        ))
        if (dbOptions.size > 0) {
            val result = _val.init()
            result.set("voting", _val.init()
                    .set("title", dbVoting.getString("title"))
                    .set("description", dbVoting.getString("description"))
            )
            val options = _val.init()
            dbOptions.forEach {
                val option = _val.cast(it)
                options.add(_val.init()
                        .set("uid", option.getString("uid"))
                        .set("description", option.getString("description"))
                        .set("total", option.getInt("total"))
                )
            }
            result.set("options", options)
            _out.json(result)
        } else {
            invalidData()
        }
    } else {
        invalidData()
    }
} else {
    badRequest()
}
