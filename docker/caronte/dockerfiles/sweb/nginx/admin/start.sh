#!/bin/bash
config_nginx() {
    service nginx restart
    service nginx stop
}
load_entrypoint_base(){
    bash /root/admin/base/start.sh
}

main(){
 load_entrypoint_base
 config_nginx
}

main