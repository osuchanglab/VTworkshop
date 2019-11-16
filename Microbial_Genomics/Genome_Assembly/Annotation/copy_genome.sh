#!/bin/bash

cp ../Assembly/AS3D7_spades/scaffolds.fasta ./AS3D7.fasta
sed -i 's/>NODE/>AS3D7/g;s/_length.*//g' AS3D7.fasta
