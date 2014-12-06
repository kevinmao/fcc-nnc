#!/bin/bash

# global vars
source ../config.sh
mkdir -p ${Report_Data}

#######################################
# calculate word counts for top5 topics
#######################################
Data="${Mallet_Data}/unigram/20"
doc_topics="${Data}/infer.doc_topics.txt"
topic_keys="${Data}/topic_keys.txt"
word_topic_counts="${Data}/word_topic_counts.txt"
output=${Report_Data}/topwords.txt

python words4Topics.py -d ${doc_topics} -t ${topic_keys} -w ${word_topic_counts} > ${output}

