#!/bin/bash

# four whitespaces will be made to verbatim environment by pandoc
cd out
sed -i 's/^    //' *exercises.md
cd ..

while read line; do
    if [ "$line" != "" ]; then
	if [[ $line != *"#"* ]]; then
	    set -- $line;
	    printf '\n***\n';
	    echo '*** make tex' $1 $2;
	    printf '***\n\n';
	    pandoc --from markdown --to latex out/$2.md -o out/$2.tex;
	fi
    fi
done < ../leanpub/filenames.txt 

grep -v frontmatter out/introduction.tex | grep -v mainmatter > out/introduction_clean.tex
rm out/introduction.tex
mv out/introduction_clean.tex out/introduction.tex

cd out
sed -i 's/includegraphics{http.*\(\/.*\)}/includegraphics{images\/downloads\1}/' *.tex
sed -i 's/includegraphics/includegraphics[width=0.5\\textwidth]/' *.tex
sed -i 's/begin{align\*/begin{aligned/' *.tex
sed -i 's/end{align\*/end{aligned/' *.tex
sed -i 's/360px-Donut-Chart.svg.png/donut.png/' plots_to_avoid.tex
cd ..
