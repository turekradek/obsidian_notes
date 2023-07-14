
kind: PersistentVolumeClaim 
apiVersion: v1 metadata: 
	name: local-pvc 
spec: 
	accessModes: 
	- ReadWriteOnce 
	storageClassName: local-storage 
		resources: requests: 
			storage: 500Mi


Create a new pod called `nginx` with the image `nginx:alpine`. The Pod should make use of the PVC `local-pvc` and mount the volume at the path `/var/www/html`.The PV `local-pv` should in a bound state.

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  containers:
  - image: nginx:alpine
    name: nginx
    volumeMounts:
    - mountPath: /var/www/html
      name: local-pv   # NAME OF PV NOT PVC 
    resources: {}
  volumes:
  - name: local-pv
    persistentVolumeClaim:
      claimName: local-pvc
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```