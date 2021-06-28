FROM python 
LABEL  "email"="ashutoshh@linux.com"
LABEL "name"="ashutoshh"
RUN  mkdir  /mycode 
COPY cisco.py  /mycode/cisco.py
WORKDIR  /mycode
CMD  ["python","cisco.py"]
