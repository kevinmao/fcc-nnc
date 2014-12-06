#!/bin/bash

# global vars
source ../config.sh

# training data
fv=${1:-unigram}
InData="${Mallet_Data}/$fv"
trainData="${InData}/train.mallet"

#######################################
# training with mallet 
#######################################
for numTopics in {5..50..5}; do

printmsg "START numTopics=${numTopics}"

# set output
OutData="${InData}/${numTopics}"
mkdir -p ${OutData}
evaluator="${OutData}/evaluator.mallet"
inferencer="${OutData}/inferencer.mallet"
doc_topics="${OutData}/doc_topics.txt"
topic_docs="${OutData}/topic_docs.txt"
topic_keys="${OutData}/topic_keys.txt"
word_topic_counts="${OutData}/word_topic_counts.txt"
rm -f ${evaluator} ${doc_topics} ${topic_docs} ${topic_keys} ${word_topic_counts}

# train by num-of-topics
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
done

