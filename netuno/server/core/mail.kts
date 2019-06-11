
class Mail_(to: String, subject: String, content: String) {

    val to : String
    val subject : String
    val content : String

    init {
        this.to = to
        this.subject = subject
        this.content = content
    }

    fun send() {
        val smtp = _smtp.init()
        smtp.setTo(to)
        smtp.setFrom("noreply@revolut.vote")

        smtp.setSubject(subject)
        smtp.setHtml("""
            <div style="font-family: Arial, Verdana, sans-serif;">
            <div style="background-color: #0006c0; padding: 20px 50px; text-align: center;">
              <a href="https://www.revolut.vote/" style="text-decoration: none;"><img src="cid:logo" width="250" style="border: 0;" /></a>
            </div>
            <div style="padding: 50px; font-size: 16px;">
            ${content}
            </div>
            <div style="background-color: #0006c0; color: #ffffff; padding: 20px 50px; text-align: center;">
              <p>Powered by <a href="https://www.revolut.vote/" style="text-decoration: none; color: #ffffff;"><b>revolut.vote</b></a></p>
            </div>
            <div>
        """.trimIndent())
        smtp.attachment(
                "logo.png",
                "image/png",
                _storage.filesystem("server", "logo.png").file(),
                "logo"
        )
        try {
            smtp.send()
        } catch (e: Throwable) {
            _log.fatal("Fail sending mail to: ".plus(to))
        }
    }
}

fun Mail(to: String, subject: String, content: String) : Mail_ {
    return Mail_(to, subject, content)
}

/*
Mail("eduveks@gmail.com", "TEST Validate Your Votation", """
        <h2>Validate</h2>
        <p>To start your votation you must validate your mail clicking in this link below:</p>
        <p><a href="https://www.revolut.vote/"></a></p>
    """.trimIndent()).send()
 */