# Ejemplo de Aplicación Spring Boot con Reducción de Consumo de Memoria

Este proyecto es un ejemplo básico de una aplicación Spring Boot que implementa configuraciones para reducir el consumo de memoria en entornos de desarrollo. Se basa en las recomendaciones del artículo [How We Reduced the Memory Consumption of Spring Boot Application Over 40% for the Development](https://medium.com/@satanjim/how-we-reduced-the-memory-consumption-of-spring-boot-application-over-40-for-the-development-c8a5813fac23).

## Requisitos Previos

- **Java 17 o superior**
- **Maven**
- **Docker** y **docker-compose** (opcional)

## Configuraciones Clave

### 1. Archivo de Configuración `dev.jvm.conf`

Este archivo contiene configuraciones que ayudan a reducir el consumo de memoria.

```plaintext
# dev.jvm.conf

# Configuraciones de Tomcat
SERVER_TOMCAT_ACCEPT_COUNT=3
SERVER_TOMCAT_MAX_CONNECTIONS=3
SERVER_TOMCAT_THREADS_MAX=3
SERVER_TOMCAT_THREADS_MIN_SPARE=1

# Inicialización perezosa de Spring
SPRING_MAIN_LAZY_INITIALIZATION=true

# Configuraciones de JVM
JAVA_TOOL_OPTIONS=-XX:+UseSerialGC -Xss512k -XX:MaxRAM=200m

```

### 2. Creación de imagen

Para construir la imagen de Docker de la aplicación, ejecuta el siguiente comando en la ruta del proyecto **memoryoptimization**:

```bash
./run_docker.sh
```

### 3. Ejecución de compose

Para iniciar los contenedores utilizando Docker Compose, puedes usar los siguientes comandos:

```bash
# Iniciar los contenedores en segundo plano
docker compose up -d

# Detener y eliminar los contenedores
docker compose down

# Iniciar contenedores con un archivo de configuración específico
docker compose -f compose-optimization.yaml up -d

# Detener y eliminar contenedores de un archivo de configuración específico
docker compose -f compose-optimization.yaml down

```

### 4. Ejecución de nativo

Referencia [spring-native-intro](https://www.baeldung.com/spring-native-intro)

```bash
# Generacion de binario nativo
mvn clean package -Pnative

# Generacion de imagen del binario nativo
./run_docker.sh

# Inicio contenedor
docker compose up -d
```