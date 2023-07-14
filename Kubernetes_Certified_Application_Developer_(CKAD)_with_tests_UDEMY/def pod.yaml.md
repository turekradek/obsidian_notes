```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
```

#POD
## resources
```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
	ports:
		- containerPort: 8080
	resources:
		requests:
			memory: "1Gi"
			cpu: 1
```
## nodeSelector
```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
	nodeSelector:
		size: Large
```

## nodeAffinity

```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
	affinity:
		nodeAffinity:
			requiredDuringSchedulingIgnoredDuringExecution:
				nodeSelectorTerms:
				- matchExpressions:
				  - key: size
				    operator: In
				    values:
				    - Large
```

## Multi container
```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
	ports:
		- contanerPort: 8080
	- name: log-agent
	  image: log-agent
```

## Readiness Probe
```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
	ports:
		- contanerPort: 8080
	readinessProbe:
		httpGet:
			path: /api/ready
			port: 8080
```

## Event simulator
```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
		- name: image-processor
		  image: some-image-processor
```
[[82 Container Logging]]

[[89 Labels, Selectors and annotations]]

## Labels
#labels
```
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: nginx-contrainer
		  image: nginx
		  ports:
			  - contanerPort: 8080
```

## Volume 
#volume
```
apiVersion: v1
kind: Pod
metadata:
	name: random-numer-generator
spec:
	containers:
		- name: alpine
		  image: alpine
		  command: ["/bin/sh","-c"]
		  args: ["shuf -i 0-100 -n 1 >> /opt/number.out;"]
		  volumeMounts:
		  - mountPath: opt
		    name: data-volume
	volumes:
	- name: data-volume
	  hostPath:
		  path: /data
		  type: Direcotry

```

[[115 Volumes]]
