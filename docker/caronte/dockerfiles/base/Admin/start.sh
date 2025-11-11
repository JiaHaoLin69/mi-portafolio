#!/bin/bash

newUser(){
    useradd -rm -d /home/${USUARIO} -s  /bin/bash jiahaolin
    echo "jiahaolin:1234" | chpasswd
    echo "Bienvenido jiahaolin ..." > /home/jiahaolin/bienvenida.txt
}

main(){
    newUser
    # Encargada de mantener el contenedor en ejecución de Background
    tail -f /dev/null
}

main