#!/bin/bash

# Установка утилит
sudo yum install nfs-utils -y

# Включение firewall
sudo systemctl enable firewalld --now


# Настройка автомонтирования директории с NFS server
sudo bash -c "echo '192.168.22.10:/srv/share/ /mnt nfs vers=3,proto=udp,x-systemd.automount 0 0' >> /etc/fstab"


#
sudo shutdown -r now


