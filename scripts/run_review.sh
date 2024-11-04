#!/bin/bash 
# read input parameter
read -p "Please enter the workflow key: all-parallel | all-serial " workflowKey
#if file trigger exists read trigger from file trigger
if [ -f trigger ]
then
    trigger=$(cat trigger)
else
    trigger=0
fi
#if trigger is 0 set trigger to 1
if [ $trigger == 1 ]
then
    trigger=0
fi

if [ -f update ]
then
    update=$(cat update)
else
    update=0
fi
#write trigger to file trigger
echo $trigger > trigger

# deploy cloudformation template
reignite24-autoredshift-review % aws cloudformation update-stack --stack-name reignite --template-body file:///Volumes/workplace/Projects/transfer/reignite24-autoredshift-review/templates/Reignite24arr.yaml --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --parameter ParameterKey=WorkflowKey,ParameterValue=$workflowKey ParameterKey=Trigger,ParameterValue=$trigger ParameterKey=Update,ParameterValue=$update
