#' getFuturesExpirations Barchart data.
#'
#' \code{getFuturesExpirations} returns an data frame
#' The getFuturesExpiration API from Barchart OnDemand provides first notice and last trade dates for futures contracts.
#'
#' @author Mario Pisa
#' @param roots optional; A symbol or code that identifies a futures root. Example ZC,ZS
#' @param contracts optional; A symbol or code that identifies a futures contract.
#' @return data frame
#' @examples
#' \donttest{
#' getFuturesExpirations(roots = 'ES')
#' getFuturesExpirations(contracts = 'NGM19,ESM19')
#' }
#' @seealso \url{https://www.barchart.com/ondemand/api/getFuturesExpirations}
#' @export
getFuturesExpirations <- function(roots = NULL, contracts = NULL) {

   # if (!exists("apikey") | !exists("url")) {
   #    print("Please, exec setAPIkey(\"<Your API key>\", premium = FALSE) function")
   #    stop()
   # }

   query <- 'getFuturesExpirations.xml'
   getMethod <- paste0(getOption("url"),
                       query,
                       '?apikey=', getOption("apikey"),
                       '&roots=', roots,
                       '&contracts=', contracts)

   res <- httr::GET(getMethod)
   res_df <- XML::xmlToDataFrame(rawToChar(res$content))
   print(paste(res_df[[1, 'code']], res_df[[1, 'message']]))
   res_df <- res_df[-1, -c(1, 2)]
   return(res_df)

}
