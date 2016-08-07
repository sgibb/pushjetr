#' @param path api path
#' @return complete api URL
#' @noRd
.api <- function(path) {
  paste(getOption("pushjetr.server"), path, sep="/")
}

#' @return user agent
#' @noRd
.ua <- function() {
  user_agent("pushjetr")
}

#' @noRd
.parseAnswer <- function(x) {
  if (http_type(x) != "application/json") {
    stop(.api(), " did not return json.", call.=FALSE)
  }

  answer <- fromJSON(content(x, "text", encoding="utf-8"), simplifyVector=FALSE)

  if (http_error(x)) {
    stop(
      sprintf(
        "%s request failed [%s]\n%s\n<%s>",
        .api(),
        status_code(x),
        answer$message,
        answer$documentation_url
      ),
      call.=FALSE
    )
  }
  answer
}
