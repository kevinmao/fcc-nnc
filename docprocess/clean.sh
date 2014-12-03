#!/bin/bash

# global vars
source ../config.sh 
rm -fr ${Clean_Data}
mkdir -p ${Clean_Data}

# CMD
Cleaner="python clean.py "

# process
for F in `ls ${Split_Data}`; do
    printmsg START $F
    G=$(basename $F)
    cat ${Split_Data}/$G | $Cleaner > ${Clean_Data}/$G
done

