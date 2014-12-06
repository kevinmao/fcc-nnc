#!/bin/bash

# global vars
source ../config.sh

#######################################
# calculate perplexity scores per num-topics
#######################################
for fv in `echo ${Fv_List}`; do
    printmsg START $fv
    pplx="${Mallet_Data}/${fv}/perplexity.txt"
    rm -f ${pplx}; touch ${pplx}
    for numTopics in `ls -d ${Mallet_Data}/${fv}/*/`; do
        python perplexity.py \
            -p ${Mallet_Data}/${fv}/${numTopics}/evaluate.doc_probs.txt \
            -l ${Mallet_Data}/${fv}/test.mallet.doc_lengths.txt \
            -n ${numTopics} >> ${pplx}
    done
done

