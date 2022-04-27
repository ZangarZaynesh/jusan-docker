#!/bin/bash
sudo curl https://stepik.org/media/attachments/lesson/686238/jusan-dockerfile.conf \
	-o jusan-dockerfile.conf
sudo curl https://stepik.org/media/attachments/lesson/686238/jusan-dockerfile.zip \
	-o jusan-dockerfile.zip
sudo unzip jusan-dockerfile.zip
sudo docker build -t nginx:jusan-dockerfile -f Dockerfile .

sudo docker run -d --name jusan-dockerfile -p 6060:80 nginx:jusan-dockerfile

