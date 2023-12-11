# 베이스 이미지 설정
FROM eclipse-temurin:17
LABEL maintainer="DDWorks JWT Server"

# 환경 변수 설정
ENV CATALINA_HOME /usr/local/tomcat

# 필요한 도구 및 패키지 설치
RUN apt-get update && apt-get install -y unzip

# Tomcat 다운로드 및 압축 해제
RUN wget -q http://apache.mirror.cdnetworks.com/tomcat/tomcat-10/v10.1.16/bin/apache-tomcat-10.1.16.tar.gz -O /tmp/tomcat.tar.gz \
    && tar xzf /tmp/tomcat.tar.gz -C /usr/local \
    && mv /usr/local/apache-tomcat-* $CATALINA_HOME \
    && rm /tmp/tomcat.tar.gz \
    && rm -rf $CATALINA_HOME/webapps/examples $CATALINA_HOME/webapps/docs

#JWT 인증 war 설치
COPY ./DDWorksGISServer.war $CATALINA_HOME/webapps/DDWorksGISServer.war

# Geoserver 다운로드 및 설치
#RUN wget -q #https://sourceforge.net/projects/geoserver/files/GeoServer/2.24.1/geoserver-2.24.1-war.zip -O #/tmp/geoserver.zip \
#    && unzip /tmp/geoserver.zip -d $CATALINA_HOME/webapps \
#    && rm /tmp/geoserver.zip


# 포트 설정
EXPOSE 8080

# 실행 명령 설정
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

#CMD ["/usr/local/geoserver/bin/startup.sh", "run"]

#docker build -t ddwweb:1.0 .

#docker run -d -p 8081:8080 --name jwtserver jwtsvr:1.0
#https://sourceforge.net/projects/geoserver/files/GeoServer/2.24.1/geoserver-2.24.1-war.zip
