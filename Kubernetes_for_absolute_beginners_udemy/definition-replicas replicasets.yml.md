```replicaSets
apiVersion: apps/v1
kind: RaplicaSet
metadata:
  name: myapp-replicaset
  labels: # all matchlabels or labels should by thesome
    app: myapp
spec:
  selector: # specyfic for replicaset
    matchLabels:
         app: myapp # in nginx file is en: production should by like in 6 line app:myapp
  replicas: 3 # how many replicas 
  template:
    metadata: # part copy from nginx.yml
	  name: nginx-2
	  labels:
	    app: myapp # in nginx file is en: production should by like in 6 line app:myapp
	spec:
	  containers:
	    - name: nginx
	      image: nginx 
```