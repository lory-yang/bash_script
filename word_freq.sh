#!/bin/bash

if [ $# -ne 1 ];then
    echo "need param"
    exit -1
fi

file=$1

egrep -o "\b[[:alpha:]]+\b" $file | \
    awk '{ count[$0]++ }
    END {
        printf ("%-15s%s\n", "Word", "Count");
        for (ind in count) {
            printf ("%-15s%s\n", ind, count[ind]);
    }
}'

