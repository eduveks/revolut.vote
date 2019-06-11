
class SMS_(to: String, content: String) {

    val to : String
    val content : String

    init {
        this.to = to
        this.content = content
    }

    fun send() {
        val config = _config.asValues("_app:config").asValues("sms")

        if (!config.getBoolean("enabled")) {
            return;
        }

        val sendSMS = _remote.init().asForm()
        sendSMS.setAuthorization(
                config.getString("sid"),
                config.getString("token")
        )
        val sms = _val.init()
                .set("From", config.getString("from"))
                .set("To", to)
                .set("Body", content)
        sendSMS.post(
                """https://api.twilio.com/2010-04-01/Accounts/${ config.getString("sid") }/Messages.json""",
                sms
        )
    }
}

fun SMS(to: String, content: String): SMS_ {
    return SMS_(to, content)
}
