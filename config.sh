#!/bin/bash

## Where am I
export Where_Am_I="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

############################################
### global options subject to change
############################################

## Project home
export Project_Home=$Where_Am_I

## Mallet home
export Mallet_Home=$Project_Home/Mallet

############################################
### corpus processing 
############################################
## corpus data 
export Corpus_Data=$Project_Home/data

## fcc data zipped
export FCC_Data_Zip=$Corpus_Data/fcc-raw/zip

## fcc data xml
export FCC_Data_Xml=$Corpus_Data/fcc-raw/xml

## processed near-raw data in tsv format
export Raw_Tsv_Data=$Corpus_Data/processed/tsv

## split [multi-email] data
export Split_Data=$Corpus_Data/processed/split

## cleaned data
export Clean_Data=$Corpus_Data/processed/clean

## training data
export Train_Data=$Corpus_Data/processed/train

############################################
### training and testing
############################################
## feature types
export Fv_List="unigram bigram uni+bigram"

## Mallet data
export Mallet_Data=$Project_Home/mallet-data

############################################
### functions
############################################
function printmsg {
    echo "------------ `date +"%Z %Y_%m_%d_%H:%M:%S"` $@ ------------"
}

