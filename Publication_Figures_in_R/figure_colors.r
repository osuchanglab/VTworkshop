library(RColorBrewer)

gg_color_hue <- function(n) {
  hues = seq(15, 375, length = n + 1)
  hcl(h = hues, l = 65, c = 100)[1:n]
}

#Ti/Ri plasmid colors
titypes<-c("TypeIa","TypeIb","TypeI", "TypeII", "TypeIII", "TypeIV", "TypeV", "RiTypeI","RiTypeII","RiTypeIII","TypeVI", "At", "chromid", "TypeIVa","TypeIVb","TypeIVc")
plasmidcolors<-c("#E41A1C", "#8B0000", brewer.pal(9,"Set1"), "darkturquoise", "seagreen1", "#6a3672", "#984EA3", "#c194c7")
names(plasmidcolors)<-titypes
#plasmidcolors
#barplot(rep(10,11), col=plasmidcolors)

#Species colors
specieslist<-c("G1","G4","G7","G7_Other","G8","G9","larrymoorei","rhizogenes","rubi","skierniewicense","vitis")
speciescolors<-gg_color_hue(11)
names(speciescolors)<-specieslist
#speciescolors
#barplot(rep(10,11), col=speciescolors)

#Biovar colors
biovarlist<-c("BiovarI","BiovarII","Brucella","BiovarIII","Rhizobium","Rhizobium_Other","Neorhizobium","Sinorhizobium-Ensifer","undicola","Mesorhizobium", "arsenijevicii", "G2", "blue", "black", "Ochrobactrum", "Shinella", "Aureimonas", "Martelella","rhizogenes-like")
biovarcolors<-c("#E41A1C","#4DAF4A","darkgreen","#377EB8","#04048C","cadetblue3","darkcyan","#984EA3","orchid","gray", "salmon", "purple", "blue", "black", "darkolivegreen1", "orange", "lightgoldenrod1", "pink", "dodgerblue3")
#biovarcolors<-c("#E41A1C","#4DAF4A","darkgreen","#377EB8","dodgerblue1","cadetblue3","darkcyan","#984EA3","orchid","gray", "salmon", "purple", "blue", "black", "green", "orange", "yellow", "pink")
names(biovarcolors)<-biovarlist
#biovarcolors

#Combined biovar/species colors
taxonomycolors<-c(speciescolors,biovarcolors)
#taxonomycolors
#barplot(rep(10,21), col=taxonomycolors)
