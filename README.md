# localstack-sqs

Quickly standup localstack, create queues and monitor queue depth

## Getting started -  Scripts

1. [Install aws cli](https://sezzle.atlassian.net/wiki/spaces/INFRA/pages/36307174/AWS+Access)
2. Add the following line added in your .bash_profile (or equivalent file).
```
alias awslocal='AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test AWS_DEFAULT_REGION=us-west-2 aws --endpoint-url=http://localhost:4566'
```
3. Start localstack
```
docker-compose up
```
4. Run initialization scripts (`source` may need to be pointed at .bash_profile)
```
./initScripts/create-queues.sh
```
5. Start monitoring the source queue
```
go run main.go
```
