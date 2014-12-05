#!/bin/bash

# global vars
source ../config.sh

# vars
LOG="../logs"
fv=${1:unigram}
ts=$(date '+%Y%m%d_%H%M%S')

for numTopics in {5..50..5}; do
    nohup time bash onepath.sh $fv $numTopics > $LOG/onepath.numT_${numTopics}.log.${ts}
done

# doclen
action="doclen_${fv}"
nohup time bash doclen.sh $fv > $LOG/${action}.log.${ts}


