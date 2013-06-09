
index=111

while [ $index -le 1075 ]
do

   echo
   echo $index
   echo

   curl -o - \
     --user-agent "Mozilla/5.0 (Windows NT 5.1; rv:17.0) Gecko/20100101 Firefox/17."\
     http://cos.name/cn/page/$index | sed -n '/topic.*target/{s,^.*href=".*topic/,,; s,".*$,,; s,/.*$,,; 279q; p;}' >> ids.txt

   index=$(($index + 1))

done
