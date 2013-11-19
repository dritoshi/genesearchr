\name{genomeSearch}
\alias{genomeSearch}
\title{Get genome sequence from GGGenome}
\usage{
  genomeSearch(query, db, k)
}
\arguments{
  \item{query}{DNA sequence (character)}

  \item{db}{genome name (character) hg19, mm10, rn5,
  galGal4, xenTro3, danRer7, ci2, dm3, ce10, TAIR10, rice,
  bmor1, refseq, ddbj}

  \item{k}{Maximum number of mismatches/gaps. (default: 0)
  (numeric vecter)}
}
\value{
  A GRanges Object
}
\description{
  This function queries DNA sequence from GGGenome.
}
\details{
  Search operators: See
  http://gggenome.dbcls.jp/en/help.html

  Species: \itemize{ \item Human: "hs19" \item Mouse:
  "mm10" \item Rat: "rn5" \item Chicken: "galGal4" \item
  Frog: "xenTro3" \item Zebrafish: "danRer7" \item Sea
  squirt: "ci2" \item Fly: "dm3" \item Worm: "ce10" \item
  Arabidopsis: "TAIR10" \item Rice: "rice" \item RefSeq:
  "refseq" \item DDBJ: "ddbj" }
}
\examples{
my.mm10.dna <- genomeSearch(query = "TTCATTGACAACATTGCGT", db = "mm10", k = 2)
}

