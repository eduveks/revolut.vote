
val config = _config.asValues("_app:config").asValues("sms")

_log.info(config.getString("sid"))
_log.info("token".plus(config.getString("token")))

val sendSMS = _remote.init().asForm()
sendSMS.setAuthorization(
        config.getString("sid"),
        config.getString("token")
)
val sms = _val.init()
        .set("From", config.getString("from"))
        .set("To", "+351929143737")
        .set("Body", "kkkkk")
_out.json(
        sendSMS.post(
                """https://api.twilio.com/2010-04-01/Accounts/${ config.getString("sid") }/Messages.json""",
                sms
        )
)
