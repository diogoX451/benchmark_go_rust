#!/bin/bash

echo "Construir a imagem para AMD64"

if sudo docker images | grep mygolangapp-amd64; then
    echo "Imagem mygolangapp-amd64 encontrada"
else
    echo "Imagem mygolangapp-amd64 não encontrada"
    sudo docker build -t mygolangapp-amd64 -f ./docker/Dockerfile .
fi

echo "Executar o contêiner Docker para AMD64"
sudo docker run -d -p 8080:8080 --name mygolangcontainer-amd64 mygolangapp-amd64
