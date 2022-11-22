```deployment>yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels: # all matchlabels or labels should by thesome
    tier: frontend
    app: myapp
spec:
  selector:
    matchLabels:
      app: myapp
  replicas: 3
  template:
    metadata:
      name: nginx-2
      labels:
        app: myapp
    spec:
      containers:
        - name: nginx
          image: nginx
```