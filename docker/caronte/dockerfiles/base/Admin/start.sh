#!/bin/bash
set -e

source /root/admin/base/usuario/mainuser.sh
source /root/admin/base/ssh/mainssh.sh
source /root/admin/base/sudo/mainSudo.sh

main(){
    # Gestión de usuario --> getuser.sh
    # Gestión del sudo --> getsudo.sh
    # ...
    touch /root/logs/informe.log
    newUser
    reuser=$?

    if [ "$resuser" -eq 0 ]
    then
        configurar_ssh
    else
        echo "No se configura SSH porque no se ha creado el usuario." >> /root/logs/informe.log
    fi

    if [ "$resuser" -eq 0 ]
    then
        configurar_sudo
    else
        echo "No se configura SUDO porque no se ha creado el usuario." >> /root/logs/informe.log
    fi
    # Encargada de mantener el contenedor en ejecución de Background
    
    tail -f /dev/null
}

main