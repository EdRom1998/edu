FROM ubuntu:20.04
RUN apt update
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
ENV CATALINA_BASE=/var/lib/tomcat9
ENV CATALINA_TMPDIR=/var/lib/tomcat9/temp
RUN git clone https://github.com/sivajavatechie/JenkinsWar.git /tmp/JenkinsWar
WORKDIR /tmp/JenkinsWar
RUN mvn package
RUN rm -rf /var/lib/tomcat9/webapps/*
RUN cp target/*.war /var/lib/tomcat9/webapps/JenkinsWar.war
RUN chown tomcat:tomcat /var/lib/tomcat9/webapps/JenkinsWar.war
EXPOSE 8080
EXPOSE 80
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]