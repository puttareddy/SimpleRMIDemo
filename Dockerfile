# Stage 1: Build the application
FROM gradle:6.9-jdk8 as builder
WORKDIR /app
COPY . /app
RUN gradle build --no-daemon -x test

# Stage 2: Package the server application
FROM openjdk:8-jre-slim as server
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 1099
ENTRYPOINT ["java", "-jar", "app.jar"]

# Stage 3: Package the client application
FROM openjdk:8-jre-slim as client
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar client.jar
ENTRYPOINT ["java", "-cp", "client.jar", "com.example.rmi.RMIClient"]
