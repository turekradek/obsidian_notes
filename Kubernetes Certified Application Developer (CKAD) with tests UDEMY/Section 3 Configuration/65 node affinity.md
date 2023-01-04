#affinity

- [ ] PODs 

[[def pod.yaml]]

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
				    operator: In # NotIn # Exists not need values below
				    values:
				    - Large
```

## Node Affinity Types

Available:
requiredDuringSchedulingIgnoredDuringExecution
preferredDuringSchedulingIgnoredDuringExecution

Planned:
requiredDurringSchedulingRequiredDuringExecution

|  | DuringScheduling | DuringExecution |
|-|-|-|
|  |During scheduling is the state where a pod does not exist and is created for the first time.| |
| Type 1| Required | Ignored |
| Type 2 | Preferred| Ignored|
| Type 3 | Required | Required|

> kubectl label node node01 color=blue