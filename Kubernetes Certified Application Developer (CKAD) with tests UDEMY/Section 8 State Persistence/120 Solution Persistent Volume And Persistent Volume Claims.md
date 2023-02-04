[[119 Practice Test - Persistent Volumes]]


1. So, we have deployed a pod, inspect the pod, and wait for it to start running.
2. The application stores logs at location logapp.log/log/app.log. So, view the logs.
> k exec webapp -- cat /log/app.log 

3. Now, if the pod was to get deleted now, would you be able to view the logs?
  no pod no volume no logs 
4. Configure a volume to store these logs at /var/log/webapp on the host 
	1. name: webapp
	2. image Name: kodekloud/event-simulator
	3. Volume HostPath: var/log/webapp
	4. Volume Mount: /log
	> ls /var/log/webapp 
	>k edit pod webapp

	volumeMounts:
	- mountPath: /log
	  name: log-volume
	   
	voluems:
	- name: log-volume
	  hostPath:
		  path: /var/log/webapp
		 
	> k replace --force -f /tmp/kubectl-edit-235235.yaml
	
	