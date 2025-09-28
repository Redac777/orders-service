# Étape 1 : builder le jar
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app

# Copier pom.xml et télécharger les dépendances
COPY pom.xml .
RUN mvn dependency:go-offline

# Copier le code source
COPY src ./src

# Builder l'application
RUN mvn clean package -DskipTests

# Étape 2 : créer l'image finale avec Java
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copier le jar buildé depuis l'étape précédente
COPY --from=build /app/target/orders-service-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port
EXPOSE 8080

# Commande pour lancer Spring Boot
ENTRYPOINT ["java","-jar","app.jar"]
