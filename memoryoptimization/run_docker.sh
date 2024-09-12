#!/bin/bash

# Nombre de la imagen de Docker
IMAGE_NAME="memory-optimization"

# Nombre del contenedor
CONTAINER_NAME="memory-optimization-container"

# Construir la imagen de Docker
echo "Construyendo la imagen de Docker..."
docker build -t $IMAGE_NAME .

# Verificar si el contenedor ya está en ejecución y detenerlo
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Deteniendo el contenedor existente..."
    docker stop $CONTAINER_NAME
fi

# Verificar si el contenedor existe y eliminarlo
if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
    echo "Eliminando el contenedor existente..."
    docker rm $CONTAINER_NAME
fi

# Ejecutar el contenedor
echo "Ejecutando el contenedor..."
docker run -d --name $CONTAINER_NAME -p 8080:8080 $IMAGE_NAME

# Mensaje de éxito
echo "La aplicación está corriendo en http://localhost:8080"