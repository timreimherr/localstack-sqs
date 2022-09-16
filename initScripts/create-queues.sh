#!/bin/bash
shopt -s expand_aliases
source ~/.aliases
awslocal sqs create-queue --queue-name dl-queue
awslocal sqs get-queue-attributes --queue-url="http://localhost:4566/000000000000/dl-queue" --attribute-name All
awslocal sqs create-queue --queue-name queue --attributes file://initScripts/create.json
# check queue depth
awslocal sqs get-queue-attributes --queue-url="http://localhost:4566/000000000000/queue" --attribute-name All
