#!/bin/bash 

SOURCE_CLUSTER=$1
DESTINATION_CLUSTER=$2
DATABASE=$3

read -ra EXCLUDE_COLLECTION <<< "$4"

mongodump --uri="$SOURCE_CLUSTER"/${DATABASE} "${EXCLUDE_COLLECTION[@]/#/--excludeCollection=}" --archive | mongorestore --uri="$DESTINATION_CLUSTER" --archive --drop

status_code="${PIPESTATUS[0]}"

if [ $status_code -ne 0 ];
then
  echo "Failed!...Error Code: ${status_code}"
  echo "Refer to Logs"
  exit ${status_code}
else
  echo "Success!"
fi

echo "::set-output name=time::$TIME"
