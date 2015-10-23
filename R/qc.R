fname_f <- function(sn, quality_f) {
    paste("raw_fastq", "htqc", sn, quality_f, sep="/")
}
#samples <- c("L1", "L2", "L3", "NL1", "NL2", "NL3")
sgroups <- c("L", "NL")
samples <- as.vector(sapply(sgroups, paste0, seq(1,3)))
q1.fname <- sapply(samples, function(x) fname_f(x, "cycle_quality_1.tab"))
q2.fname <- sapply(samples, function(x) fname_f(x, "cycle_quality_2.tab"))

q1.list <- vector("list", length(samples))
q2.list <- vector("list", length(samples))
for (i in seq(1, 6)) {
    q1 <- read.table(q1.fname[i], header=TRUE, row.names=1, sep="\t")
    colnames(q1) <- paste("Q", seq(0, 41), sep="")
	q1.list[[i]] <- colSums(q1)
    q2 <- read.table(q2.fname[i], header=TRUE, row.names=1, sep="\t")
    colnames(q2) <- paste("Q", seq(0, 41), sep="")
	q2.list[[i]] <- colSums(q2)
}
