#!/usr/bin/env bash

SECONDS=0

sampler/sampler <input-3d-model.pts >input-3d-model-preprocessed.pts
powercrust/powercrust -s 20221028 -m 10000 -i input-3d-model-preprocessed.pts

END=$SECONDS
echo "Elapsed time: $END seconds."
