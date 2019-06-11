
if (!_out.isClosed()) {
    _out.print(
            "### SERVER ERROR ###"
    )
    /*
    // Is insecure but the code below will print errors with more details...
    _out.print(
            "SERVER ERROR # "
            .plus(_error.getString("file"))
            .plus(":")
            .plus(_error.getString("line"))
            .plus(" # ")
            .plus(_error.getString("message"))
    )
     */
}
