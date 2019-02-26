FROM openjdk:8-jdk-slim

COPY MachineAgent.zip /MachineAgent.zip
COPY startup.sh /startup.sh
COPY extractAgent.sh /extractAgent.sh

RUN chmod +x /startup.sh
RUN chmod +x /extractAgent.sh

CMD "/startup.sh"
