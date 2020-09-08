FROM jetty:9.4-jre8

COPY demo-jetty-session.war /var/lib/jetty/webapps
COPY first-demo-marksu-001-168f80a9ccd8.json /var/lib/jetty
ENV GCLOUD_PROJECT=first-demo-marksu-001
ENV GOOGLE_APPLICATION_CREDENTIALS=/var/lib/jetty/first-demo-marksu-001-168f80a9ccd8.json
RUN java -jar "$JETTY_HOME/start.jar" --create-startd --add-to-start=session-store-gcloud,slf4j-simple-impl --approve-all-licenses
COPY session-store-gcloud.ini /var/lib/jetty/bin/start.d

USER root
RUN apt-get update
RUN apt-get install -y curl