FROM openjdk:8 AS BUILD_IMAGE
RUN apt update
RUN apt install maven -y

RUN git clone https://github.com/Hussain147/paac-with-ecs.git
RUN cd paac-with-ecs
RUN mvn clean install


FROM tomcat:8-jre11

RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/techiehorizon-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
WORKDIR /usr/local/tomcat/
VOLUME /usr/local/tomcat/webapps
