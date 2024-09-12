# Utiliza una imagen base de Java 17
FROM openjdk:17-jdk-slim as builder

# Copia el código fuente al contenedor
COPY . /app
WORKDIR /app

# Compila el proyecto usando Maven
RUN ./mvnw clean package -DskipTests

# Crea una imagen más pequeña para el entorno de producción
FROM openjdk:17-jdk-slim

# Copia el JAR compilado al contenedor
COPY --from=builder /app/target/*.jar /app/app.jar

# Copia el archivo de configuración al contenedor
#COPY dev.jvm.conf /app/

# Establece las variables de entorno para la configuración de JVM
#ENV JAVA_TOOL_OPTIONS="-XX:+UseSerialGC -Xss512k -XX:MaxRAM=200m"

# Expone el puerto 8080 para la aplicación
EXPOSE 8080

# Establece el comando de inicio para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/app.jar"]