Grafana_Docker_Installation
---

sudo su
cd

sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce

sudo systemctl enable docker.service

sudo systemctl start docker.servi