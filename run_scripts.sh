inotifywait -r -m -e modify . | while read path _ file; do echo '***************************' ; bash $file;    done
