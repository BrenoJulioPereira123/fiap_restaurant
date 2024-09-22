# Use uma imagem base do JDK
FROM openjdk:17-jdk-alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

COPY . /app

RUN mvn package

FROM openjdk:17-jdk-alpine

# Copie o arquivo JAR da sua aplicação para o diretório de trabalho do contêiner
COPY target/*.jar /app/app.jar

# Exponha a porta em que sua aplicação está configurada para ouvir (geralmente 8080)
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
