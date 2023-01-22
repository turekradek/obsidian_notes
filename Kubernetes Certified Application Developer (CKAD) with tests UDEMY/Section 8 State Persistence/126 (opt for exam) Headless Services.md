


#headles #headlesservice #headlessservice 

headless-service_yaml
apiVersion: v1
kind: Service
metadata:
	name: **mysql-h**
spec:
	ports:
	- port: 3306
	selector:
		app: mysql
	clusterIP: None


pod_definition_yaml
apiVersion: v1
kind: Pod
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


 apiVersion: v1                                                     
 kind: StatefulSet                                            
 metadata:                                                       
	name: myapp-deployment                                          
	labels:                                                          
		app: myapp                                            
		type: front-end                                           
spec: 
	serviceName: **mysql-h** # for deploy all pods
	replicas: 3
	matchLabels:
		app: mysql
	template:
		**metadata:
		name: mysql-pod
		labels:
			app: mysql
		spec:
			containers:
			- name: mysql
			  image: mysql
			subdomain: mysql-h # for all pods ONLY IN DEPLOYMENT
			hostname: mysql-pod # DONT NEED IN STATEFULSET

