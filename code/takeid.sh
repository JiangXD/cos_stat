#!/bin/sh

sh getpages.sh
total=$(( $(cat currentpage.txt) - $(cat lastpage.txt) + 2 ))
echo "Downloading "$total" pages..."

cp currentpage.txt lastpage.txt

curl -o - \
     --user-agent "Mozilla/5.0 (Windows NT 5.1; rv:17.0) Gecko/20100101 Firefox/17."\
       http://cos.name/cn/ | sed -n '/topic.*target/{s,^.*href=".*topic/,,; s,".*$,,; s,/.*$,,; 289q; p;}' > ids.txt


index=2

while [ $index -le $total ]
do
   curl -o - \
     --user-agent "Mozilla/5.0 (Windows NT 5.1; rv:17.0) Gecko/20100101 Firefox/17."\
     http://cos.name/cn/page/$index | sed -n '/topic.*target/{s,^.*href=".*topic/,,; s,".*$,,; s,/.*$,,; 279q; p;}' >> ids.txt

   index=$(($index + 1))

done
