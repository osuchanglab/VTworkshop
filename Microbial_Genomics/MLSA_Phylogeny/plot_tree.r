library(ape)
library(ggtree)
library(phangorn)
library(treeio)
library(ggplot2)
mytree<-read.iqtree("examplemlsa/examplemlsa.partition.treefile")@phylo
mytree<-phangorn::midpoint(mytree,node.labels='support')


pdf("examplemlsatree.pdf",width=8,height=9)
ggtree(mytree, layout="rectangular",size=1) + geom_tiplab(size=3, offset=0.01) + geom_tippoint(size=2) + geom_treescale() + xlim(0,0.2)
dev.off()
