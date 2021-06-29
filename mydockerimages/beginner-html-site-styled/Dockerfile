FROM centos
LABEL  "email"="ashutoshh@linux.com"
RUN  yum install httpd -y
# installing httpd
COPY  .  /var/www/html/
# copy entire data from the location where Dockerfile 
# is present to /var/www/html/ location of docker image
ENTRYPOINT  httpd -DFOREGROUND 