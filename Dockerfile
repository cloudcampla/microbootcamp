FROM gradle:8-jdk17-alpine AS build

WORKDIR /app

COPY . /app

RUN gradle bootJar

FROM gradle:8-jdk17-alpine

COPY --from=build /app/build/libs/microbootcamp-0.0.1-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]