## Authentication

Kubectl - > Authentication - > Create Pod
~/.kube/config


Kubectl - > Authentication - >  Authorization   -  >  Create Pod

						[[def role yaml]]



|Kubectl - > |Authentication - > | Authorization   -  > | Admission Controllers   - >| Create Pod|
|-|-|-|-|-|
|-|-|-|AlwaysPullImages|-|
|-|-|-|**DefaultStorageClass**|-|
|-|-|-|EventRateLimit|-|
|-|-|-|NamespaceAutoProvision|-|
|-|-|-|**NamespaceExists**|-|
|-|-|-|Many more|-|


list of admission controllers

> kubec-apiserver -h | grep enable-adminission-plugins 


<table>
	
</table>
kube-apiserver.service
```
ExecStart=/usr/local/bin/kube-apiserver \\
	--advertise-address=${INTERNAL_IP} \\
	......................
	.....................
	...................
	--v=2
	--enable-admission-plugins=NodeRestriction,NamespaceAutoProvision
	--disable-admission-plugins=DefaultStorageClass
	--disable-adminission-plugins=DefaultStorageClass

```

```/etc/kubernetes/manifests/kube-apiserver.yaml
apiVersion: v1
kind: Pod
metadata:
	creationTimestamp: null
	name: kube-apiserver
	namespace: kube-system
spec:
	containers:
	- command:
		- kube-apiserver
		- --authorization-mode=Node,RBAC
		- --adverise-address=172.17.0.107
		- --allow-provileged=true
		- --enable-adminission-plugins=NodeRestriction,NamespaceAutoPro
	image: k8s.gcr.io/kube-apiserver-amd4:v1.11.3
	name: kube-apiserver
```

