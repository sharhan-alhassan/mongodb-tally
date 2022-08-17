#!/bin/sh 
source_cluster=$1
destination_cluster=$2
database=$3
exclude_collection=$4

mongodump --uri=${source_cluster}/${database} --excludeCollection=${exclude_collection} --archive | mongorestore --uri=${destination_cluster} --archive

# echo "Hello $1"
# time=$(date)
# echo "::set-output name=time::$time"