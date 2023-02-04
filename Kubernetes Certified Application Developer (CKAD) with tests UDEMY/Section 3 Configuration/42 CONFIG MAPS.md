#configmap 
```
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
		    -  containerPort: 8080
		  envFrom:
		  - configMapRef:
		      name: app-configmap
```

```configMap
APP_COLOR: blue
APP_MODE: prod
```

## how to use inside pod

1.  Create ConfigMap
2.  Inject into Pod

>kubectl create configmap 

```imperative
kubectl create configmap <config-name> --from-literal=<key>=<value>
```

```
kubectl create configmap \
app-config --from-literal=APP_COLOR=blue
		   --from-literal=APP_MOD=
	       --from-literal=KEY=VALUE

```

```FROM_FILE
kubectl create configmap \
<config-name> --from-file=<path-to-file>
```

```FROM_FILE
kubectl create configmap \
	app-config --from-file=app_config.properties
```


| [[def config-map yaml]] | kubectl create -f config-map.yml |
|-|-|

> kubectl get configmaps

| [[def pod.yaml]] | [[def config-map yaml]]  |
|-|-|

```
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
		    -  containerPort: 8080
		  envFrom: # it's a list 
		    - configMapRef:
		        name: app-config # NAME OF CONFIGMAP LIKE BELOW
```

```config-map.yaml
apiVersion: v1
kind: ConfigMap
metadata:
	name: app-config # USED ABOVE IN POD DEFINITION FILE 
data:
	APP_COLOR: blue
	APP_MODE: prod
```

## 2 OPORTUNITY  SINGLE ENV 

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
		    -  containerPort: 8080
		  **env:
			  - name: APP_COLOR
			    valueFrom:
				    configMapKeyRef:
					    name: app-config
					    key: APP_COLOR**
			   

apiVersion: v1
kind: ConfigMap
metadata:
	**name: app-config # USED ABOVE IN POD DEFINITION FILE 
data:
	APP_COLOR: blue
	APP_MODE: prod**

## 3 OPORTUNITY  VOLUME 

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
		    -  containerPort: 8080
		  **volumes:
		  - name: app-config-volume
		    configMap:
			    name: app-config**
			   

apiVersion: v1
kind: ConfigMap
metadata:
	**name: app-config # USED ABOVE IN POD DEFINITION FILE 
data:
	APP_COLOR: blue
	APP_MODE: prod


