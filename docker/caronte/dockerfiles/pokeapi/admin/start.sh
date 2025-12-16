#!/bin/bash
set -e


directorio_de_trabajo(){
    cd /root/admin/node/proyectos/pokeapi
}

contruir_y_copiar(){
    npm install
    npm run build
    cp -r dist/* /var/www/html/
}

cargar_nginx(){
    nginx -t
    nginx -g 'daemon off;'
}


main(){
    load_entrypoint_node
    directorio_de_trabajo
    contruir_y_copiar
    cargar_nginx
}

main