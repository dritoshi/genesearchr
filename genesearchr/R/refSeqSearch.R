#' Full-text search in NCBI RefSeq and/or UniProt-KB
#' 
#' This R package can search NCBI RefSeq and UniProt-KB
#' from R using GGRNA and G-links Web API
#' 
#' @name genesearchr
#' @docType package
#' @aliases GeneSearchr package-genesearchr genesearch
#' @references Yuki Naito & Hidemasa Bono (2012)
#' GGRNA: an ultrafast, transcript-oriented search engine 
#' for genes and transcripts. Nucleic Acids Res. 40, W592-W596.
#' @references Kazuharu Arakawa. G-Links is a rapid data "broker" 
#' service that collects and adds related information 
#' to a given gene (or gene set). http://link.g-language.org/
#'
NULL

#' Get various gene annotation of NCBI RefSeq from GGRNA
#'
#' This function queries various information of RefSeq 
#' from GGRNA.
#'
#' @usage refSeqSearch(query, species)
#' @param query keyword or phrase (vector)
#' @param species Human: "hs", Mouse: "Mm", Rat: "Rn" and so on.
#'
#' @return A data frame
#'
#' @export
#'
#' @details
#' Search operators:
#' See http://ggrna.dbcls.jp/en/help.html
#'
#' Species:
#' \itemize{
#'   \item Human:         "hs"
#'   \item Mouse:         "mm"
#'   \item Rat:           "rn"
#'   \item Chicken:       "gg"
#'   \item Frog:          "xt"
#'   \item Zebrafish:     "dr"
#'   \item Sea squirt:    "ci"
#'   \item Fly:           "dm"
#'   \item Worm:          "ce"
#'   \item Arabidopsis:   "at"
#'   \item Rice:          "os"
#'   \item S. cerevisiae: "sc"
#'   \item S. pombe:      "sp"
#' }
#'
#' @examples
#' my.hs.gene <- refSeqSearch(query = "NM_001518", species = "hs")
#' my.mm.gene <- refSeqSearch(query = "homeobox",  species = "mm")
#' # my.dm.gene <- refSeqSearch(query = "RNA interference", species = "dm")
refSeqSearch <- function(query = query, species = species) {

  ## build a query string
  # phrase searching

  if ( identical(integer(0), grep(" ", query)) ) {
    query.string <- query
  } else {
    query.string <- paste0('%20', query, '%20')    
    query.string <- sub(" ", "+", query.string)
  }
  cat(query.string, "\n")

  ## searching
  url    = "http://GGRNA.dbcls.jp/api/"
  format = ".txt"
  url = paste0(url, species, "/", query.string, format)
  cat(url, "\n")

  x <- read.table(url, sep = "\t", header = F)
  
  return(x)
}

#' Get various gene annotation of UniProt-KB from G-links
#'
#' This function queries various information of UniProt-KB 
#' from G-links
#'
#' @usage uniprotSearch(query)
#' @param query keyword (vector)
#'
#' @return A data frame
#'
#' @export
#'
#' @details
#' Search operators:
#' See http://www.g-language.org/wiki/rest
#'
#' @examples
#' my.gid.gene <- uniprotSearch(query = "GeneID:93986")
#' my.eco.gene <- uniprotSearch(query = "eco:b2699")
uniprotSearch <- function(query = query) {

  ## build a query string
  # phrase searching

  if ( identical(integer(0), grep(" ", query)) ) {
    query.string <- query
  } else {
    cat("See search operators. http://www.g-language.org/wiki/rest\n")
    return("")
  }
  cat(query.string, "\n")

  ## searching
  url    = "http://link.g-language.org/"
  format = "/format=txt"
  url = paste0(url, query.string, format)
  cat(url, "\n")

  x <- read.table(url, sep = "\t", header = F)
  #x <- ""
  
  return(x)
}