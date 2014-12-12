#!/bin/bash

# global vars
source ../config.sh

# training data
InData="${Mallet_Data}/Z"
OutData="${InData}"
trainData="${OutData}/full.mallet"
testData=${trainData}
evaluator="${OutData}/evaluator.mallet"
inferencer="${OutData}/inferencer.mallet"
mkdir -p ${InData} ${OutData}

#######################################
# convert into mallet format
#######################################
printmsg "import data"
${Mallet_Home}/bin/mallet import-file \
--input ${InData}/fcc.train.txt \
--output ${trainData} \
--keep-sequence TRUE \
--remove-stopwords TRUE

#######################################
# train
#######################################
printmsg "START train"
${Mallet_Home}/bin/mallet train-topics \
--input ${trainData} \
--evaluator-filename ${evaluator} \
--inferencer-filename ${inferencer} \
--alpha 50.0 \
--beta 0.01 \
--num-iterations 600 \
--optimize-interval 20 \
--num-topics 20 \
--output-doc-topics ${OutData}/doc-topics.txt \
--output-topic-docs ${OutData}/topic-docs.txt \
--output-topic-keys ${OutData}/topic-keys.txt \
--word-topic-counts-file ${OutData}/word-topic-counts.txt \
--diagnostics-file ${OutData}/diagnostics.xml \
--diagnostics-file ${OutData}/diagnostics.xml \
--xml-topic-phrase-report ${OutData}/topic-phrase-report.xml \
--xml-topic-phrase-report ${OutData}/topic-phrase-report.xml \
--xml-topic-report ${OutData}/topic-report.xml  \
--topic-word-weights-file ${OutData}/topic-word-weights.txt \
--topic-word-weights-file ${OutData}/topic-word-weights.txt \
--output-state ${OutData}/state.gz

#######################################
# evaluate on itself
#######################################
printmsg "START evaluate"
${Mallet_Home}/bin/mallet evaluate-topics \
--input ${testData} \
--evaluator ${evaluator} \
--output-doc-probs ${OutData}/evaluate.doc_probs.txt \
--output-prob ${OutData}/evaluate.prob.txt

#######################################
# infer on itself
#######################################
printmsg "START infer"
${Mallet_Home}/bin/mallet infer-topics \
--input ${testData} \
--inferencer ${inferencer} \
--output-doc-topics ${OutData}/infer.doc_topics.txt

#######################################
# calculate document lengths
#######################################
printmsg "START document lengths"
${Mallet_Home}/bin/mallet run cc.mallet.util.DocumentLengths \
--input ${testData} > ${OutData}/doc_lengths.tx

