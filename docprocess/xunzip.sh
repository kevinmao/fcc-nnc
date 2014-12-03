#!/bin/bash

# global vars
source ../config.sh

# reset
rm -fr ${FCC_Data_Xml}
mkdir -p ${FCC_Data_Xml}

# 1st phrase data files
zipf="14-28-RAW-Solr.zip"
unzip ${FCC_Data_Zip}/$zipf -d ${FCC_Data_Xml}

# part of 2nd phrase data files
zipf="R-14-28-02-SOLR-RAW.zip"
xmlflist=$(unzip -l ${FCC_Data_Zip}/$zipf | awk '{print $4}' | head | grep xml | xargs)
for F in `echo "$xmlflist"`; do
    unzip ${FCC_Data_Zip}/$zipf $F -d ${FCC_Data_Xml}
done

