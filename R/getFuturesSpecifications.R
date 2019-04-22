#' getFuturesSpecifications Barchart data.
#'
#' \code{getFuturesSpecifications} returns an data frame
#' Barchart OnDemand's getFuturesSpecifications API provides contract information such as trading hours, contract size and tick size for futures contracts.
#'
#' @author Mario Pisa
#' @param symbols optional; A symbol or code that identifies a financial instrument. Multiple symbols separated by a comma may be used. Example GC,CL
#' @param exchanges optional; The code for the exchange a group of financial instruments are listed on. Example COMEX,NYMEX
#' @param futuresCategory optional; Futures categories include: Energies, Financials, Grains, Indices, Meats, Metals, Softs and Currencies. Example energies,metals
#' @return data frame
#' @examples
#' \donttest{
#' getFuturesSpecifications(symbols = 'CL')
#' }
#' @seealso \url{https://www.barchart.com/ondemand/api/getFuturesSpecifications}
#' @export
getFuturesSpecifications <- function(symbols, exchanges = NULL, futuresCategory = NULL) {

   # if (!exists("apikey") | !exists("url")) {
   #    print("Please, exec setAPIkey(\"<Your API key>\", premium = FALSE) function")
   #    stop()
   # }

   query <- 'getFuturesSpecifications.xml'
   getMethod <- paste0(getOption("url"),
                       query,
                       '?apikey=', getOption("apikey"),
                       '&symbols=', symbols,
                       '&exchanges=', exchanges,
                       '&futuresCategory=', futuresCategory)

   res <- httr::GET(getMethod)
   res_df <- XML::xmlToDataFrame(rawToChar(res$content))
   print(paste(res_df[[1, 'code']], res_df[[1, 'message']]))
   res_df <- res_df[-1, -c(1, 2)]
   return(res_df)

}
