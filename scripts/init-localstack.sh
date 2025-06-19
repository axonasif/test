#!/bin/bash

function mime () {
  time "$@"
  echo "###== $@"
}
mime awslocal configure set region eu-west-1

mime awslocal sns create-topic --name pay-items
mime awslocal sns create-topic --name hr
mime awslocal sns create-topic --name company
mime awslocal sns create-topic --name payments
mime awslocal sns create-topic --name payroll
mime awslocal sns create-topic --name pensions
mime awslocal sns create-topic --name employee
mime awslocal sns create-topic --name document

# message-worker queues and subscriptions
mime awslocal sqs create-queue --queue-name message-worker-pay-items-dlq
mime awslocal sqs create-queue --queue-name message-worker-pay-items \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-pay-items-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:pay-items \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:message-worker-pay-items

mime awslocal sqs create-queue --queue-name message-worker-hr-dlq
mime awslocal sqs create-queue --queue-name message-worker-hr \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-hr-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:hr \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:message-worker-hr

mime awslocal sqs create-queue --queue-name message-worker-company-dlq
mime awslocal sqs create-queue --queue-name message-worker-company \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-company-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:company \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:message-worker-company

mime awslocal sqs create-queue --queue-name message-worker-payments-dlq
mime awslocal sqs create-queue --queue-name message-worker-payments \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-payments-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:payments \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:message-worker-payments

mime awslocal sqs create-queue --queue-name message-worker-payroll-dlq
mime awslocal sqs create-queue --queue-name message-worker-payroll \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-payroll-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:payroll \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:message-worker-payroll

mime awslocal sqs create-queue --queue-name message-worker-pensions-dlq
mime awslocal sqs create-queue --queue-name message-worker-pensions \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-pensions-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:employee \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:message-worker-employee

mime awslocal sqs create-queue --queue-name message-worker-employee-dlq
mime awslocal sqs create-queue --queue-name message-worker-employee \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-employee-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:document \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:message-worker-document

# doc-sender
mime awslocal sqs create-queue --queue-name doc-sender-hr-dlq
mime awslocal sqs create-queue --queue-name doc-sender-hr \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-employee-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:hr \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:doc-sender-hr

mime awslocal sqs create-queue --queue-name doc-sender-document-dlq
mime awslocal sqs create-queue --queue-name doc-sender-document \
  --attributes '{
      "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-1:000000000000:message-worker-employee-dlq\",\"maxReceiveCount\":\"3\"}"
  }'
mime awslocal sns subscribe --topic-arn arn:aws:sns:eu-west-1:000000000000:document \
  --protocol sqs --notification-endpoint arn:aws:sqs:eu-west-1:000000000000:doc-sender-document