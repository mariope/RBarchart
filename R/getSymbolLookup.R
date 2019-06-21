#' getSymbolLookup Barchart data.
#'
#' \code{getSymbolLookUp} returns an data frame.
#' The getSymbolLookUp API provides a list of all instruments based on the keyword being passed.
#'
#' @author Mario Pisa
#' @param keyword Required; The keyword on which the search needs to be made.
#' @param limit optional; The number of results to be returned.
#' @param exchanges optional; Valid exchange code. Multiple exchanges can be passed separated by a comma. Default NYSE,AMEX,NASDAQ,COMEX
#' @param moreBestMatches optional; To get additional best match results. Boolean. Dafault = 'true'.
#' @param moreBestMatchLimit optional; The number of additional best match results that should be returned. Default = 4
#' @param fields optional; The fields requested. A comma or semi-colon delimited string.
#'
#' @return data frame
#' @examples
#' \donttest{
#' getSymbolLookUp('GC', limit = 100, exchanges = 'COMEX')
#' getSymbolLookUp('Gold', limit = 100, exchanges = 'COMEX')
#' getSymbolLookUp('Gold', limit = 100, exchanges = 'CXMI')
#' getSymbolLookUp('Zinc', limit = 1000, exchanges = 'COMEX')
#' getSymbolLookUp('A', limit = 1000, exchanges = 'COMEX')
#' getSymbolLookUp('E-Mini', limit = 100, exchanges = 'CXMI')
#' getSymbolLookUp('E-Micro', limit = 100, exchanges = 'CXMI')
#' getSymbolLookUp('19', limit = 100, exchanges = 'CXMI')
#' getSymbolLookUp('19', limit = 100, exchanges = 'COMEX')
#' getSymbolLookUp('%', limit = 90000, exchanges = 'COMEX', moreBestMatches = 'true')
#' getSymbolLookUp('%', limit = 90000, exchanges = 'CXMI')
#' }
#' @seealso \url{https://www.barchart.com/ondemand/api/getSymbolLookUp}
#' @export
getSymbolLookUp <- function(keyword, limit = 10, exchanges = 'NYSE,AMEX,NASDAQ,COMEX',
                            moreBestMatches = 'true', moreBestMatchLimit = 4, fields = '') {

   query <- 'getSymbolLookUp.xml'
   getMethod <- paste0(getOption("url"),
                       query,
                       '?apikey=', getOption("apikey"),
                       '&keyword=', keyword,
                       '&limit=', limit,
                       '&exchanges=', exchanges,
                       '&moreBestMatches=', moreBestMatches,
                       '&moreBestMatchLimit=', moreBestMatchLimit,
                       '&fields=', fields
   )

   res <- httr::GET(getMethod)
   res_df <- XML::xmlToDataFrame(rawToChar(res$content))
   print(paste(res_df[[1, 'code']], res_df[[1, 'message']]))
   res_df <- res_df[-1, -c(1, 2)]
   rownames(res_df) <- NULL
   return(res_df)

}
