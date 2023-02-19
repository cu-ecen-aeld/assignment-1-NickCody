#!/bin/bash


FILESDIR=${1:-""}
SEARCHSTR=${2:-""}

if [ -z "$FILESDIR" ]; then
    echo "FILESDIR must be specified!"
    exit 1
fi

if [ ! -d "$FILESDIR" ]; then
    echo "$FILESDIR does not exist!"
    exit 1
fi

if [ -z "$SEARCHSTR" ]; then
    echo "Invalid SEARCHSTR"
    exit 1
fi

X=$(find "$FILESDIR" -type f | wc -l)
Y=$(find "$FILESDIR" -type f -print0 | xargs -0 grep "$SEARCHSTR" | wc -l )

echo "The number of files are $X and the number of matching lines are $Y"
