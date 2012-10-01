\name{uniprotSearch}
\alias{uniprotSearch}
\title{Get various gene annotation of UniProt-KB from G-links}
\usage{
  uniprotSearch(query)
}
\arguments{
  \item{query}{keyword (vector)}
}
\value{
  A data frame
}
\description{
  This function queries various information of UniProt-KB
  from G-links
}
\details{
  Search operators: See http://www.g-language.org/wiki/rest
}
\examples{
my.gid.gene <- uniprotSearch(query = "GeneID:93986")
my.eco.gene <- uniprotSearch(query = "eco:b2699")
}

