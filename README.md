# Plan of traning and its execution 

<img src="plan.png">


## plan for the day 

<img src="plan1.png">

## Storage in k8s

<img src="st1.png">

## k8s volume plugins 

[volume](https://kubernetes.io/docs/concepts/storage/volumes/)

## volume info 

<img src="vol.png">

## storage source location 

<img src="volsrc.png">

### EMptyDir volume type

```
❯ kubectl  run   emppod  --image=alpine  --namespace ashu-project   --dry-run=client -o yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: emppod
  name: emppod
  namespace: ashu-project
spec:
  containers:
  - image: alpine
    name: emppod
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}


```

### deploying pod 

```
❯ ls
alpine.yaml   ashusvc1.yaml empvol.yaml   mywebapp      pod2.yaml
ashupod1.yaml depsvc.yaml   mydeploy.yaml netpol1.yaml
❯ kubectl  apply -f  empvol.yaml --dry-run=client
pod/emppod created (dry run)
❯ kubectl  apply -f  empvol.yaml
pod/emppod created

```

### checking data 

```
❯ kubectl  get  po
NAME     READY   STATUS    RESTARTS   AGE
emppod   1/1     Running   0          7s
❯ kubectl  exec  -it  emppod  -- sh
/ # cd  /mnt/cisco/
/mnt/cisco # ls
time.txt
/mnt/cisco # cat  time.txt 
Fri Jul  2 05:00:16 UTC 2021
Fri Jul  2 05:00:21 UTC 2021
Fri Jul  2 05:00:26 UTC 2021
Fri Jul  2 05:00:31 UTC 2021
Fri Jul  2 05:00:36 UTC 2021
Fri Jul  2 05:00:41 UTC 2021
Fri Jul  2 05:00:46 UTC 2021
/mnt/cisco # cat  time.txt 
Fri Jul  2 05:00:16 UTC 2021
Fri Jul  2 05:00:21 UTC 2021
Fri Jul  2 05:00:26 UTC 2021
Fri Jul  2 05:00:31 UTC 2021
Fri Jul  2 05:00:36 UTC 2021
Fri Jul  2 05:00:41 UTC 2021
Fri Jul  2 05:00:46 UTC 2021
Fri Jul  2 05:00:51 UTC 2021
/mnt/cisco # exit

```

### POD with multiple containers

<img src="mcont.png">

## demo of multi container pod 

<img src="demo1.png">


## accessing containers 

```
❯ kubectl  exec  -it  emppod  -- bash
Defaulted container "ashungc1" out of: ashungc1, emppod
root@emppod:/# cd /usr/share/nginx/html/
root@emppod:/usr/share/nginx/html# ls
time.txt
root@emppod:/usr/share/nginx/html# exit
exit
❯ kubectl  exec  -it  emppod -c  emppod  -- sh
/ # cd /mnt/cisco/
/mnt/cisco # ls
time.txt
/mnt/cisco # exit

```

### creating service and hosting it

```
❯ kubectl  expose  pod  emppod  --type NodePort  --port 80  --dry-run=client -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    run: emppod
  name: emppod
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    run: emppod
  type: NodePort
status:
  loadBalancer: {}
❯ kubectl  expose  pod  emppod  --type NodePort  --port 80  --name ashusvc1
service/ashusvc1 exposed
❯ kubectl  get  svc
NAME       TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
ashusvc1   NodePort   10.98.224.162   <none>        80:31767/TCP   4s

```



