#!/bin/bash
set -e

source /root/admin/base/usuario/mainuser.sh

main(){
    # Gestión de usuario --> getuser.sh
    # Gestión del sudo --> getsudo.sh
    # Gestión del ssh --> getssh.sh
    # ...
    touch /root/logs/informe.log
    newUser
    # Encargada de mantener el contenedor en ejecución de Background
    tail -f /dev/null
}

main