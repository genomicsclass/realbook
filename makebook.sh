#!/bin/bash

cd ../labs/intro
Rscript --no-init-file -e "library(knitr); knit('introduction.Rmd', quiet=TRUE)"
Rscript --no-init-file -e "library(knitr); knit('math_notation.Rmd', quiet=TRUE)"
cd ../inference
Rscript --no-init-file -e "library(knitr); knit('random_variables.Rmd', quiet=TRUE)"

cd ../../realbook
mv ../labs/intro/introduction.md .
mv ../labs/intro/math_notation.md .
mv ../labs/inference/random_variables.md .
mv ../labs/intro/figure/math_notation* figure
mv ../labs/inference/figure/random_variables* figure

pandoc --from markdown --to latex introduction.md -o introduction.tex
pandoc --from markdown --to latex math_notation.md -o math_notation.tex
pandoc --from markdown --to latex random_variables.md -o random_variables.tex

grep -v frontmatter introduction.tex | grep -v mainmatter > introduction_clean.tex
rm introduction.tex
mv introduction_clean.tex introduction.tex

sed -i '' 's/includegraphics/includegraphics[width=0.5\\textwidth]/' *.tex
