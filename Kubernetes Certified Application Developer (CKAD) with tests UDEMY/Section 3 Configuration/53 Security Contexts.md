kubectl exec ubuntu-sleeper -- whoami


> Edit the pod `ubuntu-sleeper` to run the sleep process with user ID `1010`.


```POD_LEVEL
apiVersion: v1 
kind: Pod 
metadata: 
	name: ubuntu-sleeper 
	namespace: default 
spec: 
	securityContext: 
		runAsUser: 1010 
	containers: 
		- command: 
		- sleep 
		- "4800" 
	image: ubuntu 
	name: ubuntu-sleeper
```

```CONTAINER_LEVEL
apiVersion: v1 
kind: Pod 
metadata: 
	name: ubuntu-sleeper 
	namespace: default 
spec: 
	containers: 
		- command: 
		- sleep 
		- "4800" 
		image: ubuntu 
		name: ubuntu-sleeper
		securityContext: 
			runAsUser: 1010 
			capabilities:
				add: ["MAC_ADMIN"]
				
```