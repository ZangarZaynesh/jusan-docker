#!/bin/bash

sudo docker build -t jusan-fastapi-final:dockerized -f Dockerfile .

sudo docker run -d --name jusan-dockerize -p 8080:8080 \
	jusan-fastapi-final:dockerized


