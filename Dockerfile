FROM maven:3.8.4-openjdk-17-slim AS build

COPY . /app
WORKDIR /app

RUN mvn clean package -DskipTests

FROM openjdk:17-slim

WORKDIR /app
COPY --from=build /app/target/comp367-lab2-q2t3-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8088

CMD ["java", "-jar", "app.jar"]