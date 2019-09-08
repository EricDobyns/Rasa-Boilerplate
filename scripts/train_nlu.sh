#!/bin/bash

docker run \
    -v $(pwd):/app/project \
    -v $(pwd)/models/rasa_nlu:/app/models \
    --rm \
    rasa/rasa_nlu:latest-spacy \
    run \
        python -m rasa_nlu.train \
        -c config.yml \
        -d project/build/intents \
        -o models \
        --project current