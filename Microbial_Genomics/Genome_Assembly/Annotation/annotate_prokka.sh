#!/bin/bash

prokka --prefix AS3D7_prokka --locustag AS3D7 --genus "Agrobacterium" --species "tumefaciens" --strain "AS3D7" --cpus 1 --addgenes AS3D7.fasta

#include signal peptide (signalp, "--gram neg") and ncRNA (infernal, "--rfam") annotation, slow
#prokka --prefix AS3D7 --locustag AS3D7 --genus "Agrobacterium" --species "tumefaciens" --strain "AS3D7" --gram neg --cpus 1 --addgenes --rfam AS3D7.fasta

