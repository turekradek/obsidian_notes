
```
apiVerion: apps/v1
kind: Deployment
metadata:
    name: nginx-inagress-controller
spec:
	replicas: 1
	selector:
		matchLabels:
			name: nginx-ingress
	template:
		metadata:
			labels:
				name: nginx-ingress
	spec:
		containers:
			- name: nginx-ingress-controller
			  image: guay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.21.0
		args:
			- /nginx-ingress-controller
			- --configmap=$(POD_NAMESPACE)/nginx-configuration
		env:
			- name : POD_NAME
			  valueFrom:
				  fieldRef:
					  fieldPath: metadata.name
			- name: POD_NAMESPACE
			  valueFrom:
				  fieldRef:
					  fieldPath: metadata.namespace
		ports:
			- name: http
			  contanerPort: 80
			- name: https
			  containerPort: 443
		
```   

```service
apiVersion: v1
kind: Sevice
metadata:
	name: nginx-ingress
spec:
	type: NodePort
	ports: 
	- port: 80
	  targetPort: 80
	  protocol: TCP
	  name: http
	- port: 443
	  targetPort: 443
	  protocol: TCP
	  name: http
	selector:
		name: nginx-ingress
```

```configmap
kind: ConfigMap
apiVersion: v1
metadata:
	name: nginx-configuration
```

```serviceaccount
apiVersion: v1
kind: ServiceAccount
metadata:
	name: nginx-ingress-serviceaccount
```

| Roles | ClusterRoles| RoleBindings|
|-|-|-|
| | | |



[[104 Ingress Networking]]

```ingress
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
	name: nginx-configuration
spec:
	backend:
		serviceName: wear-service
		servicePort: 80
```