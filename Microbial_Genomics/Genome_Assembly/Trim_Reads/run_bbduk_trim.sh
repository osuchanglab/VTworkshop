#!/bin/bash
bbduk.sh -Xmx1g overwrite=t in1=../../raw_reads/AS3D7_25_R1.fastq.gz in2=../../raw_reads/AS3D7_25_R2.fastq.gz out1=AS3D7-bbduk-R1.fastq.gz out2=AS3D7-bbduk-R2.fastq.gz ref=nextera.fa ktrim=r k=23 mink=9 hdist=1 minlength=100 tpe tbo
