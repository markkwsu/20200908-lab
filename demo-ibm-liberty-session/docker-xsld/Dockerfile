FROM websphere-liberty:latest

COPY config/server.xml /config
COPY demo-ibm-liberty-session.war /config/apps

COPY jars/wxsclient-wlp_8.6.1.2.jar /opt/ibm/wlp/
RUN cd /opt/ibm/wlp/ && java -jar wxsclient-wlp_8.6.1.2.jar /opt/ibm/wlp/ --acceptLicense

USER root
RUN apt-get update
RUN apt-get install -y curl