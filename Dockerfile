RUN apt-get install maven -y
RUN mvn clean install
# Use uma imagem base do JDK
FROM openjdk:17-jdk-alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo JAR da sua aplicação para o diretório de trabalho do contêiner
COPY --from=build /target/restaurant-0.0.1-SNAPSHOT.jar app.jar

# Exponha a porta em que sua aplicação está configurada para ouvir (geralmente 8080)
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]