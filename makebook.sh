#!/bin/bash

cd ../labs/intro
Rscript --no-init-file -e "library(knitr); knit('introduction.Rmd', quiet=TRUE)"
cd ../../realbook
mv ../labs/intro/introduction.md .
pandoc --from markdown_github --to latex introduction.md -o introduction.tex

