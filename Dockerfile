FROM ubuntu:20.04
ENV CATALINA_BASE=/etc/tomcat9
RUN mkdir -p /etc/tomcat9/conf /etc/tomcat9/temp && \
    ln -sf /etc/tomcat9/server.xml /etc/tomcat9/conf/server.xml && \
    chown -R tomcat:tomcat /etc/tomcat9/temp
RUN apt update
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/sivajavatechie/JenkinsWar.git /tmp/JenkinsWar
WORKDIR /tmp/JenkinsWar
RUN mvn package
RUN cp target/*.war /var/lib/tomcat9/webapps/JenkinsWar.war
RUN chown tomcat:tomcat /var/lib/tomcat9/webapps/JenkinsWar.war
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]