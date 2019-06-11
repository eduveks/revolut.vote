
_log.fatal("""

 #
 # Service ${_service.path}:
 #
 # ${_error.getString("message")}
 # ${_error.getString("innerMessages")}
 #
""")

/*
_log.fatal("""

SERVICE ERROR

Path: ${_service.path}
Line: ${_script.asValues("error").getString("line")}
Column: ${_script.asValues("error").getString("column")}
Message:
${_script.asValues("error").getString("message")}

    """,
        _convert.toThrowable(
                _script.asValues("error").get("throwable")
        )
)
*/
