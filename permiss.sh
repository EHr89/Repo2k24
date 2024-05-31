#!/bin/bash

# Array of paths to check and change permissions
paths=(
    "/apps/ibm/InfoSphereDataReplication/*"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforKafka/instance/"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforKafka/instance/cdckafkauat/"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforKafka/instance/cdckafkauat/log/"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforKafka/log/"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforKafka/instance/cdckafkauat/log/*"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforKafka/log/"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforPostgreSQL/instance/"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforPostgreSQL/instance/cdcpostgresqluat/"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforPostgreSQL/instance/cdcpostgresqluat/log"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforPostgreSQL/instance/cdcpostgresqluat/log/*"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforPostgreSQL/log"
    "/apps/ibm/InfoSphereDataReplication/ReplicationEngineforPostgreSQL/log/*"
)

# Loop through each path
for path in "${paths[@]}"; do
    # Check if the path exists
    if [ -e $path ]; then
        # Get the current permissions
        current_permissions=$(stat -c "%a" $path)
        # Check if the current permissions are 755
        if [ "$current_permissions" -eq 755 ]; then
            echo "Permissions for $path are already 755"
        else
            echo "Permissions for $path are $current_permissions, changing to 755"
            chmod 755 $path
        fi
    else
        echo "Path does not exist: $path"
    fi
done

echo "Permission update script completed."