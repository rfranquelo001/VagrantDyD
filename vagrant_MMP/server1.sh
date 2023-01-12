echo "####INSTALING####"
apt update
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt install wordpress curl apache2 mysql-server -y

a2dissite 000-default
a2ensite wp
systemctl reload apache2
cat /home/vagrant/wp.sql | mysql --defaults-extra-file=/etc/mysql/debian.cnf 