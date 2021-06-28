FROM centos 
# i am using centos linux distro 
# if this base docker image is not present in docker host
# it will be pulled from Docker HUB automatically
LABEL  "email"="ashutoshh@linux.com"
LABEL "name"="ashutoshh"
# img developer info optional field 
RUN  yum  install  python3 -y
# Installing python3 in Centos base os img 
# RUN is offering a run time SHELL
RUN  mkdir  /mycode 
# creating directory inside docker image
# here i will copy my source code
COPY cisco.py  /mycode/cisco.py
# copy data from Docker client machine to docker engine
# during image build time 
#  make sure Dockerfile and source is at same location 
WORKDIR  /mycode
# changing directory during image build time 
# its like cd command in linux
CMD  ["python3","cisco.py"]
# to define default parent process

