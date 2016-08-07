#' Send a message via pushjet.io
#'
#' This function sends a message using the pushjet.io API.
#'
#' @param msg message
#' @param title message title
#' @param level the importance level from 1(low) to 5(high)
#' @param secret channel secret
#' @return TRUE/FALSE
#' @export
pjmsg <- pushjet <- function(msg, title=NULL, level=3L, secret=getOption("pushjetr.secret")) {
  if (!is.character(msg) || nchar(msg) <= 0L) {
    stop("Message name must be a character vector.")
  }
  isTRUE(.parseAnswer(POST(.api("message"), body=list(secret=secret, message=msg,
                                                      title=title, level=level),
                           encode="form", config=.ua()))$status == "ok")
}
