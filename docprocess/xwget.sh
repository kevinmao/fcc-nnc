#!/bin/bash

# global vars
source ../config.sh

# reset
rm -fr ${FCC_Data_Zip}
mkdir -p ${FCC_Data_Zip}
url="http://www.fcc.gov/files/ecfs/14-28"

# data files
flist="14-28-RAW-Solr.zip R-14-28-02-SOLR-RAW.zip"
for f in `echo $flist`; do
    wget "$url/$f" -O ${FCC_Data_Zip}/$f
done

# other files
flist="SolrOutput.xsd FieldNameHelp.txt"
for f in `echo $flist`; do
    wget "$url/$f" -O ${FCC_Data_Zip}/$f
done

