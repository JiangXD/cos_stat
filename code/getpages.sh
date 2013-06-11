#!/bin/sh

total=$(( $1 + 1 ))


curl -s -o - \
     --user-agent "Mozilla/5.0 (Windows NT 5.1; rv:17.0) Gecko/20100101 Firefox/17."\
       http://cos.name/cn/ | sed -n '/div class="nav".*第 1 页/{s,^.*class="page-numbers" href="/cn/page/,,; s,".*$,,; p;q;};' > currentpage.txt

