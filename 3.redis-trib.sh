#!/bin/bash
echo '##-------- install zlib-devel gcc* openssl* wget -------->>>';
yum -y install zlib-devel gcc* openssl* wget;
echo '##--------------------- install redis ------------------->>>';
cd /root/;
tar xzvf ruby-2.3.1.tar.gz;
cd /root/ruby-2.3.1/;
./configure -prefix=/usr/local/ruby;
make && make install;
echo '##------------ copy ruby script ------------->>>';
cd /usr/local/ruby;
\cp -fr bin/ruby /usr/local/bin;
\cp -fr bin/gem /usr/local/bin;
echo '##------------ gem install ------------->>>';
gem install -l /root/redis-3.3.0.gem;
cp /root/redis-3.2.8/src/redis-trib.rb /usr/local/bin;
echo '##------------ edit config ------------->>>';
sed -i '/:password =>/s/^.*$/      :password => "redispasswd",/g' /usr/local/ruby/lib/ruby/gems/2.3.0/gems/redis-3.3.0/lib/redis/client.rb;
echo '##------------ redis trib ------------->>>';
echo 'redis trib'
