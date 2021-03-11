FROM centos
RUN yum -y update && yum clean all
RUN yum -y install httpd php php-mysql php-gd pwgen supervisor psmisc tar && yum clean all
ADD http://wordpress.org/latest.tar.gz /wordpress.tar.gz
RUN tar -xvzf /wordpress.tar.gz
RUN mv /wordpress/* /var/www/html/.
RUN cd /var/www/html
RUN chown -R apache.apache wordpress
RUN chmod -R 755 wordpress
RUN chmod 755 /etc/apache2/foreground.sh
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
