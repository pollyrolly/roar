#!bin/sh 
aws cloudformation create-stack --stack-name reignite --template-body file:///Volumes/workplace/Projects/transfer/reignite24-autoredshift-review/templates/Reignite24arr.yaml --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
aws cloudformation wait stack-create-complete --stack-name reignite