#!/bin/bash

#set -euo pipefail
#IFS=$'\n\t'

WRITEFILE=${1:-""}
WRITESTR=${2:-""}

if [ -z "$WRITEFILE" ]; then
    echo "WRITEFILE must be specified!"
    exit 1
fi

if [ -z "$WRITESTR" ]; then
    echo "Invalid WRITESTR"
    exit 1
fi

FILEPATH=$(dirname "$WRITEFILE")
mkdir -p $FILEPATH
echo "$WRITESTR" > $WRITEFILE

if [ ! -f $WRITEFILE ]; then
    echo "$WRITEFILE was not created!"
    exit 1
fi
