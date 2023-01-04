
> docker run -e APP_COLOR=pink simple-webapp-color

[[def pod.yaml]]

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
		 env:
			 - name: APP_COLOR
			    value: pink


env:
	- name: APP_COLOR                                 PLAIN KEY VALUE
	   value: pink

env:
	- name: APP_COLOR
	   valueFrom:                                           CONFIGMAP
		   configMapKeyRef:

env:
	- name: APP_COLOR
	   valueFrom:                                              SECRETS
		   secretKeyRef:

