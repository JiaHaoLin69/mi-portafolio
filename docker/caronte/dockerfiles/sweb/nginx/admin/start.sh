#!/bin/bash

load_entrypoint_base() {
    echo "Ejecutando entrypoint base..." >> /root/logs/informe_nginx.log
    
    if [ -f /root/admin/base/start.sh ]; then
        bash /root/admin/base/start.sh
        echo "Entrypoint base ejecutado" >> /root/logs/informe_nginx.log
    else
        echo "ERROR: No se encontró /root/admin/base/start.sh" >> /root/logs/informe_nginx.log
    fi
}

ajustar_nginx() {
    echo "Ajustando configuración Nginx..." >> /root/logs/informe_nginx.log
    
    # Verificar si es un servidor block completo o solo configuración
    if [ -d /etc/nginx/sites-available ]; then
        CONFIG_FILE="/etc/nginx/sites-available/default"
    else
        CONFIG_FILE="/etc/nginx/nginx.conf"
    fi
    
    if [ -f "$CONFIG_FILE" ]; then
        # Crear configuración de proxy
        echo "server {
    listen 80;

    location / {
        proxy_pass http://194.163.147.140:80;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}" > "$CONFIG_FILE"
        
        echo "Configuración Nginx actualizada" >> /root/logs/informe_nginx.log
    else
        echo "ERROR: No se encontró archivo de configuración Nginx" >> /root/logs/informe_nginx.log
    fi
}

reiniciar_nginx() {
    echo "Configurando Nginx..." >> /root/logs/informe_nginx.log
    
    # Reiniciar Nginx
    if service nginx restart; then
        echo "Nginx reiniciado" >> /root/logs/informe_nginx.log
    else
        echo "ERROR: No se pudo reiniciar Nginx" >> /root/logs/informe_nginx.log
    fi
    
    # Detener Nginx
    if service nginx stop; then
        echo "Nginx detenido" >> /root/logs/informe_nginx.log
    else
        echo "ERROR: No se pudo detener Nginx" >> /root/logs/informe_nginx.log
    fi
}


main() {
    mkdir -p /root/logs
    touch /root/logs/informe_nginx.log    
    load_entrypoint_base
    ajustar_nginx
    reiniciar_nginx
}

main