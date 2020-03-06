#!bin/bash

yum -y install epel-release yum-utils createrepo

mkdir /mnt/flash && mount /dev/sdb /mnt/flash
mkdir /mnt/flash/localrepo && cd /mnt/flash/localrepo

# Для шары Windows <-> Linux
repotrack samba
# Для сервера 1С Linux (не забыть про шрифты)
repotrack ImageMagick openssl systemd-sysv
# Неизвестно нужное ли для сервера 1С Linux
repotrack libgsf unixODBC t1utils
# Для клиента 1С Linux
repotrack webkitgtk3
# Для сервера PostgreSQL Linux
repotrack initscripts libicu libicu-devel libxslt
# Утилиты
repotrack mc lsof iftop iotop yum-plugin-remove-with-leaves

createrepo -v /mnt/flash/localrepo

yum clean all
rm /etc/yum.repos.d/localrepo.repo
