
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

[[97 CronJobs]]

[[96 Jobs]]
