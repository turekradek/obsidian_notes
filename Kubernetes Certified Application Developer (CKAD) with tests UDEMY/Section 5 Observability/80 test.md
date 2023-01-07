```
apiVersion: v1 
kind: Pod 
metadata: 
	labels: 
		name: simple-webapp 
	name: simple-webapp-1 
	namespace: default 
spec: 
	containers: 
	- env: 
		- name: APP_START_DELAY 
		  value: "80" 
	  image: kodekloud/webapp-delayed-start 
	  imagePullPolicy: Always 
	  name: simple-webapp 
	  ports: 
	  - containerPort: 8080 
	    protocol: TCP 
	  readinessProbe: 
		httpGet: 
		  path: /ready 
		  port: 8080 
	  livenessProbe: 
		  httpGet: 
			  path: /live 
			  port: 8080 
	  periodSeconds: 1 
	  initialDelaySeconds: 80
```
Update both the pods with a livenessProbe using the given spec

-   Pod Name: simple-webapp-1
-   Image Name: kodekloud/webapp-delayed-start
-   Liveness Probe: httpGet
-   Http Probe: /live
-   Http Port: 8080
-   Period Seconds: 1
-   Initial Delay: 80
-   Pod Name: simple-webapp-2
-   Image Name: kodekloud/webapp-delayed-start
-   Liveness Probe: httpGet
-   Http Probe: /live
-   Http Port: 8080 
-   Initial Delay: 80
-   Period Seconds: 1