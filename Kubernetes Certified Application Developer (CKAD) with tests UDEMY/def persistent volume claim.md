[[117 Persistent Volumes Claims]]
#PERSISTENT #persistentvolume #PERSISTENTVOLUMECLAIM
## PersistentVolume Clai
```pvc_definition_yaml
apiVersion: v1
kind: PersistentVolumecLAIM
metadata:
	name: my-claim
spec:
	accessModes:
		- ReadWriteOnce
	resources:
		requests:
			storage: 500Mi
```

> kubectl create -f pvc-definition.yaml

> kebectl get persistentvolumeclaim

> kubectl delete persistentvolumeclaim myclaim

chosse what will be happend with PV when you delete PVC
```
persistentVolumeReclaimPolicy: Retain
```
By default, it is set to retain,
meaning the persistent volume will remain
until it is manually deleted by the administrator.

```
persistentVolumeReclaimPolicy: Delete
```
Delete means This way, as soon as the claim is deleted,
the volume will be deleted as well.

```
persistentVolumeReclaimPolicy:  Recycle
```
will be scrubbed before making it available
to other claims.


```pv_definition_yaml
apiVersion: v1
kind: PersistentVolume
metadata:pv-vol1random-numer-generator
spec:
	accessModes:
		- ReadWriteOnce
	capacity:
		storage: 1Gi
	hostPath:
		path: /tmp/data
	awsElasticBlockStore:
		volumeID: <volume-id>
		fsType: ext4

[[116 Persistent Volumes]]
