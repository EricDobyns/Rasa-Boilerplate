#!/bin/bash

docker run \
    -v $(pwd):/app/project \
    -v $(pwd)/models/rasa_core:/app/models \
    --rm \
    rasa/rasa_core:latest \
    train \
        --domain project/build/domain/domain.yml \
        --stories project/build/stories \
        --out models