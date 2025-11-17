#!/bin/bash
set -e

source /root/admin/base/usuario/mainuser.sh
source /root/admin/base/ssh/mainssh.sh

main(){
    # Gestión de usuario --> getuser.sh
    # Gestión del sudo --> getsudo.sh
    # ...
    touch /root/logs/informe.log
    newUser
    # Gestión del ssh --> mainssh.sh
    configurar_ssh
    # Encargada de mantener el contenedor en ejecución de Background
    
    tail -f /dev/null
}

main