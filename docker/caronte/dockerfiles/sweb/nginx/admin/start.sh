#!/bin/bash
config_nginx() {
    service nginx restart
    service nginx stop
}
load_entrypoint_base(){
    bash /root/admin/base/start.sh
}

ajustar_nginx(){
    server {
    listen 80;

    location / {

        proxy_pass http://194.163.147.140:8888; 

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

main(){
 load_entrypoint_base
 config_nginx
}

main