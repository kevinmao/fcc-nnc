#!/bin/bash

# global vars
source ../config.sh
cd ..

# vars
LOG="./logs"
fv=${1:-unigram}
ts=$(date '+%Y%m%d_%H%M%S')

# train
action="train_${fv}"
nohup time make "${action}" > $LOG/${action}.log.${ts}

# evaluate
action="evaluate_${fv}"
nohup time make "${action}" > $LOG/${action}.log.${ts}

# doclen
action="doclen_${fv}"
nohup time make "${action}" > $LOG/${action}.log.${ts}


