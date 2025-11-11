#!/bin/bash

#Carga las variables de entorno basadas en el docker compose
set -e

checkusuario(){
    if grep -q "${USUARIO}" /etc/passwd 
    then
        echo "${USUARIO} se encuentra en el sistema." >> /root/logs/informe.log
        return 1
    else
        echo "${USUARIO} no se encuentra en el sistema." >> /root/logs/informe.log
        return 0
    fi
}

newUser(){
    checkusuario
    if [ "$?" -eq 0 ]
    then
        useradd -rm -d /home/${USUARIO} -s  /bin/bash ${USUARIO} 
        echo "${USUARIO} :${PASSWORD}" | chpasswd
        echo "Bienvenido ${USUARIO} ..." > /home/${USUARIO}/bienvenida.txt
    fi

}

main(){
    touch /root/logs/informe.log
    newUser
    # Encargada de mantener el contenedor en ejecución de Background
    tail -f /dev/null
}

main