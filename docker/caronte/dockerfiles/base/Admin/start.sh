#!/bin/bash

#Carga las variables de entorno basadas en el docker compose
set -e

newUser(){
    useradd -rm -d /home/${USUARIO} -s  /bin/bash ${USUARIO} 
    echo "${USUARIO} :${PASSWORD}" | chpasswd
    echo "Bienvenido ${USUARIO} ..." > /home/${USUARIO}/bienvenida.txt
}

main(){
    newUser
    # Encargada de mantener el contenedor en ejecución de Background
    tail -f /dev/null
}

main