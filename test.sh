#!/usr/bin/env bash

docker build -t kaistgclab/delta-processor-axis .

mkdir testfiles && cp powercrust/knot.pts testfiles

docker run --rm \
    -v $(pwd)/testfiles:/data \
    kaistgclab/delta-processor-axis \
    -m 100000 -i knot.pts

FILE=testfiles/axis.off
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
    exit 1
fi
