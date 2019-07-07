#!/usr/bin/bash
read -p "set your server domain :" domain
read -p "set your dkim selector :" selector

cat myapp.sh.default | sed s/server_name/$domain/g >tmp
cat tmp | sed s/dkim_selector/$selector/g >myapp.sh
rm tmp

sudo docker-compose up --build -d
sudo docker-compose kill
sudo docker rm dkim
sudo docker rmi dkim
sleep 3
sudo less /etc/opendkim/keys/$domain/$selector\.txt

