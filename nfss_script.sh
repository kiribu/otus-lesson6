#!/bin/bash

# Установка утилит
sudo yum install nfs-utils -y

# Включение firewall
sudo systemctl enable firewalld --now

# Запускаем
sudo systemctl enable nfs --now


#Настройка правил firewall
sudo firewall-cmd --add-service="nfs3" \
--add-service="rpc-bind" \
--add-service="mountd" \
--permanent
firewall-cmd --reload


# Создание директори на NFS сервере, установка разрешений
sudo mkdir -p /srv/share/upload
sudo chown -R nfsnobody:nfsnobody /srv/share
sudo chmod 0777 /srv/share/upload

#
sudo bash -c "cat << EOF > /etc/exports 
/srv/share 192.168.22.11/32(rw,sync,root_squash) 
EOF"

#
sudo exportfs -r
