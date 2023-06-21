echo "INICIALIZANDO DOCKER"

echo "Verificando Rede Docker"
docker network rm golang_test

if  docker network ls | grep "golang_test" > /dev/null; then
    echo "Rede Docker já existe"
else
    echo "Criando Rede Docker"
    docker network create --subnet 173.30.0.0/16  golang_test
fi

echo "Verificando Imagem Docker"

if  docker images | grep "golang_benchmark" > /dev/null; then
    echo "Imagem Docker já existe"
else
    echo "Criando Imagem Docker"
    docker build .. -t golang-test-bench  
fi

echo "Rodar Docker"

docker run -idt --rm --network golang_test --ip=173.30.0.2 --name golang_benchmark golang-test-bench