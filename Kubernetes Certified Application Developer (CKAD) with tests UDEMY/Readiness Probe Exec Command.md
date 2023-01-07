
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
		exec:
			command:
				- cat
				- /app/is_ready
```

```
	readinessProbe:
		exec:
			command:
				- cat
				- /app/is_ready
```
[[79 Liveness probes]]
[[Liveness Probe]]
