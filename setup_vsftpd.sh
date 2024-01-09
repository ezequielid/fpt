#!/bin/bash


GREEN='\033[0;32m'
NC='\033[0m' # No Color


success_message() {
  echo -e "${GREEN}$1${NC}"
}


sudo apt update


sudo apt install -y vsftpd


sudo sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sudo sed -i 's|#local_root=|local_root=/|' /etc/vsftpd.conf


sudo service vsftpd restart
success_message "vsftpd configurado y reiniciado correctamente."


sudo ufw allow 21
success_message "Puerto 21 abierto exponer el 4036."


echo -e "Servidor FTP instalado y configurado en ${GREEN}192.168.10.192${NC}"
echo -e "Puedes conectar al servidor FTP utilizando el comando:"
echo -e "${GREEN}ftp 192.168.10.192${NC}"
echo -e "Ingresa tu nombre de usuario y contraseña cuando se te solicite."
