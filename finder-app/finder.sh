#!/bin/sh


FILEDIR=$1
SEARCHSTR=$2




if [ $# -ne 2 ]
then
    echo "Usage: $0 <filedir> <searchstr>"
    exit 1
fi

if [ -z "$FILEDIR" ]
then
    echo "Error: filesdir is not set"
    exit 1
fi

if [ -z "$SEARCHSTR" ]
then
    echo "Error: searchstr is not set"
    exit 1
fi

if [ ! -d "$FILEDIR" ]
then
    echo "Error: filesdir does not represent a directory on the filesystem"
    exit 1
fi


num_files=$(find "$FILEDIR" -type f | wc -l)
num_lines=$(grep -r "$SEARCHSTR" "$FILEDIR" | wc -l)

echo "The number of files are ${num_files} and the number of matching lines are ${num_lines}"









