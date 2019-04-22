#' getClosePrice Barchart data.
#'
#' \code{getClosePrice} returns an data frame
#' The getClosePrice API provides the close price for given instruments for the given date.
#'
#' @author Mario Pisa
#' @param symbols required; A symbol or code that identifies a financial instrument. Multiple symbols separated by a comma may be used. Example IBM,AAPL,GOOG
#' @param date optional; The date of the historical data query. The value should conform to the format yyyymmdd. Example 2010-01-01
#' @param splits optional; An adjustment of stock value due to corporate action. This parameter only applies to stocks and specifies whether the data returned should be adjusted for splits or not. Set to true to query for adjusted the data, or to false for non-adjusted data. Default 1. Example true
#' @param dividends optional; A distribution of a portion of a company's earnings. This parameter only applies to stocks and specifies whether the data returned should be adjusted for dividends or not. Set to true to query for adjusted the data, or to false for non-adjusted data. Default 1. Example true
#' @return data frame
#' @examples
#' \donttest{
#' getClosePrice(symbols = 'ESM19')
#' getClosePrice(symbols = 'NGM19,ESM19')
#' }
#' @seealso \url{https://www.barchart.com/ondemand/api/getFuturesExpirations}
#' @export
getClosePrice <- function(symbols, date = NULL, splits = 1, dividends = 1) {

   # if (!exists("apikey") | !exists("url")) {
   #    print("Please, exec setAPIkey(\"<Your API key>\", premium = FALSE) function")
   #    stop()
   # }

   query <- 'getClosePrice.xml'
   getMethod <- paste0(getOption("url"),
                       query,
                       '?apikey=', getOption("apikey"),
                       '&symbols=', symbols,
                       '&date=', date,
                       '&splits=', splits,
                       '&dividends=', dividends)

   res <- httr::GET(getMethod)
   res_df <- XML::xmlToDataFrame(rawToChar(res$content))
   print(paste(res_df[[1, 'code']], res_df[[1, 'message']]))
   res_df <- res_df[-1, -c(1, 2)]
   return(res_df)

}
