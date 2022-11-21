apiVersion: apps/v1
kind: Deploymet
metadata:
  name: myapp-deployment
  labels: # all matchlabels or labels should by thesome
    app: myapp
    type: fornt-end
spec:
	template:
		metadata:
			name: myapp-pod
			labels:
				app: myapp
				type: fornt-end
		spec:
			containers:
			- name: nginx-container
			  image: nginx
replicas: 3
selector: 
	matchLabels:
		type: front-end