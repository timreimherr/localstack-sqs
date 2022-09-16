#!/bin/bash
shopt -s expand_aliases
source ~/.aliases

awslocal sqs get-queue-attributes --queue-url="http://localhost:4566/000000000000/notifications-queue" --attribute-name ApproximateNumberOfMessages ApproximateNumberOfMessagesNotVisible ApproximateNumberOfMessagesDelayed
