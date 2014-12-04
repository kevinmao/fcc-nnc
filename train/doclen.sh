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
testdoc_lengths="${InData}/testdoc_lengths.txt"
rm -f ${testdoc_lengths}

${Mallet_Home}/bin/mallet run cc.mallet.util.DocumentLengths \
    --input ${testData} > ${testdoc_lengths}

