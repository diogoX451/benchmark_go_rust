echo "INICIALIZANDO DOCKER"

echo "Verificando Rede Docker"
sudo docker network rm golang_test

if sudo docker network ls | grep "golang_test" > /dev/null; then
    echo "Rede Docker já existe"
else
    echo "Criando Rede Docker"
    sudo docker network create --subnet 173.30.0.0/16  golang_test
fi

echo "Verificando Imagem Docker"

if sudo docker images | grep "golang_benchmark" > /dev/null; then
    echo "Imagem Docker já existe"
else
    echo "Criando Imagem Docker"
     sudo docker build .. -t golang-test-bench  
fi

echo "Rodar Docker"

sudo docker run -idt --rm --network golang_test --ip=173.30.0.2 --name golang_benchmark golang-test-bench