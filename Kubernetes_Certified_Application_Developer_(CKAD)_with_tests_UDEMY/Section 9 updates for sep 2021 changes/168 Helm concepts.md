3So the first step is to convert these files into templates where these values become variables.

```template/deploymant.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress
  labels:
    app: wordpress
spec:
  replicas: 3
  selector:
    matchLabels:
      app: wordpress
  template:
    metadata:
      labels:
        app: wordpress
    spec:
      containers:
      - name: wordpress
        image: {{ .Values.image }}
        ports:
        - containerPort: 80
```

```template/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
```

```template/persistentvolumeclaim.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: foo-pvc
  namespace: foo
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: {{ .Values.storage }}
  storageClassName: "" # Empty string must be explicitly set otherwise default StorageClass will be set
  volumeName: foo-pv
  
```

```template/secrets.yaml
apiVersion: v1
kind: Secrets
metadata:
  name: mypod-admin-password
data: 
  key: {{ .Values.passwordEncoded }}
```
## this is where the variables are stored 
```values_yaml
image: wordpress:4.8-apache
storage: 20Gi
passwordEncoded: asdgfuaepoiufgbaepr
```

This way anyone who wants to deploy this application can customize their deployment by simply changing the values from the single file called Values dot yaml.

# Helm Charts = values.yaml + templates/resources deployment service secrets pvc + Charts.yaml 
```Charts.yaml
apiVersion: v2
name: Wordpress
version: 9.0.3
description: Web publishing platform for building blogs and websites.
keywords:
	- wordpress
	- cms
	- blog
	- http
	- web
	- application
	- php
home: http://www.wordpress.com/
sources:
	- https://github.com/bitnami/bitnami-docker-wordpress
maintainers:
	- email: containers@bitnami.com
	  nameL Bitnami
```
Repository Artifact HUB 
[artifactHUB](https://artifacthub.io)
> helm search hub wordpress 

>helm repo add bitnami https://charts.bitnami.com/bitnami

> helm search repo wordpress

> helm repo list

Bitnami Helm Charts

## to install helm chart

> helm install [release-name]  [chart-name]    

> helm install release-1 bitnami/wordpress

> helm install release-2 bitnami/wordpress

> helm install release-3 bitnami/wordpress

helm list
helm uninstall my-release
helm pull --untar bitnami/wordpress
ls wordpress
>helm install release-4 ./wordpress




