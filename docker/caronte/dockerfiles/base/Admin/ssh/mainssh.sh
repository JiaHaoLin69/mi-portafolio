#!/bin/bash

configurar_ssh() {

  # 1. Crear el directorio necesario para sshd si no existe
  mkdir -p /var/run/sshd

  # 2. Deshabilitar el login de root
  sed -i 's/^#?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

  # 3. Cambiar el puerto de SSH
  sed -i 's/^#?Port.*/Port 23456/' /etc/ssh/sshd_config
  
}