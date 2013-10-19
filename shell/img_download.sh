#!/bin/bash
#to download image from one page

if [ $# -ne 3 ];then
    echo "usage: $0 -d Directory URL"
    exit -1
fi

while getopts d: opt
do
    case $opt in
        d) directory=$OPTARG;;
        *) echo "opt error!";exit -1;;
    esac
done

shift $[$OPTIND - 1]

url=$1

echo "download images from $url to $directory"

mkdir -p $directory

baseurl=$(echo $url | egrep -o "https?://[a-z.]+")

curl -s $url | egrep -o "<img .*src=[^>]**>" |
sed 's/<img .*src=\"\([^"]*\).*/\1/g' > /tmp/$$.list

sed -i "s|^/|$baseurl/|" /tmp/$$.list

cd $directory

while read filename
do
    curl -s -O "$filename" --silent
done < /tmp/$$.list
