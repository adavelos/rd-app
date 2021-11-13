#!/bin/bash

# Pipelines fail if any of the steps fail (by default the last step defines the success)
set -eo pipefail

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh

function wait_for_server() {
  until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
    sleep 1
  done
}

echo "Starting WildFly server"
$JBOSS_HOME/bin/standalone.sh -c standalone.xml > /dev/null &

echo "Waiting for the server to boot"
wait_for_server

echo "Executing the commands"
cur_dir=`dirname "$0"`

# In order to capture the JBOSS-CLI execution status (using the '$?'), the 'set -eo pipefail' command must have been executed on top of the script
$JBOSS_CLI -c --file=${cur_dir}/postgress_datasource.cli | tee /start/install.log

# Capture exec status of the JBOSS_CLI command and test if status = 0 [success] or 1 [failure]
cli_res=$?
echo "Check Result of CLI"
if [ ${cli_res} -eq 1 ]
then
        echo CLI Script Failed
        exit 1
else
        echo CLI Script Success
fi

echo "Shutting down WildFly"
$JBOSS_CLI -c ":shutdown"