#!/bin/bash 
aws cloudformation delete-stack --stack-name reignite
aws cloudformation wait stack-delete-complete --stack-name reignite
# delete files trigger and update
rm -f update
rm -f trigger
