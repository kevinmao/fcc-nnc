#!/bin/bash

# global vars
source ../config.sh

# params
fv=${1:-unigram}
numTopics=${2:-5}

# training data
InData="${Mallet_Data}/$fv"
trainData="${InData}/train.mallet"
testData="${InData}/test.mallet"

#######################################
# light-weight pipe line
#######################################
OutData="${InData}/${numTopics}"
mkdir -p ${OutData}

#######################################
# train
#######################################
printmsg "START train"
evaluator="${OutData}/evaluator.mallet"
inferencer="${OutData}/inferencer.mallet"
doc_topics="${OutData}/doc_topics.txt"
topic_docs="${OutData}/topic_docs.txt"
topic_keys="${OutData}/topic_keys.txt"
word_topic_counts="${OutData}/word_topic_counts.txt"
rm -f ${evaluator} ${doc_topics} ${topic_docs} ${topic_keys} ${word_topic_counts}

${Mallet_Home}/bin/mallet train-topics \
    --alpha 50.0 \
    --beta 0.01 \
    --num-iterations 600 \
    --num-threads 5 \
    --num-topics ${numTopics} \
    --input ${trainData} \
    --evaluator-filename ${evaluator} \
    --inferencer-filename ${inferencer} \
    --output-doc-topics ${doc_topics} \
    --output-topic-docs ${topic_docs} \
    --output-topic-keys ${topic_keys} \
    --word-topic-counts-file ${word_topic_counts} 

#######################################
# evaluate
#######################################
printmsg "START evaluate"
doc_probs="${OutData}/evaluate.doc_probs.txt"
prob="${OutData}/evaluate.prob.txt"
rm -f ${doc_probs} ${prob}

${Mallet_Home}/bin/mallet evaluate-topics \
    --input ${testData} \
    --evaluator ${evaluator} \
    --output-doc-probs ${doc_probs} \
    --output-prob ${prob}

#######################################
# infer
#######################################
printmsg "START infer"
infer_doc_topics="${OutData}/infer.doc_topics.txt"
rm -f ${infer_doc_topics}

${Mallet_Home}/bin/mallet infer-topics \
    --input ${testData} \
    --inferencer ${inferencer} \
    --output-doc-topics ${infer_doc_topics}

