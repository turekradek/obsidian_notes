### I .
NOTE: "Welcome to the `KodeKloud CKAD Lightning Lab - Part 1`!"  
  
"You can toggle between the questions but make sure that that you click on `END EXAM` before the the timer runs out.  
While this test environment is valid for 60 minutes, challenge yourself and try to complete all 5 questions within 30 minutes! To pass, correctly complete at least `4 out of 5` questions.Good Luck!!!"  
  
  
  
  
Create a Persistent Volume called `log-volume`. It should make use of a `storage class` name `manual`. It should use `RWX` as the access mode and have a size of `1Gi`. The volume should use the hostPath `/opt/volume/nginx`  

Next, create a PVC called `log-claim` requesting a minimum of `200Mi` of storage. This PVC should bind to `log-volume`.  

Mount this in a pod called `logger` at the location `/var/www/nginx`. This pod should use the image `nginx:alpine`.

  

- log-volume created with correct parameters?

```
apiVersion: v1 
kind: PersistentVolume
metadata:
  name: log-volume
spec:
  storageClassName: "manual"
  claimRef:
    name: foo-pvc
    namespace: foo
  capacity:
    storage: 1Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteMany
  hostPath: 
    path: "/opt/volume/nginx"
```

```
apiVersion: v1 kind: PersistentVolumeClaim metadata: name: log-claim spec: storageClassName: manual accessModes: - ReadWriteMany resources: requests: storage: 200Mi volumeName: log-volume
```

```
 apiVersion: v1
  2 kind: Pod
  3 metadata:
  4   name: logger
  5 spec:
  6   containers:
  7     - name: logger-container
  8       image: nginx:alpine
  9       volumeMounts:
 10         - name: log-volume
 11           mountPath: /var/www/nginx
 12   volumes:
 13     - name: log-volume
 14       persistentVolumeClaim:
 15         claimName: log-claim
 16                                    
```

### II. 
We have deployed a new pod called `secure-pod` and a service called `secure-service`. Incoming or Outgoing connections to this pod are not working.  
Troubleshoot why this is happening.  

Make sure that incoming connection from the pod `webapp-color` are successful.

  

Important: Don't delete any current objects deployed.

- Important: Don't Alter Existing Objects!
    
- Connectivity working?
3.

### III . 
Create a pod called `time-check` in the `dvl1987` namespace. This pod should run a container called `time-check` that uses the `busybox` image.  

1. Create a config map called `time-config` with the data `TIME_FREQ=10` in the same namespace.  
    2. The `time-check` container should run the command: `while true; do date; sleep $TIME_FREQ;done` and write the result to the location `/opt/time/time-check.log`.  
        
    3. The path `/opt/time` on the pod should mount a volume that lasts the lifetime of this pod.

  

- Pod `time-check` configured correctly?


### IV.
Create a new deployment called `nginx-deploy`, with one single container called `nginx`, image `nginx:1.16` and `4` replicas.  
The deployment should use `RollingUpdate` strategy with `maxSurge=1`, and `maxUnavailable=2`.  
  
Next upgrade the deployment to version `1.17`.  
  
Finally, once all pods are updated, undo the update and go back to the previous version.

  

- Deployment created correctly?
    
- Was the deployment created with nginx:1.16?
    
- Was it upgraded to 1.17?
    
- Deployment rolled back to 1.16?

### V.
Create a `redis` deployment with the following parameters:  
  
Name of the deployment should be `redis` using the `redis:alpine` image. It should have exactly `1` replica.  
  
The container should request for `.2` CPU. It should use the label `app=redis`.  
  
It should mount exactly 2 volumes.  

  

a. An Empty directory volume called `data` at path `/redis-master-data`.  
  
b. A configmap volume called `redis-config` at path `/redis-master`.  
  
c. The container should expose the port `6379`.  
  
  
The configmap has already been created.

- Deployment created correctly?