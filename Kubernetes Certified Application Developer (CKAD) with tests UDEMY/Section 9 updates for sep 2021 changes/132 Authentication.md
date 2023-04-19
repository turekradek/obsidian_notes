## Accounts cluster
- [ ] Admins
- [ ] Developers
- [ ] Bots
~~kubectl create user user1
kubectl list users~~
> kubectl get serviceaccount

> kubectl create serviceaccount

## kube-apiserver authetnicate users , manage by kube-apiserver

- [ ] static password file
- [ ] static token file
- [ ] certificates
- [ ] identity services

user-details.csv
| static password file | static token file |
|-|-|
| password123,user1,u001||
|password123,user2,u002||

kube-aposerver.service
--basic-auth0file=user-details.csv
<<<<<<< HEAD
[[def kube-apiserver]]

[[def kube-api server configuraion]]
```/etc/kubernetes/manifests/kube-apiserver.yaml
apiVersion:v1
kind: Pod
metadata:
	creationTimestamp: null
	name: kube-apiserver
	namespace: kube-system
spec:
	- containers:
	- command:
	  - kube-apiserver
	  - --authorization-mode=Node,RBAC
	  - --advertise-address=172.17.0.107
	  - --allow-privileged=true
	  - --enable-adminission-plugins=NodeRestriction
	  - --enable-bootstrap-token-auth=true

	 image: k8s.gcr.io/kube-apierver-amd64:v1.11.3
	 name : kube-apiserver
	
```

> curl -v -k https://master-node-ip:6443/api;v1/pods -u "user1:password123"

## Auth Mechamisms - Basic

```user-details.csv
password123,user1,u0001,group1
password123,user2,u0002,group1
password123,user3,u0003,group2
password123,user4,u0004,group3
```

```user-token-details.csv
adfbsgfbad,user10,u00010,group1
afbgrtgbhartgba,user11,u00011,group1
egateart,user12,u00012,group2
aetbatbgat,user4,u00013,group3
```

> --token-auth-file=user-details.csv

> curl -v -k https://master-node-ip:6443/api;v1/pods -header "Authorization: Baearer adfvadfbvadfbagd"

=======
>>>>>>> main
