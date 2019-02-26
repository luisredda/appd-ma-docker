#!/bin/sh

  if [ -f "/MachineAgent.zip" ]; then
      echo "/MachineAgent.zip found!"

      MACHINE_AGENT_HOME=/appdynamics/machine-agent
      mkdir -p ${MACHINE_AGENT_HOME}
      cp /MachineAgent.zip /appdynamics/MachineAgent.zip
      unzip -oq /appdynamics/MachineAgent.zip -d ${MACHINE_AGENT_HOME} && rm /appdynamics/MachineAgent.zip

  else

    echo "/MachineAgent.zip not found!"

  fi
