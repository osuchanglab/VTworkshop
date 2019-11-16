#!/bin/bash

spades.py -o AS3D7_spades --phred-offset 33 --careful -1 ../Trim_Reads/AS3D7-bbduk-R1.fastq.gz -2 ../Trim_Reads/AS3D7-bbduk-R2.fastq.gz -t 2 -k 21,33,55,77,99

