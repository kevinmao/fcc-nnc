#!/bin/bash

# global vars
source ../config.sh

# testing data
fv=${1:-unigram}
InData="${Mallet_Data}/$fv"
testData="${InData}/test.mallet"

#######################################
# calculate document lengths
#######################################
printmsg "START $fv"
doc_lengths="${testData}.doc_lengths.txt"
rm -f ${doc_lengths}

${Mallet_Home}/bin/mallet run cc.mallet.util.DocumentLengths \
    --input ${testData} > ${doc_lengths}

