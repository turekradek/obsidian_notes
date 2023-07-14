```pod_definition
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec: # dictionary
	containers: # list/array value
		- name: nginx-container
		  image: nginx # name of image of docker repository

```