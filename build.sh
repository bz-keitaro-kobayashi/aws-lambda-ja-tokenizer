#!/bin/bash -e

docker build -t aljt .
docker run -it --rm -v /Users/keitaro.kobayashi/workspace/aws-lambda-ja-tokenizer/out/:/app/out/ aljt fab makezip
