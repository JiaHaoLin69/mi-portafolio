# Borrar la redirección del puerto 80 al Ingress (30088)
sudo iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 30088

# Borrar la redirección del puerto 443 al Ingress (30766)
sudo iptables -t nat -D PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 30766

# Borrar intentos previos (hacia la app o solvers antiguos)
sudo iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 30081
sudo iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 30166
sudo iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 31652
