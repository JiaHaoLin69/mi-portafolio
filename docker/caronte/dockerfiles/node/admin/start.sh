#!/bin/bash

set -e 

load_entrypoint_nginx(){
    bash /root/admin/sweb/nginx/admin/start.sh
}

workdir(){
    cd /root/admin/node/proyectos/pokeapi
}

dependencias(){
    npm install
    HOST=0.0.0.0 PORT=3000 npm start
}




main(){
    load_entrypoint_nginx
    workdir
    dependencias
    tail -f /dev/null
}

main