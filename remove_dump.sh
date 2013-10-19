#!/bin/bash

ls -lS | awk 'BEGIN {
    getline;getline;
    name1=$9;size1=$5
}
{
    name2=$9;size2=$5;
    if (size1==size2) {
        cmd1="md5sum "name1
        cmd2="md5sum "name2
        cmd1 | getline; sum1=$1;
        close(cmd1)
        cmd2 | getline; sum2=$1;
        close(cmd2)
        if (sum1 == sum2) {
            print name1;print name2
        }
    };
    name1=name2;size1=size2
}' | sort -u > dup_files

cat dup_files | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{print $2 }' | sort -u > dup_sample

comm dup_files dup_sample -2 -3 | xargs rm

