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
for numTopics in {10..50..10}; do

# set output
OutData="${InData}/${numTopics}"
mkdir -p ${OutData}
evaluator="${OutData}/evaluator.mallet"
doc_probs="${OutData}/doc_probs.txt"
prob="${OutData}/prob.txt"
rm -f ${doc_probs} ${prob}

# test by num-of-topics
${Mallet_Home}/bin/mallet evaluate-topics \
    --input ${testData} \
    --evaluator ${evaluator} \
    --output-doc-probs ${doc_probs} \
    --output-prob ${prob}
done

