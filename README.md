# Plan of traning and its execution 

<img src="plan.png">

## day3 revision 

<img src="day3.png">

## POD network policy rules 

<img src="podnet.png">

## minikube cluster status 

```
❯ minikube status
❗  Executing "docker container inspect minikube --format={{.State.Status}}" took an unusually long time: 2.555876862s
💡  Restarting the docker service may improve performance.
minikube
type: Control Plane
host: Stopped
kubelet: Stopped
apiserver: Stopped
kubeconfig: Stopped

❯ minikube start
😄  minikube v1.21.0 on Darwin 11.4
🆕  Kubernetes 1.20.7 is now available. If you would like to upgrade, specify: --kubernetes-version=v1.20.7
✨  Using the docker driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🔄  Restarting existing docker container for "minikube" ...



```

## Label 

<img src="lb.png">

### apply and checking labels in the POD 

```
❯ kubectl  get  po  --show-labels
NAME           READY   STATUS             RESTARTS   AGE     LABELS
ashupod123     1/1     Running            0          6m48s   x=helloashu
dipanjan1      1/1     Running            0          5m13s   x=hellodipanjan
himpod3        0/1     CrashLoopBackOff   5          3m46s   run=himpod3
sanjaypod2     1/1     Running            0          5m10s   <none>
sathyapod123   1/1     Running            0          5m55s   <none>
subhampod123   1/1     Running            0          6m21s   x=hellosubham
thirupod123    1/1     Running            0          4m47s   x=hellothiru
vritypod123    1/1     Running            0          5m17s   x=hellovrity
❯ kubectl  get  po  ashupod123   --show-labels
NAME         READY   STATUS    RESTARTS   AGE    LABELS
ashupod123   1/1     Running   0          7m5s   x=helloashu

```

### service type in k8s

<img src="stype.png">

## Nodeport 

<img src="np.png">

### creating nodeport service

```
kubectl  create  service  nodeport  ashusvc1  --tcp 1234:80  --dry-run=client -o yaml  >ashusvc1.yaml

```

### deploying service 

```
❯ kubectl apply -f  ashusvc1.yaml
service/ashusvc1 created

```

### checking service

```
❯ kubectl   get   service
NAME           TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
ashusvc1       NodePort    10.98.222.227    <none>        1234:30461/TCP   31s
dipanjansvc1   NodePort    10.99.237.159    <none>        1234:32676/TCP   27s
himsv1         NodePort    10.100.165.218   <none>        1234:31666/TCP   7m35s
kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP          25h
sanjusvc1      NodePort    10.101.146.139   <none>        1234:30623/TCP   26s
subhamsvc1     NodePort    10.106.153.8     <none>        1234:30132/TCP   12s
vrityc1        NodePort    10.101.98.154    <none>        1239:32071/TCP   31s
❯ kubectl   get   svc
NAME           TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
ashusvc1       NodePort    10.98.222.227    <none>        1234:30461/TCP   39s
dipanjansvc1   NodePort    10.99.237.159    <none>        1234:32676/TCP   35s
himsv1         NodePort    10.100.165.218   <none>        1234:31666/TCP   7m43s
kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP          25h
sanjusvc1      NodePort    10.101.146.139   <none>        1234:30623/TCP   34s
subhamsvc1     NodePort    10.106.153.8     <none>        1234:30132/TCP   20s
thirusvc1      NodePort    10.103.176.24    <none>        1234:30128/TCP   4s
vrityc1        NodePort    10.101.98.154    <none>        1239:32071/TCP   39s

```

### deleting all service

```
❯ kubectl delete  svc  ashusvc1
service "ashusvc1" deleted
❯ kubectl delete  svc  --all
service "dipanjansvc1" deleted
service "hims2" deleted
service "himsv1" deleted
service "kubernetes" deleted
service "sanjusvc1" deleted
service "sathyasvc1" deleted
service "subhamsvc1" deleted
service "thirusvc1" deleted
service "vrityc1" deleted

```

### kubernetes dashboard accessing 

<img src="dash.png">






