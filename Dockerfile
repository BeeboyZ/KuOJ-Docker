FROM	ubuntu:18.04
MAINTAINER	KuOJ <Konkuk University CSE>

RUN	apt-get -y update && apt-get -y upgrade	#install ubuntu  
RUN	apt-get install -y apache2 #install apache	
RUN	apt-get install -y php php-mysql #install php
RUN	apt-get install -y mysql-server #install mysql
RUN	apt-get install -y git #install git
RUN	apt-get install -y g++ #install g++ compiler
RUN	apt-get install -y make
RUN	git clone https://github.com/keunbum/KUOJ.git #download KUOJ from github
RUN	cp -r ~/KUOJ /var/www/html/ #copy KUOJ to /var/www/html/ #copy KUOJ to html folder
RUN	mysql -u root < ~/KUOJ/DB/kuoj.sql #import database on mysql


EXPOSE	80

