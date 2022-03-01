sudo yum install -y yum-utils
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo systemctl enable docker
docker container run -d -p 80:5000 training/webapp:latest python app.py
docker container run -d -p 80:80 --name nginx nginx