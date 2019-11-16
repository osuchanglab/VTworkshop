library(tidyr)

#read in the long-format table of ani values
mylongtab<-read.table("allanivalues.out",sep="\t",stringsAsFactors=F,header=T)

#remove unneccessary columns
mylongtab$matches <- NULL
mylongtab$total <- NULL

#spread to wide format table using tidyr, add missing values as 0 (fastANI doesnt output <80% ANI)
mywidetab<-spread(mylongtab,strain2,ani,fill=0)

#write output to a file
write.table(mywidetab,file="allanivalues.table.out", sep="\t",quote=F,row.names=F)

