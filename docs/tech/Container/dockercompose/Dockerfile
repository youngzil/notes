FROM openjdk:8-jre-alpine

ARG MODULE=hermes-test-provider-jsonrpc
ENV APP=${MODULE}-1.0.0-SNAPSHOT.jar

COPY target/$APP $APP

EXPOSE 8080

ENTRYPOINT java -Dspring.profiles.active=docker  -jar $APP
