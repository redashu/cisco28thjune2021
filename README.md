# Plan of traning and its execution 

<img src="plan.png">

## Pre-requisite 

<img src="pre.png">


## App deployment history 

<img src="hist.png">

## moving from base OS to Virtualization concept 

<img src="vm.png">

## APp platform are not using entire OS libraries and apps

<img src="app1.png">


## OS BASIC 

<img src="os.png">

## Vm VS  containers

<img src="vmcont.png">

## Hypervisor vs CRE 

<img src="cre.png">

# Getting started with Docker 

<img src="docker1.png">

## Docker ce 

<img src="ce.png">


## Docker ce installation 

<img src="ceinstall.png">

## checking installation 

```
❯ docker version
Client:
 Cloud integration: 1.0.14
 Version:           20.10.6
 API version:       1.41
 Go version:        go1.16.3
 Git commit:        370c289
 Built:             Fri Apr  9 22:46:57 2021
 OS/Arch:           darwin/amd64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.6
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       8728dd2
  Built:            Fri Apr  9 22:44:56 2021
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.4.4
  GitCommit:        05f951a3781f4f2c1911b05e
```

## Docker  arch 

<img src="darch.png">

### docker image registry 

<img src="reg.png">

## Docker client side operations 

### search. 

<img src="dh.png">

### checking images on docker host 

```
❯ docker   images
REPOSITORY                       TAG       IMAGE ID       CREATED        SIZE
navyas1388/navyacustome          v001      7f38298bcda6   10 days ago    369MB
dockerashu/ashucustomer1         v0011     0aec01272ecc   10 days ago    369MB
gcr.io/kaniko-project/executor   latest    1c812ffa8ec1   5 weeks ago    77.9MB
gcr.io/k8s-minikube/kicbase      v0.0.22   bcd131522525   7 weeks ago    1.09GB
portainer/portainer              latest    580c0e4e98b0   3 months ago   79.1MB

```

### pulling image into docker host 

```
❯ docker   pull   openjdk
Using default tag: latest
latest: Pulling from library/openjdk
5a581c13a8b9: Downloading [=========================>                         ]  21.76MB/42.18MB
26cd02acd9c2: Download complete 
66727af51578: Downloading [=====>                                             ]  19.26MB/184.8MB


```

--

```
❯ docker   pull   alpine
Using default tag: latest
latest: Pulling from library/alpine
5843afab3874: Pull complete 
Digest: sha256:234cb88d3020898631af0ccbbcca9a66ae7306ecd30c9720690858c1b007d2a0
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest
❯ docker   pull   busybox
Using default tag: latest
latest: Pulling from library/busybox
b71f96345d44: Pull complete 
Digest: sha256:930490f97e5b921535c153e0e7110d251134cc4b72bbb8133c6a5065cc68580d
Status: Downloaded newer image for busybox:latest
docker.io/library/busybox:latest
❯ docker  images
REPOSITORY                       TAG       IMAGE ID       CREATED        SIZE
navyas1388/navyacustome          v001      7f38298bcda6   10 days ago    369MB
dockerashu/ashucustomer1         v0011     0aec01272ecc   10 days ago    369MB
alpine                           latest    d4ff818577bc   12 days ago    5.6MB
busybox                          latest    69593048aa3a   2 weeks ago    1.24MB
openjdk                          latest    de085dce79ff   3 weeks ago    467MB
gcr.io/kaniko-project/executor   latest    1c812ffa8ec1   5 weeks ago    77.9MB

```

## Docker client and ENgine work flow 

<img src="flow.png">

## Process in container 

<img src="proc.png">

## creating containers 

```
❯ docker   run   --name  ashuc1   alpine:latest  ping 127.0.0.1
PING 127.0.0.1 (127.0.0.1): 56 data bytes
64 bytes from 127.0.0.1: seq=0 ttl=64 time=0.100 ms
64 bytes from 127.0.0.1: seq=1 ttl=64 time=0.392 ms
64 bytes from 127.0.0.1: seq=2 ttl=64 time=0.132 ms
64 bytes from 127.0.0.1: seq=3 ttl=64 time=0.124 ms
64 bytes from 127.0.0.1: seq=4 ttl=64 time=0.134 ms
64 bytes from 127.0.0.1: seq=5 ttl=64 time=0.113 ms
64 bytes from 127.0.0.1: seq=6 ttl=64 time=0.164 ms
64 bytes from 127.0.0.1: seq=7 ttl=64 time=0.201 ms
64 bytes from 127.0.0.1: seq=8 ttl=64 time=0.237 ms
64 bytes from 127.0.0.1: seq=9 ttl=64 time=0.131 ms
^C
--- 127.0.0.1 ping statistics ---
10 packets transmitted, 10 packets received, 0% packet loss
round-trip min/avg/max = 0.100/0.172/0.392 ms


```

## best practise to create container 

<img src="createc.png">

### checking output of a running container parent process

```
10017  docker  ps
10018  docker  logs   ashuc2 

10020  docker  ps
10021  docker  logs   72dff0def21b 

```

### stopping current running container 

```
❯ docker  kill   ashuc2
ashuc2
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

```

### listing all the containers

```
❯ docker  ps -a
CONTAINER ID   IMAGE                                   COMMAND                  CREATED         STATUS                        PORTS                                                                                                                                  NAMES
72dff0def21b   alpine:latest                           "ping 127.0.0.1"         8 minutes ago   Exited (137) 56 seconds ago                                                                                                                                          ashuc2
24bf9537274e   alpine:latest                           "ping 127.0.0.1"         9 minutes ago   Exited (0) 9 minutes ago                                                                                                                                             ashuc1

```

### starting container 

```
❯ docker  start   ashuc2
ashuc2
❯ docker  start   ashuc1
ashuc1
❯ docker   ps
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS         PORTS     NAMES
72dff0def21b   alpine:latest   "ping 127.0.0.1"   9 minutes ago    Up 6 seconds             ashuc2
24bf9537274e   alpine:latest   "ping 127.0.0.1"   10 minutes ago   Up 2 seconds             ashuc1

```

### stopping container 

```
❯ docker  ps
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS         PORTS     NAMES
72dff0def21b   alpine:latest   "ping 127.0.0.1"   11 minutes ago   Up 2 minutes             ashuc2
24bf9537274e   alpine:latest   "ping 127.0.0.1"   12 minutes ago   Up 2 minutes             ashuc1
❯ docker  kill   ashuc1  ashuc2
ashuc1
ashuc2
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
❯ 
❯ docker  start   ashuc1  ashuc2
ashuc1
ashuc2
❯ docker   ps
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS         PORTS     NAMES
72dff0def21b   alpine:latest   "ping 127.0.0.1"   12 minutes ago   Up 2 seconds             ashuc2
24bf9537274e   alpine:latest   "ping 127.0.0.1"   13 minutes ago   Up 2 seconds             ashuc1


```

### removing continaer. 

## Process in container 

```
❯ docker  rm   ashuc1
ashuc1
❯ docker   ps  -a
CONTAINER ID   IMAGE                                   COMMAND                  CREATED          STATUS                        PORTS                                                                                                                                  NAMES
72dff0def21b   alpine:latest                           "ping 127.0.0.1"         13 minutes ago   Exited (137) 19 seconds ago                                                                                                                                          ashuc2

```

## Container has 

### Root file system 

<img src="rootfs.png">

### demo

```
❯ docker   exec  -it  ashuc2   sh
/ # 
/ # 
/ # 
/ # ls  /
bin    dev    etc    home   lib    media  mnt    opt    proc   root   run    sbin   srv    sys    tmp    usr    var
/ # uname 
Linux
/ # 


```

### has its own process

```
 # ps  -e
PID   USER     TIME  COMMAND
    1 root      0:00 ping 127.0.0.1
   24 root      0:00 sh
   33 root      0:00 ps -e
/ # 

```

### final demo 

```
❯ docker   exec  -it  ashuc2   sh
/ # 
/ # 
/ # 
/ # ls  /
bin    dev    etc    home   lib    media  mnt    opt    proc   root   run    sbin   srv    sys    tmp    usr    var
/ # uname 
Linux
/ # ps  -e
PID   USER     TIME  COMMAND
    1 root      0:00 ping 127.0.0.1
   24 root      0:00 sh
   33 root      0:00 ps -e
/ # ifconfig 
eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:02  
          inet addr:172.17.0.2  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:14 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:1156 (1.1 KiB)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:908 errors:0 dropped:0 overruns:0 frame:0
          TX packets:908 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:76272 (74.4 KiB)  TX bytes:76272 (74.4 KiB)

/ # exit

```


