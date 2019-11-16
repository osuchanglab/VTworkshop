source("./figure_colors.r")
library(ape)
library(heatmap.plus)
library(gplots)
library(RColorBrewer)


plasmidtable <- read.table("./plasmidtypes.txt", sep = "\t", header=T, stringsAsFactors = F, quote = "")

pangenome <- read.table("./pangenome_matrix_t0_renamed.names.tab", sep = "\t", header=T, stringsAsFactors = F)
row.names(pangenome) <- pangenome$strain
pangenome$strain <- NULL

#convert values above 1 (multi-copy) to 1 (gene presence)
pangenome[pangenome > 0] <- 1

#select only genes found in 3 or more plasmids to simplify
pangenome <- pangenome[, which(colSums(pangenome) > 2)]


#cluster plasmids (rows) based on gene ortholog content
row_distance = dist(pangenome, method = "binary")
row_cluster = hclust(row_distance, method = "ward.D2")

#cluster columns (ortholog groups) into groups
col_distance = dist(t(pangenome), method="binary")
col_cluster = hclust(col_distance, method="ward.D2")

pangenome_col <- pangenome[,order(colSums(pangenome),decreasing = TRUE)]


plasmidtaxa<- data.frame(Isolate = plasmidtable$sample, PlasmidType = plasmidtable$subtype)
plasmidtaxa_ordered <- plasmidtaxa[match(row.names(pangenome), plasmidtaxa$Isolate),]
plasmidtypecolors <- as.data.frame(cbind(names(plasmidcolors),plasmidcolors)) 
colnames(plasmidtypecolors)<-c("type","color")
plasmidtaxa_ordered_color <- merge(plasmidtaxa_ordered,plasmidtypecolors,by.x="PlasmidType",by.y="type",all.x=TRUE)

plasmidcol_ordered <- plasmidtaxa_ordered_color[match(row.names(pangenome), plasmidtaxa_ordered_color$Isolate),]

plasmidcol<-plasmidcol_ordered$color
mycols<-cbind(as.character(plasmidcol),as.character(plasmidcol))

pdf("Figure_plasmidheatmap.pdf",width=12,height=12)
heatmap.plus(as.matrix(pangenome_col), col = c("white", "blue"), Rowv = as.dendrogram(row_cluster), RowSideColors = mycols,scale="none", labCol=NA, Colv=NA, useRaster=TRUE)
legend(x="topleft",legend=plasmidtypecolors$type, fill=as.character(plasmidtypecolors$color), border=FALSE, bty="n", y.intersp = 0.7, cex=0.7)
dev.off()
