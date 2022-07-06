#!/bin/bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 547097428470.dkr.ecr.us-east-1.amazonaws.com
REPO=`aws ecr describe-repositories | grep repositoryUri |grep server-api | awk '{print $NF}'|cut -f 1 -d , |sed 's/\"//g'`
echo Uploading to $REPO
IMAGE_ID=`docker images | grep nw-$1 | awk '{print $3}'`
docker tag $IMAGE_ID $REPO:latest
docker push $REPO