```TCP_TEST
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
		tcpSocket:
			port: 8080
```

```
	readinessProbe:
		tcpSocket:
			port: 8080
```
[[79 Liveness probes]]
[[Liveness Probe]]
