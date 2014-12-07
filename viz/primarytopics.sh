#!/bin/bash

# global vars
source ../config.sh
mkdir -p ${Report_Data}

#######################################
# calculate word counts for top5 topics
#######################################
Data="${Mallet_Data}/unigram/20"
doc_topics="${Data}/doc_topics.txt"
infer_doc_topics="${Data}/infer.doc_topics.txt"
output=${Report_Data}/primaryTopic2numdocs.txt

python docPrimaryTopic.py -i ${infer_doc_topics} -d ${doc_topics} > ${output}
