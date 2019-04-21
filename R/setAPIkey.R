#' setAPIkey Barchart.
#' The setAPIkey is used to setup the Barchart API key.
#'
#' \code{setAPIkey} returns an xts.
#' The data has:
#' - Tot
#'
#' @author Mario Pisa
#' @param apikey required; Barchart API key
#' @param premium optional; default = FALSE
#' @return xts
#' @examples
#' setAPIkey(key = '<Your Barchart API key>')
#' setAPIkey(key = '<Your Barchart API key>', premium = TRUE)
#' @seealso \url{https://www.barchart.com/ondemand/api}
#' @export
setAPIkey <- function(apikey, premium = FALSE) {
   .apikey <<- apikey
   if (isTRUE(premium)) {
      .url <<- 'https://ondemand.websol.barchart.com/'
   } else {
      .url <<- 'https://marketdata.websol.barchart.com/'
   }
}
