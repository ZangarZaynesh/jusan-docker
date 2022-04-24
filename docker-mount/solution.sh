#!/bin/bash

# download file and zip 
sudo curl https://stepik.org/media/attachments/lesson/686238/jusan-docker-mount.conf -o jusan-docker-mount.conf
sudo curl https://stepik.org/media/attachments/lesson/686238/jusan-docker-mount.zip -o jusan-docker-mount.zip

# Extract archive
sudo unzip jusan-docker-mount.zip

# delete junk files
sudo rm -rf jusan-docker-mount.zip
sudo rm -rf __MACOSX


# running docker
sudo docker run -d --name jusan-docker-mount \
	-v "$(pwd)"/jusan-docker-mount.conf:/etc/nginx/conf.d/jusan-docker-mount.conf \
	--mount type=bind,source="$(pwd)"/jusan-docker-mount,target=/var/www/example \
	-p 9999:80 nginx:mainline

# delete default file 
sudo docker exec -d jusan-docker-mount \
	rm /etc/nginx/conf.d/default.conf

# Reload nginx service
sudo docker exec -d jusan-docker-mount \
	service nginx reload

