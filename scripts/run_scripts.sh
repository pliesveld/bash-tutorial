#!/bin/bash

inotifywait -r -m -e modify /scripts | 
while read path _ file; do 
	[[ $file =~ ^.*sh$ ]] && {
		echo '***************************' 
		bash $file;
	}
done

