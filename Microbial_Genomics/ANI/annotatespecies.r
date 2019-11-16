library(igraph)
library(dplyr)
library(tidyr)
mywidetab<-read.table("allanivalues.table.out.sorted.txt",sep="\t",header=T,stringsAsFactors=F)

#convert to long format
mylongtab<-gather(mywidetab,strain2,ani,-one_of("strain"))
head(mylongtab)
#find all ANI values > 95% indicating same species group
mylongtabspecies<-mylongtab[mylongtab$ani >= 95,]
mylongtabspecies$ani<-NULL
mylongtabspecies$matches<-NULL
mylongtabspecies$total<-NULL

#create a graph connecting all strains with >95% ANI
speciesgraph<-graph_from_data_frame(mylongtabspecies, directed=F)

#clusters include strains in the same species (inclusive)
cl <- clusters(speciesgraph)
cl$membership
mywidetab$species<-cl$membership[mywidetab$strain]
write.table(mywidetab,file="allcombined.table.sorted.species.out",sep="\t",quote=F,row.names=F)
