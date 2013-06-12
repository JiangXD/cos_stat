#!/bin/sh

echo "Conducting analysis..."
Rscript authority_analysis.R
echo "Uploading..."
git add ../README.md
git add *.Rmd
git commit -m "$(date +%Y-%m-%d)"
git push origin master

