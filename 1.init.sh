#!/bin/bash
echo '##------------------->>> 设置成英文';
echo 'LANG="en_US.UTF-8"' > /etc/sysconfig/i18n
source /etc/sysconfig/i18n
echo '##------------------->>> 安装java';
yum -y install java-1.7.0-openjdk;
echo '##------------------->>> 安装perl';
yum -y install perl perl-devel;
echo '##------------------->>> 安装gcc';
yum -y install -y gcc;
echo '##------------------->>> 安装expect';
yum -y install expect;
echo '##------------------->>>';
ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa;
\cp -fr ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys;
echo '##------------------->>>';
echo 'init done'
