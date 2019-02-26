#!/bin/bash

MACHINE_AGENT_HOME=/appdynamics/machine-agent

/extractAgent.sh

#Comentado pois esta recuperando parametros via Environment Variables
#MA_PROPERTIES="-Dappdynamics.controller.hostName=${CONTROLLER_HOST}"
#MA_PROPERTIES+=" -Dappdynamics.controller.port=${CONTROLLER_PORT}"
##MA_PROPERTIES+=" -Dappdynamics.agent.applicationName=${APPLICATION_NAME}"
#MA_PROPERTIES+=" -Dappdynamics.agent.accountName=${ACCOUNT_NAME}"
#MA_PROPERTIES+=" -Dappdynamics.agent.accountAccessKey=${ACCOUNT_ACCESS_KEY}"
#MA_PROPERTIES+=" -Dappdynamics.controller.ssl.enabled=${CONTROLLER_SSL_ENABLED}"
#MA_PROPERTIES+=" -Dappdynamics.machine.agent.hierarchyPath=OPENSHIFT-MON-${HOSTNAME}"
#MA_PROPERTIES+=" -Dappdynamics.agent.uniqueHostId=k8s-${APPLICATION_NAME}"
MA_PROPERTIES+=" -Dappdynamics.sim.enabled=true"
MA_PROPERTIES+=" -Dappdynamics.docker.enabled=true"

if [ "x$METRIC_LIMIT" != "x" ]; then
    MA_PROPERTIES+=" -Dappdynamics.agent.maxMetrics=${METRIC_LIMIT}"
fi

# Start Machine Agent
java ${MA_PROPERTIES} -jar ${MACHINE_AGENT_HOME}/machineagent.jar
