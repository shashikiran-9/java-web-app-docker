FROM alpine:latest
RUN apk add openjdk8-jre
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.90/bin/apache-tomcat-8.5.90.tar.gz .
RUN tar -xvzf apache-tomcat-8.5.90.tar.gz
RUN mv apache-tomcat-8.5.90/* /usr/local/tomcat
EXPOSE 8080
CMD ["/bin/catalina.sh", "run"]
COPY /target/java-web-app-1.0.war /usr/local/tomcat/webapps/java-web-app-1.0.war
# Dummy text to test 
