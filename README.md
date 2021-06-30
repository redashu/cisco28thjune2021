# Plan of traning and its execution 

<img src="plan.png">

## more about CRE

<img src="cre_rev.png">

## More on containers 

<img src="day2_rev.png">

## A glimpse to java web and deploying in tomcat 

<img src="tomcat.png">

### BUilding javaweb 

```
[niket@ip-172-31-75-82 mydockerimages]$ docker  build -t  ciscojavaweb:v1  ./javawebapp  
Sending build context to Docker daemon  231.4kB
Step 1/6 : FROM tomcat
latest: Pulling from library/tomcat
0bc3020d05f1: Already exists 
a110e5871660: Already exists 
83d3c0fa203a: Already exists 
a8fd09c11b02: Already exists 
96ebf1506065: Pull complete 
b8bf70f9cc4d: Pull complete 
3f6da67b9e68: Pull complete 
257407776119: Pull complete 
541802ef66b7: Pull complete 
1e119b3654ab: Pull complete 
Digest: sha256:d0e769cea1684c065bb6a2e52f13cd5d7138a19a5ef3c16828f32e9bd8323f56
Status: Downloaded newer image for tomcat:latest
 ---> b0bf9a4a7c93
 
 ```
 
 ### creating container 
 
 ```
  docker run -itd --name ashujc1 -p 4466:8080 --memory 200m --cpu-shares=30  a90319d67c32 
24f1c23bf126ad70554df44216086f8f37608bd3643e094a9ac954012811f710
[niket@ip-172-31-75-82 mydockerimages]$ docker  ps
CONTAINER ID   IMAGE          COMMAND             CREATED         STATUS         PORTS                    NAMES
24f1c23bf126   a90319d67c32   "catalina.sh run"   4 seconds ago   Up 3 seconds   0.0.0.0:4466->8080/tcp   ashujc1

```

## pushing image registry to quay 

### tag

```
docker  tag  ciscojavawebapp:v1    quay.io/redashu/javawebapp:ciscoday3 
```

### login 

```
docker  login   quay.io  

```

### pushing and logout 

```
niket@ip-172-31-75-82 mydockerimages]$ docker  push  quay.io/redashu/javawebapp:ciscoday3
The push refers to repository [quay.io/redashu/javawebapp]
7dc3bf71a2aa: Pushed 
d5163f196403: Pushed 
eb671b209e8d: Pushed 
9dfdabdf2745: Pushed 
b59bec8e9230: Pushed 
6ea995e9b7d3: Pushed 


[niket@ip-172-31-75-82 mydockerimages]$ docker  logout   quay.io  
Removing login credentials for quay.io

```





