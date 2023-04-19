#headles #headlesservice #headlessservice 

```headless-service_yaml
apiVersion: v1
kind: Service
metadata:
	name: mysql-h
spec:
	ports:
	- port: 3306
	selector:
		app: mysql
	clusterIP: None
```

pod_definition_yaml
apiVersion: v1
kind: Pid
**metadata:
	name: mysql-pod
	labels:
		app: mysql
spec:
	containers:
	- name: mysql
	  image: mysql
	subdomain: mysql-h
	hostname: mysql-pod

