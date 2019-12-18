FROM	ubuntu:19.10
MAINTAINER	KuOJ <Konkuk University CSE>

#avoiding user interaction while building
ENV	DEBIAN_FRONTEND=noninteractive 

#install ubuntu
RUN	apt update -y && apt upgrade -y && apt install -y --no-install-recommends apt-utils
#install apache
RUN	apt install -y apache2	
#install php
RUN	apt install -y php php-mysql
#install mysql
RUN	apt install -y mysql-server
#install git
RUN	apt install -y git
#install g++ compiler
RUN	apt install -y g++
#install make utility
RUN	apt install -y make
#install libmysqlclient
RUN	apt install -y libmysqlclient-dev
#clone KUOJ from github
RUN	git clone https://github.com/keunbum/KUOJ.git ~/kuoj
#copy KUOJ to html folder
RUN	cp -r ~/kuoj /var/www/html/
#restart apache2
RUN	echo "ServerName localhost" >> /etc/apache2/apache2.conf

#restart apache2 mysql on container, import database, run server, run bash shell
CMD	service apache2 restart && service mysql restart && mysql -u root mysql < /var/www/html/kuoj/DB/kuoj.sql && cd /var/www/html/kuoj/Score/ && ./server && /bin/bash

#set port number for host
EXPOSE	80
