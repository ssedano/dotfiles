#!/bin/bash
if [ ! -d md ]; then
    mkdir md
fi

for f in $(find . -name "*html")
do
    temp=${f##*/}
    r="md/"${temp%%.*}".md"
    reverse_markdown $f > $r
done
