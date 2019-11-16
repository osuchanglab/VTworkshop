#!/bin/bash
echo "Contaminated genome:"
sendsketch.sh in=./examples/contaminant.fasta

echo "Contaminated genome (per sequence)"
sendsketch.sh in=./examples/contaminant.fasta mode=sequence
