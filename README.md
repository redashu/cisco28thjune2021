# Plan of traning and its execution 

<img src="plan.png">

## Day1 summary 

<img src="day1.png">

## docker BUild and RUn 

<img src="day11.png">


### trick to remove all containers

```
[niket@ip-172-31-75-82 mydockerimages]$ docker rm $(docker ps -aq) 
4e72f1ff42c3
635ced1c463c
3f9ebd843530

```

## COntainerization of webapps

### webapplication server 

<img src="web.png">

### apache httpd 

<img src="httpd.png">

### Sample front end web app -- containerization 

```
git clone https://github.com/mdn/beginner-html-site-styled
Cloning into 'beginner-html-site-styled'...
remote: Enumerating objects: 40, done.
remote: Total 40 (delta 0), reused 0 (delta 0), pack-reused 40
Unpacking objects: 100% (40/40), done.
[niket@ip-172-31-75-82 mydockerimages]$ ls
beginner-html-site-styled  javaimg  pythonimg  webappimg

```

### CMD vs ENTRYPOINT 

<img src="cmdvsent.png">

### building docker images

```
niket@ip-172-31-75-82 mydockerimages]$ cd  beginner-html-site-styled/
[niket@ip-172-31-75-82 beginner-html-site-styled]$ ls
CODE_OF_CONDUCT.md  Dockerfile  images  index.html  LICENSE  README.md  styles
[niket@ip-172-31-75-82 beginner-html-site-styled]$ docker  build  -t  httpd:ashuciscov111 . 
Sending build context to Docker daemon  63.49kB
Step 1/5 : FROM centos
 ---> 300e315adb2f
Step 2/5 : LABEL  "email"="ashutoshh@linux.com"
 ---> Using cache
 ---> 83aa7c630448
Step 3/5 : RUN  yum install httpd -y
 ---> Running in d047a579504c
CentOS Linux 8 - AppStream                       38 MB/s | 7.5 MB     00:00    
CentOS Linux 8 - BaseOS                          15 MB/s | 2.6 MB     00:00    
CentOS Linux 8 - Extras                          89 kB/s | 9.6 kB     00:00    
Dependencies resolved.
=========================================

```

## creating container 

```
docker run -tid --name x1 -p 1234:80 httpd:ashuciscov111 
```


## INtro to Cgroups 

<img src="cg.png">


### checking docker host machine resources  and other info 

```
niket@ip-172-31-75-82 mydockerimages]$ docker  info  
Client:
 Context:    default
 Debug Mode: false

Server:
 Containers: 13
  Running: 8
  Paused: 0
  Stopped: 5
 Images: 125
 Server Version: 20.10.4
 Storage Driver: overlay2
  Backing Filesystem: xfs
  Supports d_type: true
  Native Overlay Diff: true
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 1
 Plugins:
 
 ```
 
 ### checking docker stats
 
 ```
 docker stats 
 ----
 CONTAINER ID   NAME          CPU %     MEM USAGE / LIMIT    MEM %     NET I/O           BLOCK I/O    PIDS
bcce9ac3a771   webapp        0.06%     18.56MiB / 7.69GiB   0.24%     1kB / 0B          0B / 0B      213
5aa367e87118   him2httpd     0.07%     23.12MiB / 7.69GiB   0.29%     6.58kB / 61kB     0B / 0B      278
bc800694204c   vritywebc1    0.09%     23.19MiB / 7.69GiB   0.29%     7.31kB / 60.7kB   0B / 0B      278
a650cb63f8a9   DipanjanWeb   0.09%     23.2MiB / 7.69GiB    0.29%     4.31kB / 60.5kB   0B / 0B      278
7b173edc43f3   sathyac1      0.08%     23.31MiB / 7.69GiB   0.30%     7.52kB / 61.5kB   0B / 0B      278
e9e3f51d788d   sanju1        0.08%     23.25MiB / 7.69GiB   0.30%     7.11kB / 61kB     0B / 0B      278
e35dce4fd920   subhamc1      0.08%     23.45MiB / 7.69GiB   0.30%     9.33kB / 121kB    0B / 0B      278
092925605fb0   ashuc1        0.08%     24.02MiB / 7.69GiB   0.31%     18.5kB / 242kB    958kB / 0B   278


```

### container with cgroups limit

```
docker  run -tid --name ashuc2  -p 1188:80  --memory=100m   --cpu-shares=30  httpd:ashuciscov111 

```


