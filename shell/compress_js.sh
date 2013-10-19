#!/bin/bash
#compress js script

if [ $# -ne 1 ];then
    echo "Need js file name"
    echo "usage: $0 file_name"
    exit -1
fi

file=$1

cat $file | \
    tr -d '\n\t' | tr -s ' ' |\
    sed 's:/\*.*\*/::g' |\
    sed 's/ \?\([{}();,:]\) \?/\1/g' > $file.comp
