#!/bin/bash
iqtree -s ./examplemlsa/examplemlsa.concat -spp examplemlsa/examplemlsa.partition -nt 2 -bb 1000 -alrt 1000
