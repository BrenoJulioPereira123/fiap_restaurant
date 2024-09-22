# Etapa de build
FROM maven:3.8.7-openjdk-17 AS build

# Defina o diretório de trabalho e copie os arquivos da aplicação
WORKDIR /app
COPY . /app

# Executa o Maven para construir o JAR
RUN mvn clean package -DskipTests

# Etapa final
FROM openjdk:17-jdk-alpine
WORKDIR /app

# Copia o JAR do estágio de build para o estágio final
COPY --from=build /app/target/restaurant-0.0.1-SNAPSHOT.jar /app/app.jar

# Exponha a porta que a aplicação usará
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["java", "-jar", "/app/app.jar"]
