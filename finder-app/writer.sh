#!/bin/sh


WRITEFILE=$1
WRITESTR=$2




if [ $# -ne 2 ]
then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi



mkdir -p "$(dirname "$WRITEFILE")" || { echo "ERROR: Could not create directory for $WRITEFILE"; exit 1; }
echo "$WRITESTR" > "$WRITEFILE" || { echo "ERROR: Could not write to $WRITEFILE"; exit 1; }




