FROM	ubuntu:18.04
MAINTAINER	KuOJ <Konkuk University CSE>

#avoiding user interaction
ENV	DEBIAN_FRONTEND=noninteractive 

#install ubuntu
RUN	apt-get update -y && apt-get install -y --no-install-recommends apt-utils 
#install apache
RUN	apt-get install -y apache2	
#install php
RUN	apt-get install -y php php-mysql
#install mysql
RUN	apt-get install -y mysql-server
#install git
RUN	apt-get install -y git
#install g++ compiler
RUN	apt-get install -y g++
#install make utility
RUN	apt-get install -y make
#download KUOJ from github
RUN	git clone https://github.com/keunbum/KUOJ.git ~/KUOJ
#copy KUOJ to html folder
RUN	cp -r ~/KUOJ /var/www/html/
#make socket file to dir
RUN	mysql -u root -p --socket=/tmp/mysql.sock
#import database to mysql
RUN	mysql -u root < ~/KUOJ/DB/kuoj.sql



EXPOSE	80

