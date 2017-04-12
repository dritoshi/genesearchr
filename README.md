genesearchR
====

This R package can fast full-text searches NCBI RefSeq, UniProt-KB and
genome DNA sequence from
[GGRNA](http://ggrna.dbcls.jp/en/help.html)/[GGGenome](http://gggenome.dbcls.jp/en/)
and [G-links](http://link.g-language.org/) Web API.

## Install
Start R

    sudo R

Install packages
```{r}
source("http://bioconductor.org/biocLite.R")
biocLite("GenomicRanges")
    
install.packages("devtools")
install.packages("roxygen2")

library(devtools)
install_github("dritoshi/genesearchr")
```

## Usage
```{r}
library("genesearchr")

## RefSeq
my.hs.gene <- refSeqSearch(query = "NM_001518", species = "hs")
my.mm.gene <- refSeqSearch(query = "homeobox",  species = "mm")

## UniProt-KB
my.gid.gene <- uniprotSearch(query = "GeneID:93986")
my.eco.gene <- uniprotSearch(query = "eco:b2699")

## Genome DNA Sequence
my.mm10.dna <- genomeSearch(query = "TTCATTGACAACATTGCGT", db = "mm10", k = 2)
```

### Search operator
* [G-links](http://link.g-language.org/), UniProt-KB search
* [GGRNA](http://ggrna.dbcls.jp/en/help.html), RefSeq search
* [GGGenome](http://gggenome.dbcls.jp/en/help.html), Ultrafast
sequence search

## Licence

[MIT](https://github.com/dritoshi/orenogb/blob/master/LICENCE)

## Author

[dritoshi](https://github.com/dritoshi)
