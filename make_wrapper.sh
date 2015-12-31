#!/bin/bash

echo '' > out/texfiles.tex

while read line; do
    if [ "$line" != "" ]; then
	if [[ $line != *"#"* ]]; then
	    set -- $line;
	    echo '\input{'$2'}' >> out/texfiles.tex
	fi
    fi
done < ../leanpub/filenames.txt 
