#!/bin/bash

# global vars
source ../config.sh 
rm -fr ${Raw_Tsv_Data}
mkdir -p ${Raw_Tsv_Data}

# fcc files
FccFiles=fcc_file_list

# transform
Transformer="python transform.py "

# process
for F in `cat $FccFiles`; do
    printmsg START $F
    G=$(echo $F | sed 's/.xml/.tsv/g')
    $Transformer ${FCC_Data_Xml}/$F > ${Raw_Tsv_Data}/$G
done

