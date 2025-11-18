#!/bin/bash

#!/bin/bash

configurar_sudo() {

    echo "$USUARIO ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USUARIO"
    chmod 0440 "/etc/sudoers.d/$USUARIO"
    
}