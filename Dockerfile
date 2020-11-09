FROM java:8
ADD target/gateway-service.jar gateway-service.jar
EXPOSE 8011
ENTRYPOINT ["java" , "-jar" , "gateway-service.jar"]