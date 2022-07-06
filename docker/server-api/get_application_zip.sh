#!/bin/bash
VERSION="$1"
BASE_DIR=./src
S3_BUCKET="nw-maven-1"
mkdir -p $BASE_DIR
FILE=`aws s3 ls s3://${S3_BUCKET}/server-app/${VERSION}/${VERSION}/ | sort | tail -1 | awk '{print $NF}'`
echo "Downloading $FILE to /home/nextw"
aws s3 cp s3://${S3_BUCKET}/server-app/${VERSION}/${VERSION}/$FILE  $BASE_DIR/application.zip
(cd $BASE_DIR ; unzip application.zip )
