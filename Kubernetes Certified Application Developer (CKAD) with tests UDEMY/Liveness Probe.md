[[Readiness Probe tcp test]]
[[Readiness Probe http test]]
[[Readiness Probe Exec Command]]

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
	livenessProbe:
		httpGet:
			path: /api/ready
			port: 8080
		initialDelaySeconds: 10
		periodSeconds: 5
		failureThreshold: 8
```

```
	livenessProbe:
		httpGet:
			path: /api/ready
			port: 8080
		initialDelaySeconds: 10
		periodSeconds: 5
		failureThreshold: 8
