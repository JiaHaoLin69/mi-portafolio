#!/bin/bash

configurar_ssh() {

  # 1. Deshabilitar el login de root
  sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
  # 2. Cambiar el puerto de SSH
  sed -i 's/#Port.*/Port '$PORT_SSH'/' /etc/ssh/sshd_config
  mkdir /home/$USUARIO/.ssh
  cp ./common/ >> /home/$USUARIO/.ssh/
  #4 Reinicar el servicio SSH para que se aplique las configuraciones
  service ssh restart # ESTO DARÁ PROBLEMAS A FUTURO POR LO QUE USAREMOS EL QUE HAY COMENTADO ABAJO
  # /etc/init.d/ssh start
  # exec /usr/sbin/sshd -D & # dejar el ssh en background PARA CUANDO LO IMPLEMENTOS EN UN SERVICIO

}