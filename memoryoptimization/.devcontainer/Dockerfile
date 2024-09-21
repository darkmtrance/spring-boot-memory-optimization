# Usar una imagen base de GraalVM
FROM ghcr.io/graalvm/graalvm-ce:17

# Establecer el directorio de trabajo
WORKDIR /workspace

# Copiar los archivos fuente al contenedor
COPY src /workspace/src

# Instalar herramientas necesarias (opcional)
RUN apt-get update && apt-get install -y maven

# Configurar el entorno de GraalVM
ENV JAVA_HOME=/usr/lib/jvm/graalvm
ENV PATH="${JAVA_HOME}/bin:${PATH}"