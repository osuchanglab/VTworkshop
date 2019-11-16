#!/bin/bash

~/Downloads/autoMLSA/autoMLSA.pl -email weisbeal@oregonstate.edu -runid examplemlsa -prog tblastn -local_db ./inputgenomes.fna -target 2000 -local_target 2000 -relaxed -threads 2 referencegenes.faa


#remote blast, but it runs faster if you download all the genomes first and make your own database
#~/Downloads/autoMLSA/autoMLSA.pl -entrez_query 'Agrobacterium[ORGANISM]' -remote refseq_genomic -email aweisberg@gmail.com -runid xanthomonasmlsa -nocomplete -prog blastn -local_db /nfs1/BPP/Chang_Lab/SCRI/sequenced_07_01_2019/db/fna/all/all.fna -target 2000 -local_target 2000 -relaxed -threads 24 reference/*fna
