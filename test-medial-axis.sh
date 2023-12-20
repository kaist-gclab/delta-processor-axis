#!/usr/bin/env bash

SECONDS=0

sampler/sampler <medial-axis-input-3d-model.pts >medial-axis-input-3d-model-preprocessed.pts
powercrust/powercrust -s 20231221 -m 10000 -i medial-axis-input-3d-model-preprocessed.pts

END=$SECONDS
echo "Elapsed time: $END seconds."
