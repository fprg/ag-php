#!/bin/bash

tar vxzf php.tar.gz
cd php-5.6.10
./configure --prefix=/usr/local/php --with-libdir=lib64 --enable-fpm --enable-calendar --with-openssl --with-zlib --with-iconv --without-pear --enable-mbstring=shared --enable-mbregex --enable-zend-multibyte --with-curl=shared --enable-json=shared --enable-zip=shared --with-ldap=shared --with-xpm-dir=/usr --with-mcrypt --enable-xml --with-libxml-dir=/usr --with-gd=shared --with-jpeg-dir=/usr --with-png-dir=/usr --with-sqlite=shared --with-sqlite3=shared --with-mysql=shared,/usr --with-mysqli=shared,/usr/lib64/mysql/mysql_config --with-pgsql=shared --enable-pdo=shared --with-pdo-odbc=shared,unixODBC,/usr --with-pdo-mysql=shared,/usr/lib64/mysql/mysql_config --with-pdo-pgsql=shared,/usr --with-pdo-sqlite=shared,/usr --disable-fileinfo
make
make test
make install
ln -s /usr/local/php/bin/* /usr/bin/
ln -s /usr/local/php/sbin/* /usr/sbin/
php -v
cp php.ini-production /usr/local/php/lib/
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chmod 755 /etc/init.d/php-fpm
update-rc.d -f php-fpm defaults
