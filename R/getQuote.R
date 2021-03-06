#' getQuote Barchart data.
#'
#' \code{getQuote} returns an data frame
#' The getQuote API is used to request price data, either real-time,
#' delayed or end-of-day, by symbol on stocks, indexes, mutual funds, ETFs,
#' futures, foreign exchange, or cryptocurrencies.
#'
#' @author Mario Pisa
#' @param symbols Required; A symbol or code that identifies a financial instrument. Multiple symbols separated by a comma may be used. For futures, notation such as for the active contract or for the first nearby is supported, as is for all futures contracts for a given root symbol, as is for all options contracts for a given underlying futures symbol.
#' @param fields optional; The fields requested. Example fiftyTwoWkHigh,fiftyTwoWkHighDate,fiftyTwoWkLow,fiftyTwoWkLowDate
#' @param only optional; Returns only specified fields. Example symbol,name
#' @return data frame
#' @examples
#' \donttest{
#' getQuote(symbols = 'ESM19')
#' getQuote(symbols = 'NGM19,ESM19', fields = 'openInterest')
#' }
#' @seealso \url{https://www.barchart.com/ondemand/api/getQuote}
#' @export
getQuote <- function(symbols, fields = NULL, only = NULL) {

   # if (!exists("apikey") | !exists("url")) {
   #    print("Please, exec setAPIkey(\"<Your API key>\", premium = FALSE) function")
   #    stop()
   # }

   query <- 'getQuote.xml'
   getMethod <- paste0(getOption("url"),
                       query,
                       '?apikey=', getOption("apikey"),
                       '&symbols=', symbols,
                       '&fields=', fields,
                       '&only=', only)

   res <- httr::GET(getMethod)
   res_df <- XML::xmlToDataFrame(rawToChar(res$content))
   print(paste(res_df[[1, 'code']], res_df[[1, 'message']]))
   res_df <- res_df[-1, -c(1, 2)]
   return(res_df)

}
