#!/bin/bash

# Change the below 
# 1. Subnet value 
# 2. Sg value 
# 3. ec2 image id
# 4. ec2 key_name
# 5. ec2 name value
SUBNET_ID=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=vishwa_sub01" --query "Subnets[0].SubnetId" \
  --output text)

SG_ID=$(aws ec2 describe-security-groups --filters "Name=group-name,Values=vishwa-sg01" --query "SecurityGroups[0].GroupId" \
  --output text)

aws ec2 run-instances --image-id ami-0fa3fe0fa7920f68e --count 1 --instance-type t3.micro   --key-name vishwa-key01 --subnet-id $SUBNET_ID --security-group-ids $SG_ID --associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=31-vm01}]'