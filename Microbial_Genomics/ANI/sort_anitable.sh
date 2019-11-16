#!/bin/bash
./autoANI-sort.pl -reference 'Afa_C58' allanivalues.table.out  > allanivalues.table.out.sorted.txt

sed -i 's/^\t/strain\t/g' allanivalues.table.out.sorted.txt
