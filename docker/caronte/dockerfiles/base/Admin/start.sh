#!/bin/bash
set -e

source /root/admin/base/usuario/mainuser.sh

configurar_ssh() {

  # 1. Deshabilitar el login de root
  sed -i 's/#?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

  # 2. Cambiar el puerto de SSH
  sed -i 's/#?Port.*/Port 23456/' /etc/ssh/sshd_config
# 3. Configurar la autenticación por clave pública
  mkdir -p /var/run/sshd
  ssh-keygen -A


}

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