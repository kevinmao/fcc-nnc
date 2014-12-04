#!/bin/bash

# global vars
source ../config.sh

# training data
fv=${1:-unigram}
Data="${Mallet_Data}/$fv"
trainData="${Data}/train.mallet"
evaluator="${Data}/evaluator.mallet"
doc_topics="${Data}/doc_topics.txt"
topic_docs="${Data}/topic_docs.txt"
topic_keys="${Data}/topic_keys.txt"
word_topic_counts="${Data}/word_topic_counts.txt"

ls $trainData

: << 'EOF'
#######################################
# training with mallet 
#######################################
for numTopics in {10..50..10}; do
${Mallet_Home}/bin/mallet train-topics \
	--num-iterations 1000 \
	--optimize-interval 25 \
	--num-threads 5 \
	--num-topics ${numTopics} \
	--input ${trainData} \
	--evaluator-filename ${evaluator} \
	--output-doc-topics ${doc_topics} \
	--output-topic-docs ${topic_docs} \
	--output-topic-keys ${topic_keys} \
	--word-topic-counts-file ${word_topic_counts} 
done
EOF

