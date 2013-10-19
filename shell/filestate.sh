#!/bin/bash

if [ $# -ne 1 ];then
    echo "need param"
    exit -1
fi

path=$1

declare -A statearray;

while read line
do
    ftype=`file -b "$line"`
    let statearray["$ftype"]++;
done < <(find $path -type f -print)

echo "${!statearray[@]}"

for ftype in "${!statearray[@]}"
do
    echo $ftype : ${statearray["$ftype"]}
done
