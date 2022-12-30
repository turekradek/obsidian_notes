```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
	name: myapp-rc
	labels:
		app: myapp
		type: front-end
spec:
	template:
		metadata: # part from pod 
			name: myapp-pod
			labels:
				app: myapp
				type: front-end
		spec:
			containers:
				- name: nginx-contrainer
				  image: nginx
	replicas: 2 
	selector: # difference between replicacontroller and replicaset
		matchLabels:
			type: front-end
			
		
```

#REPLICASET

