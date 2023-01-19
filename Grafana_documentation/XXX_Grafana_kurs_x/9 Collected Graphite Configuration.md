collectd_graphite_configuration
---

yum install -y epel-release
yum install -y collectd
 

Following changes to do - Log and Graphite enabling
---
vi /etc/collectd.conf


LoadPlugin logfile
/root/logs


LoadPlugin syslog
LoadPlugin logfile
LoadPlugin log_logstash

<Plugin logfile>
        LogLevel debug
        File "/tmp/collectd.log"
        Timestamp true
        PrintSeverity false
</Plugin>

<Plugin log_logstash>
        LogLevel info
        File "/tmp/collectd.json.log"
</Plugin>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~```
touch collectd.log
touch collectd.json.log

chmod 776 collect*



LoadPlugin write_graphite

<Plugin write_graphite>
  <Node "example">
    Host "ec2-52-36-160-126.us-west-2.compute.amazonaws.com"
    Port "2003"
    Protocol "tcp"
    ReconnectInterval 0
    LogSendErrors true
    Prefix "collectd"
    Postfix "collectd"
    StoreRates true
    AlwaysAppendDS false
    EscapeCharacter "_"
    SeparateInstances false
    PreserveSeparator false
    DropDuplicateFields false
  </Node>
</Plugin>


Enable collectd with SELINUX


setsebool collectd_tcp_network_connect on
---

systemctl start collectd.service
systemctl stop collectd.service
service collectd status -l


sudo service collectd stop
sudo service collectd start