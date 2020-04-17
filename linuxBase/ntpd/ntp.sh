yum install ntp

restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap

server 127.127.1.0


ntpq -p NTP-IPADDR