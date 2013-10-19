#!/bin/bash
#decompress js script

if [ $# -ne 1 ];then
    echo "Need compressed js file name"
    echo "usage: $0 file_name"
    exit -1
fi

file=$1

cat $file |\
    sed 's/;/;\n/g' |\
    sed 's/{/{\n\n/g' |\
    sed 's/}/}\n\n/g' > $file.decomp
    
