#!/usr/bin/env bash

time (
    sampler/sampler <input-3d-model.pts >input-3d-model-preprocessed.pts
    powercrust/powercrust -m 10000 -i input-3d-model-preprocessed.pts
)
