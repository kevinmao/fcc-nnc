#!/bin/bash

# global vars
source ../config.sh

# training data
InData="${Mallet_Data}/bigram"
trainData="${InData}/train.mallet"
testData="${InData}/test.mallet"

#######################################
# light-weight pipe line
#######################################
numTopics=10
OutData="${InData}/lite"
mkdir -p ${OutData}

#######################################
# train
#######################################
printmsg "START train"
evaluator="${OutData}/evaluator.mallet"
doc_topics="${OutData}/doc_topics.txt"
topic_docs="${OutData}/topic_docs.txt"
topic_keys="${OutData}/topic_keys.txt"
word_topic_counts="${OutData}/word_topic_counts.txt"
rm -f ${evaluator} ${doc_topics} ${topic_docs} ${topic_keys} ${word_topic_counts}

${Mallet_Home}/bin/mallet train-topics \
	--alpha 50.0 \
	--beta 0.01 \
	--num-iterations 10 \
	--num-threads 5 \
	--num-topics ${numTopics} \
	--input ${trainData} \
	--evaluator-filename ${evaluator} \
	--output-doc-topics ${doc_topics} \
	--output-topic-docs ${topic_docs} \
	--output-topic-keys ${topic_keys} \
	--word-topic-counts-file ${word_topic_counts} 

#######################################
# evaluate
#######################################
printmsg "START evaluate"
doc_probs="${OutData}/doc_probs.txt"
prob="${OutData}/prob.txt"
rm -f ${doc_probs} ${prob}

${Mallet_Home}/bin/mallet evaluate-topics \
    --input ${testData} \
    --evaluator ${evaluator} \
    --output-doc-probs ${doc_probs} \
    --output-prob ${prob}

#######################################
# calculate document lengths
#######################################
printmsg "START doclen"
doc_lengths="${testData}.doc_lengths.txt"
rm -f ${doc_lengths}
${Mallet_Home}/bin/mallet run cc.mallet.util.DocumentLengths \
    --input ${testData} > ${doc_lengths}

