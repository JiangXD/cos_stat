#!/bin/sh

echo "Conducting analysis..."
Rscript authority_analysis.R
rm -r ../figure
mv figure ../
echo "Uploading..."
git add ../README.md
git add ../figure/*.png
git add *.Rmd
git commit -m "$(date +%Y-%m-%d)"
git push origin master

