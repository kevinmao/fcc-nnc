#!/bin/bash

# global vars
source ../config.sh
mkdir -p ${Report_Data}

#######################################
# calculate perplexity scores per num-topics
#######################################
# combined output
tmp=tmp00
output=${Report_Data}/perplexity.txt
rm -f ${output}

# process each file
re='^[0-9]+$'
for fv in `echo ${Fv_List}`; do
    printmsg START $fv
    pplx="${Mallet_Data}/${fv}/perplexity.txt"
    rm -f ${pplx}; touch ${pplx}
    for dir in `ls -d ${Mallet_Data}/${fv}/*/`; do
        numTopics=$(basename $dir)
        if ! [[ $numTopics =~ $re ]] ; then
            echo "error: [$numTopics] Not a number"
            continue
        fi    
        python perplexity.py \
            -p ${Mallet_Data}/${fv}/${numTopics}/evaluate.doc_probs.txt \
            -l ${Mallet_Data}/${fv}/test.mallet.doc_lengths.txt \
            -n ${numTopics} >> ${pplx}
    done
    echo "Created ${pplx}"

    # combine
    if [ ! -e ${output} ]; then
        echo "numTopics	$fv" > ${output}
        cat ${pplx} >> ${output}
    else
        cp ${output} ${tmp}.0  
        echo "$fv" > ${tmp}.1
        cat ${pplx} | cut -f2 >> ${tmp}.1
        paste ${tmp}.0 ${tmp}.1 > ${output}
    fi
done
echo "Created ${output}"
rm -f ${tmp} ${tmp}.*
