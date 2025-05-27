#!/usr/bin/env bash

URL_LIST=$(grep "href=\"http" index.html | cut -d'"' -f2)

echo "Found URLS:"
echo "$URL_LIST"

for i in $URL_LIST; do 
    echo "Testing $i";
    curl -s --silent "$i" 1>/dev/null 2>&1; 
    RESULT=$?
    echo "Result $RESULT"
    if [[ $RESULT -gt 0 ]]; then
        echo "$RESULT - Bad URL: $i";
    fi;
done;