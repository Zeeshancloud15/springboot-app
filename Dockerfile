
FROM eclipse-temurin:21-jdk

WORKDIR /app

ARG NEXUS_REPO_URL
ARG NEXUS_USER
ARG NEXUS_PASS

ENV ARTIFACT_PATH=com/devops/springboot-app/1.0/springboot-app-1.0.jar

RUN apt-get update && apt-get install -y wget \
    && wget --user="$NEXUS_USER" \
       --password="$NEXUS_PASS" \
       -O app.jar \
       "${NEXUS_REPO_URL}${ARTIFACT_PATH}" \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
