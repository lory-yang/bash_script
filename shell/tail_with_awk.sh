#!/bin/bash
#using awk to implement head

if [ $# -ne 2 ];then
    echo "usage: $0 line_num file_name"
    exit -1
fi

awk -v line=$1 '{end=NR%line;buffer[NR%line] = $0; } 
    END { 
        for(i=1;i<=line;i++) {
            print buffer[(i + end)%line]
        }
    }' $2
