# redis-dump
Docker image for redis dump/restore https://github.com/yannh/redis-dump-go


### Configure encrypted redis connection

```
cat /etc/stunnel/redis-cli.conf
				
fips = no
setuid = root
setgid = root
pid = /var/run/stunnel.pid
debug = 7 
delay = yes
options = NO_SSLv2
options = NO_SSLv3
[redis-cli]
   client = yes
   accept = 127.0.0.1:6379
   connect = master.ssltest.wif01h.use1.cache.amazonaws.com:6379
[redis-cli-replica]
   client = yes
   accept = 127.0.0.1:6380
   connect = ssltest-02.ssltest.wif01h.use1.cache.amazonaws.com:6379
```

### Start stunnel

```bash
sudo stunnel /etc/stunnel/redis-cli.conf
```

### Connect

```bash
redis-cli -h localhost -p 6379  -a my-secret-password	
```
