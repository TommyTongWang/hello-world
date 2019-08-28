#!/bin/bash
echo '##-------------install tcl------------>>>';
yum -y install tcl
echo '##-------------install redis------------>>>';
cd ~/
tar xzvf redis-3.2.8.tar.gz
cd ~/redis-3.2.8/
make && make test && make install
echo '##------------find redis_init_script------------->>>';
find /root/ -name redis_init_script;
cp /root/redis-3.2.8/utils/redis_init_script /etc/init.d/redis_6379;
echo '##------------check port------------->>>';
cat /etc/init.d/redis_6379 | grep 'REDISPORT=';
echo '##------------mkdir------------->>>';
mkdir -p /etc/redis /var/redis/6379;
##------------------------->>>
cp /root/redis-3.2.8/redis.conf /etc/redis/6379.conf;
##------------------------->>>
sed -i '/^daemonize/s/^.*$/daemonize yes/g' /etc/redis/6379.conf;
sed -i '/^dir/s/^.*$/dir \/var\/redis\/6379/g' /etc/redis/6379.conf;
##------------------------->>>
grep -vE "^#|^$" /etc/redis/6379.conf | egrep "daemonize|pidfile|port|dir" | cat -n;
echo '##------------check config------------->>>';
chmod 777 /etc/init.d/redis_6379;
/etc/init.d/redis_6379 start;
##------------------------->>>
sed -i '1a\# chkconfig: 2345 10 90' /etc/init.d/redis_6379;
sed -i '2a\# description: Start and Stop redis' /etc/init.d/redis_6379;
echo '##------------ps -ef------------->>>';
ps -ef | grep redis;
echo '##------------chkconfig------------->>>';
chkconfig redis_6379 on;
chkconfig redis_6379 --list;
echo 'redis done'
