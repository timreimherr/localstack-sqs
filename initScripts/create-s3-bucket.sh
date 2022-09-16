#!/bin/bash
shopt -s expand_aliases
source ~/.aliases

aws --endpoint-url=http://localhost:4566 s3 mb s3://bucket
