FROM eclipse-temurin:21-jdk

WORKDIR /app

ENV NEXUS_REPO_URL="http://18.214.15.83:8081/repository/maven-release/"
ENV ARTIFACT_PATH="com/devops/springboot-app/1.0/springboot-app-1.0.jar"

ADD ${NEXUS_REPO_URL}${ARTIFACT_PATH} /app/app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
