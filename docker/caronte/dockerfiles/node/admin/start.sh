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
    npm run dev -- --host 0.0.0.0 --port 3000
}

main(){
    load_entrypoint_nginx
    workdir
    dependencias
    tail -f /dev/null
}

main