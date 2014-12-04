#!/bin/bash

# global vars
source ../config.sh

#######################################
# create mallet format data
#######################################
for fv in `echo ${Fv_List}`; do

printmsg START $fv
rm -fr ${Mallet_Data}/$fv
mkdir -p ${Mallet_Data}/$fv

# merge into ONE file
Input=${Mallet_Data}/$fv/fcc.train.txt
cat ${Train_Data}/$fv/*.tsv > ${Input}

# convert into mallet format
${Mallet_Home}/bin/mallet import-file \
    --input ${Input} \
    --output ${Mallet_Data}/$fv/full.mallet \
    --keep-sequence TRUE \
    --remove-stopwords FALSE

# split data into 80% training and 20% testing
${Mallet_Home}/bin/mallet split \
    --input ${Mallet_Data}/$fv/full.mallet \
    --training-file ${Mallet_Data}/$fv/train.mallet \
    --testing-file ${Mallet_Data}/$fv/test.mallet \
    --training-portion 0.8

done

