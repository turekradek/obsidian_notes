## pod
```pod
apiVersion: v1
kind: Pod
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	containers:
		- name: math-add
		  image: ubuntu
		  command: ['expr','3','+','2']
	restartPolicy: Never
```

## job
```job
apiVersion: batch/v1
kind: Job
metadata:
	name: myapp-pod
	labels:
		app: myapp
		type: front-end
spec:
	completions: 3
	template:
		spec:
			containers:
				- name: math-add
				  image: ubuntu
				  dommand: ['expr','3','+','2']
			restartPolicy: Never
```

>kubectl create -f job-definition.yaml
>kubectl get jobs

#JOB
#POD 
#DEFINITION
[[96 Jobs]]

>kubectl logs pod-name
>kubectl delete job pod-name
