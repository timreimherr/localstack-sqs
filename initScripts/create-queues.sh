#!/bin/bash
shopt -s expand_aliases
source ~/.aliases
awslocal sqs create-queue --queue-name notifications-dl-queue
awslocal sqs get-queue-attributes --queue-url="http://localhost:4566/000000000000/notifications-dl-queue" --attribute-name All
awslocal sqs create-queue --queue-name notifications-queue --attributes file://initScripts/create.json
# check queue depth
awslocal sqs get-queue-attributes --queue-url="http://localhost:4566/000000000000/notifications-queue" --attribute-name All
