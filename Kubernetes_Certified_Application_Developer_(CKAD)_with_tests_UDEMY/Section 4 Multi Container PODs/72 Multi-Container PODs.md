- [ ]  SIDECAR 

## Multi container
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
		- contanerPort: 8080
	- name: log-agent
	  image: log-agent
```

O - > LOGS TO SERVICE | CONVERT LOGS TO A COMMON FORMAT FOR THIS WE DEPLOY AN  <span style=color:red>ADAPTER</span> CONTAINER | TO CONNECT WITH DIFFERENT SERVICES DESIGN <span style=color:red>AMBASSADOR</span>
0 - > LOGS TO SERVICE | CONVERT LOGS TO A COMMON FORMAT FOR THIS WE DEPLOY AN  <span style=color:red>ADAPTER</span> CONTAINER
O - > LOGS TO SERVICE | CONVERT LOGS TO A COMMON FORMAT FOR THIS WE DEPLOY AN  <span style=color:red>ADAPTER</span> CONTAINER 

The application outputs logs to the file `/log/app.log`. View the logs and try to identify the user having issues with Login.

Run the command: 
`kubectl -n elastic-stack exec -it app -- cat /log/app.log`

