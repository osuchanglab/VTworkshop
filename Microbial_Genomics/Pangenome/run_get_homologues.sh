#!/bin/bash

#run get_homologues to perform all-by-all blast (or diamond) and then cluster with MCL
/home/osboxes/Downloads/get_homologues-x86_64-20190805/get_homologues.pl -X -d ./genomes -n 1 -M -t 0 -r Afa_C58.gbk -s -P 

#generate cluster files in fasta format for nucleotide sequences (remove -n for protein)
/home/osboxes/Downloads/get_homologues-x86_64-20190805/compare_clusters.pl -d ./genomes_homologues/AfaC58_dmd_f0_0taxa_algOMCL_e0_ -o ./genomes_homologues/genomes_nucl_OMCL -m -T -n

#perform core gene analysis
/home/osboxes/Downloads/get_homologues-x86_64-20190805/parse_pangenome_matrix.pl -m ./genomes_homologues/genomes_nucl_OMCL/pangenome_matrix_t0.tab -s 
