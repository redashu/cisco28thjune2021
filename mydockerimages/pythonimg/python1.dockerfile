FROM alpine 
LABEL  "email"="ashutoshh@linux.com"
LABEL "name"="ashutoshh"
RUN apk add python3 
RUN  mkdir  /mycode 
COPY cisco.py  /mycode/cisco.py
WORKDIR  /mycode
CMD  ["python3","cisco.py"]