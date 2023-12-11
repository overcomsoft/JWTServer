#JWTAuthServer:1.0

FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-17-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget http://apache.tt.co.kr/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.14/* /usr/local/tomcat/
RUN rm -rf /tmp/* && rm -rf /usr/local/tomcat/webapps/*

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
