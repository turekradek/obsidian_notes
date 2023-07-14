```
apiVersion: v1
kind: ReplicationController
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
```

apiVersion: v1
kind: ReplicationController
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


