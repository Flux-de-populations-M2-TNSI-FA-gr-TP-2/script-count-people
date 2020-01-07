
# Count the lines.
echo $(cat $(ls -t result/output* | head -1) | grep -A999 "Station MAC" | grep -v "Station" | wc -l)


