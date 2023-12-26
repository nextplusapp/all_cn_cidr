#!/bin/bash -ex

IN=all_cn_cidr.txt
OUT=all_cn_cidr.conf

wget https://ispip.clang.cn/$IN -O $IN
: > $OUT

while IFS= read -r line; do
  echo "allow $line;" >> $OUT
done < $IN
echo "deny all" >> $OUT

cat $OUT
