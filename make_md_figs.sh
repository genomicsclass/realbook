#!/bin/bash

cd ../labs;

while read line; do
    if [ "$line" != "" ]; then
	if [[ $line != *"#"* ]]; then
	    if [[ $line != *"exercises"* ]]; then
		set -- $line;
		printf '\n***\n';
		echo '*** making' $1 $2;
	        printf '***\n\n';
		cd $1;
		Rscript --no-init-file -e "library(knitr); knit('$2.Rmd', quiet=TRUE)";
		mv $2.md ../../realbook/out;
		imgcount=`ls -1 figure/$2* 2> /dev/null | wc -l`
		if [ $imgcount -gt 0 ]
		then
		    mv figure/$2* ../../realbook/out/figure;
		fi
		cd ..;
	    fi
	fi
    fi
done < ../realbook/filenames.txt 
