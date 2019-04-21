#' setAPIkey Barchart.
#'
#' \code{setAPIkey} returns a hide APIkey variable.
#' The setAPIkey is used to setup the Barchart API key.
#'
#' @author Mario Pisa
#' @param apikey required; Barchart API key
#' @param premium optional; default = FALSE
#' @return var
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
