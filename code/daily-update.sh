#!/bin/sh

wc -l ../cosdata.txt
sh takeid.sh
Rscript collect.R
sort ../cosdata.txt | uniq > tmp.txt
mv tmp.txt ../cosdata.txt
wc -l ../cosdata.txt

echo "Begining analysis..."
Rscript analysis.R

git add ../cosdata.txt
git add ../README.md
git add *.Rmd
git commit -m "Updated to $(date +%Y-%m-%d)"
git push origin master
