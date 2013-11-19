\name{refSeqSearch}
\alias{refSeqSearch}
\title{Get various gene annotation of NCBI RefSeq from GGRNA}
\usage{
  refSeqSearch(query, species)
}
\arguments{
  \item{query}{keyword or phrase (vector)}

  \item{species}{Human: "hs", Mouse: "Mm", Rat: "Rn" and so
  on.}
}
\value{
  A data frame
}
\description{
  This function queries various information of RefSeq from
  GGRNA.
}
\details{
  Search operators: See http://ggrna.dbcls.jp/en/help.html

  Species: \itemize{ \item Human: "hs" \item Mouse: "mm"
  \item Rat: "rn" \item Chicken: "gg" \item Frog: "xt"
  \item Zebrafish: "dr" \item Sea squirt: "ci" \item Fly:
  "dm" \item Worm: "ce" \item Arabidopsis: "at" \item Rice:
  "os" \item S. cerevisiae: "sc" \item S. pombe: "sp" }
}
\examples{
my.hs.gene <- refSeqSearch(query = "NM_001518", species = "hs")
my.mm.gene <- refSeqSearch(query = "homeobox",  species = "mm")
# my.dm.gene <- refSeqSearch(query = "RNA interference", species = "dm")
}

