#!/usr/bin/env bash

docker build -t kaistgclab/delta-processor-axis .

# In CircleCI, it is not possible to mount a volume from job space
# into a container in Remote Docker. However, our docker image does not
# incldue sample 3d models files. To transfer the input and output, we
# instead use the `docker cp` command in the test file. See
# https://circleci.com/docs/2.0/building-docker-images/#mounting-folders

# Create a dummy container which will hold a volume for 3d model file
docker create \
    -v /data \
    --name vcontainer \
    kaistgclab/delta-processor-axis \
    /bin/true

# Copy model file
docker cp powercrust/knot.pts vcontainer:/data

# Run container
docker run \
    --volumes-from vcontainer \
    --name app \
    kaistgclab/delta-processor-axis \
    -m 100000 \
    -i knot.pts

# Copy output (the entire `data` directory
# is copied to the current location)
docker cp app:/data .

# Check axis.off file exists
FILE=data/axis.off
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
    exit 1
fi
