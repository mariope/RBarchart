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
#' \donttest{
#' setAPIkey(apikey = '<Your Barchart API key>')
#' setAPIkey(apikey = '<Your Barchart API key>', premium = TRUE)
#' }
#' @seealso \url{https://www.barchart.com/ondemand/api}
#' @export
setAPIkey <- function(apikey, premium = FALSE) {

   if (!missing(apikey)) {
      options(apikey = apikey)
   }
   invisible(getOption("apikey"))

   if (isTRUE(premium)) {
      options(url = 'https://ondemand.websol.barchart.com/')
   } else {
      options(url = 'https://marketdata.websol.barchart.com/')
   }
   invisible(getOption("url"))
}
