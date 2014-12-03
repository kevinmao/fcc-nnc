#!/bin/bash

# global vars
source ../config.sh 

# CMD
Generator="python genfeat.py "

# reset
rm -fr ${Train_Data}

# process
for fv in `echo ${Fv_List}`; do
    mkdir -p ${Train_Data}/$fv
    for F in `ls ${Clean_Data}`; do
        printmsg START [ $fv :: $F ]
        G=$(basename $F)
        cat ${Clean_Data}/$G | $Generator -t "$fv" -s "$G"  > ${Train_Data}/$fv/$G
    done
done

