#!/bin/sh 
SOURCE_CLUSTER=$1
DESTINATION_CLUSTER=$2
DATABASE=$3
EXCLUDE_COLLECTION=$4
TIME=$(date)

mongodump --uri=${SOURCE_CLUSTER}/${DATABASE} --excludeCollection=${EXCLUDE_COLLECTION} --archive | mongorestore --uri=${DESTINATION_CLUSTER} --archive

echo "::set-output name=time::$TIME"
