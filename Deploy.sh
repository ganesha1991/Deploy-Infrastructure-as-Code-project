#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: deploy, delete, preview.
#   $2: Name of the Stack
#   $3: Template File
#   $4: Parameter File
#   $3: AWS Region - [optional] defaulted to us-east-1 
#
# Usage examples:
#   ./run.sh deploy 
#   ./run.sh preview
#   ./run.sh delete
#

EXEC_MODE=$1
STACK_NAME=$2
TEMPLATE_FILE=$3
PARAMETERS_FILE=$4
AWS_REGION=${5:-us-east-1}

# Validate parameters
if [[ $EXEC_MODE != "deploy" && $EXEC_MODE != "delete" && $EXEC_MODE != "preview" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    exit 1
fi

# Execute CloudFormation CLI
if [ $EXEC_MODE == "deploy" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $TEMPLATE_FILE \
        --parameter-overrides file://$PARAMETERS_FILE \
        --capabilities "CAPABILITY_NAMED_IAM" \
        --region=$AWS_REGION
fi
if [ $EXEC_MODE == "delete" ]
then
    aws cloudformation delete-stack \
        --stack-name $STACK_NAME \
        --region=$AWS_REGION
fi
if [ $EXEC_MODE == "preview" ]
then
    aws cloudformation deploy \
         --stack-name $STACK_NAME \
        --template-file $TEMPLATE_FILE \
        --parameter-overrides file://$PARAMETERS_FILE \
        --capabilities "CAPABILITY_NAMED_IAM" \
        --no-execute-changeset \
        --region=$AWS_REGION 
fi
