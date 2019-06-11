
fun success() {
    _header.status(200)
    _out.json(hashMapOf(
            "result" to true
    ))
}

fun badRequest() {
    _header.status(500)
    _out.json(hashMapOf(
            "result" to false,
            "error" to "bad-request"
    ))
}

fun invalidData() {
    _header.status(500)
    _out.json(hashMapOf(
            "result" to false,
            "error" to "invalid-data"
    ))
}

fun invalidDataOwner() {
    _header.status(500)
    _out.json(hashMapOf(
            "result" to false,
            "error" to "invalid-data-owner"
    ))
}

fun alreadyVoted() {
    _header.status(500)
    _out.json(hashMapOf(
            "result" to false,
            "error" to "already-voted"
    ))
}
