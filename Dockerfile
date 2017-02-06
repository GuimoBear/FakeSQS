FROM openjdk:8-jdk-alpine
MAINTAINER Guilherme Barros <guilherme@tecsoft.info>
RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN curl -o elasticmq-server.jar https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-0.13.1.jar
COPY ./custom.conf ./custom.conf
CMD java -Dconfig.file=custom.conf -jar elasticmq-server.jar
EXPOSE 9324