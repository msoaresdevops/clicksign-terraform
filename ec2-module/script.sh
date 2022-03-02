#!/bin/bash

sudo yum install -y yum-utils
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo systemctl enable docker
docker container run -d -p 80:80 efraimbensoares/my-custom-nginx:1.2

