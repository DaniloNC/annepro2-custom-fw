docker build -t annepro .
docker run --rm -it -v $PWD/customization:/opt/customization -v $PWD/output:/root/output annepro