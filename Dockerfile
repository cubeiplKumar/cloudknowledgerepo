FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
MAINTAINER trainings.anil@gmail.com
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/free-css-templates/page2/photobusiness/photobusiness.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photobusiness.zip
RUN cp -rvf photobusiness/* .
RUN rm -rf photobusiness photobusiness.zip
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
