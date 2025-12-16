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

reiniciar_nginx() {
    echo "Configurando Nginx..." >> /root/logs/informe_nginx.log
    
    # Reiniciar Nginx
    if service nginx restart; then
        echo "Nginx reiniciado" >> /root/logs/informe_nginx.log
    else
        echo "ERROR: No se pudo reiniciar Nginx" >> /root/logs/informe_nginx.log
    fi
    
    # Detener Nginx
    #if service nginx stop; then
     #   echo "Nginx detenido" >> /root/logs/informe_nginx.log
    #else
     #   echo "ERROR: No se pudo detener Nginx" >> /root/logs/informe_nginx.log
    #fi
}


main() {
    mkdir -p /root/logs
    touch /root/logs/informe_nginx.log    
    load_entrypoint_base
    reiniciar_nginx
    tail -f /dev/null
}

main