#!/bin/bash

#This will not run without downloading the latest blast db
#Alternatively add --remote and change -db nt to run remotely but its slower
	blastn \
	-task megablast \
	-query ./example/contaminant.fasta \
	-db /myfolder/BlastDB/NCBI/lastest_blastdb/nt \
	-outfmt '6 qseqid staxids bitscore std sscinames sskingdoms stitle' \
	-culling_limit 5 \
	-evalue 1e-25 \
	-out contaminant.vs.nt.cul5.1e25.megablast.out


blobtools create -i examples/contaminant.fasta -y spades -t contaminant.vs.nt.cul5.1e25.megablast.out -o contaminant.blobjson.out
blobtools blobplot -i contaminant.blobjson.out.blobDB.json -o contaminant.blobplot --format png --rank genus 
blobtools view -i contaminant.blobjson.out.blobDB.json -o contaminant.blobtable --rank genus 
