
| CPU | MEM | DISK|
|-|-|-|
| 0.5 | 256 Mi | |
|0.1|3462556|-|
|1m|1G|-|

1G (Gigabyte = 1,000,000,000 bytes)
1M (Megatybe = 1,000,000 bytes)
1K (Kilobyte = 1,000 bytes)

1Gi (Gigibyte = 1,073,741,824 bytes)
1Mi (Mebitybe = 1,048,576 bytes)
1Ki (Kilobyte = 1,024 bytes)

[[def pod.yaml]]


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
		limits:
			memory: "2Gi"
			cpu: 2
```