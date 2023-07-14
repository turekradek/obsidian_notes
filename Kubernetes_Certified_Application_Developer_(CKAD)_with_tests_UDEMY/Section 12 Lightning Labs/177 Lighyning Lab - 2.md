# I 
<span style="color:green">Welcome to the `KodeKloud CKAD Lightning Lab - Part 2`!  
  
NOTE: You can toggle between the questions but make sure that that you click on `END EXAM` before the the timer runs out.  
While this test environment is valid for 60 minutes, challenge yourself and try to complete all 5 questions within 30 minutes! To pass, correctly complete at least `4 out of 5` questions. Good Luck!!!  
  
  
We have deployed a few pods in this cluster in various namespaces. Inspect them and identify the pod which is not in a `Ready` state. Troubleshoot and fix the issue.

Next, add a check to restart the container on the same pod if the command `ls /var/www/html/file_check` fails. This check should start after a delay of `10 seconds` and run `every 60 seconds`.

  

You may delete and recreate the object. Ignore the warnings from the probe.

- Task completed correctly? </span>

The pod `nginx1401` is not in a `Ready` state as the `Readiness Probe` has failed. Here is the solution YAML file:

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: nginx
  name: nginx1401
  namespace: dev1401
spec:
  containers:
  - image: kodekloud/nginx
    imagePullPolicy: IfNotPresent
    name: nginx
    ports:
    - containerPort: 9080
      protocol: TCP
    readinessProbe:
      httpGet:
        path: /
        port: 9080    
    livenessProbe:
      exec:
        command:
        - ls
        - /var/www/html/file_check
      initialDelaySeconds: 10
      periodSeconds: 60
```

# II 
<span style="color:green">Create a cronjob called `dice` that runs every `one minute`. Use the Pod template located at `/root/throw-a-dice`. The image `throw-dice` randomly returns a value between 1 and 6. The result of 6 is considered `success` and all others are `failure`.  
  
The job should be `non-parallel` and complete the task `once`. Use a `backoffLimit` of `25`.  
  
If the task is not completed within `20 seconds` the job should fail and pods should be terminated.

You don't have to wait for the job completion. As long as the cronjob has been created as per the requirements. </span>

Use the following YAML file to create the cronjob:

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: dice
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      completions: 1
      backoffLimit: 25 # This is so the job does not quit before it succeeds.
      activeDeadlineSeconds: 20
      template:
        spec:
          containers:
          - name: dice
            image: kodekloud/throw-dice
          restartPolicy: Never
```

# III 
<span style="color:green">Create a pod called `my-busybox` in the `dev2406` namespace using the `busybox` image. The container should be called `secret` and should sleep for `3600` seconds.  

The container should mount a `read-only` secret volume called `secret-volume` at the path `/etc/secret-volume`. The secret being mounted has already been created for you and is called `dotfile-secret`.  

Make sure that the pod is scheduled on `controlplane` and no other node in the cluster. </span>

Use the following YAML file to create the pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: my-busybox
  name: my-busybox
  namespace: dev2406
spec:
  volumes:
  - name: secret-volume
    secret:
      secretName: dotfile-secret
  nodeSelector:
    kubernetes.io/hostname: controlplane
  containers:
  - command:
    - sleep
    args:
    - "3600"
    image: busybox
    name: secret
    volumeMounts:
    - name: secret-volume
      readOnly: true
      mountPath: "/etc/secret-volume"
```



# IV 
<span style="color:green">Create a single ingress resource called `ingress-vh-routing`. The resource should route HTTP traffic to multiple hostnames as specified below:

1. The service `video-service` should be accessible on `http://watch.ecom-store.com:30093/video`
    
2. The service `apparels-service` should be accessible on `http://apparels.ecom-store.com:30093/wear`
    

Here `30093` is the port used by the `Ingress Controller`</span>

Use the following YAML to create the ingress resource:

```yaml
---
kind: Ingress
apiVersion: networking.k8s.io/v1
metadata:
  name: ingress-vh-routing
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: watch.ecom-store.com
    http:
      paths:
      - pathType: Prefix
        path: "/video"
        backend:
          service:
            name: video-service
            port:
              number: 8080
  - host: apparels.ecom-store.com
    http:
      paths:
      - pathType: Prefix
        path: "/wear"
        backend:
          service:
            name: apparels-service
            port:
              number: 8080
```



# V 
<span style="color:green">A pod called `dev-pod-dind-878516` has been deployed in the default namespace. Inspect the logs for the container called `log-x` and redirect the warnings to `/opt/dind-878516_logs.txt` on the `controlplane` node </span>
Run the command:  
  
`kubectl logs dev-pod-dind-878516 -c log-x | grep WARNING > /opt/dind-878516_logs.txt`