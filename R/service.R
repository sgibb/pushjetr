#' @return complete service api URL
#' @noRd
.service <- function() {
  .api("service")
}

#' Create a pushjet.io service.
#'
#' @param name name of the service
#' @param icon icon of the service (default is the R-Project icon)
#' @return list with service information
#' @export
createService <- function(name, icon="https://www.r-project.org/favicon-32x32.png") {
  if (length(name) != 1L || !is.character(name) || nchar(name) <= 0L) {
    stop("Service name must be a valid character vector of length 1.")
  }
  .parseAnswer(POST(.service(), body=list(name=name, icon=icon),
                    encode="form", config=.ua()))$service
}

#' Get information about a pushjet.io service.
#'
#' @param secret secret key of service
#' @return list with service information
#' @export
serviceInfo <- function(secret=getOption("pushjetr.secret")) {
  .parseAnswer(GET(.service(), query=list(secret=secret), config=.ua()))$service
}

#' Remove pushjet.io service.
#'
#' @param secret secret key of service
#' @return TRUE/FALSE
#' @export
deleteService <- function(secret) {
  isTRUE(.parseAnswer(DELETE(.service(), body=list(secret=secret),
                             encode="form", config=.ua()))$status == "ok")
}
