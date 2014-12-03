#!/bin/bash

# global vars
source ../config.sh

# fcc files
fccFiles=fcc_file_list

# echo
whereIsIt=$(echo ${FCC_Data_Xml} | sed "s|/home/$USER|~|g")
echo $whereIsIt
echo

# stats
xsum=0
for f in `cat $fccFiles`; do
    cnt=$(cat ${FCC_Data_Xml}/$f | grep '<doc>' | wc -l)
    let xsum=xsum+cnt
    printf '%30s = %d\n' "$f" "$cnt"
done
printf 'total = %d\n' "$xsum"

