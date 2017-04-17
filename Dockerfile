FROM ubuntu:16.04
# bla bla bla
RUN apt-get -y update && apt-get -y install openjdk-8-jre-headless
RUN useradd -ms /bin/bash smartcinema

ADD https://jenkins.genosse-einhorn.de/job/SmartCinema%20web%20master/lastSuccessfulBuild/artifact/web%20app/build/libs/tinf15b4-kino-web-0.0.1-SNAPSHOT.jar /home/smartcinema/webapp.jar
RUN chown smartcinema:smartcinema /home/smartcinema/webapp.jar

USER smartcinema
WORKDIR /home/smartcinema
EXPOSE 8080

CMD ["java", "-jar", "/home/smartcinema/webapp.jar"]
