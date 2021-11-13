#!/bin/bash

# Pipelines fail if any of the steps fail (by default the last step defines the success)
set -eo pipefail

# get the ip address of the container to bind in wildfly startup script
host_ip=$(hostname -I)

# replace markers: those markers were placed by the JBoss CLI script. The corresponding variables are defined in the Dockerfile, but can optionally be overriden by CMD args
sed -e "s/###DB_HOST###/${DB_HOST}/g" \
	-e "s/###DB_PORT###/${DB_PORT}/g" \
	-e "s/###DB_SCHEMA###/${DB_SCHEMA}/g" \
	-e "s/###DB_USER###/${DB_USER}/g" \
	-e "s/###DB_PASSWORD###/${DB_PASSWORD}/g" \
	-i /opt/jboss/wildfly/standalone/configuration/standalone.xml

# if the container CMD value is jboss, run wildfly
if [ "$1" = 'jboss' ]; then
    echo "Starting application on ${host_ip}"
    exec /opt/jboss/wildfly/bin/standalone.sh -b=${host_ip} -bmanagement=${host_ip} -bunsecure=${host_ip} --server-config=standalone.xml 
fi

# if the container CMD value is not jboss, run the given CMD value directly on the system
# this allows for example to start the container running a bash shell instead of the wildfly.
exec "$@"