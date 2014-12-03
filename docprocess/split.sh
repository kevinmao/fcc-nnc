#!/bin/bash

# global vars
source ../config.sh 
rm -fr ${Split_Data}
mkdir -p ${Split_Data}

# CMD
Splitor="python split.py "

# process
for F in `ls ${Raw_Tsv_Data}`; do
    printmsg START $F
    G=$(basename $F)
    cat ${Raw_Tsv_Data}/$G | $Splitor > ${Split_Data}/$G
done

