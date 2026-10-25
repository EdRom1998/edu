FROM ubuntu:20.04
ENV CATALINA_BASE=/etc/tomcat9
RUN apt update
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/sivajavatechie/JenkinsWar.git /tmp/JenkinsWar
WORKDIR /tmp/JenkinsWar
RUN mvn package
RUN cp target/*.war /var/lib/tomcat9/webapps/JenkinsWar.war
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]