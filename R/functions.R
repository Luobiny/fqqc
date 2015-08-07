#' This function returns the phred quality scores for a read
#' Assume the FastqSanger format of FastQ file.
#'
#' @param x : an object of the class ShortReadQ
#' @return The quality score in numeric format for the first read
#'          in \code{x}
phred_q <- function(x) {
    strtoi(charToRaw(as.character(quality(x)[[1]])), 16L) - 33
}

#' Convert the phred quality score (fastq-sanger) from ASCII encoded value to
#' actually numeric value.
#'
#' @export
#'
#' @param x a vector or something coercible to this by as.character, which
#'   contains the ASCII encoded quality score
#' @return The numeric value of quality score
#' @examples
#' strtoq(c('A', 'D', '['))
strtoq<-function(x) {
    strtoi(x, 16L) - 33
}

#fastq_quality_raw<-function(x){
#    as.character(quality(quality(x)))
#}

# Return the quality score as a list.
#' @export
fastq_qlist=function(x) {
    lapply(lapply(as.character(quality(quality(x))), charToRaw), strtoq)
}

fastq_qlist_mc=function(x) {
    mclapply(mclapply(as.character(quality(quality(x))), charToRaw), strtoq)
}

barplot_qv=function(x,col="darkcyan") {
    barplot(x,ylim=c(0,40),space=0,col=col,names.arg=seq(1,length(x),1),cex.names=0.4,axis.lty=1,cex=0.6, border=c("white"), xlim=c(0,length(x)-1))
}
