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
	name: reporting-job
	labels:
		app: myapp
		type: front-end
spec:
	completions: 3
	template:
		spec: # from spec of pod
			containers:
				- name: math-add
				  image: ubuntu
				  dommand: ['expr','3','+','2']
			restartPolicy: Never
```

## cronjob
```job
apiVersion: batch/v1
kind: CronJob
metadata:
	name: reporting-cron-job
	labels:
		app: myapp
		type: front-end
spec: # spec for cronjob
	schedule: "*/1 * * * *"
	jobTemplate: # from spec of job
		spec: # spec for job
			completions: 3
			template:
				spec: # spec for pod 
					containers:
						- name: math-add
						  image: ubuntu
						  dommand: ['expr','3','+','2']
					restartPolicy: Never
```
[[def cronjob.yaml]]


>kubectl create -f job-definition.yaml
>kubectl get jobs

#JOB
#POD 
#DEFINITION
[[96 Jobs]]

>kubectl logs pod-name
>kubectl delete job pod-name

> kubectl get cronjobs 

