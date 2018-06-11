#!/usr/bin/env bash

docker run -d -p 13306:3306 --name mysql_pika -v ~/IdeaProjects/pika/pika-boss/mysql/data:/var/lib/mysql mysql:5.7