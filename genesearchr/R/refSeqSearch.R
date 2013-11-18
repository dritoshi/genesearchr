#' Full-text search in NCBI RefSeq and/or UniProt-KB
#' 
#' This R package can search NCBI RefSeq and UniProt-KB
#' from R using GGRNA and G-links Web API
#' 
#' @name genesearchr
#' @docType package
#' @aliases GeneSearchr package-genesearchr genesearch
#'
#' @references Yuki Naito & Hidemasa Bono (2012)
#' GGRNA: an ultrafast, transcript-oriented search engine
#' for genes and transcripts. Nucleic Acids Res. 40, W592-W596.
#'
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

#' Get genome sequence from GGGenome
#'
#' This function queries DNA sequence from GGGenome.
#'
#' @usage genomeSearch(query, db, k)
#' @param query DNA sequence (character)
#' @param db genome name (character)
#'   hg19, mm10, rn5, galGal4, xenTro3, danRer7, ci2, dm3, 
#'   ce10, TAIR10, rice, bmor1, refseq, ddbj
#' @param k Maximum number of mismatches/gaps. (default: 0) (numeric vecter)
#'
#' @return A GRanges Object
#'
#' @export
#'
#' @details
#' Search operators:
#' See http://gggenome.dbcls.jp/en/help.html
#'
#' Species:
#' \itemize{
#'   \item Human:       "hs19"
#'   \item Mouse:       "mm10"
#'   \item Rat:         "rn5"
#'   \item Chicken:     "galGal4"
#'   \item Frog:        "xenTro3"
#'   \item Zebrafish:   "danRer7"
#'   \item Sea squirt:  "ci2"
#'   \item Fly:         "dm3"
#'   \item Worm:        "ce10"
#'   \item Arabidopsis: "TAIR10"
#'   \item Rice:        "rice"
#'   \item RefSeq:      "refseq"
#'   \item DDBJ:        "ddbj"
#' }
#'
#' @examples
#' my.mm10.dna <- genomeSearch(query = "TTCATTGACAACATTGCGT", db = "mm10", k = 2)
genomeSearch <- function(query = query, db = species, k = 0) {

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
  url    = "http://GGGenome.dbcls.jp/"
  format = ".txt"
  url = paste0(url, db, "/", k, "/", query.string, format)
  cat(url, "\n")

  x <- read.table(url, sep = "\t", header = F)
  x <- GRanges(
    seqnames = x[,1],
    strand   = x[,2],
    ranges   = IRanges(start = x[,3], end = x[,4]),
    sequence = x[,5]
  )
  
  return(x)
}
