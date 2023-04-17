FROM maven:3.6.3-openjdk-11-slim AS MAVEN_BUILD
COPY ./ ./
RUN mvn clean package --no-transfer-progress -DskipTests

FROM openjdk:11-jre
COPY --from=MAVEN_BUILD /target/helloworld.war /helloworld.war
CMD ["java", "-jar", "helloworld.war"]
