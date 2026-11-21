
FROM eclipse-temurin:21-jdk

WORKDIR /app

ENV NEXUS_REPO_URL="http://18.214.15.83:8081/repository/maven-release/"

ENV ARTIFACT_PATH="com/devops/springboot-app/1.0/springboot-app-1.0.jar"

RUN apt-get update && apt-get install -y wget \
    && wget -O app.jar "${NEXUS_REPO_URL}${ARTIFACT_PATH}" \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
