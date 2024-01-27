#!/bin/bash

######################################################

# Author: Shreyas
# Version: v1

# Shell Script for tracking aws resources

#####################################################

set -x #debug mode


echo "S3 tracking"
aws s3 ls

echo "IAM Users"
aws iam list-users

echo "EC2 instances"
aws ec2 describe-instances
