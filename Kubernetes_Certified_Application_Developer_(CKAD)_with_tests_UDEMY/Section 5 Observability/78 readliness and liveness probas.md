| POD status | - | - |
| - | - | - |
| Pending| ContainerCreating| Running|

| POD Conditions | - | - |
| - | - | - |
| PidScheduled| Initialized| |

[[def pod.yaml]]

## Readiness Probe 
#pod [[def pod.yaml]]
HTTP Test - /api/ready
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
		initialDelaySeconds: 10
		periodSeconds: 5
		failureThreshold: 8
```

| HTTP Test - /api/ready | TCP Test - 3306 | Exec Command |
|-|-|-|
|[[Readiness Probe http test]]| [[Readiness Probe tcp test]] | [[Readiness Probe Exec Command]] |




