#!/bin/bash

# global vars
source ../config.sh

# testing data
fv=${1:-unigram}
InData="${Mallet_Data}/$fv"
testData="${InData}/test.mallet"

#######################################
# testing with mallet 
#######################################
for numTopics in {5..50..5}; do

printmsg "START numTopics=${numTopics}"

# set output
OutData="${InData}/${numTopics}"
mkdir -p ${OutData}
inferencer="${OutData}/inferencer.mallet"
infer_doc_topics="${OutData}/infer.doc_topics.txt"
rm -f ${doc_topics}

# test by num-of-topics
${Mallet_Home}/bin/mallet infer-topics \
    --input ${testData} \
    --inferencer ${inferencer} \
    --output-doc-topics ${infer_doc_topics}
done

