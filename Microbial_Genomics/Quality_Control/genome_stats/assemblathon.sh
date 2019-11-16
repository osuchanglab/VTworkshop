#!/bin/bash
search=$1
if [ ! "$search" ]; then
	search=".fna"
fi
for file in `ls *$search`; do
	if [ -e "$file.stats" ]; then
		continue
	fi
	/nfs1/BPP/Chang_Lab/SCRI/Agrobacterium/sequencing/processing_scripts/assemblathon_stats.pl -n 10 $file > $file.stats
done
