#!/bin/bash

#make a list of input genomes to compare
ls -1 input_genomes/*fna > genomelist


#split the list into groups to compare (important for large datasets), second number is number of groups, ie 2)
mkdir splitdb
./splitDatabase.sh genomelist 2 splitdb


mkdir log
mkdir output

for DATABASE_PARTITION in `ls -1 ./splitdb/parti*`; do 
	for DATABASE_PARTITION2 in `ls -1 ./splitdb/parti*`; do 
  		i=`echo $DATABASE_PARTITION | sed 's/^.*partition\.//g'`
  		i2=`echo $DATABASE_PARTITION2 | sed 's/^.*partition\.//g'`
  		fastANI --ql $DATABASE_PARTITION --rl $DATABASE_PARTITION2 -t 8 -o ./output/${i}_vs_${i2}.output &> ./log/BATCH_OUTPUT_${i}_vs_${i2}
	done
done

#combine all output
echo -e "strain1	strain2	ani	matches	total: > allanivalues.out"
cat output/*.output | sort | uniq >> allanivalues.out
sed -i 's/input_genomes\///g;s/\.fna//g' allanivalues.out
