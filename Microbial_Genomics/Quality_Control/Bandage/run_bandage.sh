#!/bin/bash


Bandage image JL5181_illumina.gfa JL5181_illumina.gfa.jpg
lximage-qt JL5181_illumina.gfa.jpg &
Bandage image JL5181_nanopore.gfa JL5181_nanopore.gfa.jpg
lximage-qt JL5181_nanopore.gfa.jpg &
