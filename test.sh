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

# Check result.json file exists under `data` directory.
RESULT_FILE=testfiles/result.json
if [ -f "$RESULT_FILE" ]; then
    echo "$RESULT_FILE exists."
else 
    echo "$RESULT_FILE does not exist."
    exit 1
fi

FILE=testfiles/axis.off
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
    exit 1
fi
