#!/bin/bash 
if [ -f update ]
then
    update=$(cat update)
else
    update=0
fi
#if update is 0 set update to 1
if [ $update == 1 ]
then
    update=0
else
    update=1
fi
if [ -f trigger ]
then
    trigger=$(cat trigger)
else
    trigger=0
fi
#write update to file update
echo $update > update
aws cloudformation update-stack --stack-name reignite --template-body file:///Volumes/workplace/Projects/transfer/reignite24-autoredshift-review/templates/Reignite24arr.yaml --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --parameter ParameterKey=Update,ParameterValue=$update ParameterKey=Trigger,ParameterValue=$trigger
