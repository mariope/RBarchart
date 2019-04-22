#' getQuoteEod Barchart data.
#'
#' \code{getQuoteEod} returns an data frame
#' The getQuoteEod API is used to request end-of-day price data,
#' by combined exchange and symbol, on stocks, indexes, mutual funds, ETFs,
#' futures, foreign exchange, or cryptocurrencies. Historical data is
#' available as tick, minute bars or end-of-day data.
#'
#' @author Mario Pisa
#' @param symbols required; An MIC code or a Country code plus the symbol or code that identifies a financial instrument. Multiple symbols separated by a comma may be used. For futures, notation such as for the active contract or for the first nearby is supported, as is for all futures contracts for a given root symbol. If no country code or MIC is passed then the API will behave the same as the getQuote API. Example XASE:SPY,US:IBM
#' @param exchange optional; The list of valid exchange codes to limit symbol search. Example NYSE,AMEX
#' @return data frame
#' @examples
#' \donttest{
#' getQuoteEod(symbols = 'XASE:SPY')
#' }
#' @seealso \url{https://www.barchart.com/ondemand/api/getQuoteEod}
#' @export
getQuoteEod <- function(symbols, exchange = NULL) {

   # if (!exists("apikey") | !exists("url")) {
   #    print("Please, exec setAPIkey(\"<Your API key>\", premium = FALSE) function")
   #    stop()
   # }

   query <- 'getQuoteEod.xml'
   getMethod <- paste0(getOption("url"),
                       query,
                       '?apikey=', getOption("apikey"),
                       '&symbols=', symbols,
                       '&exchange=', exchange)

   res <- httr::GET(getMethod)
   res_df <- XML::xmlToDataFrame(rawToChar(res$content))
   print(paste(res_df[[1, 'code']], res_df[[1, 'message']]))
   res_df <- res_df[-1, -c(1, 2)]
   return(res_df)

}
