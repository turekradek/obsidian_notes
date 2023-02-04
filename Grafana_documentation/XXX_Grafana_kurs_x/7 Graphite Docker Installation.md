Graphite_Docker_Installation
---

docker kill graphite
docker rm graphite
docker run -d\
 --name graphite\
 --restart=always\
 -p 4040:80\
 -p 2003-2004:2003-2004\
 -p 2023-2024:2023-2024\
 -p 8125:8125/udp\
 -p 8126:8126\
 graphiteapp/graphite-statsd
 
 docker restart graphite
 
yum -y install nc

echo "test.graphite.count 20 `date +%s`" | nc node1 2003
echo "test.graphite.count 20 `date +%s`" | nc ip-172-31-24-72.us-west-2.compute.inter