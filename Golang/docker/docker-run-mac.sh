#!/bin/bash

# Construir a imagem para ARM64
docker build -t mygolangapp-arm64 -f ./docker/Dockerfile --build-arg TARGETARCH=arm64 ..

# Executar o contêiner Docker para ARM64
docker run -d -p 8081:8080 --name mygolangcontainer-arm64 mygolangapp-arm64