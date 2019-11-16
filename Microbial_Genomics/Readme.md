## Microbial comparative genomics

If you are running these from within the supplied virtual machine, 
open a terminal and go to the Workshop folder:
cd ~/Workshop

Otherwise these can be run from your own computer if the appropriate software is installed

## Initial Quality Control

# Check sequencing quality with FastQC
 cd Quality_Control/FastQC
 ./run_FastQC.sh

# Check reads for contamination with bbtools sendsketch
 cd Quality_Control/bbsketch
 ./makesketch_raw_reads.sh

# Trim reads for quality and remove adapters with bbduk
 cd Genome_Assembly/Trim_Reads
 ./run_bbduk_trim.sh

## Assembly and annotation

# Assembly with SPAdes
 cd Genome_Assembly/Assembly
 ./assemble_SPAdes.sh

# Check assembly size and statistics
 cd Quality_Control/genome_stats
 ./assemblathon.sh

# Quality check with Bandage
 cd Quality_Control/Bandage
 ./run_bandage.sh


# Check assembly for contamination with bbtools sendsketch
 cd Quality_Control/bbsketch

 # Check the species content of the overall assembly
 ./makesketch_assembly.sh

 # Check the species content for an example dataset with a known contaminant
 ./makesketch_assembly_contaminant.sh

 # Check the species content individually for each sequence in a file
 ./makesketch_assembly_indcontig.sh

# Check for contamination with blobtools
 cd Quality_Control/blobplot
 # requires having the NCBI nr database installed (see blobtools website for alternatives
 ./make_blobplot_contaminant.sh

# Annotate with prokka
 cd Genome_Assembly/Annotation
 # copy the assembled genome from the Assembly folder and rename the sequence IDs
 ./copy_genome.sh
 # annotate the genome with prokka
 ./annotate_prokka.sh

## Comparative genomics

# Average nucleotide identity (ANI)
 cd ./ANI
 
 #setup databases for fastANI and run fastANI for all comparisons
 ./setupfastANI.sh
 
 #convert the the ANI results from long pairwise format to a table
 Rscript ./finish_ani_table.r
 
 #sort the ANI table to cluster similar strains
 ./sort_anitable.sh
 
 #annotate the table with species group designations
 Rscript annotate_species.r

# Ortholog clustering
 
 # If you are running this from the virtual machine (downloaded from this github), you need to tell get_homologues to download
 # the Pfam database. You only need to do this once and if you attended the workshop you do not need to run it.
 ~/Downloads/get_homologues-x86_64-20190805/install.pl


 cd Pangenome
 #place the annotated genomes you wish to analyze in the genomes folder
 ./run_get_homologues.sh
 # final ortholog clusters are in ./genomes_homologues/genomes_nucl_OMCL/
 # pangenome matrixes and analyses are in the same folder (start with pangenome_matrix...)
 # Percentage of conserved proteins (POCP)
 get_homologues produces POCP output (-P option)
 file is ./genomes_homologues/   .POCP
 alternatively run autoPOCP
## Phylogenetic trees

# MLSA phylogeny
 cd ./MLSA_Phylogeny
 # make a blast database of your genomes to analyze. Can include genomes downloaded from NCBI too
 cat ./input_genomes/*.fna > inputgenomes.fna 
 makeblastdb -in inputgenomes.fna -dbtype nucl
 # run autoMLSA to  create concatenated gene alignment and partition with optimal models
 ./runmlsaall.sh
 # run iqtree to make a phylogenetic tree
 ./run_iqtree.sh
 Rscript plot_tree.r
