#!/bin/bash

cat << EOF > jusan-docker-exec.conf
server {
    listen 80;
    server_name jusan.singularity;

    location / {return 200 'Hello, from jusan-docker-exec';}
    location /home {return 201 'This is my home!';}
    location /about {return 202 'I am just an exercise!';}
}
EOF

# Running nginx docker
sudo docker run -d \
	--name jusan-docker-exec \
	--mount type=bind,source="$(pwd)",target=/var/www \
	-p 8181:80 nginx:mainline

# Create file in docker
sudo docker exec -d jusan-docker-exec \
        mv /var/www/jusan-docker-exec.conf /etc/nginx/conf.d/

# Remove defaut config
sudo docker exec -d jusan-docker-exec \
	rm /etc/nginx/conf.d/default.conf

# Reload service nginx
sudo docker exec -d jusan-docker-exec \
	service nginx reload


