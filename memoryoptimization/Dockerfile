# Etapa de producción: crea una imagen ligera
FROM gcr.io/distroless/base

# Copia el ejecutable nativo desde la etapa de construcción
COPY /target/memoryoptimization.exe /app/memoryoptimization.exe

# Expone el puerto 8080 para la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["/app/memoryoptimizationnative"]