FROM ubuntu:20.04
RUN apt update
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN git clone https://github.com/sivajavatechie/JenkinsWar.git /tmp/JenkinsWar
WORKDIR /tmp/JenkinsWar
RUN mvn package
RUN cp target/*.war /usr/share/tomcat9/webapps/
EXPOSE 8080