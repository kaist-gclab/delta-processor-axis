#!/usr/bin/env bash

echo "================== Build Image =================="

docker build -t kaistgclab/delta-processor-axis .

mkdir testfiles && cp powercrust/knot.pts testfiles

echo ""
echo "================== Run Media Axis =================="

time docker run --rm \
    -v $(pwd)/testfiles:/data \
    kaistgclab/delta-processor-axis \
    -m 100000 -i knot.pts

echo ""
echo "================== Check Outputs =================="

FILE=testfiles/axis.off
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
    exit 1
fi
