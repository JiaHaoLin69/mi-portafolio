#!/bin/bash

#Carga las variables de entorno basadas en el docker compose
set -e

newUser(){
<<<<<<< HEAD
    useradd -rm -d /home/${USUARIO} -s  /bin/bash ${USUARIO} 
    echo "${USUARIO} :1234" | chpasswd
    echo "Bienvenido ${USUARIO} ..." > /home/${USUARIO}/bienvenida.txt
=======
    useradd -rm -d /home/${USUARIO} -s  /bin/bash jiahaolin
    echo "jiahaolin:1234" | chpasswd
    echo "Bienvenido jiahaolin ..." > /home/jiahaolin/bienvenida.txt
>>>>>>> 6b9e55529df7f231284694d8379a4218faeecd7b
}

main(){
    newUser
    # Encargada de mantener el contenedor en ejecución de Background
    tail -f /dev/null
}

main