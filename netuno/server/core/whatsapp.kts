
class WhatsApp {

    /**
        TO whatsapp numbers must starts with "whatsapp:" like:

            whatsapp:+15017122661

        cURL sample:

        curl -X POST https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages.json \
        --data-urlencode "Body=This is the ship that made the Kessel Run in fourteen parsecs?" \
        --data-urlencode "From=+15017122661" \
        --data-urlencode "To=+15558675310" \
        -u ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:your_auth_token
     */

    // TEST
    // SID AC20d07b3212dbfccb67839cbe91c86728
    // TOKEN 8719d436e104f8751df51dc8e9c32f10

    // PROD
    // SID ACe5711712db845f39bd8d6430f70b7d7e
    // TOKEN 453a29c9f3bdaab6ba19b425b9fa6569

        /*

    // +37123233033

    curl -X POST https://api.twilio.com/2010-04-01/Accounts/ACe5711712db845f39bd8d6430f70b7d7e/Messages.json \
    --data-urlencode "From=+37123233033" \
    --data-urlencode "Body=Hello there..." \
    --data-urlencode "To=+351929143737" \
    -u ACe5711712db845f39bd8d6430f70b7d7e:453a29c9f3bdaab6ba19b425b9fa6569

    */

    /* send(to: String, content: String) {
        val sendSMS = _remote.init()
        sendSMS.setAuthorization("Bearer YOUR_TOKEN")
        val sms = _val.init()
            .set("From", "Revolut.Vote")
            .set("To", to)
            .set("Text", content)
        _out.json(
            sendSMS.post("https://api.mailjet.com/v4/sms-send", sms)
        )
    } */
}
